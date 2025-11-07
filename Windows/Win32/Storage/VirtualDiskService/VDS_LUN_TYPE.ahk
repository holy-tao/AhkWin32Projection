#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the set of valid types for a LUN.
 * @remarks
 * 
 * The  
 *         <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdssubsystem-createlun">IVdsSubSystem::CreateLun</a> method passes a <b>VDS_LUN_TYPE</b> value as a parameter to set a new LUN type, and the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_lun_prop">VDS_LUN_PROP</a> structure includes a <b>VDS_LUN_TYPE</b> value as a member to indicate an existing LUN type.
 * 
 * If the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdssubsystem-createlun">IVdsSubSystem::CreateLun</a> method returns a <b>VDS_LUN_TYPE</b> value that the caller does not recognize, the caller should display the LUN type as unknown. The caller should not attempt to map the unrecognized LUN type to another LUN type.
 * 
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_LUN_TYPE</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_LUN_TYPE</b> enumeration constant.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ne-vds-vds_lun_type
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_LUN_TYPE{

    /**
     * This value is reserved.
     * @type {Integer (Int32)}
     */
    static VDS_LT_UNKNOWN => 0

    /**
     * The LUN type is default automagic—the provider configures the LUN automatically based on hints. This value is used as an input parameter only; it is not returned by queries.
     * @type {Integer (Int32)}
     */
    static VDS_LT_DEFAULT => 1

    /**
     * The LUN type is fault tolerant automagic—the provider configures the LUN automatically based on hints, but with the requirement that the resulting LUN is fault tolerant. This value is used as an input parameter only; it is not returned by queries.
     * @type {Integer (Int32)}
     */
    static VDS_LT_FAULT_TOLERANT => 2

    /**
     * The LUN type is non-fault tolerant automagic—the provider configures the LUN automatically based on hints, but with the requirement that the resulting LUN is non-fault tolerant. This value is used as an input parameter only; it is not returned by queries.
     * @type {Integer (Int32)}
     */
    static VDS_LT_NON_FAULT_TOLERANT => 3

    /**
     * The LUN type is simple—it is composed of extents from exactly one drive.
     * @type {Integer (Int32)}
     */
    static VDS_LT_SIMPLE => 10

    /**
     * The LUN's type is spanned—it is composed of extents from more than one drive.
     * @type {Integer (Int32)}
     */
    static VDS_LT_SPAN => 11

    /**
     * The LUN type is striped, which is equivalent to RAID 0.
     * @type {Integer (Int32)}
     */
    static VDS_LT_STRIPE => 12

    /**
     * The LUN type is mirrored, which is equivalent to RAID 1.
     * @type {Integer (Int32)}
     */
    static VDS_LT_MIRROR => 13

    /**
     * The LUN type is striped with parity, which accounts for RAID levels 3, 4, 5, and 6.
     * @type {Integer (Int32)}
     */
    static VDS_LT_PARITY => 14

    /**
     * The LUN type is RAID level 2.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_LT_RAID2 => 15

    /**
     * The LUN type is RAID level 3.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_LT_RAID3 => 16

    /**
     * The LUN type is RAID level 4.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_LT_RAID4 => 17

    /**
     * The LUN type is RAID level 5.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_LT_RAID5 => 18

    /**
     * The LUN type is RAID level 6.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_LT_RAID6 => 19

    /**
     * The LUN type is RAID level 0+1.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_LT_RAID01 => 20

    /**
     * The LUN type is RAID level 0+3.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_LT_RAID03 => 21

    /**
     * The LUN type is RAID level 0+5.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_LT_RAID05 => 22

    /**
     * The LUN type is RAID level 1+0.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_LT_RAID10 => 23

    /**
     * The LUN type is RAID level 1+5.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_LT_RAID15 => 24

    /**
     * The LUN type is RAID level 3+0.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_LT_RAID30 => 25

    /**
     * The LUN type is RAID level 5+0.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_LT_RAID50 => 26

    /**
     * The LUN type is RAID level 5+1.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_LT_RAID51 => 27

    /**
     * The LUN type is RAID level 5+3.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_LT_RAID53 => 28

    /**
     * The LUN type is RAID level 6+0.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_LT_RAID60 => 29

    /**
     * The LUN type is RAID level 6+1.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_LT_RAID61 => 30
}
