#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a method for localizing keywords in a specified string.
 * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nn-structuredquery-ischemalocalizersupport
 * @namespace Windows.Win32.System.Search
 */
export default struct ISchemaLocalizerSupport extends IUnknown {
    /**
     * The interface identifier for ISchemaLocalizerSupport
     * @type {Guid}
     */
    static IID := Guid("{ca3fdca2-bfbe-4eed-90d7-0caef0a1bda1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISchemaLocalizerSupport interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Localize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISchemaLocalizerSupport.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Localizes keywords from an input string.
     * @param {PWSTR} pszGlobalString Type: <b>LPCWSTR</b>
     * 
     * Pointer to a null-terminated Unicode string to be localized. It may be in one of two forms: (1) a set of keywords separated by the vertical bar character (Unicode character code 007C) (for example "date modified|modified|modification date"), or (2) a string of the form "@some.dll,-12345". This example refers to resource ID 12345 of the some.dll binary. That resource must be a string of the previous (1) form.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Returns a null-terminated Unicode string that is the localized string. The calling application must free the returned string by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>. If the method does not succeed, this parameter is set to <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ischemalocalizersupport-localize
     */
    Localize(pszGlobalString) {
        pszGlobalString := pszGlobalString is String ? StrPtr(pszGlobalString) : pszGlobalString

        result := ComCall(3, this, "ptr", pszGlobalString, PWSTR.Ptr, &ppszLocalString := 0, "HRESULT")
        return ppszLocalString
    }

    Query(iid) {
        if (ISchemaLocalizerSupport.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Localize := CallbackCreate(GetMethod(implObj, "Localize"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Localize)
    }
}
