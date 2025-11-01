#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Graphics\Gdi\HPALETTE.ahk
#Include ..\..\WindowsAndMessaging\HCURSOR.ahk
#Include .\ITextHost.ahk

/**
 * The ITextHost2 interface extends the ITextHost interface.
 * @see https://docs.microsoft.com/windows/win32/api//textserv/nl-textserv-itexthost2
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class ITextHost2 extends ITextHost{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 42

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TxIsDoubleClickPending", "TxGetWindow", "TxSetForegroundWindow", "TxGetPalette", "TxGetEastAsianFlags", "TxSetCursor2", "TxFreeTextServicesNotification", "TxGetEditStyle", "TxGetWindowStyles", "TxShowDropCaret", "TxDestroyCaret", "TxGetHorzExtent"]

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost2-txisdoubleclickpending
     */
    TxIsDoubleClickPending() {
        result := ComCall(42, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} phwnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost2-txgetwindow
     */
    TxGetWindow(phwnd) {
        result := ComCall(43, this, "ptr", phwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost2-txsetforegroundwindow
     */
    TxSetForegroundWindow() {
        result := ComCall(44, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HPALETTE} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost2-txgetpalette
     */
    TxGetPalette() {
        result := ComCall(45, this, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost2-txgeteastasianflags
     */
    TxGetEastAsianFlags(pFlags) {
        pFlagsMarshal := pFlags is VarRef ? "int*" : "ptr"

        result := ComCall(46, this, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HCURSOR} hcur 
     * @param {BOOL} bText 
     * @returns {HCURSOR} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost2-txsetcursor2
     */
    TxSetCursor2(hcur, bText) {
        hcur := hcur is Win32Handle ? NumGet(hcur, "ptr") : hcur

        result := ComCall(47, this, "ptr", hcur, "int", bText, "ptr")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost2-txfreetextservicesnotification
     */
    TxFreeTextServicesNotification() {
        ComCall(48, this)
    }

    /**
     * 
     * @param {Integer} dwItem 
     * @param {Pointer<Integer>} pdwData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost2-txgeteditstyle
     */
    TxGetEditStyle(dwItem, pdwData) {
        pdwDataMarshal := pdwData is VarRef ? "uint*" : "ptr"

        result := ComCall(49, this, "uint", dwItem, pdwDataMarshal, pdwData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwStyle 
     * @param {Pointer<Integer>} pdwExStyle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost2-txgetwindowstyles
     */
    TxGetWindowStyles(pdwStyle, pdwExStyle) {
        pdwStyleMarshal := pdwStyle is VarRef ? "uint*" : "ptr"
        pdwExStyleMarshal := pdwExStyle is VarRef ? "uint*" : "ptr"

        result := ComCall(50, this, pdwStyleMarshal, pdwStyle, pdwExStyleMarshal, pdwExStyle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fShow 
     * @param {HDC} hdc 
     * @param {Pointer<RECT>} prc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost2-txshowdropcaret
     */
    TxShowDropCaret(fShow, hdc, prc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := ComCall(51, this, "int", fShow, "ptr", hdc, "ptr", prc, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost2-txdestroycaret
     */
    TxDestroyCaret() {
        result := ComCall(52, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plHorzExtent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost2-txgethorzextent
     */
    TxGetHorzExtent(plHorzExtent) {
        plHorzExtentMarshal := plHorzExtent is VarRef ? "int*" : "ptr"

        result := ComCall(53, this, plHorzExtentMarshal, plHorzExtent, "HRESULT")
        return result
    }
}
