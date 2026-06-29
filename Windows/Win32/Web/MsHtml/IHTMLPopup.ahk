#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IHTMLDocument.ahk" { IHTMLDocument }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLPopup extends IDispatch {
    /**
     * The interface identifier for IHTMLPopup
     * @type {Guid}
     */
    static IID := Guid("{3050f666-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLPopup
     * @type {Guid}
     */
    static CLSID := Guid("{3050f667-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLPopup interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        show         : IntPtr
        hide         : IntPtr
        get_document : IntPtr
        get_isOpen   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLPopup.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IHTMLDocument} 
     */
    document {
        get => this.get_document()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    isOpen {
        get => this.get_isOpen()
    }

    /**
     * Shows the timeout values of the service (in seconds).
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} w 
     * @param {Integer} h 
     * @param {Pointer<VARIANT>} pElement 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Http/show-timeout
     */
    show(x, y, w, h, pElement) {
        result := ComCall(7, this, "int", x, "int", y, "int", w, "int", h, VARIANT.Ptr, pElement, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    hide() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IHTMLDocument} 
     */
    get_document() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDocument(p)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_isOpen() {
        result := ComCall(10, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLPopup.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.show := CallbackCreate(GetMethod(implObj, "show"), flags, 6)
        this.vtbl.hide := CallbackCreate(GetMethod(implObj, "hide"), flags, 1)
        this.vtbl.get_document := CallbackCreate(GetMethod(implObj, "get_document"), flags, 2)
        this.vtbl.get_isOpen := CallbackCreate(GetMethod(implObj, "get_isOpen"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.show)
        CallbackFree(this.vtbl.hide)
        CallbackFree(this.vtbl.get_document)
        CallbackFree(this.vtbl.get_isOpen)
    }
}
