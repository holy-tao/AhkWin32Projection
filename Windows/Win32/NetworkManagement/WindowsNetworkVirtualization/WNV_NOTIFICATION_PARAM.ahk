#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WNV_OBJECT_HEADER.ahk" { WNV_OBJECT_HEADER }
#Import ".\WNV_NOTIFICATION_TYPE.ahk" { WNV_NOTIFICATION_TYPE }

/**
 * Specifies the version, notification type, and the buffer location in a WnvRequestNotification function call.
 * @see https://learn.microsoft.com/windows/win32/api/wnvapi/ns-wnvapi-wnv_notification_param
 * @namespace Windows.Win32.NetworkManagement.WindowsNetworkVirtualization
 */
export default struct WNV_NOTIFICATION_PARAM {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wnvapi/ns-wnvapi-wnv_object_header">WNV_OBJECT_HEADER</a></b>
     * 
     * The version and buffer size for this structure.
     */
    Header : WNV_OBJECT_HEADER

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wnvapi/ne-wnvapi-wnv_notification_type">WNV_NOTIFICATION_TYPE</a></b>
     * 
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/wnvapi/ne-wnvapi-wnv_notification_type">WNV_NOTIFICATION_TYPE</a> enumeration that specifies the type of notifications requested, such as policy mismatches, Internet Control Message Protocol
     * (ICMP) redirect message arrivals, and object changes.
     */
    NotificationType : WNV_NOTIFICATION_TYPE

    /**
     * Type: <b>ULONG</b>
     * 
     * An output value that provides the caller information about the number of pending events of the specified notification type. The pending events are queued within the WNV driver along with the events that have already been added to the <b>Buffer</b> field when the current <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wnvapi/nf-wnvapi-wnvrequestnotification">WnvRequestNotification</a> function call is completed. This field allows the WNV driver to indicate the number of remaining events to the caller of <b>WnvRequestNotification</b>, so the caller can estimate the size of the buffer required. The caller should post another call with enough buffer size to <b>WnvRequestNotification</b> to consume these remaining events.
     */
    PendingNotifications : UInt32

    /**
     * Type: <b>PUCHAR</b>
     * 
     * A pointer to a  buffer that is filled by the WNV driver with notification structures of the specified notification type when completing the call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wnvapi/nf-wnvapi-wnvrequestnotification">WnvRequestNotification</a>. The eventual content in this field is explained by the following table.
     * 
     * <table>
     * <tr>
     * <th>Value of the <b>NotificationType</b> field</th>
     * <th>Content of the <b>Buffer</b> field</th>
     * </tr>
     * <tr>
     * <td><b>WnvPolicyMismatchType</b></td>
     * <td>
     * One or more <a href="https://docs.microsoft.com/windows/desktop/api/wnvapi/ns-wnvapi-wnv_policy_mismatch_param">WNV_POLICY_MISMATCH_PARAM</a> structures
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>WnvRedirectType</b></td>
     * <td>
     * One or more <a href="https://docs.microsoft.com/windows/desktop/api/wnvapi/ns-wnvapi-wnv_redirect_param">WNV_REDIRECT_PARAM</a> structures
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>WnvObjectChangeType</b></td>
     * <td>
     * One or more <a href="https://docs.microsoft.com/windows/desktop/api/wnvapi/ns-wnvapi-wnv_object_change_param">WNV_OBJECT_CHANGE_PARAM</a> structures
     * 
     * </td>
     * </tr>
     * </table>
     */
    Buffer : IntPtr

}
