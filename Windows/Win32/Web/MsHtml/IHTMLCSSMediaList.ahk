#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLCSSMediaList extends IDispatch {
    /**
     * The interface identifier for IHTMLCSSMediaList
     * @type {Guid}
     */
    static IID := Guid("{30510731-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLCSSMediaList
     * @type {Guid}
     */
    static CLSID := Guid("{30510732-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLCSSMediaList interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_mediaText : IntPtr
        get_mediaText : IntPtr
        get_length    : IntPtr
        item          : IntPtr
        appendMedium  : IntPtr
        deleteMedium  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLCSSMediaList.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    mediaText {
        get => this.get_mediaText()
        set => this.put_mediaText(value)
    }

    /**
     * @type {Integer} 
     */
    length {
        get => this.get_length()
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_mediaText(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_mediaText() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(9, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {BSTR} 
     */
    item(index) {
        pbstrMedium := BSTR.Owned()
        result := ComCall(10, this, "int", index, BSTR.Ptr, pbstrMedium, "HRESULT")
        return pbstrMedium
    }

    /**
     * 
     * @param {BSTR} bstrMedium 
     * @returns {HRESULT} 
     */
    appendMedium(bstrMedium) {
        bstrMedium := bstrMedium is String ? BSTR.Alloc(bstrMedium).Value : bstrMedium

        result := ComCall(11, this, BSTR, bstrMedium, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrMedium 
     * @returns {HRESULT} 
     */
    deleteMedium(bstrMedium) {
        bstrMedium := bstrMedium is String ? BSTR.Alloc(bstrMedium).Value : bstrMedium

        result := ComCall(12, this, BSTR, bstrMedium, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHTMLCSSMediaList.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_mediaText := CallbackCreate(GetMethod(implObj, "put_mediaText"), flags, 2)
        this.vtbl.get_mediaText := CallbackCreate(GetMethod(implObj, "get_mediaText"), flags, 2)
        this.vtbl.get_length := CallbackCreate(GetMethod(implObj, "get_length"), flags, 2)
        this.vtbl.item := CallbackCreate(GetMethod(implObj, "item"), flags, 3)
        this.vtbl.appendMedium := CallbackCreate(GetMethod(implObj, "appendMedium"), flags, 2)
        this.vtbl.deleteMedium := CallbackCreate(GetMethod(implObj, "deleteMedium"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_mediaText)
        CallbackFree(this.vtbl.get_mediaText)
        CallbackFree(this.vtbl.get_length)
        CallbackFree(this.vtbl.item)
        CallbackFree(this.vtbl.appendMedium)
        CallbackFree(this.vtbl.deleteMedium)
    }
}
