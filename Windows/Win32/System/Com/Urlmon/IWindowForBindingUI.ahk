#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IWindowForBindingUI extends IUnknown {
    /**
     * The interface identifier for IWindowForBindingUI
     * @type {Guid}
     */
    static IID := Guid("{79eac9d5-bafa-11ce-8c82-00aa004ba90b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWindowForBindingUI interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetWindow : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWindowForBindingUI.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a handle to a window that has the specified relationship (Z-Order or owner) to the specified window.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enumchildwindows">EnumChildWindows</a> function is more reliable than calling <b>GetWindow</b> in a loop. An application that calls <b>GetWindow</b> to perform this task risks being caught in an infinite loop or referencing a handle to a window that has been destroyed.
     * @param {Pointer<Guid>} rguidReason 
     * @returns {HWND} 
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getwindow
     */
    GetWindow(rguidReason) {
        phwnd := HWND()
        result := ComCall(3, this, Guid.Ptr, rguidReason, HWND.Ptr, phwnd, "HRESULT")
        return phwnd
    }

    Query(iid) {
        if (IWindowForBindingUI.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetWindow := CallbackCreate(GetMethod(implObj, "GetWindow"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetWindow)
    }
}
