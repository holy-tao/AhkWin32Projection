#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IGCHostControl.ahk" { IGCHostControl }
#Import ".\IDebuggerThreadControl.ahk" { IDebuggerThreadControl }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IGCThreadControl.ahk" { IGCThreadControl }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct ICorConfiguration extends IUnknown {
    /**
     * The interface identifier for ICorConfiguration
     * @type {Guid}
     */
    static IID := Guid("{5c2b07a5-1e98-11d3-872f-00c04f79ed0d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICorConfiguration interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetGCThreadControl       : IntPtr
        SetGCHostControl         : IntPtr
        SetDebuggerThreadControl : IntPtr
        AddDebuggerSpecialThread : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICorConfiguration.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IGCThreadControl} pGCThreadControl 
     * @returns {HRESULT} 
     */
    SetGCThreadControl(pGCThreadControl) {
        result := ComCall(3, this, "ptr", pGCThreadControl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IGCHostControl} pGCHostControl 
     * @returns {HRESULT} 
     */
    SetGCHostControl(pGCHostControl) {
        result := ComCall(4, this, "ptr", pGCHostControl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebuggerThreadControl} pDebuggerThreadControl 
     * @returns {HRESULT} 
     */
    SetDebuggerThreadControl(pDebuggerThreadControl) {
        result := ComCall(5, this, "ptr", pDebuggerThreadControl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSpecialThreadId 
     * @returns {HRESULT} 
     */
    AddDebuggerSpecialThread(dwSpecialThreadId) {
        result := ComCall(6, this, "uint", dwSpecialThreadId, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICorConfiguration.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetGCThreadControl := CallbackCreate(GetMethod(implObj, "SetGCThreadControl"), flags, 2)
        this.vtbl.SetGCHostControl := CallbackCreate(GetMethod(implObj, "SetGCHostControl"), flags, 2)
        this.vtbl.SetDebuggerThreadControl := CallbackCreate(GetMethod(implObj, "SetDebuggerThreadControl"), flags, 2)
        this.vtbl.AddDebuggerSpecialThread := CallbackCreate(GetMethod(implObj, "AddDebuggerSpecialThread"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetGCThreadControl)
        CallbackFree(this.vtbl.SetGCHostControl)
        CallbackFree(this.vtbl.SetDebuggerThreadControl)
        CallbackFree(this.vtbl.AddDebuggerSpecialThread)
    }
}
