#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the set of object status values for a controller.
 * @remarks
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdscontroller-setstatus">IVdsController::SetStatus</a>method passes a <b>VDS_CONTROLLER_STATUS</b> value as an argument to set the status of a controller, and  the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_controller_prop">VDS_CONTROLLER_PROP</a> structure includes a <b>VDS_CONTROLLER_STATUS</b> value as a member to indicate the current status.
 * 
 * If your application encounters a <b>VDS_CONTROLLER_STATUS</b> value that it does not recognize, it should display the controller status as unknown. It should not attempt to map the unrecognized controller status to another controller status.
 * 
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_CONTROLLER_STATUS</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_CONTROLLER_STATUS</b> enumeration constant.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ne-vds-vds_controller_status
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_CONTROLLER_STATUS{

    /**
     * The status of the controller cannot be determined.
     * @type {Integer (Int32)}
     */
    static VDS_CS_UNKNOWN => 0

    /**
     * The controller is physically present and in use. The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_health">VDS_HEALTH</a> value associated with this controller status can be any value except <b>VDS_H_FAILED</b>.
     * @type {Integer (Int32)}
     */
    static VDS_CS_ONLINE => 1

    /**
     * The controller is busy. The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_health">VDS_HEALTH</a> value can be any value except <b>VDS_H_FAILED</b>.
     * @type {Integer (Int32)}
     */
    static VDS_CS_NOT_READY => 2

    /**
     * The controller is physically present but not available for use. For example, the controller has been set to the inactive state. When this controller status is set, a <b>VDS_NF_CONTROLLER_REMOVED</b> notification is sent.  The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_health">VDS_HEALTH</a> value can be any value.
     * @type {Integer (Int32)}
     */
    static VDS_CS_OFFLINE => 4

    /**
     * The controller has failed. The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_health">VDS_HEALTH</a> value should be <b>VDS_H_FAILED</b> or <b>VDS_H_FAILING</b>.
     * @type {Integer (Int32)}
     */
    static VDS_CS_FAILED => 5

    /**
     * The controller has been physically unplugged from the subsystem. When this status is set, a <b>VDS_NF_CONTROLLER_DEPART</b> notification is sent.
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_CS_REMOVED => 8
}
