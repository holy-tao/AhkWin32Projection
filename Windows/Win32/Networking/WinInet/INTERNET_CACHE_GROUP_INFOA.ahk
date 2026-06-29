#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Contains the information for a particular cache group. (ANSI)
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines INTERNET_CACHE_GROUP_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wininet/ns-wininet-internet_cache_group_infoa
 * @namespace Windows.Win32.Networking.WinInet
 * @charset ANSI
 */
export default struct INTERNET_CACHE_GROUP_INFOA {
    #StructPack 4

    /**
     * Size of the structure, <b>TCHARs</b>.
     */
    dwGroupSize : UInt32

    /**
     * Group flags. Currently, the only value defined is CACHEGROUP_FLAG_NONPURGEABLE, which indicates that the cache entries in this group will not be removed by the cache manager.
     */
    dwGroupFlags : UInt32

    /**
     * Group type. Currently, the only value defined is CACHEGROUP_TYPE_INVALID.
     */
    dwGroupType : UInt32

    /**
     * Current disk usage of this cache group, in kilobytes.
     */
    dwDiskUsage : UInt32

    /**
     * Disk quota for this cache group, in kilobytes.
     */
    dwDiskQuota : UInt32

    /**
     * Array  that can be used by a client application to store information related to the group.
     */
    dwOwnerStorage : UInt32[4]

    /**
     * Group name.
     */
    szGroupName : CHAR[120]

}
