#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpTaskManager extends IUnknown{
    /**
     * The interface identifier for ISpTaskManager
     * @type {Guid}
     */
    static IID => Guid("{2baeef81-2ca3-4331-98f3-26ec5abefb03}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<SPTMTHREADINFO>} pPoolInfo 
     * @returns {HRESULT} 
     */
    SetThreadPoolInfo(pPoolInfo) {
        result := ComCall(3, this, "ptr", pPoolInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SPTMTHREADINFO>} pPoolInfo 
     * @returns {HRESULT} 
     */
    GetThreadPoolInfo(pPoolInfo) {
        result := ComCall(4, this, "ptr", pPoolInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpTask>} pTask 
     * @param {Pointer<Void>} pvTaskData 
     * @param {HANDLE} hCompEvent 
     * @param {Pointer<UInt32>} pdwGroupId 
     * @param {Pointer<UInt32>} pTaskID 
     * @returns {HRESULT} 
     */
    QueueTask(pTask, pvTaskData, hCompEvent, pdwGroupId, pTaskID) {
        hCompEvent := hCompEvent is Win32Handle ? NumGet(hCompEvent, "ptr") : hCompEvent

        result := ComCall(5, this, "ptr", pTask, "ptr", pvTaskData, "ptr", hCompEvent, "uint*", pdwGroupId, "uint*", pTaskID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpTask>} pTask 
     * @param {Pointer<Void>} pvTaskData 
     * @param {HANDLE} hCompEvent 
     * @param {Pointer<ISpNotifySink>} ppTaskCtrl 
     * @returns {HRESULT} 
     */
    CreateReoccurringTask(pTask, pvTaskData, hCompEvent, ppTaskCtrl) {
        hCompEvent := hCompEvent is Win32Handle ? NumGet(hCompEvent, "ptr") : hCompEvent

        result := ComCall(6, this, "ptr", pTask, "ptr", pvTaskData, "ptr", hCompEvent, "ptr", ppTaskCtrl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpThreadTask>} pTask 
     * @param {Pointer<Void>} pvTaskData 
     * @param {Integer} nPriority 
     * @param {Pointer<ISpThreadControl>} ppTaskCtrl 
     * @returns {HRESULT} 
     */
    CreateThreadControl(pTask, pvTaskData, nPriority, ppTaskCtrl) {
        result := ComCall(7, this, "ptr", pTask, "ptr", pvTaskData, "int", nPriority, "ptr", ppTaskCtrl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwTaskId 
     * @param {Integer} ulWaitPeriod 
     * @returns {HRESULT} 
     */
    TerminateTask(dwTaskId, ulWaitPeriod) {
        result := ComCall(8, this, "uint", dwTaskId, "uint", ulWaitPeriod, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwGroupId 
     * @param {Integer} ulWaitPeriod 
     * @returns {HRESULT} 
     */
    TerminateTaskGroup(dwGroupId, ulWaitPeriod) {
        result := ComCall(9, this, "uint", dwGroupId, "uint", ulWaitPeriod, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
