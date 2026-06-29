#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IHTMLStyleSheet.ahk" { IHTMLStyleSheet }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLCSSImportRule extends IDispatch {
    /**
     * The interface identifier for IHTMLCSSImportRule
     * @type {Guid}
     */
    static IID := Guid("{305106ea-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLCSSImportRule
     * @type {Guid}
     */
    static CLSID := Guid("{305106f0-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLCSSImportRule interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_href       : IntPtr
        put_media      : IntPtr
        get_media      : IntPtr
        get_styleSheet : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLCSSImportRule.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    href {
        get => this.get_href()
    }

    /**
     * @type {VARIANT} 
     */
    media {
        get => this.get_media()
        set => this.put_media(value)
    }

    /**
     * @type {IHTMLStyleSheet} 
     */
    styleSheet {
        get => this.get_styleSheet()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_href() {
        p := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_media(v) {
        result := ComCall(8, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_media() {
        p := VARIANT()
        result := ComCall(9, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLStyleSheet} 
     */
    get_styleSheet() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLStyleSheet(p)
    }

    Query(iid) {
        if (IHTMLCSSImportRule.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_href := CallbackCreate(GetMethod(implObj, "get_href"), flags, 2)
        this.vtbl.put_media := CallbackCreate(GetMethod(implObj, "put_media"), flags, 2)
        this.vtbl.get_media := CallbackCreate(GetMethod(implObj, "get_media"), flags, 2)
        this.vtbl.get_styleSheet := CallbackCreate(GetMethod(implObj, "get_styleSheet"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_href)
        CallbackFree(this.vtbl.put_media)
        CallbackFree(this.vtbl.get_media)
        CallbackFree(this.vtbl.get_styleSheet)
    }
}
