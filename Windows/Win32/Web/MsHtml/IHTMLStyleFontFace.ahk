#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLStyleFontFace extends IDispatch {
    /**
     * The interface identifier for IHTMLStyleFontFace
     * @type {Guid}
     */
    static IID := Guid("{3050f3d5-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLStyleFontFace
     * @type {Guid}
     */
    static CLSID := Guid("{3050f3d4-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLStyleFontFace interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_fontsrc : IntPtr
        get_fontsrc : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLStyleFontFace.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    fontsrc {
        get => this.get_fontsrc()
        set => this.put_fontsrc(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_fontsrc(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fontsrc() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLStyleFontFace.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_fontsrc := CallbackCreate(GetMethod(implObj, "put_fontsrc"), flags, 2)
        this.vtbl.get_fontsrc := CallbackCreate(GetMethod(implObj, "get_fontsrc"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_fontsrc)
        CallbackFree(this.vtbl.get_fontsrc)
    }
}
