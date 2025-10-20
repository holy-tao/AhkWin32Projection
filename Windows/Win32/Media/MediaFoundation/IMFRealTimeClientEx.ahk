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
     * 
     * @param {Pointer<Integer>} pdwTaskIndex 
     * @param {PWSTR} wszClassName 
     * @param {Integer} lBasePriority 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfrealtimeclientex-registerthreadsex
     */
    RegisterThreadsEx(pdwTaskIndex, wszClassName, lBasePriority) {
        wszClassName := wszClassName is String ? StrPtr(wszClassName) : wszClassName

        result := ComCall(3, this, "uint*", pdwTaskIndex, "ptr", wszClassName, "int", lBasePriority, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfrealtimeclientex-unregisterthreads
     */
    UnregisterThreads() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMultithreadedWorkQueueId 
     * @param {Integer} lWorkItemBasePriority 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfrealtimeclientex-setworkqueueex
     */
    SetWorkQueueEx(dwMultithreadedWorkQueueId, lWorkItemBasePriority) {
        result := ComCall(5, this, "uint", dwMultithreadedWorkQueueId, "int", lWorkItemBasePriority, "HRESULT")
        return result
    }
}
