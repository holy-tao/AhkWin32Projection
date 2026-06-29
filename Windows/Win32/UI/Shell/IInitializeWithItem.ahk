#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IShellItem.ahk" { IShellItem }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method used to initialize a handler, such as a property handler, thumbnail handler, or preview handler, with an IShellItem.
 * @remarks
 * Whenever possible, it is recommended that initialization be done through a stream using <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-iinitializewithstream">IInitializeWithStream</a>. Benefits of this include increased security and stability.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iinitializewithitem
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IInitializeWithItem extends IUnknown {
    /**
     * The interface identifier for IInitializeWithItem
     * @type {Guid}
     */
    static IID := Guid("{7f73be3f-fb79-493c-a6c7-7ee14e245841}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInitializeWithItem interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInitializeWithItem.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes a handler with an IShellItem.
     * @remarks
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> cannot be accessed, this method returns an appropriate error code.
     * 
     * A handler instance should be initialized only once in its lifetime. Attempts by the calling application to reinitialize the handler result in the error <c>HRESULT_FROM_WIN32(ERROR_ALREADY_INITIALIZED)</c>.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>.
     * @param {Integer} grfMode Type: <b>DWORD</b>
     * 
     * One of the following <a href="https://docs.microsoft.com/windows/desktop/Stg/stgm-constants">STGM</a> values that indicate the access mode for <i>psi</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iinitializewithitem-initialize
     */
    Initialize(psi, grfMode) {
        result := ComCall(3, this, "ptr", psi, "uint", grfMode, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInitializeWithItem.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
    }
}
