#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLStyleMedia extends IDispatch {
    /**
     * The interface identifier for IHTMLStyleMedia
     * @type {Guid}
     */
    static IID := Guid("{3051074b-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLStyleMedia
     * @type {Guid}
     */
    static CLSID := Guid("{3051074c-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLStyleMedia interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_type    : IntPtr
        matchMedium : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLStyleMedia.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    type {
        get => this.get_type()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_type() {
        p := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} mediaQuery 
     * @returns {VARIANT_BOOL} 
     */
    matchMedium(mediaQuery) {
        mediaQuery := mediaQuery is String ? BSTR.Alloc(mediaQuery).Value : mediaQuery

        result := ComCall(8, this, BSTR, mediaQuery, VARIANT_BOOL.Ptr, &matches := 0, "HRESULT")
        return matches
    }

    Query(iid) {
        if (IHTMLStyleMedia.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_type := CallbackCreate(GetMethod(implObj, "get_type"), flags, 2)
        this.vtbl.matchMedium := CallbackCreate(GetMethod(implObj, "matchMedium"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_type)
        CallbackFree(this.vtbl.matchMedium)
    }
}
