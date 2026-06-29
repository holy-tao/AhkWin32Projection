#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IExecAction.ahk" { IExecAction }

/**
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct IExecAction2 extends IExecAction {
    /**
     * The interface identifier for IExecAction2
     * @type {Guid}
     */
    static IID := Guid("{f2a82542-bda5-4e6b-9143-e2bf4f8987b6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IExecAction2 interfaces
    */
    struct Vtbl extends IExecAction.Vtbl {
        get_HideAppWindow : IntPtr
        put_HideAppWindow : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IExecAction2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    HideAppWindow {
        get => this.get_HideAppWindow()
        set => this.put_HideAppWindow(value)
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pHideAppWindow 
     * @returns {HRESULT} 
     */
    get_HideAppWindow(pHideAppWindow) {
        pHideAppWindowMarshal := pHideAppWindow is VarRef ? "short*" : "ptr"

        result := ComCall(16, this, pHideAppWindowMarshal, pHideAppWindow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} hideAppWindow 
     * @returns {HRESULT} 
     */
    put_HideAppWindow(hideAppWindow) {
        result := ComCall(17, this, VARIANT_BOOL, hideAppWindow, "HRESULT")
        return result
    }

    Query(iid) {
        if (IExecAction2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_HideAppWindow := CallbackCreate(GetMethod(implObj, "get_HideAppWindow"), flags, 2)
        this.vtbl.put_HideAppWindow := CallbackCreate(GetMethod(implObj, "put_HideAppWindow"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_HideAppWindow)
        CallbackFree(this.vtbl.put_HideAppWindow)
    }
}
