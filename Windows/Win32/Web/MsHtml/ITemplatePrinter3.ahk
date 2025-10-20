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
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_headerFooterFont(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(71, this, "ptr", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_headerFooterFont(p) {
        result := ComCall(72, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} pageRule 
     * @param {Integer} pageWidth 
     * @param {Integer} pageHeight 
     * @param {Pointer<VARIANT>} pMargin 
     * @returns {HRESULT} 
     */
    getPageMarginTop(pageRule, pageWidth, pageHeight, pMargin) {
        result := ComCall(73, this, "ptr", pageRule, "int", pageWidth, "int", pageHeight, "ptr", pMargin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} pageRule 
     * @param {Integer} pageWidth 
     * @param {Integer} pageHeight 
     * @param {Pointer<VARIANT>} pMargin 
     * @returns {HRESULT} 
     */
    getPageMarginRight(pageRule, pageWidth, pageHeight, pMargin) {
        result := ComCall(74, this, "ptr", pageRule, "int", pageWidth, "int", pageHeight, "ptr", pMargin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} pageRule 
     * @param {Integer} pageWidth 
     * @param {Integer} pageHeight 
     * @param {Pointer<VARIANT>} pMargin 
     * @returns {HRESULT} 
     */
    getPageMarginBottom(pageRule, pageWidth, pageHeight, pMargin) {
        result := ComCall(75, this, "ptr", pageRule, "int", pageWidth, "int", pageHeight, "ptr", pMargin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} pageRule 
     * @param {Integer} pageWidth 
     * @param {Integer} pageHeight 
     * @param {Pointer<VARIANT>} pMargin 
     * @returns {HRESULT} 
     */
    getPageMarginLeft(pageRule, pageWidth, pageHeight, pMargin) {
        result := ComCall(76, this, "ptr", pageRule, "int", pageWidth, "int", pageHeight, "ptr", pMargin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} pageRule 
     * @param {Pointer<VARIANT_BOOL>} pbImportant 
     * @returns {HRESULT} 
     */
    getPageMarginTopImportant(pageRule, pbImportant) {
        result := ComCall(77, this, "ptr", pageRule, "ptr", pbImportant, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} pageRule 
     * @param {Pointer<VARIANT_BOOL>} pbImportant 
     * @returns {HRESULT} 
     */
    getPageMarginRightImportant(pageRule, pbImportant) {
        result := ComCall(78, this, "ptr", pageRule, "ptr", pbImportant, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} pageRule 
     * @param {Pointer<VARIANT_BOOL>} pbImportant 
     * @returns {HRESULT} 
     */
    getPageMarginBottomImportant(pageRule, pbImportant) {
        result := ComCall(79, this, "ptr", pageRule, "ptr", pbImportant, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} pageRule 
     * @param {Pointer<VARIANT_BOOL>} pbImportant 
     * @returns {HRESULT} 
     */
    getPageMarginLeftImportant(pageRule, pbImportant) {
        result := ComCall(80, this, "ptr", pageRule, "ptr", pbImportant, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
