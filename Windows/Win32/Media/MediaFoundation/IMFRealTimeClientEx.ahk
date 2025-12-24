#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Notifies a pipeline object to register itself with the Multimedia Class Scheduler Service (MMCSS).
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfrealtimeclientex
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFRealTimeClientEx extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFRealTimeClientEx
     * @type {Guid}
     */
    static IID => Guid("{03910848-ab16-4611-b100-17b88ae2f248}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterThreadsEx", "UnregisterThreads", "SetWorkQueueEx"]

    /**
     * Notifies the object to register its worker threads with the Multimedia Class Scheduler Service (MMCSS).
     * @param {Pointer<Integer>} pdwTaskIndex The MMCSS task identifier. If the value is zero on input,  the object should create a new MCCSS task group. See Remarks.
     * @param {PWSTR} wszClassName The name of the MMCSS task.
     * @param {Integer} lBasePriority The base priority of the thread.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfrealtimeclientex-registerthreadsex
     */
    RegisterThreadsEx(pdwTaskIndex, wszClassName, lBasePriority) {
        wszClassName := wszClassName is String ? StrPtr(wszClassName) : wszClassName

        pdwTaskIndexMarshal := pdwTaskIndex is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwTaskIndexMarshal, pdwTaskIndex, "ptr", wszClassName, "int", lBasePriority, "HRESULT")
        return result
    }

    /**
     * Notifies the object to unregister its worker threads from the Multimedia Class Scheduler Service (MMCSS).
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfrealtimeclientex-unregisterthreads
     */
    UnregisterThreads() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Specifies the work queue that this object should use for asynchronous work items.
     * @param {Integer} dwMultithreadedWorkQueueId The work queue identifier.
     * @param {Integer} lWorkItemBasePriority The base priority for work items.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfrealtimeclientex-setworkqueueex
     */
    SetWorkQueueEx(dwMultithreadedWorkQueueId, lWorkItemBasePriority) {
        result := ComCall(5, this, "uint", dwMultithreadedWorkQueueId, "int", lWorkItemBasePriority, "HRESULT")
        return result
    }
}
