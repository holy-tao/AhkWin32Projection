#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPrintOemUI.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintOemUI2 extends IPrintOemUI{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintOemUI2
     * @type {Guid}
     */
    static IID => Guid("{292515f9-b54b-489b-9275-bab56821395e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryJobAttributes", "HideStandardUI", "DocumentEvent"]

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Pointer<DEVMODEA>} pDevmode 
     * @param {Integer} dwLevel 
     * @param {Pointer<Integer>} lpAttributeInfo 
     * @returns {HRESULT} 
     */
    QueryJobAttributes(hPrinter, pDevmode, dwLevel, lpAttributeInfo) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := ComCall(17, this, "ptr", hPrinter, "ptr", pDevmode, "uint", dwLevel, "char*", lpAttributeInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMode 
     * @returns {HRESULT} 
     */
    HideStandardUI(dwMode) {
        result := ComCall(18, this, "uint", dwMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {HDC} hdc 
     * @param {Integer} iEsc 
     * @param {Integer} cbIn 
     * @param {Pointer<Void>} pvIn 
     * @param {Integer} cbOut 
     * @param {Pointer<Void>} pvOut 
     * @param {Pointer<Integer>} piResult 
     * @returns {HRESULT} 
     */
    DocumentEvent(hPrinter, hdc, iEsc, cbIn, pvIn, cbOut, pvOut, piResult) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := ComCall(19, this, "ptr", hPrinter, "ptr", hdc, "int", iEsc, "uint", cbIn, "ptr", pvIn, "uint", cbOut, "ptr", pvOut, "int*", piResult, "HRESULT")
        return result
    }
}
