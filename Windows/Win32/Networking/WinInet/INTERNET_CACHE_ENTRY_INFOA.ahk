#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Contains information about an entry in the Internet cache.
 * @remarks
 * 
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wininet/ns-wininet-internet_cache_entry_infoa
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 * @charset ANSI
 */
class INTERNET_CACHE_ENTRY_INFOA extends Win32Struct
{
    static sizeof => 112

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
     * Pointer to a null-terminated string that contains the URL name. The string occupies the memory area at the end of this structure.
     * @type {PSTR}
     */
    lpszSourceUrlName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a null-terminated string that contains the local file name. The string occupies the memory area at the end of this structure.
     * @type {PSTR}
     */
    lpszLocalFileName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

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
     * @type {Integer}
     */
    CacheEntryType {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Current number of WinINEet callers using the cache entry.
     * @type {Integer}
     */
    dwUseCount {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Number of times the cache entry was retrieved.
     * @type {Integer}
     */
    dwHitRate {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Low-order portion of the file size, in <b>bytes</b>.
     * @type {Integer}
     */
    dwSizeLow {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * High-order portion of the file size, in <b>bytes</b>.
     * @type {Integer}
     */
    dwSizeHigh {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the last modified time of this URL, in Greenwich mean time format.
     * @type {FILETIME}
     */
    LastModifiedTime{
        get {
            if(!this.HasProp("__LastModifiedTime"))
                this.__LastModifiedTime := FILETIME(48, this)
            return this.__LastModifiedTime
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the expiration time of this file, in Greenwich mean time format.
     * @type {FILETIME}
     */
    ExpireTime{
        get {
            if(!this.HasProp("__ExpireTime"))
                this.__ExpireTime := FILETIME(56, this)
            return this.__ExpireTime
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the last accessed time, in Greenwich mean time format.
     * @type {FILETIME}
     */
    LastAccessTime{
        get {
            if(!this.HasProp("__LastAccessTime"))
                this.__LastAccessTime := FILETIME(64, this)
            return this.__LastAccessTime
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the last time the cache was synchronized.
     * @type {FILETIME}
     */
    LastSyncTime{
        get {
            if(!this.HasProp("__LastSyncTime"))
                this.__LastSyncTime := FILETIME(72, this)
            return this.__LastSyncTime
        }
    }

    /**
     * Pointer to a buffer that contains the header information. The buffer occupies the memory at the end of this structure.
     * @type {PSTR}
     */
    lpHeaderInfo {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Size of the 
     * <b>lpHeaderInfo</b> buffer, in <b>TCHARs</b>.
     * @type {Integer}
     */
    dwHeaderInfoSize {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * Pointer to a string that contains the file name extension used to retrieve the data as a file. The string occupies the memory area at the end of this structure.
     * @type {PSTR}
     */
    lpszFileExtension {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    dwExemptDelta {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }
}
