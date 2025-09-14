#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class APP_CACHE_GROUP_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer<PWSTR>}
     */
    pwszManifestUrl {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {FILETIME}
     */
    ftLastAccessTime{
        get {
            if(!this.HasProp("__ftLastAccessTime"))
                this.__ftLastAccessTime := FILETIME(this.ptr + 8)
            return this.__ftLastAccessTime
        }
    }

    /**
     * @type {Integer}
     */
    ullSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
