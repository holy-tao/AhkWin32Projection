#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 * @charset ANSI
 */
class INTERNET_CACHE_CONFIG_PATH_ENTRYA extends Win32Struct
{
    static sizeof => 264

    static packingSize => 4

    /**
     * @type {String}
     */
    CachePath {
        get => StrGet(this.ptr + 0, 259, "UTF-8")
        set => StrPut(value, this.ptr + 0, 259, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    dwCacheSize {
        get => NumGet(this, 260, "uint")
        set => NumPut("uint", value, this, 260)
    }
}
