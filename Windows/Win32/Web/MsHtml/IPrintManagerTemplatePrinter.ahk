#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IPrintManagerTemplatePrinter extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintManagerTemplatePrinter
     * @type {Guid}
     */
    static IID => Guid("{f633be14-9eff-4c4d-929e-05717b21b3e6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["startPrint", "drawPreviewPage", "setPageCount", "invalidatePreview", "getPrintTaskOptionValue", "endPrint"]

    /**
     * 
     * @returns {HRESULT} 
     */
    startPrint() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} pElemDisp 
     * @param {Integer} nPage 
     * @returns {HRESULT} 
     */
    drawPreviewPage(pElemDisp, nPage) {
        result := ComCall(8, this, "ptr", pElemDisp, "int", nPage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nPage 
     * @returns {HRESULT} 
     */
    setPageCount(nPage) {
        result := ComCall(9, this, "int", nPage, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    invalidatePreview() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrKey 
     * @returns {VARIANT} 
     */
    getPrintTaskOptionValue(bstrKey) {
        bstrKey := bstrKey is String ? BSTR.Alloc(bstrKey).Value : bstrKey

        pvarin := VARIANT()
        result := ComCall(11, this, "ptr", bstrKey, "ptr", pvarin, "HRESULT")
        return pvarin
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    endPrint() {
        result := ComCall(12, this, "HRESULT")
        return result
    }
}
