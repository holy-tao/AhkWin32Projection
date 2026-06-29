#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains preshutdown settings.
 * @remarks
 * Starting with the Windows Creator’s Update (build 15063) the default preshutdown time-out value is 10,000 milliseconds (10 seconds). In prior releases, the default preshutdown time-out value is 180,000 milliseconds (three minutes).
 * 
 * After the service control manager sends the SERVICE_CONTROL_PRESHUTDOWN notification to the <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lphandler_function_ex">HandlerEx</a> function, it waits for one of the following to occur before proceeding with other shutdown actions: the specified time elapses or the service enters the SERVICE_STOPPED state. The service can continue to update its status for as long as it is in the SERVICE_STOP_PENDING state.
 * @see https://learn.microsoft.com/windows/win32/api/winsvc/ns-winsvc-service_preshutdown_info
 * @namespace Windows.Win32.System.Services
 */
export default struct SERVICE_PRESHUTDOWN_INFO {
    #StructPack 4

    /**
     * The time-out value, in milliseconds.
     */
    dwPreshutdownTimeout : UInt32

}
