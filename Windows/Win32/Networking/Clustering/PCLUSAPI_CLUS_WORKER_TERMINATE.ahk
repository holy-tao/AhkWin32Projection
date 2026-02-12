#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Terminates a worker thread. The PCLUSAPI_CLUS_WORKER_TERMINATE type defines a pointer to this function.
 * @remarks
 * The <i>ClusWorkerTerminate</i> utility function checks 
 *      the <b>hThread</b> and <b>Terminate</b> members of the 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/ns-resapi-clus_worker">CLUS_WORKER</a> structure pointed to by 
 *      <i>lpWorker</i>. If <b>hThread</b> is not <b>NULL</b> 
 *      and <b>Terminate</b> is set to <b>FALSE</b>, indicating that this is your 
 *      first call to <i>ClusWorkerTerminate</i>, the function 
 *      waits for the thread to exit before returning. Otherwise, if you have called 
 *      <i>ClusWorkerTerminate</i> previously, indicated by 
 *      <b>Terminate</b> being set to <b>TRUE</b>, the function may return before 
 *      the thread has terminated.
 * @see https://learn.microsoft.com/windows/win32/api//content/resapi/nc-resapi-pclusapi_clus_worker_terminate
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class PCLUSAPI_CLUS_WORKER_TERMINATE extends IUnknown {

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
     * @param {Pointer<CLUS_WORKER>} lpWorker 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(lpWorker) {
        ComCall(3, this, "ptr", lpWorker)
    }
}
