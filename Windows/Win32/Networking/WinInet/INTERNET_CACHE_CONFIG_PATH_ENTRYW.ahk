#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 * @charset Unicode
 */
class INTERNET_CACHE_CONFIG_PATH_ENTRYW extends Win32Struct
{
    static sizeof => 524

    static packingSize => 4

    /**
     * @type {String}
     */
    CachePath {
        get => StrGet(this.ptr + 0, 259, "UTF-16")
        set => StrPut(value, this.ptr + 0, 259, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwCacheSize {
        get => NumGet(this, 520, "uint")
        set => NumPut("uint", value, this, 520)
    }
}
