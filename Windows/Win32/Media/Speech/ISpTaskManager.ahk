#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\ISpThreadTask.ahk" { ISpThreadTask }
#Import ".\ISpNotifySink.ahk" { ISpNotifySink }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISpThreadControl.ahk" { ISpThreadControl }
#Import ".\SPTMTHREADINFO.ahk" { SPTMTHREADINFO }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ISpTask.ahk" { ISpTask }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpTaskManager extends IUnknown {
    /**
     * The interface identifier for ISpTaskManager
     * @type {Guid}
     */
    static IID := Guid("{2baeef81-2ca3-4331-98f3-26ec5abefb03}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpTaskManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetThreadPoolInfo     : IntPtr
        GetThreadPoolInfo     : IntPtr
        QueueTask             : IntPtr
        CreateReoccurringTask : IntPtr
        CreateThreadControl   : IntPtr
        TerminateTask         : IntPtr
        TerminateTaskGroup    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpTaskManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<SPTMTHREADINFO>} pPoolInfo 
     * @returns {HRESULT} 
     */
    SetThreadPoolInfo(pPoolInfo) {
        result := ComCall(3, this, SPTMTHREADINFO.Ptr, pPoolInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {SPTMTHREADINFO} 
     */
    GetThreadPoolInfo() {
        pPoolInfo := SPTMTHREADINFO()
        result := ComCall(4, this, SPTMTHREADINFO.Ptr, pPoolInfo, "HRESULT")
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
        pvTaskDataMarshal := pvTaskData is VarRef ? "ptr" : "ptr"
        pdwGroupIdMarshal := pdwGroupId is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pTask, pvTaskDataMarshal, pvTaskData, HANDLE, hCompEvent, pdwGroupIdMarshal, pdwGroupId, "uint*", &pTaskID := 0, "HRESULT")
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
        pvTaskDataMarshal := pvTaskData is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, "ptr", pTask, pvTaskDataMarshal, pvTaskData, HANDLE, hCompEvent, "ptr*", &ppTaskCtrl := 0, "HRESULT")
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

    Query(iid) {
        if (ISpTaskManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetThreadPoolInfo := CallbackCreate(GetMethod(implObj, "SetThreadPoolInfo"), flags, 2)
        this.vtbl.GetThreadPoolInfo := CallbackCreate(GetMethod(implObj, "GetThreadPoolInfo"), flags, 2)
        this.vtbl.QueueTask := CallbackCreate(GetMethod(implObj, "QueueTask"), flags, 6)
        this.vtbl.CreateReoccurringTask := CallbackCreate(GetMethod(implObj, "CreateReoccurringTask"), flags, 5)
        this.vtbl.CreateThreadControl := CallbackCreate(GetMethod(implObj, "CreateThreadControl"), flags, 5)
        this.vtbl.TerminateTask := CallbackCreate(GetMethod(implObj, "TerminateTask"), flags, 3)
        this.vtbl.TerminateTaskGroup := CallbackCreate(GetMethod(implObj, "TerminateTaskGroup"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetThreadPoolInfo)
        CallbackFree(this.vtbl.GetThreadPoolInfo)
        CallbackFree(this.vtbl.QueueTask)
        CallbackFree(this.vtbl.CreateReoccurringTask)
        CallbackFree(this.vtbl.CreateThreadControl)
        CallbackFree(this.vtbl.TerminateTask)
        CallbackFree(this.vtbl.TerminateTaskGroup)
    }
}
