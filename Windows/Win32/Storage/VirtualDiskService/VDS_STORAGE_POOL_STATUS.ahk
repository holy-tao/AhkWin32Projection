#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of object status values for a storage pool.
 * @remarks
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_storage_pool_prop">VDS_STORAGE_POOL_PROP</a> structure uses a <b>VDS_STORAGE_POOL_STATUS</b> value in the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_storage_pool_prop">status</a> member to indicate the current status of the storage pool.
 * 
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_STORAGE_POOL_STATUS</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_STORAGE_POOL_STATUS</b> enumeration constant.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ne-vds-vds_storage_pool_status
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_STORAGE_POOL_STATUS extends Win32Enum{

    /**
     * The provider failed to get the storage pool properties or could not access the storage pool.
     * @type {Integer (Int32)}
     */
    static VDS_SPS_UNKNOWN => 0

    /**
     * The storage pool is available.
     * @type {Integer (Int32)}
     */
    static VDS_SPS_ONLINE => 1

    /**
     * The storage pool is busy.
     * @type {Integer (Int32)}
     */
    static VDS_SPS_NOT_READY => 2

    /**
     * The storage pool is not available.
     * @type {Integer (Int32)}
     */
    static VDS_SPS_OFFLINE => 4
}
