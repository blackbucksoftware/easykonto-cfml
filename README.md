# easykonto-cfml
easykonto-cfml is a CFML library for checking IBANs with the EasyKonto-API. [EasyKonto](https://www.easykonto.de/) is a commercial 3rd-party-service to check IBANs and BICs.


## Installation
This wrapper can be installed as standalone library or as a ColdBox Module. Either approach requires a simple CommandBox command:

```
$ box install easykontocfml
```

Alternatively the git repository can be cloned.


### Standalone Usage

Once the library has been installed, the core `easykonto` component can be instantiated directly:

```cfc
easykonto = new path.to.easykontocfml.easykonto(
    key = 'YOUR_EASYKONTO_API_KEY',
    secret = 'YOUR_EASYKONTO_API_SECRET'
);
```


### ColdBox Module

To use the library as a ColdBox Module, add the init arguments to the `moduleSettings` struct in `config/Coldbox.cfc`:

```cfc
moduleSettings = {
    easykontocfml: {
        key = 'YOUR_EASYKONTO_API_KEY',
        secret = 'YOUR_EASYKONTO_API_SECRET'
    }
}
```


You can subsequently reference the library via the injection DSL: `easykonto@easykontocfml`:

```cfc
property name="easykonto" inject="easykonto@easykontocfml";
```


## Configuration

EasyKonto requires two params, `key` and `secret`. Both are provided in your EasyKonto backend. 

If your are running Lucee as your CFML engine, you can also provide ENV vars called `EASYKONTO_KEY`, `EASYKONTO_SECRET` instead.

The `baseUrl` parameter is optional and defaults to `https://api.easykonto.de/v5`. 


## Getting Started

```
<!--- Check IBAN entered by user --->
<cfset easykonto = new easykonto() />
<cfset x = easykonto.checkIban( iban='DE89 37040 0440 5320 13000') />
<cfdump var="#x#" />
```


## Responses

EasyKonto's REST-API returns JSON objects in response to all requests. **easykonto-cfml** deserializes this response into a CFML struct and makes it available under the `data` key.

Responses to API calls are all returned as structs in the following format:

```cfc
{
    data: {}                // struct containing the body of the response
    statuscode: {}          // struct containing the status code of the response
}
```


## Methods Available

**easykonto-cfml** covers all methods of the EasyKonto API v5:

* `checkIban( iban="DE89370400440532013000" )` - Checks IBAN
* `checkGermanAccount( konto="0532013000", blz="37040044" )` - Converts German account number and bank code to IBAN and BIC
* `findGermanBank( blz="37040044" )` - Checks German bank code (BLZ)
* `findBank( bic="COBADEFFXXX" )` - Checks BIC code


## Links
[EasyKonto website](https://www.easykonto.de/)

[EasyKonto API docs](https://easykonto.readme.io/reference/general)


## Disclaimer
Blackbuck Software is not affiliated with EasyKonto.