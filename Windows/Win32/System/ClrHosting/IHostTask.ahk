#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ICLRTask.ahk" { ICLRTask }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct IHostTask extends IUnknown {
    /**
     * The interface identifier for IHostTask
     * @type {Guid}
     */
    static IID := Guid("{c2275828-c4b1-4b55-82c9-92135f74df1a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHostTask interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Start       : IntPtr
        Alert       : IntPtr
        Join        : IntPtr
        SetPriority : IntPtr
        GetPriority : IntPtr
        SetCLRTask  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHostTask.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Start() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Alert() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMilliseconds 
     * @param {Integer} option 
     * @returns {HRESULT} 
     */
    Join(dwMilliseconds, option) {
        result := ComCall(5, this, "uint", dwMilliseconds, "uint", option, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} newPriority 
     * @returns {HRESULT} 
     */
    SetPriority(newPriority) {
        result := ComCall(6, this, "int", newPriority, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetPriority() {
        result := ComCall(7, this, "int*", &pPriority := 0, "HRESULT")
        return pPriority
    }

    /**
     * 
     * @param {ICLRTask} pCLRTask 
     * @returns {HRESULT} 
     */
    SetCLRTask(pCLRTask) {
        result := ComCall(8, this, "ptr", pCLRTask, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHostTask.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Start := CallbackCreate(GetMethod(implObj, "Start"), flags, 1)
        this.vtbl.Alert := CallbackCreate(GetMethod(implObj, "Alert"), flags, 1)
        this.vtbl.Join := CallbackCreate(GetMethod(implObj, "Join"), flags, 3)
        this.vtbl.SetPriority := CallbackCreate(GetMethod(implObj, "SetPriority"), flags, 2)
        this.vtbl.GetPriority := CallbackCreate(GetMethod(implObj, "GetPriority"), flags, 2)
        this.vtbl.SetCLRTask := CallbackCreate(GetMethod(implObj, "SetCLRTask"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Start)
        CallbackFree(this.vtbl.Alert)
        CallbackFree(this.vtbl.Join)
        CallbackFree(this.vtbl.SetPriority)
        CallbackFree(this.vtbl.GetPriority)
        CallbackFree(this.vtbl.SetCLRTask)
    }
}
