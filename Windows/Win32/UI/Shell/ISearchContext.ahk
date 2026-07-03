#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that channel customization information to the search hooks.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nn-shlobj_core-isearchcontext
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ISearchContext extends IUnknown {
    /**
     * The interface identifier for ISearchContext
     * @type {Guid}
     */
    static IID := Guid("{09f656a2-41af-480c-88f7-16cc0d164615}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISearchContext interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSearchUrl   : IntPtr
        GetSearchText  : IntPtr
        GetSearchStyle : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISearchContext.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the URL that is being searched for.
     * @returns {BSTR} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a></b>
     * 
     * The <b>BSTR</b> that receives the URL.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-isearchcontext-getsearchurl
     */
    GetSearchUrl() {
        pbstrSearchUrl := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, pbstrSearchUrl, "HRESULT")
        return pbstrSearchUrl
    }

    /**
     * Retrieves the text that is in the browser's Address bar.
     * @returns {BSTR} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a></b>
     * 
     * The <b>BSTR</b> that receives the text in the Address bar.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-isearchcontext-getsearchtext
     */
    GetSearchText() {
        pbstrSearchText := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, pbstrSearchText, "HRESULT")
        return pbstrSearchText
    }

    /**
     * Overrides the registry settings that determine how an autosearch is performed.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * A pointer to a <b>DWORD</b> value that indicates how the search is performed.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-isearchcontext-getsearchstyle
     */
    GetSearchStyle() {
        result := ComCall(5, this, "uint*", &pdwSearchStyle := 0, "HRESULT")
        return pdwSearchStyle
    }

    Query(iid) {
        if (ISearchContext.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSearchUrl := CallbackCreate(GetMethod(implObj, "GetSearchUrl"), flags, 2)
        this.vtbl.GetSearchText := CallbackCreate(GetMethod(implObj, "GetSearchText"), flags, 2)
        this.vtbl.GetSearchStyle := CallbackCreate(GetMethod(implObj, "GetSearchStyle"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSearchUrl)
        CallbackFree(this.vtbl.GetSearchText)
        CallbackFree(this.vtbl.GetSearchStyle)
    }
}
