#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the set of object status values for a port.
 * @remarks
 * 
  * The  <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_port_prop">VDS_PORT_PROP</a> structure includes a <b>VDS_PORT_STATUS</b> value as a member to indicate the current status of a port.
  * 
  * If your application encounters a <b>VDS_PORT_STATUS</b> value that it does not recognize, it should display the port status as unknown. It should not attempt to map the unrecognized port status to another port status.
  * 
  * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_PORT_STATUS</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_PORT_STATUS</b> enumeration constant.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ne-vds-vds_port_status
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_PORT_STATUS{

    /**
     * The status of the port cannot be determined.
     * @type {Integer (Int32)}
     */
    static VDS_PRS_UNKNOWN => 0

    /**
     * The port is physically present and in use. The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_health">VDS_HEALTH</a> value associated with this port status can be any value except <b>VDS_H_FAILED</b>.
     * @type {Integer (Int32)}
     */
    static VDS_PRS_ONLINE => 1

    /**
     * The port is busy. The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_health">VDS_HEALTH</a> value can be any value except <b>VDS_H_FAILED</b>.
     * @type {Integer (Int32)}
     */
    static VDS_PRS_NOT_READY => 2

    /**
     * Either the port or its controller is physically present but not available for use. For example, the port or its controller has been set to the inactive state. When this status is set,  a <b>VDS_NF_PORT_REMOVED</b> notification is sent. The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_health">VDS_HEALTH</a> value can be any value.
     * @type {Integer (Int32)}
     */
    static VDS_PRS_OFFLINE => 4

    /**
     * The port has failed. The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_health">VDS_HEALTH</a> value should be <b>VDS_H_FAILED</b> or <b>VDS_H_FAILING</b>.
     * @type {Integer (Int32)}
     */
    static VDS_PRS_FAILED => 5

    /**
     * The port's controller has been physically removed from the subsystem.  When this status is set, a <b>VDS_NF_PORT_DEPART</b> notification is sent.
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_PRS_REMOVED => 8
}
