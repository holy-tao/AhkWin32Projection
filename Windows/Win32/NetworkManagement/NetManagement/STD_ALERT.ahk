#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The STD_ALERT structure contains the time and date when a significant event occurred.
 * @remarks
 * The 
  * <b>STD_ALERT</b> structure must be followed by one 
  * <a href="https://docs.microsoft.com/windows/desktop/api/lmalert/ns-lmalert-admin_other_info">ADMIN_OTHER_INFO</a>, 
  * <a href="https://docs.microsoft.com/windows/desktop/api/lmalert/ns-lmalert-errlog_other_info">ERRLOG_OTHER_INFO</a>, 
  * <a href="https://docs.microsoft.com/windows/desktop/api/lmalert/ns-lmalert-print_other_info">PRINT_OTHER_INFO</a>, or 
  * <a href="https://docs.microsoft.com/windows/desktop/api/lmalert/ns-lmalert-user_other_info">USER_OTHER_INFO</a> structure. These structures can optionally be followed by variable-length data. The calling application must allocate the memory for all structures and variable-length data in an alert message buffer.
  * 
  * See 
  * <a href="https://docs.microsoft.com/windows/desktop/api/lmalert/nf-lmalert-netalertraise">NetAlertRaise</a> for a code sample that raises an administrative alert using a 
  * <b>STD_ALERT</b> structure and an 
  * <a href="https://docs.microsoft.com/windows/desktop/api/lmalert/ns-lmalert-admin_other_info">ADMIN_OTHER_INFO</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/lmalert/ns-lmalert-std_alert
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class STD_ALERT extends Win32Struct
{
    static sizeof => 200

    static packingSize => 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The time and date of the event. This value is stored as the number of seconds that have elapsed since 00:00:00, January 1, 1970, GMT.
     * @type {Integer}
     */
    alrt_timestamp {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>WCHAR[EVLEN + 1]</b>
     * 
     * A Unicode string indicating the alert class (type of event). This parameter can be one of the following predefined values, or another alert class that you have defined for network applications. (The event name for an alert can be any text string.) 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ALERT_ADMIN_EVENT"></a><a id="alert_admin_event"></a><dl>
     * <dt><b>ALERT_ADMIN_EVENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An administrator's intervention is required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ALERT_ERRORLOG_EVENT"></a><a id="alert_errorlog_event"></a><dl>
     * <dt><b>ALERT_ERRORLOG_EVENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An entry was added to the error log.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ALERT_MESSAGE_EVENT"></a><a id="alert_message_event"></a><dl>
     * <dt><b>ALERT_MESSAGE_EVENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A user or application received a broadcast message.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ALERT_PRINT_EVENT"></a><a id="alert_print_event"></a><dl>
     * <dt><b>ALERT_PRINT_EVENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A print job completed or a print error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ALERT_USER_EVENT"></a><a id="alert_user_event"></a><dl>
     * <dt><b>ALERT_USER_EVENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An application or resource was used.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {String}
     */
    alrt_eventname {
        get => StrGet(this.ptr + 4, 16, "UTF-16")
        set => StrPut(value, this.ptr + 4, 16, "UTF-16")
    }

    /**
     * Type: <b>WCHAR[SNLEN + 1]</b>
     * 
     * A Unicode string indicating the service application that is raising the alert message.
     * @type {String}
     */
    alrt_servicename {
        get => StrGet(this.ptr + 38, 80, "UTF-16")
        set => StrPut(value, this.ptr + 38, 80, "UTF-16")
    }
}
