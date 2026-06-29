#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SERVICE_RUNS_IN_PROCESS.ahk" { SERVICE_RUNS_IN_PROCESS }
#Import ".\ENUM_SERVICE_TYPE.ahk" { ENUM_SERVICE_TYPE }
#Import ".\SERVICE_STATUS_CURRENT_STATE.ahk" { SERVICE_STATUS_CURRENT_STATE }

/**
 * Contains process status information for a service. The ControlServiceEx, EnumServicesStatusEx, NotifyServiceStatusChange, and QueryServiceStatusEx functions use this structure.
 * @see https://learn.microsoft.com/windows/win32/api/winsvc/ns-winsvc-service_status_process
 * @namespace Windows.Win32.System.Services
 */
export default struct SERVICE_STATUS_PROCESS {
    #StructPack 4

    dwServiceType : ENUM_SERVICE_TYPE

    dwCurrentState : SERVICE_STATUS_CURRENT_STATE

    /**
     * The control codes the service accepts and processes in its handler function (see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lphandler_function">Handler</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lphandler_function_ex">HandlerEx</a>). A user interface process can control a service by specifying a control command in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-controlservice">ControlService</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-controlserviceexa">ControlServiceEx</a> function. By default, all services accept the <b>SERVICE_CONTROL_INTERROGATE</b> value. 
     * 
     * 
     * 
     * 
     * The following are the control codes.
     * 
     * <table>
     * <tr>
     * <th>Control code</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_ACCEPT_NETBINDCHANGE"></a><a id="service_accept_netbindchange"></a><dl>
     * <dt><b>SERVICE_ACCEPT_NETBINDCHANGE</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  The service is a network component that can accept changes in its binding without being stopped and restarted. 
     * 
     * 
     * 
     * 
     * This control code allows the service to receive <b>SERVICE_CONTROL_NETBINDADD</b>, <b>SERVICE_CONTROL_NETBINDREMOVE</b>, <b>SERVICE_CONTROL_NETBINDENABLE</b>, and <b>SERVICE_CONTROL_NETBINDDISABLE</b> notifications.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_ACCEPT_PARAMCHANGE"></a><a id="service_accept_paramchange"></a><dl>
     * <dt><b>SERVICE_ACCEPT_PARAMCHANGE</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  The service can reread its startup parameters without being stopped and restarted. 
     * 
     * 
     * 
     * 
     * This control code allows the service to receive <b>SERVICE_CONTROL_PARAMCHANGE</b> notifications.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_ACCEPT_PAUSE_CONTINUE"></a><a id="service_accept_pause_continue"></a><dl>
     * <dt><b>SERVICE_ACCEPT_PAUSE_CONTINUE</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service can be paused and continued. 
     * 
     * 
     * 
     * 
     * This control code allows the service to receive <b>SERVICE_CONTROL_PAUSE</b> and <b>SERVICE_CONTROL_CONTINUE</b> notifications.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_ACCEPT_PRESHUTDOWN"></a><a id="service_accept_preshutdown"></a><dl>
     * <dt><b>SERVICE_ACCEPT_PRESHUTDOWN</b></dt>
     * <dt>0x00000100</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service can perform preshutdown tasks. 
     * 
     * This control code enables the service to receive <b>SERVICE_CONTROL_PRESHUTDOWN</b> notifications. Note that 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-controlservice">ControlService</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-controlserviceexa">ControlServiceEx</a> cannot send this notification; only the system can send it.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>This value is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_ACCEPT_SHUTDOWN"></a><a id="service_accept_shutdown"></a><dl>
     * <dt><b>SERVICE_ACCEPT_SHUTDOWN</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service is notified when system shutdown occurs. 
     * 
     * 
     * 
     * 
     * This control code allows the service to receive <b>SERVICE_CONTROL_SHUTDOWN</b> notifications. Note that 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-controlservice">ControlService</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-controlserviceexa">ControlServiceEx</a> cannot send this notification; only the system can send it.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_ACCEPT_STOP"></a><a id="service_accept_stop"></a><dl>
     * <dt><b>SERVICE_ACCEPT_STOP</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service can be stopped. 
     * 
     * 
     * 
     * 
     * This control code allows the service to receive <b>SERVICE_CONTROL_STOP</b> notifications.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * This member can also contain the following extended control codes, which are supported only by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lphandler_function_ex">HandlerEx</a>. (Note that these control codes cannot be sent by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-controlservice">ControlService</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-controlserviceexa">ControlServiceEx</a>.)
     * 
     * <table>
     * <tr>
     * <th>Control code</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_ACCEPT_HARDWAREPROFILECHANGE"></a><a id="service_accept_hardwareprofilechange"></a><dl>
     * <dt><b>SERVICE_ACCEPT_HARDWAREPROFILECHANGE</b></dt>
     * <dt>0x00000020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  The service is notified when the computer's hardware profile has changed. This enables the system to send <b>SERVICE_CONTROL_HARDWAREPROFILECHANGE</b> notifications to the service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_ACCEPT_POWEREVENT"></a><a id="service_accept_powerevent"></a><dl>
     * <dt><b>SERVICE_ACCEPT_POWEREVENT</b></dt>
     * <dt>0x00000040</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  The service is notified when the computer's power status has changed. This enables the system to send <b>SERVICE_CONTROL_POWEREVENT</b> notifications to the service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_ACCEPT_SESSIONCHANGE"></a><a id="service_accept_sessionchange"></a><dl>
     * <dt><b>SERVICE_ACCEPT_SESSIONCHANGE</b></dt>
     * <dt>0x00000080</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  The service is notified when the computer's session status has changed. This enables the system to send <b>SERVICE_CONTROL_SESSIONCHANGE</b> notifications to the service.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwControlsAccepted : UInt32

    /**
     * The error code that the service uses to report an error that occurs when it is starting or stopping. To return an error code specific to the service, the service must set this value to <b>ERROR_SERVICE_SPECIFIC_ERROR</b> to indicate that the <b>dwServiceSpecificExitCode</b> member contains the error code. The service should set this value to <b>NO_ERROR</b> when it is running and when it terminates normally.
     */
    dwWin32ExitCode : UInt32

    /**
     * The service-specific error code that the service returns when an error occurs while the service is starting or stopping. This value is ignored unless the <b>dwWin32ExitCode</b> member is set to <b>ERROR_SERVICE_SPECIFIC_ERROR</b>.
     */
    dwServiceSpecificExitCode : UInt32

    /**
     * The check-point value that the service increments periodically to report its progress during a lengthy start, stop, pause, or continue operation. For example, the service should increment this value as it completes each step of its initialization when it is starting up. The user interface program that invoked the operation on the service uses this value to track the progress of the service during a lengthy operation. This value is not valid and should be zero when the service does not have a start, stop, pause, or continue operation pending.
     */
    dwCheckPoint : UInt32

    /**
     * The estimated time required for a pending start, stop, pause, or continue operation, in milliseconds. Before the specified amount of time has elapsed, the service should make its next call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-setservicestatus">SetServiceStatus</a> function with either an incremented <b>dwCheckPoint</b> value or a change in <b>dwCurrentState</b>. If the amount of time specified by <b>dwWaitHint</b> passes, and <b>dwCheckPoint</b> has not been incremented or <b>dwCurrentState</b> has not changed, the service control manager or service control program can assume that an error has occurred and the service should be stopped. However, if the service shares a process with other services, the service control manager cannot terminate the service application because it would have to terminate the other services sharing the process as well.
     */
    dwWaitHint : UInt32

    /**
     * The process identifier of the service.
     */
    dwProcessId : UInt32

    dwServiceFlags : SERVICE_RUNS_IN_PROCESS

}
