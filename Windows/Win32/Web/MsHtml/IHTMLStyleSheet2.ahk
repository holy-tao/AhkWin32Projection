#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLStyleSheetPagesCollection.ahk" { IHTMLStyleSheetPagesCollection }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLStyleSheet2 extends IDispatch {
    /**
     * The interface identifier for IHTMLStyleSheet2
     * @type {Guid}
     */
    static IID := Guid("{3050f3d1-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLStyleSheet2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_pages   : IntPtr
        addPageRule : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLStyleSheet2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IHTMLStyleSheetPagesCollection} 
     */
    pages {
        get => this.get_pages()
    }

    /**
     * 
     * @returns {IHTMLStyleSheetPagesCollection} 
     */
    get_pages() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLStyleSheetPagesCollection(p)
    }

    /**
     * 
     * @param {BSTR} bstrSelector 
     * @param {BSTR} bstrStyle 
     * @param {Integer} lIndex 
     * @returns {Integer} 
     */
    addPageRule(bstrSelector, bstrStyle, lIndex) {
        bstrSelector := bstrSelector is String ? BSTR.Alloc(bstrSelector).Value : bstrSelector
        bstrStyle := bstrStyle is String ? BSTR.Alloc(bstrStyle).Value : bstrStyle

        result := ComCall(8, this, BSTR, bstrSelector, BSTR, bstrStyle, "int", lIndex, "int*", &plNewIndex := 0, "HRESULT")
        return plNewIndex
    }

    Query(iid) {
        if (IHTMLStyleSheet2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_pages := CallbackCreate(GetMethod(implObj, "get_pages"), flags, 2)
        this.vtbl.addPageRule := CallbackCreate(GetMethod(implObj, "addPageRule"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_pages)
        CallbackFree(this.vtbl.addPageRule)
    }
}
