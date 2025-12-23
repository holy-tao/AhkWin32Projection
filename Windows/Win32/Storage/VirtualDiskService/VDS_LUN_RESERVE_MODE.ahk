#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Not supported.This enumeration is reserved for future use. (VDS_LUN_RESERVE_MODE)
 * @remarks
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_LUN_RESERVE_MODE</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_LUN_RESERVE_MODE</b> enumeration constant.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/vds/ne-vds-vds_lun_reserve_mode
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_LUN_RESERVE_MODE extends Win32Enum{

    /**
     * This value is reserved.
     * @type {Integer (Int32)}
     */
    static VDS_LRM_NONE => 0

    /**
     * This value is reserved.
     * @type {Integer (Int32)}
     */
    static VDS_LRM_EXCLUSIVE_RW => 1

    /**
     * This value is reserved.
     * @type {Integer (Int32)}
     */
    static VDS_LRM_EXCLUSIVE_RO => 2

    /**
     * This value is reserved.
     * @type {Integer (Int32)}
     */
    static VDS_LRM_SHARED_RO => 3

    /**
     * This value is reserved.
     * @type {Integer (Int32)}
     */
    static VDS_LRM_SHARED_RW => 4
}
