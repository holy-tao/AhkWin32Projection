#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * An application-defined callback function used with the RegisterServiceCtrlHandlerEx function. A service program can use it as the control handler function of a particular service.
 * @remarks
 * When a service is started, its <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lpservice_main_functiona">ServiceMain</a> function 
 *     should immediately call the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-registerservicectrlhandlerexa">RegisterServiceCtrlHandlerEx</a> 
 *     function to specify a <b>HandlerEx</b> function to process control 
 *     requests. To specify the control codes to be accepted, use the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-setservicestatus">SetServiceStatus</a> and 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-registerdevicenotificationa">RegisterDeviceNotification</a> functions.
 * 
 * The control dispatcher in the main thread of a service invokes the control handler function for the specified 
 *     service whenever it receives a control request from the service control manager. After processing the control 
 *     request, the control handler must call 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-setservicestatus">SetServiceStatus</a> if the service state changes to 
 *     report its new status to the service control manager.
 * 
 * The control handler function is intended to receive notification and return immediately. The 
 *     callback function should save its parameters and create other threads to perform additional work. (Your application 
 *     must ensure that such threads have exited before stopping the service.) In particular, a control handler should avoid operations that might block, such as taking a lock, because this could result in a deadlock or cause the system to stop responding.
 * 
 * When the service control manager sends a control code to a service, it waits for the handler function to 
 *     return before sending additional control codes to other services. The control handler should return as quickly as possible; if it does not return within 30 
 *     seconds, the SCM returns an error. If a service must do lengthy processing when the service is executing the 
 *     control handler, it should create a secondary thread to perform the lengthy processing, and then return from the 
 *     control handler. This prevents the service from tying up the control dispatcher and blocking other services from 
 *     receiving control codes.
 * 
 * The <b>SERVICE_CONTROL_SHUTDOWN</b> control code should only be processed by services that must absolutely clean up 
 *     during shutdown, because there is a limited time (about 20 seconds) available for service shutdown. After this 
 *     time expires, system shutdown proceeds regardless of whether service shutdown is complete. Note that if the system 
 *     is left in the shutdown state (not restarted or powered down), the service continues to run. If your service registers to accept <b>SERVICE_CONTROL_SHUTDOWN</b>, it must handle the control code and return <b>NO_ERROR</b>. Returning an error for this control code and not stopping in a timely fashion can increase the time required to shut down the system, because the system must wait for the full amount of time allowed for service shutdown before system shutdown can proceed. 
 * 
 * If the service requires more time to clean up, it should send <b>STOP_PENDING</b> status messages, along with a wait 
 *     hint, so the service controller knows how long to wait before reporting to the system that service shutdown is 
 *     complete. However, to prevent a service from stopping shutdown, there is a limit to how long the service 
 *     controller waits. If the service is being shut down through the Services snap-in, the limit is 125 seconds. If the operating system is rebooting, the time limit is specified in the <b>WaitToKillServiceTimeout</b> value of the following registry key:
 * 
 * 
 * <b>HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control</b>
 * 
 * 
 * 
 * Be sure to handle Plug and Play device events as quickly as possible; otherwise, the system may become 
 *     unresponsive. If your event handler is to perform an operation that may block execution (such as I/O), it is best 
 *     to start another thread to perform the operation asynchronously.
 * 
 * Services can also use the 
 *     <a href="https://docs.microsoft.com/windows/console/setconsolectrlhandler">SetConsoleCtrlHandler</a> function to receive 
 *     shutdown notification. This notification is received when the running applications are shutting down, which occurs 
 *     before services are shut down.
 * @see https://learn.microsoft.com/windows/win32/api/winsvc/nc-winsvc-lphandler_function_ex
 * @namespace Windows.Win32.System.Services
 */
export default struct LPHANDLER_FUNCTION_EX {
    value : IntPtr

    __value {
        set {
            if (value is LPHANDLER_FUNCTION_EX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwControl 
     * @param {Integer} dwEventType The type of event that has occurred. This parameter is used if <i>dwControl</i> is 
     *       <b>SERVICE_CONTROL_DEVICEEVENT</b>, <b>SERVICE_CONTROL_HARDWAREPROFILECHANGE</b>, <b>SERVICE_CONTROL_POWEREVENT</b>, or 
     *       <b>SERVICE_CONTROL_SESSIONCHANGE</b>. Otherwise, it is zero. 
     * 	     
     * 
     * If <i>dwControl</i> is <b>SERVICE_CONTROL_DEVICEEVENT</b>, this parameter can be one of the 
     *         following values:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/DevIO/dbt-devicearrival">DBT_DEVICEARRIVAL</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/DevIO/dbt-deviceremovecomplete">DBT_DEVICEREMOVECOMPLETE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/DevIO/dbt-devicequeryremove">DBT_DEVICEQUERYREMOVE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/DevIO/dbt-devicequeryremovefailed">DBT_DEVICEQUERYREMOVEFAILED</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/DevIO/dbt-deviceremovepending">DBT_DEVICEREMOVEPENDING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/DevIO/dbt-customevent">DBT_CUSTOMEVENT</a>
     * </li>
     * </ul>
     * If <i>dwControl</i> is <b>SERVICE_CONTROL_HARDWAREPROFILECHANGE</b>, this parameter can be
     * @param {Pointer<Void>} lpEventData Additional device information, if required. The format of this data depends on the value of the 
     *       <i>dwControl</i> and <i>dwEventType</i> parameters. 
     * 
     * If 
     *       <i>dwControl</i> is <b>SERVICE_CONTROL_DEVICEEVENT</b>, this data corresponds to the 
     *       <i>lParam</i> parameter that applications receive as part of a 
     *       <a href="https://docs.microsoft.com/windows/desktop/DevIO/wm-devicechange">WM_DEVICECHANGE</a> message. 
     * 
     * If 
     *       <i>dwControl</i> is <b>SERVICE_CONTROL_POWEREVENT</b> and <i>dwEventType</i> is PBT_POWERSETTINGCHANGE, this data is a pointer to a 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-powerbroadcast_setting">POWERBROADCAST_SETTING</a> structure. 
     * 
     * If 
     *       <i>dwControl</i> is <b>SERVICE_CONTROL_SESSIONCHANGE</b>, this parameter is a pointer to a 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-wtssession_notification">WTSSESSION_NOTIFICATION</a> 
     *       structure.
     * 
     * If <i>dwControl</i> is <b>SERVICE_CONTROL_TIMECHANGE</b>, this data is a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-service_timechange_info">SERVICE_TIMECHANGE_INFO</a> structure.
     * @param {Pointer<Void>} lpContext User-defined data passed from 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-registerservicectrlhandlerexa">RegisterServiceCtrlHandlerEx</a>.
     *       When multiple services share a process, the <i>lpContext</i> parameter can help identify the 
     *       service.
     * @returns {Integer} The return value for this function depends on the control code received.
     * 
     * The following list identifies the rules for this return value:
     * 
     * <ul>
     * <li>In general, if your service does not handle the control, return <b>ERROR_CALL_NOT_IMPLEMENTED</b>. However, your service should return <b>NO_ERROR</b> for <b>SERVICE_CONTROL_INTERROGATE</b> even if your service does not handle it.</li>
     * <li>If your service handles <b>SERVICE_CONTROL_STOP</b> or  <b>SERVICE_CONTROL_SHUTDOWN</b>, return <b>NO_ERROR</b>.</li>
     * <li>If your service handles <b>SERVICE_CONTROL_DEVICEEVENT</b>, return <b>NO_ERROR</b> to grant the request and an error 
     *         code to deny the request.</li>
     * <li>If your service handles <b>SERVICE_CONTROL_HARDWAREPROFILECHANGE</b>, return <b>NO_ERROR</b> to grant the request and 
     *         an error code to deny the request.</li>
     * <li>If your service handles <b>SERVICE_CONTROL_POWEREVENT</b>, return <b>NO_ERROR</b> to grant the request and an error 
     *         code to deny the request.</li>
     * <li>For all other control codes your service handles, return <b>NO_ERROR</b>.</li>
     * </ul>
     */
    Call(dwControl, dwEventType, lpEventData, lpContext) {
        lpEventDataMarshal := lpEventData is VarRef ? "ptr" : "ptr"
        lpContextMarshal := lpContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, UInt32, dwControl, UInt32, dwEventType, lpEventDataMarshal, lpEventData, lpContextMarshal, lpContext, UInt32)
        return result
    }

    /**
     * A LPHANDLER_FUNCTION_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPHANDLER_FUNCTION_EX {
        /**
         * Creates a LPHANDLER_FUNCTION_EX pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32, "ptr", "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, "ptr", "ptr", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
