#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\ITemplatePrinter2.ahk" { ITemplatePrinter2 }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ITemplatePrinter3 extends ITemplatePrinter2 {
    /**
     * The interface identifier for ITemplatePrinter3
     * @type {Guid}
     */
    static IID := Guid("{305104a3-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITemplatePrinter3 interfaces
    */
    struct Vtbl extends ITemplatePrinter2.Vtbl {
        put_headerFooterFont         : IntPtr
        get_headerFooterFont         : IntPtr
        getPageMarginTop             : IntPtr
        getPageMarginRight           : IntPtr
        getPageMarginBottom          : IntPtr
        getPageMarginLeft            : IntPtr
        getPageMarginTopImportant    : IntPtr
        getPageMarginRightImportant  : IntPtr
        getPageMarginBottomImportant : IntPtr
        getPageMarginLeftImportant   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITemplatePrinter3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    headerFooterFont {
        get => this.get_headerFooterFont()
        set => this.put_headerFooterFont(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_headerFooterFont(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(71, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_headerFooterFont() {
        p := BSTR.Owned()
        result := ComCall(72, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {IDispatch} pageRule 
     * @param {Integer} pageWidth 
     * @param {Integer} pageHeight 
     * @returns {VARIANT} 
     */
    getPageMarginTop(pageRule, pageWidth, pageHeight) {
        pMargin := VARIANT()
        result := ComCall(73, this, "ptr", pageRule, "int", pageWidth, "int", pageHeight, VARIANT.Ptr, pMargin, "HRESULT")
        return pMargin
    }

    /**
     * 
     * @param {IDispatch} pageRule 
     * @param {Integer} pageWidth 
     * @param {Integer} pageHeight 
     * @returns {VARIANT} 
     */
    getPageMarginRight(pageRule, pageWidth, pageHeight) {
        pMargin := VARIANT()
        result := ComCall(74, this, "ptr", pageRule, "int", pageWidth, "int", pageHeight, VARIANT.Ptr, pMargin, "HRESULT")
        return pMargin
    }

    /**
     * 
     * @param {IDispatch} pageRule 
     * @param {Integer} pageWidth 
     * @param {Integer} pageHeight 
     * @returns {VARIANT} 
     */
    getPageMarginBottom(pageRule, pageWidth, pageHeight) {
        pMargin := VARIANT()
        result := ComCall(75, this, "ptr", pageRule, "int", pageWidth, "int", pageHeight, VARIANT.Ptr, pMargin, "HRESULT")
        return pMargin
    }

    /**
     * 
     * @param {IDispatch} pageRule 
     * @param {Integer} pageWidth 
     * @param {Integer} pageHeight 
     * @returns {VARIANT} 
     */
    getPageMarginLeft(pageRule, pageWidth, pageHeight) {
        pMargin := VARIANT()
        result := ComCall(76, this, "ptr", pageRule, "int", pageWidth, "int", pageHeight, VARIANT.Ptr, pMargin, "HRESULT")
        return pMargin
    }

    /**
     * 
     * @param {IDispatch} pageRule 
     * @returns {VARIANT_BOOL} 
     */
    getPageMarginTopImportant(pageRule) {
        result := ComCall(77, this, "ptr", pageRule, VARIANT_BOOL.Ptr, &pbImportant := 0, "HRESULT")
        return pbImportant
    }

    /**
     * 
     * @param {IDispatch} pageRule 
     * @returns {VARIANT_BOOL} 
     */
    getPageMarginRightImportant(pageRule) {
        result := ComCall(78, this, "ptr", pageRule, VARIANT_BOOL.Ptr, &pbImportant := 0, "HRESULT")
        return pbImportant
    }

    /**
     * 
     * @param {IDispatch} pageRule 
     * @returns {VARIANT_BOOL} 
     */
    getPageMarginBottomImportant(pageRule) {
        result := ComCall(79, this, "ptr", pageRule, VARIANT_BOOL.Ptr, &pbImportant := 0, "HRESULT")
        return pbImportant
    }

    /**
     * 
     * @param {IDispatch} pageRule 
     * @returns {VARIANT_BOOL} 
     */
    getPageMarginLeftImportant(pageRule) {
        result := ComCall(80, this, "ptr", pageRule, VARIANT_BOOL.Ptr, &pbImportant := 0, "HRESULT")
        return pbImportant
    }

    Query(iid) {
        if (ITemplatePrinter3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_headerFooterFont := CallbackCreate(GetMethod(implObj, "put_headerFooterFont"), flags, 2)
        this.vtbl.get_headerFooterFont := CallbackCreate(GetMethod(implObj, "get_headerFooterFont"), flags, 2)
        this.vtbl.getPageMarginTop := CallbackCreate(GetMethod(implObj, "getPageMarginTop"), flags, 5)
        this.vtbl.getPageMarginRight := CallbackCreate(GetMethod(implObj, "getPageMarginRight"), flags, 5)
        this.vtbl.getPageMarginBottom := CallbackCreate(GetMethod(implObj, "getPageMarginBottom"), flags, 5)
        this.vtbl.getPageMarginLeft := CallbackCreate(GetMethod(implObj, "getPageMarginLeft"), flags, 5)
        this.vtbl.getPageMarginTopImportant := CallbackCreate(GetMethod(implObj, "getPageMarginTopImportant"), flags, 3)
        this.vtbl.getPageMarginRightImportant := CallbackCreate(GetMethod(implObj, "getPageMarginRightImportant"), flags, 3)
        this.vtbl.getPageMarginBottomImportant := CallbackCreate(GetMethod(implObj, "getPageMarginBottomImportant"), flags, 3)
        this.vtbl.getPageMarginLeftImportant := CallbackCreate(GetMethod(implObj, "getPageMarginLeftImportant"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_headerFooterFont)
        CallbackFree(this.vtbl.get_headerFooterFont)
        CallbackFree(this.vtbl.getPageMarginTop)
        CallbackFree(this.vtbl.getPageMarginRight)
        CallbackFree(this.vtbl.getPageMarginBottom)
        CallbackFree(this.vtbl.getPageMarginLeft)
        CallbackFree(this.vtbl.getPageMarginTopImportant)
        CallbackFree(this.vtbl.getPageMarginRightImportant)
        CallbackFree(this.vtbl.getPageMarginBottomImportant)
        CallbackFree(this.vtbl.getPageMarginLeftImportant)
    }
}
