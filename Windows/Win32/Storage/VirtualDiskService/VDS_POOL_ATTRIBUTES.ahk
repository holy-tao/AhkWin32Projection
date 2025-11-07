#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the attributes of a storage pool.
 * @remarks
 * 
 * If an attribute is set for a storage pool, that attribute setting must apply to all drive extents that make up the pool.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ns-vds-vds_pool_attributes
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_POOL_ATTRIBUTES extends Win32Struct
{
    static sizeof => 176

    static packingSize => 8

    /**
     * A mask that specifies the attributes in the structure that are defined by this storage pool. 
     * 
     * 
     * The list of valid attribute flags is as follows. Each flag corresponds to a member in the <b>VDS_POOL_ATTRIBUTES</b> structure. Unused bits are reserved.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Attribute defined by the storage pool</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_POOL_ATTRIB_RAIDTYPE"></a><a id="vds_pool_attrib_raidtype"></a><dl>
     * <dt><b>VDS_POOL_ATTRIB_RAIDTYPE</b></dt>
     * <dt>0x1L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>raidType</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_POOL_ATTRIB_BUSTYPE"></a><a id="vds_pool_attrib_bustype"></a><dl>
     * <dt><b>VDS_POOL_ATTRIB_BUSTYPE</b></dt>
     * <dt>0x2L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>busType</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_POOL_ATTRIB_ALLOW_SPINDOWN"></a><a id="vds_pool_attrib_allow_spindown"></a><dl>
     * <dt><b>VDS_POOL_ATTRIB_ALLOW_SPINDOWN</b></dt>
     * <dt>0x4L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>bSpinDown</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_POOL_ATTRIB_THIN_PROVISION"></a><a id="vds_pool_attrib_thin_provision"></a><dl>
     * <dt><b>VDS_POOL_ATTRIB_THIN_PROVISION</b></dt>
     * <dt>0x8L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>bIsThinProvisioned</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_POOL_ATTRIB_NO_SINGLE_POF"></a><a id="vds_pool_attrib_no_single_pof"></a><dl>
     * <dt><b>VDS_POOL_ATTRIB_NO_SINGLE_POF</b></dt>
     * <dt>0x10L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>bNoSinglePointOfFailure</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_POOL_ATTRIB_DATA_RDNCY_MAX"></a><a id="vds_pool_attrib_data_rdncy_max"></a><dl>
     * <dt><b>VDS_POOL_ATTRIB_DATA_RDNCY_MAX</b></dt>
     * <dt>0x20L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>ulDataRedundancyMax</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_POOL_ATTRIB_DATA_RDNCY_MIN"></a><a id="vds_pool_attrib_data_rdncy_min"></a><dl>
     * <dt><b>VDS_POOL_ATTRIB_DATA_RDNCY_MIN</b></dt>
     * <dt>0x40L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>ulDataRedundancyMin</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_POOL_ATTRIB_DATA_RDNCY_DEF"></a><a id="vds_pool_attrib_data_rdncy_def"></a><dl>
     * <dt><b>VDS_POOL_ATTRIB_DATA_RDNCY_DEF</b></dt>
     * <dt>0x80L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>ulDataRedundancyDefault</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_POOL_ATTRIB_PKG_RDNCY_MAX"></a><a id="vds_pool_attrib_pkg_rdncy_max"></a><dl>
     * <dt><b>VDS_POOL_ATTRIB_PKG_RDNCY_MAX</b></dt>
     * <dt>0x100L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>ulPackageRedundancyDefault</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_POOL_ATTRIB_PKG_RDNCY_MIN"></a><a id="vds_pool_attrib_pkg_rdncy_min"></a><dl>
     * <dt><b>VDS_POOL_ATTRIB_PKG_RDNCY_MIN</b></dt>
     * <dt>0x200L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>ulPackageRedundancyMin</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_POOL_ATTRIB_PKG_RDNCY_DEF"></a><a id="vds_pool_attrib_pkg_rdncy_def"></a><dl>
     * <dt><b>VDS_POOL_ATTRIB_PKG_RDNCY_DEF</b></dt>
     * <dt>0x400L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>ulPackageRedundancyDefault</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_POOL_ATTRIB_STRIPE_SIZE"></a><a id="vds_pool_attrib_stripe_size"></a><dl>
     * <dt><b>VDS_POOL_ATTRIB_STRIPE_SIZE</b></dt>
     * <dt>0x800L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>ulStripeSize</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_POOL_ATTRIB_STRIPE_SIZE_MAX"></a><a id="vds_pool_attrib_stripe_size_max"></a><dl>
     * <dt><b>VDS_POOL_ATTRIB_STRIPE_SIZE_MAX</b></dt>
     * <dt>0x1000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>ulStripeSizeMax</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_POOL_ATTRIB_STRIPE_SIZE_MIN"></a><a id="vds_pool_attrib_stripe_size_min"></a><dl>
     * <dt><b>VDS_POOL_ATTRIB_STRIPE_SIZE_MIN</b></dt>
     * <dt>0x2000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>ulStripeSizeMin</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_POOL_ATTRIB_STRIPE_SIZE_DEF"></a><a id="vds_pool_attrib_stripe_size_def"></a><dl>
     * <dt><b>VDS_POOL_ATTRIB_STRIPE_SIZE_DEF</b></dt>
     * <dt>0x4000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>ulDefaultStripeSize</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_POOL_ATTRIB_NUM_CLMNS"></a><a id="vds_pool_attrib_num_clmns"></a><dl>
     * <dt><b>VDS_POOL_ATTRIB_NUM_CLMNS</b></dt>
     * <dt>0x8000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>ulNumberOfColumns</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_POOL_ATTRIB_NUM_CLMNS_MAX"></a><a id="vds_pool_attrib_num_clmns_max"></a><dl>
     * <dt><b>VDS_POOL_ATTRIB_NUM_CLMNS_MAX</b></dt>
     * <dt>0x10000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>ulNumberOfColumnsMax</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_POOL_ATTRIB_NUM_CLMNS_MIN"></a><a id="vds_pool_attrib_num_clmns_min"></a><dl>
     * <dt><b>VDS_POOL_ATTRIB_NUM_CLMNS_MIN</b></dt>
     * <dt>0x20000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>ulNumberOfColumnsMin</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_POOL_ATTRIB_NUM_CLMNS_DEF"></a><a id="vds_pool_attrib_num_clmns_def"></a><dl>
     * <dt><b>VDS_POOL_ATTRIB_NUM_CLMNS_DEF</b></dt>
     * <dt>0x40000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>ulDefaultNumberofColumns</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_POOL_ATTRIB_DATA_AVL_HINT"></a><a id="vds_pool_attrib_data_avl_hint"></a><dl>
     * <dt><b>VDS_POOL_ATTRIB_DATA_AVL_HINT</b></dt>
     * <dt>0x80000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>ulDataAvailabilityHint</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_POOL_ATTRIB_ACCS_RNDM_HINT"></a><a id="vds_pool_attrib_accs_rndm_hint"></a><dl>
     * <dt><b>VDS_POOL_ATTRIB_ACCS_RNDM_HINT</b></dt>
     * <dt>0x100000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>ulAccessRandomnessHint</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_POOL_ATTRIB_ACCS_DIR_HINT"></a><a id="vds_pool_attrib_accs_dir_hint"></a><dl>
     * <dt><b>VDS_POOL_ATTRIB_ACCS_DIR_HINT</b></dt>
     * <dt>0x200000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>ulAccessDirectionHint</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_POOL_ATTRIB_ACCS_SIZE_HINT"></a><a id="vds_pool_attrib_accs_size_hint"></a><dl>
     * <dt><b>VDS_POOL_ATTRIB_ACCS_SIZE_HINT</b></dt>
     * <dt>0x400000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>ulAccessSizeHint</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_POOL_ATTRIB_ACCS_LTNCY_HINT"></a><a id="vds_pool_attrib_accs_ltncy_hint"></a><dl>
     * <dt><b>VDS_POOL_ATTRIB_ACCS_LTNCY_HINT</b></dt>
     * <dt>0x800000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>ulAccessLatencyHint</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_POOL_ATTRIB_ACCS_BDW_WT_HINT"></a><a id="vds_pool_attrib_accs_bdw_wt_hint"></a><dl>
     * <dt><b>VDS_POOL_ATTRIB_ACCS_BDW_WT_HINT</b></dt>
     * <dt>0x1000000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>ulAccessBandwidthWeightHint</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_POOL_ATTRIB_STOR_COST_HINT"></a><a id="vds_pool_attrib_stor_cost_hint"></a><dl>
     * <dt><b>VDS_POOL_ATTRIB_STOR_COST_HINT</b></dt>
     * <dt>0x2000000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>ulStorageCostHint</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_POOL_ATTRIB_STOR_EFFCY_HINT"></a><a id="vds_pool_attrib_stor_effcy_hint"></a><dl>
     * <dt><b>VDS_POOL_ATTRIB_STOR_EFFCY_HINT</b></dt>
     * <dt>0x4000000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>ulStorageEfficiencyHint</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_POOL_ATTRIB_CUSTOM_ATTRIB"></a><a id="vds_pool_attrib_custom_attrib"></a><dl>
     * <dt><b>VDS_POOL_ATTRIB_CUSTOM_ATTRIB</b></dt>
     * <dt>0x8000000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>pPoolCustomAttributes</b>
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    ullAttributeMask {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A  <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_raid_type">VDS_RAID_TYPE</a> enumeration value that specifies the RAID type of the storage pool. If the storage pool does not have a specific RAID type, set this member to <b>VDS_RT_UNKNOWN</b> and  clear the <b>VDS_POOL_ATTRIB_RAIDTYPE</b> attribute flag in the <b>ullAttributeMask</b> member.
     * @type {Integer}
     */
    raidType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ne-vdslun-vds_storage_bus_type">VDS_STORAGE_BUS_TYPE</a> enumeration value that specifies the bus type of the drives in the storage pool.
     * @type {Integer}
     */
    busType {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * A string that specifies the usage of the storage pool. Typically, this may indicate the application that is using the storage pool (for example,  "SQL" or "Exchange") or the business function that is using the storage pool (for example, "Finance" or "Human Resources").
     * @type {PWSTR}
     */
    pwszIntendedUsage {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * <b>TRUE</b> if the drives in the storage pool spin down automatically to reduce power usage, or <b>FALSE</b> otherwise.
     * @type {BOOL}
     */
    bSpinDown {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * <b>TRUE</b> if the storage pool is thin provisioned, or <b>FALSE</b> otherwise. If the pool is thin provisioned, the number of bytes in the consumed space of the pool could be less than the number of bytes in the provisioned space of the pool. (The number of bytes in the provisioned space is stored in the <b>ullProvisionedSpace</b> member of this structure. The number of bytes in the consumed space is stored in the <b>ullTotalConsumedSpace</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_storage_pool_prop">VDS_STORAGE_POOL_PROP</a> structure.) When a hardware provider sets this member to <b>TRUE</b>, it must also set the <b>type</b> member of the <b>VDS_STORAGE_POOL_PROP</b> structure to <b>VDS_SPT_CONCRETE</b>.
     * @type {BOOL}
     */
    bIsThinProvisioned {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * If the pool is thin provisioned, this member specifies the space, in bytes, that is provisioned for the pool. The value of this member must be greater than or equal to the value of the <b>ullTotalConsumedSpace</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_storage_pool_prop">VDS_STORAGE_POOL_PROP</a> structure.
     * @type {Integer}
     */
    ullProvisionedSpace {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * <b>TRUE</b> if there is no single point of failure in the pool, or <b>FALSE</b> otherwise.
     * @type {BOOL}
     */
    bNoSinglePointOfFailure {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * The maximum number of complete copies of the data that can be maintained in this storage pool.
     * @type {Integer}
     */
    ulDataRedundancyMax {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * The minimum number of complete copies of the data that can be maintained in this storage pool.
     * @type {Integer}
     */
    ulDataRedundancyMin {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The default number of complete copies of the data that are maintained in this storage pool.
     * @type {Integer}
     */
    ulDataRedundancyDefault {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * The maximum number of drives that can be used in the storage pool to ensure package redundancy. Package redundancy indicates the number of drives that can fail in the storage pool without resulting in a data loss.
     * @type {Integer}
     */
    ulPackageRedundancyMax {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * The minimum number of drives that can be used in the storage pool to ensure package redundancy. Package redundancy indicates the number of drives that can fail in the storage pool without resulting in a data loss.
     * @type {Integer}
     */
    ulPackageRedundancyMin {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * The default number of drives that are used in the storage pool to ensure package redundancy. Package redundancy indicates the number of drives that can fail in the storage pool without resulting in a data loss.
     * @type {Integer}
     */
    ulPackageRedundancyDefault {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * The mirror or parity stripe size, in bytes, of the storage pool if the pool is striped (with or without parity).
     * @type {Integer}
     */
    ulStripeSize {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * The maximum stripe size, in bytes, that is supported by the storage pool.
     * @type {Integer}
     */
    ulStripeSizeMax {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * The minimum stripe size, in bytes, that is supported by the storage pool.
     * @type {Integer}
     */
    ulStripeSizeMin {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * The default stripe size, in bytes, that is supported by the storage pool.
     * @type {Integer}
     */
    ulDefaultStripeSize {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * The number of columns of the storage pool if the pool is striped (with or without parity).
     * @type {Integer}
     */
    ulNumberOfColumns {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * The maximum number of columns supported by the storage pool.
     * @type {Integer}
     */
    ulNumberOfColumnsMax {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * The minimum number of columns supported by the storage pool.
     * @type {Integer}
     */
    ulNumberOfColumnsMin {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * The default number of columns supported by the storage pool.
     * @type {Integer}
     */
    ulDefaultNumberofColumns {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * A hint from the client that indicates the importance placed on data availability. Values range from 0 (Not Important) to 10 (Very Important).
     * @type {Integer}
     */
    ulDataAvailabilityHint {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * A hint from the client that indicates the randomness of data access. Values range from 0 (Entirely Sequential) to 10 (Entirely Random).
     * @type {Integer}
     */
    ulAccessRandomnessHint {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * A hint from the client that indicates the direction of data access. Values range from 0 (Entirely Read) to 10 (Entirely Write).
     * @type {Integer}
     */
    ulAccessDirectionHint {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * A hint from the client that indicates the optimal access size in megabytes.
     * @type {Integer}
     */
    ulAccessSizeHint {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * A hint from the client that indicates the importance of access latency to the client. Values range from 0 (Not Important) to 10 (Very Important).
     * @type {Integer}
     */
    ulAccessLatencyHint {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * A hint from the client that indicates the importance of high bandwidth. Values range from 0 (Not Important) to 10 (Very Important).
     * @type {Integer}
     */
    ulAccessBandwidthWeightHint {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * A hint from the client that indicates the importance of storage cost to the client. Values range from 0 (Not Important) to 10 (Very Important). If the storage cost is very important to the client, a value of 10 indicates that the client would prefer to provision the pool using lower cost storage.
     * @type {Integer}
     */
    ulStorageCostHint {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
    }

    /**
     * A hint from the client that indicates the importance of storage efficiency to the client. Values range from 0 (Not Important) to 10 (Very Important).
     * @type {Integer}
     */
    ulStorageEfficiencyHint {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * The number of custom attributes defined for the storage pool.
     * @type {Integer}
     */
    ulNumOfCustomAttributes {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_pool_custom_attributes">VDS_POOL_CUSTOM_ATTRIBUTES</a> structures. Each structure contains a custom attribute that is defined for the storage pool.
     * @type {Pointer<VDS_POOL_CUSTOM_ATTRIBUTES>}
     */
    pPoolCustomAttributes {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * This member is reserved for future use. Do not use.
     * @type {BOOL}
     */
    bReserved1 {
        get => NumGet(this, 144, "int")
        set => NumPut("int", value, this, 144)
    }

    /**
     * This member is reserved for future use. Do not use.
     * @type {BOOL}
     */
    bReserved2 {
        get => NumGet(this, 148, "int")
        set => NumPut("int", value, this, 148)
    }

    /**
     * This member is reserved for future use. Do not use.
     * @type {Integer}
     */
    ulReserved1 {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * This member is reserved for future use. Do not use.
     * @type {Integer}
     */
    ulReserved2 {
        get => NumGet(this, 156, "uint")
        set => NumPut("uint", value, this, 156)
    }

    /**
     * This member is reserved for future use. Do not use.
     * @type {Integer}
     */
    ullReserved1 {
        get => NumGet(this, 160, "uint")
        set => NumPut("uint", value, this, 160)
    }

    /**
     * This member is reserved for future use. Do not use.
     * @type {Integer}
     */
    ullReserved2 {
        get => NumGet(this, 168, "uint")
        set => NumPut("uint", value, this, 168)
    }
}
