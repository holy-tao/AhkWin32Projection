#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 * @charset ANSI
 */
class INTERNET_CACHE_CONTAINER_INFOA extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwCacheVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PSTR}
     */
    lpszName{
        get {
            if(!this.HasProp("__lpszName"))
                this.__lpszName := PSTR(this.ptr + 8)
            return this.__lpszName
        }
    }

    /**
     * @type {PSTR}
     */
    lpszCachePrefix{
        get {
            if(!this.HasProp("__lpszCachePrefix"))
                this.__lpszCachePrefix := PSTR(this.ptr + 16)
            return this.__lpszCachePrefix
        }
    }

    /**
     * @type {PSTR}
     */
    lpszVolumeLabel{
        get {
            if(!this.HasProp("__lpszVolumeLabel"))
                this.__lpszVolumeLabel := PSTR(this.ptr + 24)
            return this.__lpszVolumeLabel
        }
    }

    /**
     * @type {PSTR}
     */
    lpszVolumeTitle{
        get {
            if(!this.HasProp("__lpszVolumeTitle"))
                this.__lpszVolumeTitle := PSTR(this.ptr + 32)
            return this.__lpszVolumeTitle
        }
    }
}
