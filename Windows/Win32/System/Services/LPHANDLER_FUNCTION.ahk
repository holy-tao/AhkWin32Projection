#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * An application-defined callback function used with the RegisterServiceCtrlHandler function. A service program can use it as the control handler function of a particular service.
 * @remarks
 * When a service is started, its 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lpservice_main_functiona">ServiceMain</a> function should immediately call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-registerservicectrlhandlera">RegisterServiceCtrlHandler</a> function to specify a 
 * <b>Handler</b> function to process control requests.
 * 
 * The control dispatcher in the main thread of a service process invokes the control handler function for the specified service whenever it receives a control request from the service control manager. After processing the control request, the control handler must call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-setservicestatus">SetServiceStatus</a> function if the service state changes to report its new status to the service control manager.
 * 
 * The control handler function is intended to receive notification and return immediately. The callback function should save its parameters and create other threads to perform additional work. (Your application must ensure that such threads have exited before stopping the service.) In particular, a control handler should avoid  operations that might block, such as taking a lock, because this could result  in  a deadlock or cause the system to stop responding. 
 * 
 * When the service control manager sends a control code to a service, it waits for the handler function to return before sending additional control codes to other services. The control handler should return as quickly as possible; if it does not return within 30 seconds, the SCM  returns an error. If a service must do lengthy processing when the service is executing the control handler, it should create a secondary thread to perform the lengthy processing, and then return from the control handler. This prevents the service from tying up the control dispatcher and blocking other services from receiving control codes.
 * 
 * The <b>SERVICE_CONTROL_SHUTDOWN</b> control code should only be processed by services that must absolutely clean up during shutdown, because there is a limited time (about 20 seconds) available for service shutdown. After this time expires, system shutdown proceeds regardless of whether service shutdown is complete. Note that if the system is left in the shutdown state (not restarted or powered down), the service continues to run.   If your service registers to accept <b>SERVICE_CONTROL_SHUTDOWN</b>, it must handle the control code and stop  in a timely fashion. Otherwise, the service can increase the time required to shut down the system, because the system must wait for the full amount of time allowed for service shutdown before system shutdown can proceed. 
 * 
 * If the service requires more time to clean up, it should send <b>STOP_PENDING</b> status messages, along with a wait hint, so the service controller knows how long to wait before reporting to the system that service shutdown is complete. However, to prevent a service from stopping shutdown, there is a limit to how long the service controller will wait. If the service is being shut down through the Services snap-in, the limit is 125 seconds. If the operating system is rebooting, the time limit is specified in the <b>WaitToKillServiceTimeout</b> value of the following registry key:
 * 
 * 
 * <b>HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control</b>
 * 
 * 
 * 
 * Services can also use the <a href="https://docs.microsoft.com/windows/console/setconsolectrlhandler">SetConsoleCtrlHandler</a> function to receive shutdown notification. This notification is received when the running applications are shutting down, which occurs before services are shut down.
 * @see https://learn.microsoft.com/windows/win32/api//content/winsvc/nc-winsvc-lphandler_function
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 */
class LPHANDLER_FUNCTION extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Integer} dwControl 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(dwControl) {
        ComCall(3, this, "uint", dwControl)
    }
}
