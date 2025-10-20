#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPrintManagerTemplatePrinter.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IPrintManagerTemplatePrinter2 extends IPrintManagerTemplatePrinter{
    /**
     * The interface identifier for IPrintManagerTemplatePrinter2
     * @type {Guid}
     */
    static IID => Guid("{c6403497-7493-4f09-8016-54b03e9bda69}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_showHeaderFooter(p) {
        result := ComCall(13, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_shrinkToFit(p) {
        result := ComCall(14, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} p 
     * @returns {HRESULT} 
     */
    get_percentScale(p) {
        result := ComCall(15, this, "float*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
