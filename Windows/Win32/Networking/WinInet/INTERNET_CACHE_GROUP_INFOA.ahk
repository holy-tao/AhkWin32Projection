#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the information for a particular cache group.
 * @remarks
 * 
  * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
  * <div> </div>
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The wininet.h header defines INTERNET_CACHE_GROUP_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wininet/ns-wininet-internet_cache_group_infoa
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 * @charset ANSI
 */
class INTERNET_CACHE_GROUP_INFOA extends Win32Struct
{
    static sizeof => 156

    static packingSize => 4

    /**
     * Size of the structure, <b>TCHARs</b>.
     * @type {Integer}
     */
    dwGroupSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Group flags. Currently, the only value defined is CACHEGROUP_FLAG_NONPURGEABLE, which indicates that the cache entries in this group will not be removed by the cache manager.
     * @type {Integer}
     */
    dwGroupFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Group type. Currently, the only value defined is CACHEGROUP_TYPE_INVALID.
     * @type {Integer}
     */
    dwGroupType {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Current disk usage of this cache group, in kilobytes.
     * @type {Integer}
     */
    dwDiskUsage {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Disk quota for this cache group, in kilobytes.
     * @type {Integer}
     */
    dwDiskQuota {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Array  that can be used by a client application to store information related to the group.
     * @type {Array<UInt32>}
     */
    dwOwnerStorage{
        get {
            if(!this.HasProp("__dwOwnerStorageProxyArray"))
                this.__dwOwnerStorageProxyArray := Win32FixedArray(this.ptr + 20, 4, Primitive, "uint")
            return this.__dwOwnerStorageProxyArray
        }
    }

    /**
     * Group name.
     * @type {String}
     */
    szGroupName {
        get => StrGet(this.ptr + 36, 119, "UTF-8")
        set => StrPut(value, this.ptr + 36, 119, "UTF-8")
    }
}
