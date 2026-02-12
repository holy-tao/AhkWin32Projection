#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Initializes a worker thread with the specified callback routine. The PWORKER_START_ROUTINE type defines a pointer to this function.
 * @remarks
 * The pointer to this  callback function is used as an input parameter for the <a href="https://docs.microsoft.com/windows/desktop/api/resapi/nf-resapi-clusworkercreate">ClusWorkerCreate</a> function.
 * @see https://learn.microsoft.com/windows/win32/api//content/resapi/nc-resapi-pworker_start_routine
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class PWORKER_START_ROUTINE extends IUnknown {

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
     * @param {Pointer<CLUS_WORKER>} pWorker 
     * @param {Pointer<Void>} lpThreadParameter 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pWorker, lpThreadParameter) {
        lpThreadParameterMarshal := lpThreadParameter is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", pWorker, lpThreadParameterMarshal, lpThreadParameter, "uint")
        return result
    }
}
