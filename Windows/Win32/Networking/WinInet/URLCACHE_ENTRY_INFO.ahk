#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class URLCACHE_ENTRY_INFO extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {Pointer<Char>}
     */
    pwszSourceUrlName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Char>}
     */
    pwszLocalFileName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwCacheEntryType {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwUseCount {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    dwHitRate {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    dwSizeLow {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    dwSizeHigh {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {FILETIME}
     */
    ftLastModifiedTime{
        get {
            if(!this.HasProp("__ftLastModifiedTime"))
                this.__ftLastModifiedTime := FILETIME(this.ptr + 40)
            return this.__ftLastModifiedTime
        }
    }

    /**
     * @type {FILETIME}
     */
    ftExpireTime{
        get {
            if(!this.HasProp("__ftExpireTime"))
                this.__ftExpireTime := FILETIME(this.ptr + 48)
            return this.__ftExpireTime
        }
    }

    /**
     * @type {FILETIME}
     */
    ftLastAccessTime{
        get {
            if(!this.HasProp("__ftLastAccessTime"))
                this.__ftLastAccessTime := FILETIME(this.ptr + 56)
            return this.__ftLastAccessTime
        }
    }

    /**
     * @type {FILETIME}
     */
    ftLastSyncTime{
        get {
            if(!this.HasProp("__ftLastSyncTime"))
                this.__ftLastSyncTime := FILETIME(this.ptr + 64)
            return this.__ftLastSyncTime
        }
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbHeaderInfo {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    cbHeaderInfoSize {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbExtraData {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    cbExtraDataSize {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }
}
