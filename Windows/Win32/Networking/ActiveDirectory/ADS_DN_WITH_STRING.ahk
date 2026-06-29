#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Used with the ADSVALUE structure to contain a distinguished name attribute value that also contains string data.
 * @remarks
 * When extending the active directory schema to add <b>ADS_DN_WITH_STRING</b>, you must also specify the otherWellKnownGuid attribute definition. Add the following to the ldf file attribute definition: omObjectClass:: KoZIhvcUAQEBDA==
 * @see https://learn.microsoft.com/windows/win32/api/iads/ns-iads-ads_dn_with_string
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct ADS_DN_WITH_STRING {
    #StructPack 8

    /**
     * Pointer to a null-terminated Unicode string that contains the string value of the attribute.
     */
    pszStringValue : PWSTR

    /**
     * Pointer to a null-terminated Unicode string that contains the distinguished name.
     */
    pszDNString : PWSTR

}
