#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * Contains information about an entry in the Internet cache. (Unicode)
 * @remarks
 * There is no cache entry size limit, so applications that need to enumerate the cache must be prepared to allocate variable-sized buffers. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/appendix-b-using-buffers">Using Buffers</a>.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines INTERNET_CACHE_ENTRY_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wininet/ns-wininet-internet_cache_entry_infow
 * @namespace Windows.Win32.Networking.WinInet
 * @charset Unicode
 */
export default struct INTERNET_CACHE_ENTRY_INFOW {
    #StructPack 8

    /**
     * Size of this structure, in bytes. This value can be used to help determine the version of the cache system.
     */
    dwStructSize : UInt32

    /**
     * Pointer to a null-terminated string that contains the URL name. The string occupies the memory area at the end of this structure.
     */
    lpszSourceUrlName : PWSTR

    /**
     * Pointer to a null-terminated string that contains the local file name. The string occupies the memory area at the end of this structure.
     */
    lpszLocalFileName : PWSTR

    /**
     * A bitmask indicating the type of cache entry and its properties. The cache entry types include: history entries (URLHISTORY_CACHE_ENTRY),  cookie entries  (COOKIE_CACHE_ENTRY), and normal cached content (NORMAL_CACHE_ENTRY).
     * 
     * 
     * This member can be zero or more of the following property flags, and  cache type flags listed below.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EDITED_CACHE_ENTRY"></a><a id="edited_cache_entry"></a><dl>
     * <dt><b>EDITED_CACHE_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cache entry file that has been edited externally. This cache entry type is exempt from scavenging.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SPARSE_CACHE_ENTRY"></a><a id="sparse_cache_entry"></a><dl>
     * <dt><b>SPARSE_CACHE_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Partial response cache entry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="STICKY_CACHE_ENTRY"></a><a id="sticky_cache_entry"></a><dl>
     * <dt><b>STICKY_CACHE_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sticky cache entry that is exempt from scavenging for the amount of time specified by 
     * <b>dwExemptDelta</b>. The default value set by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-commiturlcacheentrya">CommitUrlCacheEntryA</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-commiturlcacheentryw">CommitUrlCacheEntryW</a> is one day. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRACK_OFFLINE_CACHE_ENTRY"></a><a id="track_offline_cache_entry"></a><dl>
     * <dt><b>TRACK_OFFLINE_CACHE_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not currently implemented.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRACK_ONLINE_CACHE_ENTRY"></a><a id="track_online_cache_entry"></a><dl>
     * <dt><b>TRACK_ONLINE_CACHE_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not currently implemented.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * The following list contains the cache type flags.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="COOKIE_CACHE_ENTRY"></a><a id="cookie_cache_entry"></a><dl>
     * <dt><b>COOKIE_CACHE_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cookie cache entry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NORMAL_CACHE_ENTRY"></a><a id="normal_cache_entry"></a><dl>
     * <dt><b>NORMAL_CACHE_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Normal cache entry; can be deleted to recover space for new entries.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="URLHISTORY_CACHE_ENTRY"></a><a id="urlhistory_cache_entry"></a><dl>
     * <dt><b>URLHISTORY_CACHE_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Visited link cache entry.
     * 
     * </td>
     * </tr>
     * </table>
     */
    CacheEntryType : UInt32

    /**
     * Current number of WinINEet callers using the cache entry.
     */
    dwUseCount : UInt32

    /**
     * Number of times the cache entry was retrieved.
     */
    dwHitRate : UInt32

    /**
     * Low-order portion of the file size, in <b>bytes</b>.
     */
    dwSizeLow : UInt32

    /**
     * High-order portion of the file size, in <b>bytes</b>.
     */
    dwSizeHigh : UInt32

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the last modified time of this URL, in Greenwich mean time format.
     */
    LastModifiedTime : FILETIME

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the expiration time of this file, in Greenwich mean time format.
     */
    ExpireTime : FILETIME

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the last accessed time, in Greenwich mean time format.
     */
    LastAccessTime : FILETIME

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the last time the cache was synchronized.
     */
    LastSyncTime : FILETIME

    /**
     * Pointer to a buffer that contains the header information. The buffer occupies the memory at the end of this structure.
     */
    lpHeaderInfo : PWSTR

    /**
     * Size of the 
     * <b>lpHeaderInfo</b> buffer, in <b>TCHARs</b>.
     */
    dwHeaderInfoSize : UInt32

    /**
     * Pointer to a string that contains the file name extension used to retrieve the data as a file. The string occupies the memory area at the end of this structure.
     */
    lpszFileExtension : PWSTR

    dwReserved : UInt32

    static __New() {
        DefineProp(this.Prototype, 'dwExemptDelta', { type: UInt32, offset: 104 })
        this.DeleteProp("__New")
    }
}
