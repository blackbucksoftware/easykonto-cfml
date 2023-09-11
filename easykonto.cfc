component {

    function init( string key, string secret, string baseUrl ) {
        variables.instance = { 
            "key" : (arguments.key ?: server.system.environment[ "EASYKONTO_KEY" ]),
            "secret" : (arguments.secret ?: server.system.environment[ "EASYKONTO_SECRET" ]),
            "baseUrl" : (arguments.baseUrl ?: "https://api.easykonto.de/v5") 
        }
        return this;
    }

    function checkIban( required string iban) {
        var result = {};
        result.data = "";

        try {
            cfhttp(method="POST", charset="utf-8", url="#variables.instance.baseUrl#/check-iban", result="httpresult") {
                cfhttpparam(name="API-Key-Id", type="header", value="#variables.instance.key#");
                cfhttpparam(name="API-Key-Secret", type="header", value="#variables.instance.secret#");
                cfhttpparam(name="Accept", type="header", value="application/json");
                cfhttpparam(name="Content-Type", type="header", value="application/json");
                cfhttpparam(name="data", type="body", value='{"iban":"#reReplace( "#ucase(arguments.iban)#", "[^A-Z0-9]", "", "ALL")#"}');
            }
            result.statuscode = httpresult.statusCode;
            if (httpresult.statusCode == 200) {
                result.data = deserializeJSON(httpresult.fileContent);
            }
        } catch (e any) {
            results.statuscode = 500;
        }
        
        return result;
    }

    function checkGermanAccount( required string konto, required string blz) {
        var result = {};
        result.data = "";

        try {
            cfhttp(method="POST", charset="utf-8", url="#variables.instance.baseUrl#/check-german-account", result="httpresult") {
                cfhttpparam(name="API-Key-Id", type="header", value="#variables.instance.key#");
                cfhttpparam(name="API-Key-Secret", type="header", value="#variables.instance.secret#");
                cfhttpparam(name="Accept", type="header", value="application/json");
                cfhttpparam(name="Content-Type", type="header", value="application/json");
                cfhttpparam(name="data", type="body", value='{"bankCode":"#reReplace( "#ucase(arguments.blz)#", "[^0-9]", "", "ALL")#","accountNumber":"#reReplace( "#ucase(arguments.konto)#", "[^0-9]", "", "ALL")#"}');
            }
            result.statuscode = httpresult.statusCode;
            if (httpresult.statusCode == 200) {
                result.data = deserializeJSON(httpresult.fileContent);
            }
        } catch (e any) {
            results.statuscode = 500;
        }
        
        return result;
    }

    function findGermanBank( required string blz) {
        var result = {};
        result.data = "";

        try {
            cfhttp(method="POST", charset="utf-8", url="#variables.instance.baseUrl#/find-german-bank", result="httpresult") {
                cfhttpparam(name="API-Key-Id", type="header", value="#variables.instance.key#");
                cfhttpparam(name="API-Key-Secret", type="header", value="#variables.instance.secret#");
                cfhttpparam(name="Accept", type="header", value="application/json");
                cfhttpparam(name="Content-Type", type="header", value="application/json");
                cfhttpparam(name="data", type="body", value='{"bankCode":"#reReplace( "#ucase(arguments.blz)#", "[^0-9]", "", "ALL")#"}');
            }
            result.statuscode = httpresult.statusCode;
            if (httpresult.statusCode == 200) {
                result.data = deserializeJSON(httpresult.fileContent);
            }
        } catch (e any) {
            results.statuscode = 500;
        }
        
        return result;
    }

    function findBank( required string bic) {
        var result = {};
        result.data = "";

        try {
            cfhttp(method="POST", charset="utf-8", url="#variables.instance.baseUrl#/find-bank", result="httpresult") {
                cfhttpparam(name="API-Key-Id", type="header", value="#variables.instance.key#");
                cfhttpparam(name="API-Key-Secret", type="header", value="#variables.instance.secret#");
                cfhttpparam(name="Accept", type="header", value="application/json");
                cfhttpparam(name="Content-Type", type="header", value="application/json");
                cfhttpparam(name="data", type="body", value='{"bic":"#reReplace( "#ucase(arguments.bic)#", "[^A-Z0-9]", "", "ALL")#"}');
            }
            result.statuscode = httpresult.statusCode;
            if (httpresult.statusCode == 200) {
                result.data = deserializeJSON(httpresult.fileContent);
            }
        } catch (e any) {
            results.statuscode = 500;
        }
        
        return result;
    }

}