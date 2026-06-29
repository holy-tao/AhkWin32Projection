#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that provide access to the ProgID associated with an object.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iobjectwithprogid
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IObjectWithProgID extends IUnknown {
    /**
     * The interface identifier for IObjectWithProgID
     * @type {Guid}
     */
    static IID := Guid("{71e806fb-8dee-46fc-bf8c-7748a8a1ae13}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IObjectWithProgID interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetProgID : IntPtr
        GetProgID : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IObjectWithProgID.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the ProgID of an object.
     * @param {PWSTR} pszProgID Type: <b>LPCWSTR</b>
     * 
     * A pointer to a string that contains the new ProgID.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iobjectwithprogid-setprogid
     */
    SetProgID(pszProgID) {
        pszProgID := pszProgID is String ? StrPtr(pszProgID) : pszProgID

        result := ComCall(3, this, "ptr", pszProgID, "HRESULT")
        return result
    }

    /**
     * Retrieves the ProgID associated with an object.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * A pointer to a string that, when this method returns successfully, contains the ProgID.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iobjectwithprogid-getprogid
     */
    GetProgID() {
        result := ComCall(4, this, PWSTR.Ptr, &ppszProgID := 0, "HRESULT")
        return ppszProgID
    }

    Query(iid) {
        if (IObjectWithProgID.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetProgID := CallbackCreate(GetMethod(implObj, "SetProgID"), flags, 2)
        this.vtbl.GetProgID := CallbackCreate(GetMethod(implObj, "GetProgID"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetProgID)
        CallbackFree(this.vtbl.GetProgID)
    }
}
