#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\COR_GC_THREAD_STATS.ahk" { COR_GC_THREAD_STATS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct ICLRTask extends IUnknown {
    /**
     * The interface identifier for ICLRTask
     * @type {Guid}
     */
    static IID := Guid("{28e66a4a-9906-4225-b231-9187c3eb8611}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICLRTask interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SwitchIn                : IntPtr
        SwitchOut               : IntPtr
        GetMemStats             : IntPtr
        Reset                   : IntPtr
        ExitTask                : IntPtr
        Abort                   : IntPtr
        RudeAbort               : IntPtr
        NeedsPriorityScheduling : IntPtr
        YieldTask               : IntPtr
        LocksHeld               : IntPtr
        SetTaskIdentifier       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICLRTask.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {HANDLE} threadHandle 
     * @returns {HRESULT} 
     */
    SwitchIn(threadHandle) {
        result := ComCall(3, this, HANDLE, threadHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SwitchOut() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {COR_GC_THREAD_STATS} 
     */
    GetMemStats() {
        memUsage := COR_GC_THREAD_STATS()
        result := ComCall(5, this, COR_GC_THREAD_STATS.Ptr, memUsage, "HRESULT")
        return memUsage
    }

    /**
     * 
     * @param {BOOL} fFull 
     * @returns {HRESULT} 
     */
    Reset(fFull) {
        result := ComCall(6, this, BOOL, fFull, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ExitTask() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Abort() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RudeAbort() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    NeedsPriorityScheduling() {
        result := ComCall(10, this, BOOL.Ptr, &pbNeedsPriorityScheduling := 0, "HRESULT")
        return pbNeedsPriorityScheduling
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    YieldTask() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer} 
     */
    LocksHeld() {
        result := ComCall(12, this, "ptr*", &pLockCount := 0, "HRESULT")
        return pLockCount
    }

    /**
     * 
     * @param {Integer} asked 
     * @returns {HRESULT} 
     */
    SetTaskIdentifier(asked) {
        result := ComCall(13, this, "uint", asked, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICLRTask.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SwitchIn := CallbackCreate(GetMethod(implObj, "SwitchIn"), flags, 2)
        this.vtbl.SwitchOut := CallbackCreate(GetMethod(implObj, "SwitchOut"), flags, 1)
        this.vtbl.GetMemStats := CallbackCreate(GetMethod(implObj, "GetMemStats"), flags, 2)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 2)
        this.vtbl.ExitTask := CallbackCreate(GetMethod(implObj, "ExitTask"), flags, 1)
        this.vtbl.Abort := CallbackCreate(GetMethod(implObj, "Abort"), flags, 1)
        this.vtbl.RudeAbort := CallbackCreate(GetMethod(implObj, "RudeAbort"), flags, 1)
        this.vtbl.NeedsPriorityScheduling := CallbackCreate(GetMethod(implObj, "NeedsPriorityScheduling"), flags, 2)
        this.vtbl.YieldTask := CallbackCreate(GetMethod(implObj, "YieldTask"), flags, 1)
        this.vtbl.LocksHeld := CallbackCreate(GetMethod(implObj, "LocksHeld"), flags, 2)
        this.vtbl.SetTaskIdentifier := CallbackCreate(GetMethod(implObj, "SetTaskIdentifier"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SwitchIn)
        CallbackFree(this.vtbl.SwitchOut)
        CallbackFree(this.vtbl.GetMemStats)
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.ExitTask)
        CallbackFree(this.vtbl.Abort)
        CallbackFree(this.vtbl.RudeAbort)
        CallbackFree(this.vtbl.NeedsPriorityScheduling)
        CallbackFree(this.vtbl.YieldTask)
        CallbackFree(this.vtbl.LocksHeld)
        CallbackFree(this.vtbl.SetTaskIdentifier)
    }
}
