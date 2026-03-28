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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DrawToDC", "SetDocumentPrinter"]

    /**
     * 
     * @param {HDC} _hDC 
     * @returns {HRESULT} 
     */
    DrawToDC(_hDC) {
        _hDC := _hDC is Win32Handle ? NumGet(_hDC, "ptr") : _hDC

        result := ComCall(3, this, "ptr", _hDC, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPrinterName 
     * @param {HDC} _hDC 
     * @returns {HRESULT} 
     */
    SetDocumentPrinter(bstrPrinterName, _hDC) {
        bstrPrinterName := bstrPrinterName is String ? BSTR.Alloc(bstrPrinterName).Value : bstrPrinterName
        _hDC := _hDC is Win32Handle ? NumGet(_hDC, "ptr") : _hDC

        result := ComCall(4, this, "ptr", bstrPrinterName, "ptr", _hDC, "HRESULT")
        return result
    }
}
