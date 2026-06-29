#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\INTERNET_CACHE_CONFIG_PATH_ENTRYA.ahk" { INTERNET_CACHE_CONFIG_PATH_ENTRYA }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

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
 * @charset ANSI
 */
export default struct INTERNET_CACHE_CONFIG_INFOA {
    #StructPack 4

    /**
     * Size of this structure, in bytes. This value can be used to help determine the version of the cache system.
     */
    dwStructSize : UInt32

    /**
     * The container that the rest of the data in the struct applies to. 0 (zero) indicates the content container.
     */
    dwContainer : UInt32

    /**
     * The cache quota limit of the container specified in kilobytes.
     */
    dwQuota : UInt32

    /**
     * Reserved.
     */
    dwReserved4 : UInt32

    /**
     * Reserved.
     */
    fPerUser : BOOL

    /**
     * Reserved.
     */
    dwSyncMode : UInt32

    /**
     * Reserved.
     */
    dwNumCachePaths : UInt32

    CachePath : CHAR[260]

    dwCacheSize : UInt32

    /**
     * The cache size of the container specified in kilobytes.
     */
    dwNormalUsage : UInt32

    /**
     * The number of kilobytes for this container exempt from scavenging.
     */
    dwExemptUsage : UInt32

    static __New() {
        DefineProp(this.Prototype, 'CachePaths', { type: INTERNET_CACHE_CONFIG_PATH_ENTRYA[1], offset: 28 })
        this.DeleteProp("__New")
    }
}
