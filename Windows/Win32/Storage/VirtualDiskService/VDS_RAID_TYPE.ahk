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
 */
class VDS_RAID_TYPE extends Win32Enum {

    /**
     * The RAID level is unknown.
     * Native name: VDS_RT_UNKNOWN
     * @type {Integer (Int32)}
     */
    static RT_UNKNOWN => 0

    /**
     * RAID level 0.
     * Native name: VDS_RT_RAID0
     * @type {Integer (Int32)}
     */
    static RT_RAID0 => 10

    /**
     * RAID level 1.
     * Native name: VDS_RT_RAID1
     * @type {Integer (Int32)}
     */
    static RT_RAID1 => 11

    /**
     * RAID level 2.
     * Native name: VDS_RT_RAID2
     * @type {Integer (Int32)}
     */
    static RT_RAID2 => 12

    /**
     * RAID level 3.
     * Native name: VDS_RT_RAID3
     * @type {Integer (Int32)}
     */
    static RT_RAID3 => 13

    /**
     * RAID level 4.
     * Native name: VDS_RT_RAID4
     * @type {Integer (Int32)}
     */
    static RT_RAID4 => 14

    /**
     * RAID level 5.
     * Native name: VDS_RT_RAID5
     * @type {Integer (Int32)}
     */
    static RT_RAID5 => 15

    /**
     * RAID level 6.
     * Native name: VDS_RT_RAID6
     * @type {Integer (Int32)}
     */
    static RT_RAID6 => 16

    /**
     * RAID level 0+1.
     * Native name: VDS_RT_RAID01
     * @type {Integer (Int32)}
     */
    static RT_RAID01 => 17

    /**
     * RAID level 0+3.
     * Native name: VDS_RT_RAID03
     * @type {Integer (Int32)}
     */
    static RT_RAID03 => 18

    /**
     * RAID level 0+5.
     * Native name: VDS_RT_RAID05
     * @type {Integer (Int32)}
     */
    static RT_RAID05 => 19

    /**
     * RAID level 1+0.
     * Native name: VDS_RT_RAID10
     * @type {Integer (Int32)}
     */
    static RT_RAID10 => 20

    /**
     * RAID level 1+5.
     * Native name: VDS_RT_RAID15
     * @type {Integer (Int32)}
     */
    static RT_RAID15 => 21

    /**
     * RAID level 3+0.
     * Native name: VDS_RT_RAID30
     * @type {Integer (Int32)}
     */
    static RT_RAID30 => 22

    /**
     * RAID level 5+0.
     * Native name: VDS_RT_RAID50
     * @type {Integer (Int32)}
     */
    static RT_RAID50 => 23

    /**
     * RAID level 5+1.
     * Native name: VDS_RT_RAID51
     * @type {Integer (Int32)}
     */
    static RT_RAID51 => 24

    /**
     * RAID level 5+3.
     * Native name: VDS_RT_RAID53
     * @type {Integer (Int32)}
     */
    static RT_RAID53 => 25

    /**
     * RAID level 6+0.
     * Native name: VDS_RT_RAID60
     * @type {Integer (Int32)}
     */
    static RT_RAID60 => 26

    /**
     * RAID level 6+1.
     * Native name: VDS_RT_RAID61
     * @type {Integer (Int32)}
     */
    static RT_RAID61 => 27
}
