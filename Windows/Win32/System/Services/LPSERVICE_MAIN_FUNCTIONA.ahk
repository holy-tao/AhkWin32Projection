#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The entry point for a service. (ANSI)
 * @remarks
 * A service program can start one or more services. A service process has a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-service_table_entrya">SERVICE_TABLE_ENTRY</a> structure for each service that it can start. The structure specifies the service name and a pointer to the 
 * <b>ServiceMain</b> function for that service.
 * 
 * When the service control manager receives a request to start a service, it starts the service process (if it is not already running). The main thread of the service process calls the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-startservicectrldispatchera">StartServiceCtrlDispatcher</a> function with a pointer to an array of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-service_table_entrya">SERVICE_TABLE_ENTRY</a> structures. Then the service control manager sends a start request to the service control dispatcher for this service process. The service control dispatcher creates a new thread to execute the 
 * <b>ServiceMain</b> function of the service being started.
 * 
 * The 
 * <b>ServiceMain</b> function should immediately call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-registerservicectrlhandlerexa">RegisterServiceCtrlHandlerEx</a> function to specify a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lphandler_function">HandlerEx</a> function to handle control requests. Next, it should call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-setservicestatus">SetServiceStatus</a> function to send status information to the service control manager. After these calls, the function should complete the initialization of the service. Do not attempt to start another service in the 
 * <b>ServiceMain</b> function.
 * 
 * The Service Control Manager (SCM) waits until the service reports a status of SERVICE_RUNNING. It is recommended that the service reports this status as quickly as possible, as other components in the system that require interaction with SCM will be blocked during this time. Some functions  may require interaction with the SCM either directly or indirectly. 
 * 
 * The SCM locks the service control database during initialization, so if a service attempts to call <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-startservicea">StartService</a> during initialization, the call will block. When the service reports to the SCM that it has successfully started, it can call <b>StartService</b>. If the service requires another service to be running, the service should set the required dependencies.
 * 
 * Furthermore, you should not call any  system functions during service initialization. The service code should call system functions only after it reports a status of SERVICE_RUNNING.
 * 
 * The 
 * <b>ServiceMain</b> function should create a global event, call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-registerwaitforsingleobject">RegisterWaitForSingleObject</a> function on this event, and exit. This will terminate the thread that is running the 
 * <b>ServiceMain</b> function, but will not terminate the service. When the service is stopping, the service control handler should call <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-setservicestatus">SetServiceStatus</a> with SERVICE_STOP_PENDING and signal this event. A thread from the thread pool will execute the wait callback function; this function should perform clean-up tasks, including closing the global event, and call 
 * <b>SetServiceStatus</b> with SERVICE_STOPPED. After the service has stopped, you should not execute any additional service code because  you can introduce a race condition if the service receives a start control and <b>ServiceMain</b> is called again. Note that this problem is more likely to occur when multiple services share a process.
 * @see https://learn.microsoft.com/windows/win32/api//content/winsvc/nc-winsvc-lpservice_main_functiona
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 * @charset ANSI
 */
class LPSERVICE_MAIN_FUNCTIONA extends IUnknown {

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
     * @param {Integer} dwNumServicesArgs 
     * @param {Pointer<PSTR>} lpServiceArgVectors 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(dwNumServicesArgs, lpServiceArgVectors) {
        lpServiceArgVectorsMarshal := lpServiceArgVectors is VarRef ? "ptr*" : "ptr"

        ComCall(3, this, "uint", dwNumServicesArgs, lpServiceArgVectorsMarshal, lpServiceArgVectors)
    }
}
