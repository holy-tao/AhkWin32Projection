#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The ADS_EMAIL structure is an ADSI representation of the EMail Address attribute syntax.
 * @see https://docs.microsoft.com/windows/win32/api//iads/ns-iads-ads_email
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_EMAIL extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The null-terminated Unicode string that contains the user address.
     * @type {PWSTR}
     */
    Address{
        get {
            if(!this.HasProp("__Address"))
                this.__Address := PWSTR(this.ptr + 0)
            return this.__Address
        }
    }

    /**
     * Type of the email message.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
