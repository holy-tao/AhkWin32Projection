#Requires AutoHotkey v2.0.0 64-bit

/**
 * The VDS_LUN_PLEX_TYPE enumeration (vdshwprv.h) defines the set of valid types for a LUN plex.
 * @remarks
 * The  <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_lun_plex_prop">VDS_LUN_PLEX_PROP</a> structure includes a <b>VDS_LUN_PLEX_TYPE</b> value as a member to indicate the existing plex type.
  * 
  * If your application encounters a <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_hwprovider_type">VDS_HWPROVIDER_TYPE</a> value that it does not recognize, it should display the provider type as unknown. It should not attempt to map the unrecognized provider type to another provider type.
  * 
  * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_LUN_PLEX_TYPE</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_LUN_PLEX_TYPE</b> enumeration constant.</div>
  * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ne-vdshwprv-vds_lun_plex_type
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_LUN_PLEX_TYPE{

    /**
     * This value is reserved.
     * @type {Integer (Int32)}
     */
    static VDS_LPT_UNKNOWN => 0

    /**
     * The plex type is simple—it is composed of extents from exactly one drive.
     * @type {Integer (Int32)}
     */
    static VDS_LPT_SIMPLE => 10

    /**
     * The plex type is spanned—it is composed of extents from more than one drive.
     * @type {Integer (Int32)}
     */
    static VDS_LPT_SPAN => 11

    /**
     * The plex type is striped, which is equivalent to RAID 0.
     * @type {Integer (Int32)}
     */
    static VDS_LPT_STRIPE => 12

    /**
     * The plex type is striped with parity, which accounts for RAID levels 3, 4, 5, and 6.
     * @type {Integer (Int32)}
     */
    static VDS_LPT_PARITY => 14

    /**
     * The plex type is RAID level 2.
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_LPT_RAID2 => 15

    /**
     * The plex type is RAID level 3.
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_LPT_RAID3 => 16

    /**
     * The plex type is RAID level 4.
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_LPT_RAID4 => 17

    /**
     * The plex type is RAID level 5.
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_LPT_RAID5 => 18

    /**
     * The plex type is RAID level 6.
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_LPT_RAID6 => 19

    /**
     * The plex type is RAID level 0+3.
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_LPT_RAID03 => 21

    /**
     * The plex type is RAID level 0+5.
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_LPT_RAID05 => 22

    /**
     * The plex type is RAID level 1+0.
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_LPT_RAID10 => 23

    /**
     * The plex type is RAID level 1+5.
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_LPT_RAID15 => 24

    /**
     * The plex type is RAID level 3+0.
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_LPT_RAID30 => 25

    /**
     * The plex type is RAID level 5+0.
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_LPT_RAID50 => 26

    /**
     * The plex type is RAID level 5+3.
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_LPT_RAID53 => 28

    /**
     * The plex type is RAID level 6+0.
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_LPT_RAID60 => 29
}
