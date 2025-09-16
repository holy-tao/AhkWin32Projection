#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used with the ADSVALUE structure to contain a distinguished name attribute value that also contains string data.
 * @remarks
 * When extending the active directory schema to add <b>ADS_DN_WITH_STRING</b>, you must also specify the otherWellKnownGuid attribute definition. Add the following to the ldf file attribute definition: omObjectClass:: KoZIhvcUAQEBDA==
 * @see https://learn.microsoft.com/windows/win32/api/iads/ns-iads-ads_dn_with_string
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_DN_WITH_STRING extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Pointer to a null-terminated Unicode string that contains the string value of the attribute.
     * @type {Pointer<PWSTR>}
     */
    pszStringValue {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a null-terminated Unicode string that contains the distinguished name.
     * @type {Pointer<PWSTR>}
     */
    pszDNString {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
