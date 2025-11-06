#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SPTMTHREADINFO.ahk
#Include .\ISpNotifySink.ahk
#Include .\ISpThreadControl.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpTaskManager extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetThreadPoolInfo", "GetThreadPoolInfo", "QueueTask", "CreateReoccurringTask", "CreateThreadControl", "TerminateTask", "TerminateTaskGroup"]

    /**
     * 
     * @param {Pointer<SPTMTHREADINFO>} pPoolInfo 
     * @returns {HRESULT} 
     */
    SetThreadPoolInfo(pPoolInfo) {
        result := ComCall(3, this, "ptr", pPoolInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {SPTMTHREADINFO} 
     */
    GetThreadPoolInfo() {
        pPoolInfo := SPTMTHREADINFO()
        result := ComCall(4, this, "ptr", pPoolInfo, "HRESULT")
        return pPoolInfo
    }

    /**
     * 
     * @param {ISpTask} pTask 
     * @param {Pointer<Void>} pvTaskData 
     * @param {HANDLE} hCompEvent 
     * @param {Pointer<Integer>} pdwGroupId 
     * @returns {Integer} 
     */
    QueueTask(pTask, pvTaskData, hCompEvent, pdwGroupId) {
        hCompEvent := hCompEvent is Win32Handle ? NumGet(hCompEvent, "ptr") : hCompEvent

        pvTaskDataMarshal := pvTaskData is VarRef ? "ptr" : "ptr"
        pdwGroupIdMarshal := pdwGroupId is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pTask, pvTaskDataMarshal, pvTaskData, "ptr", hCompEvent, pdwGroupIdMarshal, pdwGroupId, "uint*", &pTaskID := 0, "HRESULT")
        return pTaskID
    }

    /**
     * 
     * @param {ISpTask} pTask 
     * @param {Pointer<Void>} pvTaskData 
     * @param {HANDLE} hCompEvent 
     * @returns {ISpNotifySink} 
     */
    CreateReoccurringTask(pTask, pvTaskData, hCompEvent) {
        hCompEvent := hCompEvent is Win32Handle ? NumGet(hCompEvent, "ptr") : hCompEvent

        pvTaskDataMarshal := pvTaskData is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, "ptr", pTask, pvTaskDataMarshal, pvTaskData, "ptr", hCompEvent, "ptr*", &ppTaskCtrl := 0, "HRESULT")
        return ISpNotifySink(ppTaskCtrl)
    }

    /**
     * 
     * @param {ISpThreadTask} pTask 
     * @param {Pointer<Void>} pvTaskData 
     * @param {Integer} nPriority 
     * @returns {ISpThreadControl} 
     */
    CreateThreadControl(pTask, pvTaskData, nPriority) {
        pvTaskDataMarshal := pvTaskData is VarRef ? "ptr" : "ptr"

        result := ComCall(7, this, "ptr", pTask, pvTaskDataMarshal, pvTaskData, "int", nPriority, "ptr*", &ppTaskCtrl := 0, "HRESULT")
        return ISpThreadControl(ppTaskCtrl)
    }

    /**
     * 
     * @param {Integer} dwTaskId 
     * @param {Integer} ulWaitPeriod 
     * @returns {HRESULT} 
     */
    TerminateTask(dwTaskId, ulWaitPeriod) {
        result := ComCall(8, this, "uint", dwTaskId, "uint", ulWaitPeriod, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwGroupId 
     * @param {Integer} ulWaitPeriod 
     * @returns {HRESULT} 
     */
    TerminateTaskGroup(dwGroupId, ulWaitPeriod) {
        result := ComCall(9, this, "uint", dwGroupId, "uint", ulWaitPeriod, "HRESULT")
        return result
    }
}
