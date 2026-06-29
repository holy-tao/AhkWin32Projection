#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct IMLangCodePages extends IUnknown {
    /**
     * The interface identifier for IMLangCodePages
     * @type {Guid}
     */
    static IID := Guid("{359f3443-bd4a-11d0-b188-00aa0038c969}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMLangCodePages interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCharCodePages    : IntPtr
        GetStrCodePages     : IntPtr
        CodePageToCodePages : IntPtr
        CodePagesToCodePage : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMLangCodePages.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} chSrc 
     * @returns {Integer} 
     */
    GetCharCodePages(chSrc) {
        result := ComCall(3, this, "char", chSrc, "uint*", &pdwCodePages := 0, "HRESULT")
        return pdwCodePages
    }

    /**
     * 
     * @param {PWSTR} pszSrc 
     * @param {Integer} cchSrc 
     * @param {Integer} dwPriorityCodePages 
     * @param {Pointer<Integer>} pdwCodePages 
     * @param {Pointer<Integer>} pcchCodePages 
     * @returns {HRESULT} 
     */
    GetStrCodePages(pszSrc, cchSrc, dwPriorityCodePages, pdwCodePages, pcchCodePages) {
        pszSrc := pszSrc is String ? StrPtr(pszSrc) : pszSrc

        pdwCodePagesMarshal := pdwCodePages is VarRef ? "uint*" : "ptr"
        pcchCodePagesMarshal := pcchCodePages is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pszSrc, "int", cchSrc, "uint", dwPriorityCodePages, pdwCodePagesMarshal, pdwCodePages, pcchCodePagesMarshal, pcchCodePages, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uCodePage 
     * @returns {Integer} 
     */
    CodePageToCodePages(uCodePage) {
        result := ComCall(5, this, "uint", uCodePage, "uint*", &pdwCodePages := 0, "HRESULT")
        return pdwCodePages
    }

    /**
     * 
     * @param {Integer} dwCodePages 
     * @param {Integer} uDefaultCodePage 
     * @returns {Integer} 
     */
    CodePagesToCodePage(dwCodePages, uDefaultCodePage) {
        result := ComCall(6, this, "uint", dwCodePages, "uint", uDefaultCodePage, "uint*", &puCodePage := 0, "HRESULT")
        return puCodePage
    }

    Query(iid) {
        if (IMLangCodePages.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCharCodePages := CallbackCreate(GetMethod(implObj, "GetCharCodePages"), flags, 3)
        this.vtbl.GetStrCodePages := CallbackCreate(GetMethod(implObj, "GetStrCodePages"), flags, 6)
        this.vtbl.CodePageToCodePages := CallbackCreate(GetMethod(implObj, "CodePageToCodePages"), flags, 3)
        this.vtbl.CodePagesToCodePage := CallbackCreate(GetMethod(implObj, "CodePagesToCodePage"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCharCodePages)
        CallbackFree(this.vtbl.GetStrCodePages)
        CallbackFree(this.vtbl.CodePageToCodePages)
        CallbackFree(this.vtbl.CodePagesToCodePage)
    }
}
