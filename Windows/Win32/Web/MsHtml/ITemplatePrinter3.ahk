#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_headerFooterFont(p) {
        result := ComCall(72, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} pageRule 
     * @param {Integer} pageWidth 
     * @param {Integer} pageHeight 
     * @param {Pointer<VARIANT>} pMargin 
     * @returns {HRESULT} 
     */
    getPageMarginTop(pageRule, pageWidth, pageHeight, pMargin) {
        result := ComCall(73, this, "ptr", pageRule, "int", pageWidth, "int", pageHeight, "ptr", pMargin, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} pageRule 
     * @param {Integer} pageWidth 
     * @param {Integer} pageHeight 
     * @param {Pointer<VARIANT>} pMargin 
     * @returns {HRESULT} 
     */
    getPageMarginRight(pageRule, pageWidth, pageHeight, pMargin) {
        result := ComCall(74, this, "ptr", pageRule, "int", pageWidth, "int", pageHeight, "ptr", pMargin, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} pageRule 
     * @param {Integer} pageWidth 
     * @param {Integer} pageHeight 
     * @param {Pointer<VARIANT>} pMargin 
     * @returns {HRESULT} 
     */
    getPageMarginBottom(pageRule, pageWidth, pageHeight, pMargin) {
        result := ComCall(75, this, "ptr", pageRule, "int", pageWidth, "int", pageHeight, "ptr", pMargin, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} pageRule 
     * @param {Integer} pageWidth 
     * @param {Integer} pageHeight 
     * @param {Pointer<VARIANT>} pMargin 
     * @returns {HRESULT} 
     */
    getPageMarginLeft(pageRule, pageWidth, pageHeight, pMargin) {
        result := ComCall(76, this, "ptr", pageRule, "int", pageWidth, "int", pageHeight, "ptr", pMargin, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} pageRule 
     * @param {Pointer<VARIANT_BOOL>} pbImportant 
     * @returns {HRESULT} 
     */
    getPageMarginTopImportant(pageRule, pbImportant) {
        result := ComCall(77, this, "ptr", pageRule, "ptr", pbImportant, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} pageRule 
     * @param {Pointer<VARIANT_BOOL>} pbImportant 
     * @returns {HRESULT} 
     */
    getPageMarginRightImportant(pageRule, pbImportant) {
        result := ComCall(78, this, "ptr", pageRule, "ptr", pbImportant, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} pageRule 
     * @param {Pointer<VARIANT_BOOL>} pbImportant 
     * @returns {HRESULT} 
     */
    getPageMarginBottomImportant(pageRule, pbImportant) {
        result := ComCall(79, this, "ptr", pageRule, "ptr", pbImportant, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} pageRule 
     * @param {Pointer<VARIANT_BOOL>} pbImportant 
     * @returns {HRESULT} 
     */
    getPageMarginLeftImportant(pageRule, pbImportant) {
        result := ComCall(80, this, "ptr", pageRule, "ptr", pbImportant, "HRESULT")
        return result
    }
}
