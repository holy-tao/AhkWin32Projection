#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ETaskType.ahk" { ETaskType }
#Import ".\ICLRTask.ahk" { ICLRTask }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct ICLRTaskManager extends IUnknown {
    /**
     * The interface identifier for ICLRTaskManager
     * @type {Guid}
     */
    static IID := Guid("{4862efbe-3ae5-44f8-8feb-346190ee8a34}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICLRTaskManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateTask         : IntPtr
        GetCurrentTask     : IntPtr
        SetUILocale        : IntPtr
        SetLocale          : IntPtr
        GetCurrentTaskType : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICLRTaskManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {ICLRTask} 
     */
    CreateTask() {
        result := ComCall(3, this, "ptr*", &pTask := 0, "HRESULT")
        return ICLRTask(pTask)
    }

    /**
     * 
     * @returns {ICLRTask} 
     */
    GetCurrentTask() {
        result := ComCall(4, this, "ptr*", &pTask := 0, "HRESULT")
        return ICLRTask(pTask)
    }

    /**
     * 
     * @param {Integer} lcid 
     * @returns {HRESULT} 
     */
    SetUILocale(lcid) {
        result := ComCall(5, this, "uint", lcid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lcid 
     * @returns {HRESULT} 
     */
    SetLocale(lcid) {
        result := ComCall(6, this, "uint", lcid, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ETaskType} 
     */
    GetCurrentTaskType() {
        result := ComCall(7, this, "int*", &pTaskType := 0, "HRESULT")
        return pTaskType
    }

    Query(iid) {
        if (ICLRTaskManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateTask := CallbackCreate(GetMethod(implObj, "CreateTask"), flags, 2)
        this.vtbl.GetCurrentTask := CallbackCreate(GetMethod(implObj, "GetCurrentTask"), flags, 2)
        this.vtbl.SetUILocale := CallbackCreate(GetMethod(implObj, "SetUILocale"), flags, 2)
        this.vtbl.SetLocale := CallbackCreate(GetMethod(implObj, "SetLocale"), flags, 2)
        this.vtbl.GetCurrentTaskType := CallbackCreate(GetMethod(implObj, "GetCurrentTaskType"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateTask)
        CallbackFree(this.vtbl.GetCurrentTask)
        CallbackFree(this.vtbl.SetUILocale)
        CallbackFree(this.vtbl.SetLocale)
        CallbackFree(this.vtbl.GetCurrentTaskType)
    }
}
