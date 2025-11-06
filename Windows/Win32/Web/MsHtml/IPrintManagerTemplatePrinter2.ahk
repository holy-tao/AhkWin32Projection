#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPrintManagerTemplatePrinter.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IPrintManagerTemplatePrinter2 extends IPrintManagerTemplatePrinter{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_showHeaderFooter", "get_shrinkToFit", "get_percentScale"]

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_showHeaderFooter() {
        result := ComCall(13, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_shrinkToFit() {
        result := ComCall(14, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Float} 
     */
    get_percentScale() {
        result := ComCall(15, this, "float*", &p := 0, "HRESULT")
        return p
    }
}
