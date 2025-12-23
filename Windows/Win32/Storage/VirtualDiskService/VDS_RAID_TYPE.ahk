#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The VDS_RAID_TYPE enumeration (vdshwprv.h) defines the set enumeration values that can be used to specify the underlying RAID type of a storage pool.
 * @remarks
 * A subsystem uses a  <b>VDS_RAID_TYPE</b> enumeration value to specify the underlying RAID type of a storage pool. 
 * 
 * A storage pool does not necessarily have a single underlying RAID type. For example, 
 * 
 * The underlying RAID type of of the storage pool is different from the RAID type of a LUN that can be created from the storage pool.
 * 
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_RAID_TYPE</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_RAID_TYPE</b> enumeration constant.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ne-vdshwprv-vds_raid_type
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_RAID_TYPE extends Win32Enum{

    /**
     * The RAID level is unknown.
     * @type {Integer (Int32)}
     */
    static VDS_RT_UNKNOWN => 0

    /**
     * RAID level 0.
     * @type {Integer (Int32)}
     */
    static VDS_RT_RAID0 => 10

    /**
     * RAID level 1.
     * @type {Integer (Int32)}
     */
    static VDS_RT_RAID1 => 11

    /**
     * RAID level 2.
     * @type {Integer (Int32)}
     */
    static VDS_RT_RAID2 => 12

    /**
     * RAID level 3.
     * @type {Integer (Int32)}
     */
    static VDS_RT_RAID3 => 13

    /**
     * RAID level 4.
     * @type {Integer (Int32)}
     */
    static VDS_RT_RAID4 => 14

    /**
     * RAID level 5.
     * @type {Integer (Int32)}
     */
    static VDS_RT_RAID5 => 15

    /**
     * RAID level 6.
     * @type {Integer (Int32)}
     */
    static VDS_RT_RAID6 => 16

    /**
     * RAID level 0+1.
     * @type {Integer (Int32)}
     */
    static VDS_RT_RAID01 => 17

    /**
     * RAID level 0+3.
     * @type {Integer (Int32)}
     */
    static VDS_RT_RAID03 => 18

    /**
     * RAID level 0+5.
     * @type {Integer (Int32)}
     */
    static VDS_RT_RAID05 => 19

    /**
     * RAID level 1+0.
     * @type {Integer (Int32)}
     */
    static VDS_RT_RAID10 => 20

    /**
     * RAID level 1+5.
     * @type {Integer (Int32)}
     */
    static VDS_RT_RAID15 => 21

    /**
     * RAID level 3+0.
     * @type {Integer (Int32)}
     */
    static VDS_RT_RAID30 => 22

    /**
     * RAID level 5+0.
     * @type {Integer (Int32)}
     */
    static VDS_RT_RAID50 => 23

    /**
     * RAID level 5+1.
     * @type {Integer (Int32)}
     */
    static VDS_RT_RAID51 => 24

    /**
     * RAID level 5+3.
     * @type {Integer (Int32)}
     */
    static VDS_RT_RAID53 => 25

    /**
     * RAID level 6+0.
     * @type {Integer (Int32)}
     */
    static VDS_RT_RAID60 => 26

    /**
     * RAID level 6+1.
     * @type {Integer (Int32)}
     */
    static VDS_RT_RAID61 => 27
}
