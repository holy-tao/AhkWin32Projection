#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\VDS_HEALTH.ahk" { VDS_HEALTH }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\VDS_STORAGE_POOL_TYPE.ahk" { VDS_STORAGE_POOL_TYPE }
#Import ".\VDS_STORAGE_POOL_STATUS.ahk" { VDS_STORAGE_POOL_STATUS }

/**
 * The VDS_STORAGE_POOL_PROP structure (vdshwprv.h) defines the properties of a storage pool object.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsstoragepool-getproperties">IVdsStoragePool::GetProperties</a> returns this structure to report the properties of a <a href="https://docs.microsoft.com/windows/desktop/VDS/storage-pool-object">storage pool object</a>.
 * 
 * The following examples show how the <b>ullTotalConsumedSpace</b>, <b>ullTotalManagedSpace</b>, and <b>ullRemainingFreeSpace</b> members work together.
 * 
 * <h3><a id="Example_1"></a><a id="example_1"></a><a id="EXAMPLE_1"></a>Example 1</h3>
 * Suppose you have 2 drives of 1 TB each. Suppose further that you do the following:<ol>
 * <li>Create a storage pool as a mirror pool.</li>
 * <li>Create a LUN whose size is 200 GB.</li>
 * </ol>
 * 
 * 
 * <b>ullTotalConsumedSpace</b> = 2 TB. This is the amount of storage pool space  that is backed by physical storage or physical disks. Creating LUNs from the pool does not change this number.
 * 
 * <b>ullTotalManagedSpace</b> = 1 TB. This is the maximum size of the LUN or storage pool that can be created from this pool. Only 1 TB is available, because the pool type is a mirror with only 2 plexes. <div class="alert"><b>Note</b>  If the pool type were RAID5, <b>ullTotalManagedSpace</b> would be (<i>N</i>-1)/<i>N</i> * <b>ullTotalConsumedSpace</b>, where <i>N</i> is the number of columns. For example, with 5 drives and 5 columns, <b>ullTotalManagedSpace</b> would be (5-1)/5 * <b>ullTotalConsumedSpace</b> or 1.6 TB.</div>
 * <div> </div>
 * 
 * 
 * <b>ullRemainingFreeSpace</b> = 800 GB (1 TB – 200 GB), because 200GB has already been allocated to a LUN.
 * 
 * (<b>ullTotalManagedSpace</b> -  <b>ullRemainingFreeSpace</b>) is the amount of managed space allocated to LUNs and pools created from this pool. In this example, <b>ullTotalManagedSpace</b> -  <b>ullRemainingFreeSpace</b> = 200 GB.
 * 
 * <h3><a id="Example_2"></a><a id="example_2"></a><a id="EXAMPLE_2"></a>Example 2</h3>
 * Suppose you have 2 drives of 1 TB each. Suppose further that you do the following:<ol>
 * <li>Create a storage pool as a mirror pool.</li>
 * <li>Create a thin-provisioned LUN whose size is 10 TB.</li>
 * </ol>
 * 
 * 
 * <b>ullProvisionedSpace</b> = 10 TB. This applies only to thin-provisioned pools. This is the total space provisioned for the pool. The total space consumed by the pool is less than or equal to the total space provisioned for the pool.
 * 
 * <b>ullTotalConsumedSpace</b> = 2 TB.
 * 
 * <b>ullTotalManagedSpace</b> = 1 TB.
 * 
 * <b>ullRemainingFreeSpace</b> = 1 TB minus the amount of  managed space currently backing the LUN.  <div class="alert"><b>Note</b>  Although the LUN's size is 10 TB, there may be as little as 10 GB of managed space backing the LUN, in which case there would be 20 GB of consumed space backing the mirrored LUN.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_storage_pool_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_STORAGE_POOL_PROP {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/VDS/vds-data-types">VDS_OBJECT_ID</a> value that identifies the storage pool object.
     */
    id : Guid

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_storage_pool_status">VDS_STORAGE_POOL_STATUS</a> enumeration value that specifies the status of the storage pool.
     */
    status : VDS_STORAGE_POOL_STATUS

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_health">VDS_HEALTH</a> enumeration value that specifies the health of the storage pool. The following are the valid values for this member.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b><b>VDS_H_DEGRADED</b> is not supported.
     */
    health : VDS_HEALTH

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_storage_pool_type">VDS_STORAGE_POOL_TYPE</a> enumeration value that specifies the type of the storage pool.
     */
    type : VDS_STORAGE_POOL_TYPE

    /**
     * A string that specifies the name of the storage pool.
     */
    pwszName : PWSTR

    /**
     * A string that contains a description of the storage pool.
     */
    pwszDescription : PWSTR

    /**
     * The amount of physical storage backing  the storage pool, in bytes. The value of this member must be less than or equal to the value of the <b>ullProvisionedSpace</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_pool_attributes">VDS_POOL_ATTRIBUTES</a> structure.
     */
    ullTotalConsumedSpace : Int64

    /**
     * The space, in bytes, in this storage pool that can be allocated to create child storage elements (LUNs or pools), including space that has already been allocated. Depending on the way the storage pool is configured, the value of this member can be much less than the value of the <b>ullTotalConsumedSpace</b> member. For example, if the storage pool is configured as a mirrored pool, the value of <b>ullTotalManagedSpace</b> is only half as large as the value of the <b>ullTotalConsumedSpace</b> member.
     */
    ullTotalManagedSpace : Int64

    /**
     * The maximum size that may be used to create new LUNs or child storage pools from this pool, or to expand existing LUNs or child storage pools. To calculate the amount of managed space that has already been allocated to existing LUNs or child storage pools, subtract the value of this member from the value of the <b>ullTotalManagedSpace</b> member.
     */
    ullRemainingFreeSpace : Int64

}
