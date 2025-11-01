#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IHostThreadpoolManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHostThreadpoolManager
     * @type {Guid}
     */
    static IID => Guid("{983d50e2-cb15-466b-80fc-845dc6e8c5fd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueueUserWorkItem", "SetMaxThreads", "GetMaxThreads", "GetAvailableThreads", "SetMinThreads", "GetMinThreads"]

    /**
     * Queues a work item to a worker thread in the thread pool.
     * @param {Pointer<LPTHREAD_START_ROUTINE>} Function A pointer to the application-defined callback function of type <b>LPTHREAD_START_ROUTINE</b> to be executed by the thread in the thread pool. This value represents the starting address of the thread. This callback function must not call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-terminatethread">TerminateThread</a> function. 
     * 
     * The return value of the callback function is not used.
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms686736(v=vs.85)">ThreadProc</a>.
     * @param {Pointer<Void>} Context A single parameter value to be passed to the thread function.
     * @param {Integer} Flags 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//threadpoollegacyapiset/nf-threadpoollegacyapiset-queueuserworkitem
     */
    QueueUserWorkItem(Function, Context, Flags) {
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", Function, ContextMarshal, Context, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMaxWorkerThreads 
     * @returns {HRESULT} 
     */
    SetMaxThreads(dwMaxWorkerThreads) {
        result := ComCall(4, this, "uint", dwMaxWorkerThreads, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwMaxWorkerThreads 
     * @returns {HRESULT} 
     */
    GetMaxThreads(pdwMaxWorkerThreads) {
        pdwMaxWorkerThreadsMarshal := pdwMaxWorkerThreads is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pdwMaxWorkerThreadsMarshal, pdwMaxWorkerThreads, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwAvailableWorkerThreads 
     * @returns {HRESULT} 
     */
    GetAvailableThreads(pdwAvailableWorkerThreads) {
        pdwAvailableWorkerThreadsMarshal := pdwAvailableWorkerThreads is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pdwAvailableWorkerThreadsMarshal, pdwAvailableWorkerThreads, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMinIOCompletionThreads 
     * @returns {HRESULT} 
     */
    SetMinThreads(dwMinIOCompletionThreads) {
        result := ComCall(7, this, "uint", dwMinIOCompletionThreads, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwMinIOCompletionThreads 
     * @returns {HRESULT} 
     */
    GetMinThreads(pdwMinIOCompletionThreads) {
        pdwMinIOCompletionThreadsMarshal := pdwMinIOCompletionThreads is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pdwMinIOCompletionThreadsMarshal, pdwMinIOCompletionThreads, "HRESULT")
        return result
    }
}
