#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDebugApplicationThread.ahk" { IDebugApplicationThread }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IDebugSyncOperation extends IUnknown {
    /**
     * The interface identifier for IDebugSyncOperation
     * @type {Guid}
     */
    static IID := Guid("{51973c1a-cb0c-11d0-b5c9-00a0244a0e7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugSyncOperation interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTargetThread : IntPtr
        Execute         : IntPtr
        InProgressAbort : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugSyncOperation.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IDebugApplicationThread} 
     */
    GetTargetThread() {
        result := ComCall(3, this, "ptr*", &ppatTarget := 0, "HRESULT")
        return IDebugApplicationThread(ppatTarget)
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    Execute() {
        result := ComCall(4, this, "ptr*", &ppunkResult := 0, "HRESULT")
        return IUnknown(ppunkResult)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    InProgressAbort() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugSyncOperation.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTargetThread := CallbackCreate(GetMethod(implObj, "GetTargetThread"), flags, 2)
        this.vtbl.Execute := CallbackCreate(GetMethod(implObj, "Execute"), flags, 2)
        this.vtbl.InProgressAbort := CallbackCreate(GetMethod(implObj, "InProgressAbort"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTargetThread)
        CallbackFree(this.vtbl.Execute)
        CallbackFree(this.vtbl.InProgressAbort)
    }
}
