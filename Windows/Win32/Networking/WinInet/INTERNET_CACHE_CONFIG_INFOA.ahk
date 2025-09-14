#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\INTERNET_CACHE_CONFIG_PATH_ENTRYA.ahk

/**
 * Contains information about the configuration of the Internet cache. (ANSI)
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
  * <div> </div>
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The winineti.h header defines INTERNET_CACHE_CONFIG_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winineti/ns-winineti-internet_cache_config_infoa
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 * @charset ANSI
 */
class INTERNET_CACHE_CONFIG_INFOA extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Size of this structure, in bytes. This value can be used to help determine the version of the cache system.
     * @type {Integer}
     */
    dwStructSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The container that the rest of the data in the struct applies to. 0 (zero) indicates the content container.
     * @type {Integer}
     */
    dwContainer {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The cache quota limit of the container specified in kilobytes.
     * @type {Integer}
     */
    dwQuota {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    dwReserved4 {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    fPerUser {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    dwSyncMode {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    dwNumCachePaths {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Array<SByte>}
     */
    CachePath{
        get {
            if(!this.HasProp("__CachePathProxyArray"))
                this.__CachePathProxyArray := Win32FixedArray(this.ptr + 32, 260, Primitive, "char")
            return this.__CachePathProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dwCacheSize {
        get => NumGet(this, 292, "uint")
        set => NumPut("uint", value, this, 292)
    }

    /**
     * @type {Array<INTERNET_CACHE_CONFIG_PATH_ENTRYA>}
     */
    CachePaths{
        get {
            if(!this.HasProp("__CachePathsProxyArray"))
                this.__CachePathsProxyArray := Win32FixedArray(this.ptr + 32, 1, INTERNET_CACHE_CONFIG_PATH_ENTRYA, "")
            return this.__CachePathsProxyArray
        }
    }

    /**
     * The cache size of the container specified in kilobytes.
     * @type {Integer}
     */
    dwNormalUsage {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The number of kilobytes for this container exempt from scavenging.
     * @type {Integer}
     */
    dwExemptUsage {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}
