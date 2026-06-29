#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The ADS_POSTALADDRESS structure is an ADSI representation of the Postal Address attribute.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ns-iads-ads_postaladdress
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct ADS_POSTALADDRESS {
    #StructPack 8

    /**
     * An array of six null-terminated Unicode strings that represent the postal address.
     */
    PostalAddress : PWSTR[6]

}
