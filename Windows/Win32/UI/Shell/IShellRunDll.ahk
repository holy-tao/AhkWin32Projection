#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Not supported. (IShellRunDll)
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-ishellrundll
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IShellRunDll extends IUnknown {
    /**
     * The interface identifier for IShellRunDll
     * @type {Guid}
     */
    static IID := Guid("{fce4bde0-4b68-4b80-8e9c-7426315a7388}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShellRunDll interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Run : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShellRunDll.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Not supported. (IShellRunDll.Run)
     * @param {PWSTR} pszArgs Type: <b>LPCWSTR</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ishellrundll-run
     */
    Run(pszArgs) {
        pszArgs := pszArgs is String ? StrPtr(pszArgs) : pszArgs

        result := ComCall(3, this, "ptr", pszArgs, "HRESULT")
        return result
    }

    Query(iid) {
        if (IShellRunDll.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Run := CallbackCreate(GetMethod(implObj, "Run"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Run)
    }
}
