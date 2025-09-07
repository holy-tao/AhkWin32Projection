#Requires AutoHotkey v2.0.0 64-bit

/**
 * The VDS_SUB_SYSTEM_SUPPORTED_RAID_TYPE_FLAG enumeration (vdshwprv.h) defines the set of RAID levels that can be supported by subsystems.
 * @remarks
 * The values of this enumeration are used in the <b>ulSupportedRaidTypeFlags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_sub_system_prop2">VDS_SUB_SYSTEM_PROP2</a> structure.
  * 
  * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_SUB_SYSTEM_SUPPORTED_RAID_TYPE_FLAG</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_SUB_SYSTEM_SUPPORTED_RAID_TYPE_FLAG</b> enumeration constant.</div>
  * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ne-vdshwprv-vds_sub_system_supported_raid_type_flag
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_SUB_SYSTEM_SUPPORTED_RAID_TYPE_FLAG{

    /**
     * Supports RAID level 2.
     * @type {Integer (Int32)}
     */
    static VDS_SF_SUPPORTS_RAID2_LUNS => 1

    /**
     * Supports RAID level 3.
     * @type {Integer (Int32)}
     */
    static VDS_SF_SUPPORTS_RAID3_LUNS => 2

    /**
     * Supports RAID level 4.
     * @type {Integer (Int32)}
     */
    static VDS_SF_SUPPORTS_RAID4_LUNS => 4

    /**
     * Supports RAID level 5.
     * @type {Integer (Int32)}
     */
    static VDS_SF_SUPPORTS_RAID5_LUNS => 8

    /**
     * Supports RAID level 6.
     * @type {Integer (Int32)}
     */
    static VDS_SF_SUPPORTS_RAID6_LUNS => 16

    /**
     * Supports RAID level 0+1.
     * @type {Integer (Int32)}
     */
    static VDS_SF_SUPPORTS_RAID01_LUNS => 32

    /**
     * Supports RAID level 0+3.
     * @type {Integer (Int32)}
     */
    static VDS_SF_SUPPORTS_RAID03_LUNS => 64

    /**
     * Supports RAID level 0+5.
     * @type {Integer (Int32)}
     */
    static VDS_SF_SUPPORTS_RAID05_LUNS => 128

    /**
     * Supports RAID level 1+0.
     * @type {Integer (Int32)}
     */
    static VDS_SF_SUPPORTS_RAID10_LUNS => 256

    /**
     * Supports RAID level 1+5.
     * @type {Integer (Int32)}
     */
    static VDS_SF_SUPPORTS_RAID15_LUNS => 512

    /**
     * Supports RAID level 3+0.
     * @type {Integer (Int32)}
     */
    static VDS_SF_SUPPORTS_RAID30_LUNS => 1024

    /**
     * Supports RAID level 5+0.
     * @type {Integer (Int32)}
     */
    static VDS_SF_SUPPORTS_RAID50_LUNS => 2048

    /**
     * Supports RAID level 5+1.
     * @type {Integer (Int32)}
     */
    static VDS_SF_SUPPORTS_RAID51_LUNS => 4096

    /**
     * Supports RAID level 5+3.
     * @type {Integer (Int32)}
     */
    static VDS_SF_SUPPORTS_RAID53_LUNS => 8192

    /**
     * Supports RAID level 6+0.
     * @type {Integer (Int32)}
     */
    static VDS_SF_SUPPORTS_RAID60_LUNS => 16384

    /**
     * Supports RAID level 6+1.
     * @type {Integer (Int32)}
     */
    static VDS_SF_SUPPORTS_RAID61_LUNS => 32768
}
