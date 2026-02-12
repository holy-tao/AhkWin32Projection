#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * A controller is reported as physically present on the subsystem. The <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_controller_status">VDS_CONTROLLER_STATUS</a> value associated with this notification should be any value except <b>VDS_CS_REMOVED</b>.
 * @see https://learn.microsoft.com/windows/win32/api//content/vds/ns-vds-vds_controller_notification
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_NF_CONTROLLER extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_CONTROLLER_ARRIVE => 103

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_CONTROLLER_DEPART => 104

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_CONTROLLER_MODIFY => 350

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_CONTROLLER_REMOVED => 351
}
