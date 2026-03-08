#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * A drive is reported as physically present on the subsystem. The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_drive_status">VDS_DRIVE_STATUS</a> value associated with this notification should be any  value except <b>VDS_DRS_REMOVED</b>.
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-vds_drive_notification
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_NF_DRIVE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_DRIVE_ARRIVE => 105

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_DRIVE_DEPART => 106

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_DRIVE_MODIFY => 107

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_DRIVE_REMOVED => 354
}
