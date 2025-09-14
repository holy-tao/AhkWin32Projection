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
     * @type {Array<SByte>}
     */
    CachePath{
        get {
            if(!this.HasProp("__CachePathProxyArray"))
                this.__CachePathProxyArray := Win32FixedArray(this.ptr + 0, 260, Primitive, "char")
            return this.__CachePathProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dwCacheSize {
        get => NumGet(this, 260, "uint")
        set => NumPut("uint", value, this, 260)
    }
}
