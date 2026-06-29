#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IShellDispatch5.ahk" { IShellDispatch5 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Extends the IShellDispatch5 object.
 * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch6
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IShellDispatch6 extends IShellDispatch5 {
    /**
     * The interface identifier for IShellDispatch6
     * @type {Guid}
     */
    static IID := Guid("{286e6f1b-7113-4355-9562-96b7e9d64c54}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShellDispatch6 interfaces
    */
    struct Vtbl extends IShellDispatch5.Vtbl {
        SearchCommand : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShellDispatch6.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Displays the Apps Search pane, which normally appears when you begin to type a search term from the Start screen.
     * @returns {HRESULT} This method has no parameters.
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch6-searchcommand
     */
    SearchCommand() {
        result := ComCall(45, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IShellDispatch6.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SearchCommand := CallbackCreate(GetMethod(implObj, "SearchCommand"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SearchCommand)
    }
}
