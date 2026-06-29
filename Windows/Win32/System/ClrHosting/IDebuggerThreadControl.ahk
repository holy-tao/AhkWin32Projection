#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct IDebuggerThreadControl extends IUnknown {
    /**
     * The interface identifier for IDebuggerThreadControl
     * @type {Guid}
     */
    static IID := Guid("{23d86786-0bb5-4774-8fb5-e3522add6246}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebuggerThreadControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ThreadIsBlockingForDebugger : IntPtr
        ReleaseAllRuntimeThreads    : IntPtr
        StartBlockingForDebugger    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebuggerThreadControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ThreadIsBlockingForDebugger() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ReleaseAllRuntimeThreads() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwUnused 
     * @returns {HRESULT} 
     */
    StartBlockingForDebugger(dwUnused) {
        result := ComCall(5, this, "uint", dwUnused, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebuggerThreadControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ThreadIsBlockingForDebugger := CallbackCreate(GetMethod(implObj, "ThreadIsBlockingForDebugger"), flags, 1)
        this.vtbl.ReleaseAllRuntimeThreads := CallbackCreate(GetMethod(implObj, "ReleaseAllRuntimeThreads"), flags, 1)
        this.vtbl.StartBlockingForDebugger := CallbackCreate(GetMethod(implObj, "StartBlockingForDebugger"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ThreadIsBlockingForDebugger)
        CallbackFree(this.vtbl.ReleaseAllRuntimeThreads)
        CallbackFree(this.vtbl.StartBlockingForDebugger)
    }
}
