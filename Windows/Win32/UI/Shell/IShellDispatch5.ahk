#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IShellDispatch4.ahk" { IShellDispatch4 }

/**
 * Extends the IShellDispatch4 object.
 * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch5
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IShellDispatch5 extends IShellDispatch4 {
    /**
     * The interface identifier for IShellDispatch5
     * @type {Guid}
     */
    static IID := Guid("{866738b9-6cf2-4de8-8767-f794ebe74f4e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShellDispatch5 interfaces
    */
    struct Vtbl extends IShellDispatch4.Vtbl {
        WindowSwitcher : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShellDispatch5.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * IShellDispatch5.WindowSwitcher method - Displays your open windows in a 3D stack that you can flip through.
     * @returns {HRESULT} This method has no parameters.
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch5-windowswitcher
     */
    WindowSwitcher() {
        result := ComCall(44, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IShellDispatch5.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.WindowSwitcher := CallbackCreate(GetMethod(implObj, "WindowSwitcher"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.WindowSwitcher)
    }
}
