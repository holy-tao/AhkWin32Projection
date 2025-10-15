#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class APP_CACHE_DOWNLOAD_ENTRY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pwszUrl{
        get {
            if(!this.HasProp("__pwszUrl"))
                this.__pwszUrl := PWSTR(this.ptr + 0)
            return this.__pwszUrl
        }
    }

    /**
     * @type {Integer}
     */
    dwEntryType {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
