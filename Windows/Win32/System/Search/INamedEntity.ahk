#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides methods to get the value of, or a default phrase for the value of, a named entity.
 * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nn-structuredquery-inamedentity
 * @namespace Windows.Win32.System.Search
 */
export default struct INamedEntity extends IUnknown {
    /**
     * The interface identifier for INamedEntity
     * @type {Guid}
     */
    static IID := Guid("{abdbd0b1-7d54-49fb-ab5c-bff4130004cd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INamedEntity interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetValue      : IntPtr
        DefaultPhrase : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INamedEntity.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the value of this named entity as a string.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Receives a pointer to the value of the named entity as a Unicode string. The calling application must free the returned string by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-inamedentity-getvalue
     */
    GetValue() {
        result := ComCall(3, this, PWSTR.Ptr, &ppszValue := 0, "HRESULT")
        return ppszValue
    }

    /**
     * Retrieves a default phrase to use for this named entity in restatements.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Receives a pointer to the default phrase as a Unicode string. The calling application must free the returned string by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-inamedentity-defaultphrase
     */
    DefaultPhrase() {
        result := ComCall(4, this, PWSTR.Ptr, &ppszPhrase := 0, "HRESULT")
        return ppszPhrase
    }

    Query(iid) {
        if (INamedEntity.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetValue := CallbackCreate(GetMethod(implObj, "GetValue"), flags, 2)
        this.vtbl.DefaultPhrase := CallbackCreate(GetMethod(implObj, "DefaultPhrase"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetValue)
        CallbackFree(this.vtbl.DefaultPhrase)
    }
}
