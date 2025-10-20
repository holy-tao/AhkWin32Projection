#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLElementRender extends IUnknown{
    /**
     * The interface identifier for IHTMLElementRender
     * @type {Guid}
     */
    static IID => Guid("{3050f669-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {HDC} hDC 
     * @returns {HRESULT} 
     */
    DrawToDC(hDC) {
        hDC := hDC is Win32Handle ? NumGet(hDC, "ptr") : hDC

        result := ComCall(3, this, "ptr", hDC, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrPrinterName 
     * @param {HDC} hDC 
     * @returns {HRESULT} 
     */
    SetDocumentPrinter(bstrPrinterName, hDC) {
        bstrPrinterName := bstrPrinterName is String ? BSTR.Alloc(bstrPrinterName).Value : bstrPrinterName
        hDC := hDC is Win32Handle ? NumGet(hDC, "ptr") : hDC

        result := ComCall(4, this, "ptr", bstrPrinterName, "ptr", hDC, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
