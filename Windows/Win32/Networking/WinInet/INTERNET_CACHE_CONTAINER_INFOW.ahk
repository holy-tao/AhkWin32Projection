#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 * @charset Unicode
 */
class INTERNET_CACHE_CONTAINER_INFOW extends Win32Struct
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
     * @type {PWSTR}
     */
    lpszName{
        get {
            if(!this.HasProp("__lpszName"))
                this.__lpszName := PWSTR(this.ptr + 8)
            return this.__lpszName
        }
    }

    /**
     * @type {PWSTR}
     */
    lpszCachePrefix{
        get {
            if(!this.HasProp("__lpszCachePrefix"))
                this.__lpszCachePrefix := PWSTR(this.ptr + 16)
            return this.__lpszCachePrefix
        }
    }

    /**
     * @type {PWSTR}
     */
    lpszVolumeLabel{
        get {
            if(!this.HasProp("__lpszVolumeLabel"))
                this.__lpszVolumeLabel := PWSTR(this.ptr + 24)
            return this.__lpszVolumeLabel
        }
    }

    /**
     * @type {PWSTR}
     */
    lpszVolumeTitle{
        get {
            if(!this.HasProp("__lpszVolumeTitle"))
                this.__lpszVolumeTitle := PWSTR(this.ptr + 32)
            return this.__lpszVolumeTitle
        }
    }
}
