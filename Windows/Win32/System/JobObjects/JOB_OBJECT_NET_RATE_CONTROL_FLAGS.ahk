#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies types of scheduling policies for network rate control.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ne-winnt-job_object_net_rate_control_flags
 * @namespace Windows.Win32.System.JobObjects
 * @version v4.0.30319
 */
class JOB_OBJECT_NET_RATE_CONTROL_FLAGS{

    /**
     * Turns on the control of the network traffic. You must set this value if you also set either <b>JOB_OBJECT_NET_RATE_CONTROL_MAX_BANDWIDTH</b> or <b>JOB_OBJECT_NET_RATE_CONTROL_DSCP_TAG</b>.
     * @type {Integer (Int32)}
     */
    static JOB_OBJECT_NET_RATE_CONTROL_ENABLE => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static JOB_OBJECT_NET_RATE_CONTROL_MAX_BANDWIDTH => 2

    /**
     * Sets the DSCP field in the packet header to the value of the <b>DscpTag</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-jobobject_net_rate_control_information">JOBOBJECT_NET_RATE_CONTROL_INFORMATION</a> structure. For information about DSCP, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/qos/differentiated-services">Differentiated Services</a>.
     * @type {Integer (Int32)}
     */
    static JOB_OBJECT_NET_RATE_CONTROL_DSCP_TAG => 4

    /**
     * The combination of all of the valid flags for the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-job_object_net_rate_control_flags">JOB_OBJECT_NET_RATE_CONTROL_FLAGS</a> enumeration.
     * @type {Integer (Int32)}
     */
    static JOB_OBJECT_NET_RATE_CONTROL_VALID_FLAGS => 7
}
