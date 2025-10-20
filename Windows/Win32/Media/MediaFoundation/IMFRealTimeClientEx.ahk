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
     * 
     * @param {Pointer<UInt32>} pdwTaskIndex 
     * @param {PWSTR} wszClassName 
     * @param {Integer} lBasePriority 
     * @returns {HRESULT} 
     */
    RegisterThreadsEx(pdwTaskIndex, wszClassName, lBasePriority) {
        wszClassName := wszClassName is String ? StrPtr(wszClassName) : wszClassName

        result := ComCall(3, this, "uint*", pdwTaskIndex, "ptr", wszClassName, "int", lBasePriority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UnregisterThreads() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwMultithreadedWorkQueueId 
     * @param {Integer} lWorkItemBasePriority 
     * @returns {HRESULT} 
     */
    SetWorkQueueEx(dwMultithreadedWorkQueueId, lWorkItemBasePriority) {
        result := ComCall(5, this, "uint", dwMultithreadedWorkQueueId, "int", lWorkItemBasePriority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
