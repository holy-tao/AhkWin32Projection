#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Graphics\Gdi\HDC.ahk
#Include ..\..\Input\Ime\HIMC.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The ITextHost interface is used by a text services object to obtain text host services.
 * @remarks
 * 
  * You must implement the <b>ITextHost</b> interface before you call the <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-createtextservices">CreateTextServices</a> function.
  * 
  * Applications do not call the <b>ITextHost</b> methods. A text services object created by the <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-createtextservices">CreateTextServices</a> function calls the interface methods.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//textserv/nl-textserv-itexthost
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class ITextHost extends IUnknown{

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HDC} 
     */
    TxGetDC() {
        result := ComCall(3, this, "ptr")
        return result
    }

    /**
     * 
     * @param {HDC} hdc 
     * @returns {Integer} 
     */
    TxReleaseDC(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := ComCall(4, this, "ptr", hdc, "int")
        return result
    }

    /**
     * 
     * @param {Integer} fnBar 
     * @param {BOOL} fShow 
     * @returns {BOOL} 
     */
    TxShowScrollBar(fnBar, fShow) {
        result := ComCall(5, this, "int", fnBar, "int", fShow, "int")
        return result
    }

    /**
     * 
     * @param {Integer} fuSBFlags 
     * @param {Integer} fuArrowflags 
     * @returns {BOOL} 
     */
    TxEnableScrollBar(fuSBFlags, fuArrowflags) {
        result := ComCall(6, this, "int", fuSBFlags, "int", fuArrowflags, "int")
        return result
    }

    /**
     * 
     * @param {Integer} fnBar 
     * @param {Integer} nMinPos 
     * @param {Integer} nMaxPos 
     * @param {BOOL} fRedraw 
     * @returns {BOOL} 
     */
    TxSetScrollRange(fnBar, nMinPos, nMaxPos, fRedraw) {
        result := ComCall(7, this, "int", fnBar, "int", nMinPos, "int", nMaxPos, "int", fRedraw, "int")
        return result
    }

    /**
     * 
     * @param {Integer} fnBar 
     * @param {Integer} nPos 
     * @param {BOOL} fRedraw 
     * @returns {BOOL} 
     */
    TxSetScrollPos(fnBar, nPos, fRedraw) {
        result := ComCall(8, this, "int", fnBar, "int", nPos, "int", fRedraw, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prc 
     * @param {BOOL} fMode 
     * @returns {String} Nothing - always returns an empty string
     */
    TxInvalidateRect(prc, fMode) {
        ComCall(9, this, "ptr", prc, "int", fMode)
        return result
    }

    /**
     * 
     * @param {BOOL} fUpdate 
     * @returns {String} Nothing - always returns an empty string
     */
    TxViewChange(fUpdate) {
        ComCall(10, this, "int", fUpdate)
        return result
    }

    /**
     * 
     * @param {HBITMAP} hbmp 
     * @param {Integer} xWidth 
     * @param {Integer} yHeight 
     * @returns {BOOL} 
     */
    TxCreateCaret(hbmp, xWidth, yHeight) {
        hbmp := hbmp is Win32Handle ? NumGet(hbmp, "ptr") : hbmp

        result := ComCall(11, this, "ptr", hbmp, "int", xWidth, "int", yHeight, "int")
        return result
    }

    /**
     * 
     * @param {BOOL} fShow 
     * @returns {BOOL} 
     */
    TxShowCaret(fShow) {
        result := ComCall(12, this, "int", fShow, "int")
        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {BOOL} 
     */
    TxSetCaretPos(x, y) {
        result := ComCall(13, this, "int", x, "int", y, "int")
        return result
    }

    /**
     * 
     * @param {Integer} idTimer 
     * @param {Integer} uTimeout 
     * @returns {BOOL} 
     */
    TxSetTimer(idTimer, uTimeout) {
        result := ComCall(14, this, "uint", idTimer, "uint", uTimeout, "int")
        return result
    }

    /**
     * 
     * @param {Integer} idTimer 
     * @returns {String} Nothing - always returns an empty string
     */
    TxKillTimer(idTimer) {
        ComCall(15, this, "uint", idTimer)
        return result
    }

    /**
     * 
     * @param {Integer} dx 
     * @param {Integer} dy 
     * @param {Pointer<RECT>} lprcScroll 
     * @param {Pointer<RECT>} lprcClip 
     * @param {HRGN} hrgnUpdate 
     * @param {Pointer<RECT>} lprcUpdate 
     * @param {Integer} fuScroll 
     * @returns {String} Nothing - always returns an empty string
     */
    TxScrollWindowEx(dx, dy, lprcScroll, lprcClip, hrgnUpdate, lprcUpdate, fuScroll) {
        hrgnUpdate := hrgnUpdate is Win32Handle ? NumGet(hrgnUpdate, "ptr") : hrgnUpdate

        ComCall(16, this, "int", dx, "int", dy, "ptr", lprcScroll, "ptr", lprcClip, "ptr", hrgnUpdate, "ptr", lprcUpdate, "uint", fuScroll)
        return result
    }

    /**
     * 
     * @param {BOOL} fCapture 
     * @returns {String} Nothing - always returns an empty string
     */
    TxSetCapture(fCapture) {
        ComCall(17, this, "int", fCapture)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    TxSetFocus() {
        ComCall(18, this)
        return result
    }

    /**
     * 
     * @param {HCURSOR} hcur 
     * @param {BOOL} fText 
     * @returns {String} Nothing - always returns an empty string
     */
    TxSetCursor(hcur, fText) {
        hcur := hcur is Win32Handle ? NumGet(hcur, "ptr") : hcur

        ComCall(19, this, "ptr", hcur, "int", fText)
        return result
    }

    /**
     * 
     * @param {Pointer<POINT>} lppt 
     * @returns {BOOL} 
     */
    TxScreenToClient(lppt) {
        result := ComCall(20, this, "ptr", lppt, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<POINT>} lppt 
     * @returns {BOOL} 
     */
    TxClientToScreen(lppt) {
        result := ComCall(21, this, "ptr", lppt, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plOldState 
     * @returns {HRESULT} 
     */
    TxActivate(plOldState) {
        result := ComCall(22, this, "int*", plOldState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lNewState 
     * @returns {HRESULT} 
     */
    TxDeactivate(lNewState) {
        result := ComCall(23, this, "int", lNewState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prc 
     * @returns {HRESULT} 
     */
    TxGetClientRect(prc) {
        result := ComCall(24, this, "ptr", prc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prc 
     * @returns {HRESULT} 
     */
    TxGetViewInset(prc) {
        result := ComCall(25, this, "ptr", prc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<CHARFORMATW>} ppCF 
     * @returns {HRESULT} 
     */
    TxGetCharFormat(ppCF) {
        result := ComCall(26, this, "ptr", ppCF, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PARAFORMAT>} ppPF 
     * @returns {HRESULT} 
     */
    TxGetParaFormat(ppPF) {
        result := ComCall(27, this, "ptr", ppPF, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @returns {COLORREF} 
     */
    TxGetSysColor(nIndex) {
        result := ComCall(28, this, "int", nIndex, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pstyle 
     * @returns {HRESULT} 
     */
    TxGetBackStyle(pstyle) {
        result := ComCall(29, this, "int*", pstyle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} plength 
     * @returns {HRESULT} 
     */
    TxGetMaxLength(plength) {
        result := ComCall(30, this, "uint*", plength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwScrollBar 
     * @returns {HRESULT} 
     */
    TxGetScrollBars(pdwScrollBar) {
        result := ComCall(31, this, "uint*", pdwScrollBar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SByte>} pch 
     * @returns {HRESULT} 
     */
    TxGetPasswordChar(pch) {
        result := ComCall(32, this, "char*", pch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pcp 
     * @returns {HRESULT} 
     */
    TxGetAcceleratorPos(pcp) {
        result := ComCall(33, this, "int*", pcp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SIZE>} lpExtent 
     * @returns {HRESULT} 
     */
    TxGetExtent(lpExtent) {
        result := ComCall(34, this, "ptr", lpExtent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<CHARFORMATW>} pCF 
     * @returns {HRESULT} 
     */
    OnTxCharFormatChange(pCF) {
        result := ComCall(35, this, "ptr", pCF, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PARAFORMAT>} pPF 
     * @returns {HRESULT} 
     */
    OnTxParaFormatChange(pPF) {
        result := ComCall(36, this, "ptr", pPF, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwMask 
     * @param {Pointer<UInt32>} pdwBits 
     * @returns {HRESULT} 
     */
    TxGetPropertyBits(dwMask, pdwBits) {
        result := ComCall(37, this, "uint", dwMask, "uint*", pdwBits, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iNotify 
     * @param {Pointer<Void>} pv 
     * @returns {HRESULT} 
     */
    TxNotify(iNotify, pv) {
        result := ComCall(38, this, "uint", iNotify, "ptr", pv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HIMC} 
     */
    TxImmGetContext() {
        result := ComCall(39, this, "ptr")
        return result
    }

    /**
     * 
     * @param {HIMC} himc 
     * @returns {String} Nothing - always returns an empty string
     */
    TxImmReleaseContext(himc) {
        himc := himc is Win32Handle ? NumGet(himc, "ptr") : himc

        ComCall(40, this, "ptr", himc)
        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} lSelBarWidth 
     * @returns {HRESULT} 
     */
    TxGetSelectionBarWidth(lSelBarWidth) {
        result := ComCall(41, this, "int*", lSelBarWidth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
