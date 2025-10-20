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

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 42

    /**
     * 
     * @returns {BOOL} 
     */
    TxIsDoubleClickPending() {
        result := ComCall(42, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} phwnd 
     * @returns {HRESULT} 
     */
    TxGetWindow(phwnd) {
        result := ComCall(43, this, "ptr", phwnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    TxSetForegroundWindow() {
        result := ComCall(44, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HPALETTE} 
     */
    TxGetPalette() {
        result := ComCall(45, this, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pFlags 
     * @returns {HRESULT} 
     */
    TxGetEastAsianFlags(pFlags) {
        result := ComCall(46, this, "int*", pFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HCURSOR} hcur 
     * @param {BOOL} bText 
     * @returns {HCURSOR} 
     */
    TxSetCursor2(hcur, bText) {
        hcur := hcur is Win32Handle ? NumGet(hcur, "ptr") : hcur

        result := ComCall(47, this, "ptr", hcur, "int", bText, "ptr")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    TxFreeTextServicesNotification() {
        ComCall(48, this)
        return result
    }

    /**
     * 
     * @param {Integer} dwItem 
     * @param {Pointer<UInt32>} pdwData 
     * @returns {HRESULT} 
     */
    TxGetEditStyle(dwItem, pdwData) {
        result := ComCall(49, this, "uint", dwItem, "uint*", pdwData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwStyle 
     * @param {Pointer<UInt32>} pdwExStyle 
     * @returns {HRESULT} 
     */
    TxGetWindowStyles(pdwStyle, pdwExStyle) {
        result := ComCall(50, this, "uint*", pdwStyle, "uint*", pdwExStyle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fShow 
     * @param {HDC} hdc 
     * @param {Pointer<RECT>} prc 
     * @returns {HRESULT} 
     */
    TxShowDropCaret(fShow, hdc, prc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := ComCall(51, this, "int", fShow, "ptr", hdc, "ptr", prc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    TxDestroyCaret() {
        result := ComCall(52, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plHorzExtent 
     * @returns {HRESULT} 
     */
    TxGetHorzExtent(plHorzExtent) {
        result := ComCall(53, this, "int*", plHorzExtent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
