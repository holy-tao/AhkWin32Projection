#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method that can be used by an accessibility application.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-iaccessibleobject
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IAccessibleObject extends IUnknown {
    /**
     * The interface identifier for IAccessibleObject
     * @type {Guid}
     */
    static IID := Guid("{95a391c5-9ed4-4c28-8401-ab9e06719e11}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAccessibleObject interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetAccessibleName : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAccessibleObject.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets text that is retrieved by IAccessible::get_accName which accessibility tools use to obtain the Name Property of an object.
     * @param {PWSTR} pszName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated, Unicode string containing the name.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iaccessibleobject-setaccessiblename
     */
    SetAccessibleName(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(3, this, "ptr", pszName, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAccessibleObject.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetAccessibleName := CallbackCreate(GetMethod(implObj, "SetAccessibleName"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetAccessibleName)
    }
}
