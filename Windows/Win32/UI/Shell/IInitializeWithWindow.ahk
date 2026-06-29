#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method through which a client can provide an owner window to a Windows Runtime object used in a desktop application.
 * @remarks
 * Implement this interface if your object needs to be provided with an owner window, generally to display UI. Most third-party applications will not need to implement this interface.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iinitializewithwindow
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IInitializeWithWindow extends IUnknown {
    /**
     * The interface identifier for IInitializeWithWindow
     * @type {Guid}
     */
    static IID := Guid("{3e68d4bd-7135-4d10-8018-9fb6d9f33fa1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInitializeWithWindow interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInitializeWithWindow.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Specifies an owner window to be used by a Windows Runtime object that is used in a desktop app.
     * @param {HWND} _hwnd The handle of the window to be used as the owner window.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iinitializewithwindow-initialize
     */
    Initialize(_hwnd) {
        result := ComCall(3, this, HWND, _hwnd, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInitializeWithWindow.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
    }
}
