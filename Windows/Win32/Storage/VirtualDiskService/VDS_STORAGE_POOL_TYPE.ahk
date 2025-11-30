#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of storage pool types.
 * @remarks
 * 
 * The terms <i>primordial storage pool</i> and <i>concrete storage pool</i> are defined in section 5.1.3 of the "Part 3: Block Devices" portion of the <a href="https://www.snia.org/tech_activities/standards/curr_standards/smi/">SMI-S v1.5 specification</a>, which can be downloaded from the <a href="https://www.snia.org/">SNIA website</a>.
 * 
 * A storage area network (SAN) can contain one primordial pool. You can create multiple concrete pools within the primordial pool. The attributes in the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_pool_attributes">VDS_POOL_ATTRIBUTES</a> structure do not apply to a primordial pool, because it contains all physically available storage on the SAN. For example, suppose you have ten 10-GB SAN drives, five of which are in a concrete pool. In the Disk Management utility, the primordial pool has ten disk drives and a size of 100 GB, because it has a total of 100 GB of storage space available. The concrete pool has only 50 GB of storage space available. But if it is thin-provisioned, the size that the Disk Management utility reports for the concrete pool might be much larger than 50 GB.
 * 
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_STORAGE_POOL_TYPE</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_STORAGE_POOL_TYPE</b> enumeration constant.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ne-vds-vds_storage_pool_type
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_STORAGE_POOL_TYPE extends Win32Enum{

    /**
     * The storage pool type is unknown.
     * @type {Integer (Int32)}
     */
    static VDS_SPT_UNKNOWN => 0

    /**
     * The storage pool type is primordial.
     * @type {Integer (Int32)}
     */
    static VDS_SPT_PRIMORDIAL => 1

    /**
     * The storage pool type is concrete (non-primordial).
     * @type {Integer (Int32)}
     */
    static VDS_SPT_CONCRETE => 2
}
