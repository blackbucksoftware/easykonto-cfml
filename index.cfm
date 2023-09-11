<cfset mollie = new easykonto() />

<cfset x = mollie.checkIban( iban='de89 37040 0440 5320 13000') />
<cfdump var="#x#" />

<cfset x2 = mollie.checkGermanAccount( blz='40040028', konto='342948700') />
<cfdump var="#x2#" />

<cfset x3 = mollie.findGermaNBANK( blz='40040028') />
<cfdump var="#x3#" label="findGermanBank" />

<cfset x4 = mollie.findBank( bic='COBADEFFXXX') />
<cfdump var="#x4#" label="findBank" />


<cfset iban="de89 3704 00440532013000" />
<cfoutput>
<p>
    #reReplace( "#ucase(iban)#", "[^A-Z0-9]", "", "ALL")#
</p>
</cfoutput>