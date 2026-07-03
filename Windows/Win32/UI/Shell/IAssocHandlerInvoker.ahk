#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that invoke an associated application handler.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iassochandlerinvoker
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IAssocHandlerInvoker extends IUnknown {
    /**
     * The interface identifier for IAssocHandlerInvoker
     * @type {Guid}
     */
    static IID := Guid("{92218cab-ecaa-4335-8133-807fd234c2ee}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAssocHandlerInvoker interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SupportsSelection : IntPtr
        Invoke            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAssocHandlerInvoker.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Determines whether an invoker supports its selection.
     * @remarks
     * For example, this method should return whether an application (as selected from an "Open With" context menu) can <b>Open</b> a file.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if this instance supports its selection, or <b>S_FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iassochandlerinvoker-supportsselection
     */
    SupportsSelection() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Invokes an associated application handler.
     * @remarks
     * There is no guarantee that a given association handler will support a particular selection, especially if multiple items are selected.  Before attempting to invoke the selection via this method, it is recommended to call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iassochandlerinvoker-supportsselection">IAssocHandlerInvoker::SupportsSelection</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iassochandlerinvoker-invoke
     */
    Invoke() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAssocHandlerInvoker.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SupportsSelection := CallbackCreate(GetMethod(implObj, "SupportsSelection"), flags, 1)
        this.vtbl.Invoke := CallbackCreate(GetMethod(implObj, "Invoke"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SupportsSelection)
        CallbackFree(this.vtbl.Invoke)
    }
}
