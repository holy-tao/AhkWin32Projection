#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * A controller port is reported as physically present on the subsystem. 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_port_status">VDS_PORT_STATUS</a> value associated with this notification should be any value except <b>VDS_PRS_REMOVED</b>.
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-vds_port_notification
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_NF_PORT extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_PORT_ARRIVE => 121

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_PORT_DEPART => 122

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_PORT_MODIFY => 352

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_PORT_REMOVED => 353
}
