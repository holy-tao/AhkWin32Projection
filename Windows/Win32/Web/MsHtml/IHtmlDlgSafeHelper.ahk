#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHtmlDlgSafeHelper extends IDispatch {
    /**
     * The interface identifier for IHtmlDlgSafeHelper
     * @type {Guid}
     */
    static IID := Guid("{3050f81a-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HtmlDlgSafeHelper
     * @type {Guid}
     */
    static CLSID := Guid("{3050f819-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHtmlDlgSafeHelper interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        choosecolordlg   : IntPtr
        getCharset       : IntPtr
        get_Fonts        : IntPtr
        get_BlockFormats : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHtmlDlgSafeHelper.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IDispatch} 
     */
    Fonts {
        get => this.get_Fonts()
    }

    /**
     * @type {IDispatch} 
     */
    BlockFormats {
        get => this.get_BlockFormats()
    }

    /**
     * 
     * @param {VARIANT} initColor 
     * @returns {VARIANT} 
     */
    choosecolordlg(initColor) {
        _rgbColor := VARIANT()
        result := ComCall(7, this, VARIANT, initColor, VARIANT.Ptr, _rgbColor, "HRESULT")
        return _rgbColor
    }

    /**
     * 
     * @param {BSTR} fontName 
     * @returns {VARIANT} 
     */
    getCharset(fontName) {
        fontName := fontName is String ? BSTR.Alloc(fontName).Value : fontName

        charset := VARIANT()
        result := ComCall(8, this, BSTR, fontName, VARIANT.Ptr, charset, "HRESULT")
        return charset
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Fonts() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_BlockFormats() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    Query(iid) {
        if (IHtmlDlgSafeHelper.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.choosecolordlg := CallbackCreate(GetMethod(implObj, "choosecolordlg"), flags, 3)
        this.vtbl.getCharset := CallbackCreate(GetMethod(implObj, "getCharset"), flags, 3)
        this.vtbl.get_Fonts := CallbackCreate(GetMethod(implObj, "get_Fonts"), flags, 2)
        this.vtbl.get_BlockFormats := CallbackCreate(GetMethod(implObj, "get_BlockFormats"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.choosecolordlg)
        CallbackFree(this.vtbl.getCharset)
        CallbackFree(this.vtbl.get_Fonts)
        CallbackFree(this.vtbl.get_BlockFormats)
    }
}
