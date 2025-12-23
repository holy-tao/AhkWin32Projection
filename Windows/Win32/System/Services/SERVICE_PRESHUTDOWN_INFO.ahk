#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains preshutdown settings.
 * @remarks
 * Starting with the Windows Creator’s Update (build 15063) the default preshutdown time-out value is 10,000 milliseconds (10 seconds). In prior releases, the default preshutdown time-out value is 180,000 milliseconds (three minutes).
 * 
 * After the service control manager sends the SERVICE_CONTROL_PRESHUTDOWN notification to the <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lphandler_function_ex">HandlerEx</a> function, it waits for one of the following to occur before proceeding with other shutdown actions: the specified time elapses or the service enters the SERVICE_STOPPED state. The service can continue to update its status for as long as it is in the SERVICE_STOP_PENDING state.
 * @see https://learn.microsoft.com/windows/win32/api/winsvc/ns-winsvc-service_preshutdown_info
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 */
class SERVICE_PRESHUTDOWN_INFO extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The time-out value, in milliseconds.
     * @type {Integer}
     */
    dwPreshutdownTimeout {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
