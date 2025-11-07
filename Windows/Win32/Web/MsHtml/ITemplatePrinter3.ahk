#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\ITemplatePrinter2.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ITemplatePrinter3 extends ITemplatePrinter2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITemplatePrinter3
     * @type {Guid}
     */
    static IID => Guid("{305104a3-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 71

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_headerFooterFont", "get_headerFooterFont", "getPageMarginTop", "getPageMarginRight", "getPageMarginBottom", "getPageMarginLeft", "getPageMarginTopImportant", "getPageMarginRightImportant", "getPageMarginBottomImportant", "getPageMarginLeftImportant"]

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_headerFooterFont(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(71, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_headerFooterFont() {
        p := BSTR()
        result := ComCall(72, this, "ptr", p, "HRESULT")
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
        result := ComCall(73, this, "ptr", pageRule, "int", pageWidth, "int", pageHeight, "ptr", pMargin, "HRESULT")
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
        result := ComCall(74, this, "ptr", pageRule, "int", pageWidth, "int", pageHeight, "ptr", pMargin, "HRESULT")
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
        result := ComCall(75, this, "ptr", pageRule, "int", pageWidth, "int", pageHeight, "ptr", pMargin, "HRESULT")
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
        result := ComCall(76, this, "ptr", pageRule, "int", pageWidth, "int", pageHeight, "ptr", pMargin, "HRESULT")
        return pMargin
    }

    /**
     * 
     * @param {IDispatch} pageRule 
     * @returns {VARIANT_BOOL} 
     */
    getPageMarginTopImportant(pageRule) {
        result := ComCall(77, this, "ptr", pageRule, "short*", &pbImportant := 0, "HRESULT")
        return pbImportant
    }

    /**
     * 
     * @param {IDispatch} pageRule 
     * @returns {VARIANT_BOOL} 
     */
    getPageMarginRightImportant(pageRule) {
        result := ComCall(78, this, "ptr", pageRule, "short*", &pbImportant := 0, "HRESULT")
        return pbImportant
    }

    /**
     * 
     * @param {IDispatch} pageRule 
     * @returns {VARIANT_BOOL} 
     */
    getPageMarginBottomImportant(pageRule) {
        result := ComCall(79, this, "ptr", pageRule, "short*", &pbImportant := 0, "HRESULT")
        return pbImportant
    }

    /**
     * 
     * @param {IDispatch} pageRule 
     * @returns {VARIANT_BOOL} 
     */
    getPageMarginLeftImportant(pageRule) {
        result := ComCall(80, this, "ptr", pageRule, "short*", &pbImportant := 0, "HRESULT")
        return pbImportant
    }
}
