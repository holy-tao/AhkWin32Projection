#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Used with the ADSVALUE structure to contain a distinguished name attribute value that also contains binary data.
 * @remarks
 * 
  * When extending the active directory schema to add <b>ADS_DN_WITH_BINARY</b>, you must also specify the otherWellKnownGuid attribute definition. Add the following to the ldf file attribute definition: omObjectClass:: KoZIhvcUAQEBCw==
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/ns-iads-ads_dn_with_binary
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_DN_WITH_BINARY extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Contains the length, in bytes, of the binary data in <b>lpBinaryValue</b>.
     * @type {Integer}
     */
    dwLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to an array of bytes that contains the binary data for the attribute. The <b>dwLength</b> member contains the number of bytes in this array.
     * @type {Pointer<Byte>}
     */
    lpBinaryValue {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a null-terminated Unicode string that contains the distinguished name.
     * @type {PWSTR}
     */
    pszDNString{
        get {
            if(!this.HasProp("__pszDNString"))
                this.__pszDNString := PWSTR(this.ptr + 16)
            return this.__pszDNString
        }
    }
}
