#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Retrieves a list of valid and invalid characters or the maximum length of a name in the namespace. Use this interface for validation parsing and translation.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iitemnamelimits
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IItemNameLimits extends IUnknown {
    /**
     * The interface identifier for IItemNameLimits
     * @type {Guid}
     */
    static IID := Guid("{1df0d7f1-b267-4d28-8b10-12e23202a5c4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IItemNameLimits interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetValidCharacters : IntPtr
        GetMaxLength       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IItemNameLimits.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Loads a string that contains each of the characters that are valid or invalid in the namespace under which it is called.
     * @remarks
     * As an example, the standard file system returns the string "\/:*?"&lt;&gt;|" in <i>ppwszInvalidChars</i> and <b>NULL</b> in <i>ppwszValidChars</i>. 
     * 
     * Both parameters cannot return non-<b>NULL</b> values, so <i>ppwszValidChars</i> is assigned a value of <b>NULL</b> because of the non-<b>NULL</b> value 
     * 
     * in <i>ppwszInvalidChars</i>. It is assumed that when there are specified invalid characters, everything else is valid. Only when <i>ppwszInvalidChars</i> is <b>NULL</b> does <i>ppwszValidChars</i> contain a list of all valid characters.
     * 			
     * 
     * If the method returns a success code, the allocated string must be freed using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @param {Pointer<PWSTR>} ppwszValidChars Type: <b>LPWSTR*</b>
     * 
     * A pointer to a string that contains all valid characters in the namespace. If the namespace provides <i>any</i> invalid characters in <i>ppwszInvalidChars</i>, then this value returns <b>NULL</b>. See Remarks for more details.
     * @param {Pointer<PWSTR>} ppwszInvalidChars Type: <b>LPWSTR*</b>
     * 
     * A pointer to a string that contains all invalid characters in the namespace.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iitemnamelimits-getvalidcharacters
     */
    GetValidCharacters(ppwszValidChars, ppwszInvalidChars) {
        ppwszValidCharsMarshal := ppwszValidChars is VarRef ? "ptr*" : "ptr"
        ppwszInvalidCharsMarshal := ppwszInvalidChars is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, ppwszValidCharsMarshal, ppwszValidChars, ppwszInvalidCharsMarshal, ppwszInvalidChars, "HRESULT")
        return result
    }

    /**
     * Returns the maximum number of characters allowed for a particular name in the namespace under which it is called.
     * @param {PWSTR} pszName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a string containing a name.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * A pointer to the maximum number of characters which can be used in the name.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iitemnamelimits-getmaxlength
     */
    GetMaxLength(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(4, this, "ptr", pszName, "int*", &piMaxNameLen := 0, "HRESULT")
        return piMaxNameLen
    }

    Query(iid) {
        if (IItemNameLimits.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetValidCharacters := CallbackCreate(GetMethod(implObj, "GetValidCharacters"), flags, 3)
        this.vtbl.GetMaxLength := CallbackCreate(GetMethod(implObj, "GetMaxLength"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetValidCharacters)
        CallbackFree(this.vtbl.GetMaxLength)
    }
}
