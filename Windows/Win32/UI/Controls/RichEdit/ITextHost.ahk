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

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TxGetDC", "TxReleaseDC", "TxShowScrollBar", "TxEnableScrollBar", "TxSetScrollRange", "TxSetScrollPos", "TxInvalidateRect", "TxViewChange", "TxCreateCaret", "TxShowCaret", "TxSetCaretPos", "TxSetTimer", "TxKillTimer", "TxScrollWindowEx", "TxSetCapture", "TxSetFocus", "TxSetCursor", "TxScreenToClient", "TxClientToScreen", "TxActivate", "TxDeactivate", "TxGetClientRect", "TxGetViewInset", "TxGetCharFormat", "TxGetParaFormat", "TxGetSysColor", "TxGetBackStyle", "TxGetMaxLength", "TxGetScrollBars", "TxGetPasswordChar", "TxGetAcceleratorPos", "TxGetExtent", "OnTxCharFormatChange", "OnTxParaFormatChange", "TxGetPropertyBits", "TxNotify", "TxImmGetContext", "TxImmReleaseContext", "TxGetSelectionBarWidth"]

    /**
     * 
     * @returns {HDC} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost-txgetdc
     */
    TxGetDC() {
        result := ComCall(3, this, "ptr")
        return result
    }

    /**
     * 
     * @param {HDC} hdc 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost-txreleasedc
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
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost-txshowscrollbar
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
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost-txenablescrollbar
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
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost-txsetscrollrange
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
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost-txsetscrollpos
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
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost-txinvalidaterect
     */
    TxInvalidateRect(prc, fMode) {
        ComCall(9, this, "ptr", prc, "int", fMode)
    }

    /**
     * 
     * @param {BOOL} fUpdate 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost-txviewchange
     */
    TxViewChange(fUpdate) {
        ComCall(10, this, "int", fUpdate)
    }

    /**
     * 
     * @param {HBITMAP} hbmp 
     * @param {Integer} xWidth 
     * @param {Integer} yHeight 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost-txcreatecaret
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
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost-txshowcaret
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
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost-txsetcaretpos
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
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost-txsettimer
     */
    TxSetTimer(idTimer, uTimeout) {
        result := ComCall(14, this, "uint", idTimer, "uint", uTimeout, "int")
        return result
    }

    /**
     * 
     * @param {Integer} idTimer 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost-txkilltimer
     */
    TxKillTimer(idTimer) {
        ComCall(15, this, "uint", idTimer)
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
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost-txscrollwindowex
     */
    TxScrollWindowEx(dx, dy, lprcScroll, lprcClip, hrgnUpdate, lprcUpdate, fuScroll) {
        hrgnUpdate := hrgnUpdate is Win32Handle ? NumGet(hrgnUpdate, "ptr") : hrgnUpdate

        ComCall(16, this, "int", dx, "int", dy, "ptr", lprcScroll, "ptr", lprcClip, "ptr", hrgnUpdate, "ptr", lprcUpdate, "uint", fuScroll)
    }

    /**
     * 
     * @param {BOOL} fCapture 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost-txsetcapture
     */
    TxSetCapture(fCapture) {
        ComCall(17, this, "int", fCapture)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost-txsetfocus
     */
    TxSetFocus() {
        ComCall(18, this)
    }

    /**
     * 
     * @param {HCURSOR} hcur 
     * @param {BOOL} fText 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost-txsetcursor
     */
    TxSetCursor(hcur, fText) {
        hcur := hcur is Win32Handle ? NumGet(hcur, "ptr") : hcur

        ComCall(19, this, "ptr", hcur, "int", fText)
    }

    /**
     * 
     * @param {Pointer<POINT>} lppt 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost-txscreentoclient
     */
    TxScreenToClient(lppt) {
        result := ComCall(20, this, "ptr", lppt, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<POINT>} lppt 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost-txclienttoscreen
     */
    TxClientToScreen(lppt) {
        result := ComCall(21, this, "ptr", lppt, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plOldState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost-txactivate
     */
    TxActivate(plOldState) {
        plOldStateMarshal := plOldState is VarRef ? "int*" : "ptr"

        result := ComCall(22, this, plOldStateMarshal, plOldState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lNewState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost-txdeactivate
     */
    TxDeactivate(lNewState) {
        result := ComCall(23, this, "int", lNewState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost-txgetclientrect
     */
    TxGetClientRect(prc) {
        result := ComCall(24, this, "ptr", prc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost-txgetviewinset
     */
    TxGetViewInset(prc) {
        result := ComCall(25, this, "ptr", prc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<CHARFORMATW>>} ppCF 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost-txgetcharformat
     */
    TxGetCharFormat(ppCF) {
        ppCFMarshal := ppCF is VarRef ? "ptr*" : "ptr"

        result := ComCall(26, this, ppCFMarshal, ppCF, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<PARAFORMAT>>} ppPF 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost-txgetparaformat
     */
    TxGetParaFormat(ppPF) {
        ppPFMarshal := ppPF is VarRef ? "ptr*" : "ptr"

        result := ComCall(27, this, ppPFMarshal, ppPF, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @returns {COLORREF} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost-txgetsyscolor
     */
    TxGetSysColor(nIndex) {
        result := ComCall(28, this, "int", nIndex, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pstyle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost-txgetbackstyle
     */
    TxGetBackStyle(pstyle) {
        pstyleMarshal := pstyle is VarRef ? "int*" : "ptr"

        result := ComCall(29, this, pstyleMarshal, pstyle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost-txgetmaxlength
     */
    TxGetMaxLength(plength) {
        plengthMarshal := plength is VarRef ? "uint*" : "ptr"

        result := ComCall(30, this, plengthMarshal, plength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwScrollBar 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost-txgetscrollbars
     */
    TxGetScrollBars(pdwScrollBar) {
        pdwScrollBarMarshal := pdwScrollBar is VarRef ? "uint*" : "ptr"

        result := ComCall(31, this, pdwScrollBarMarshal, pdwScrollBar, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost-txgetpasswordchar
     */
    TxGetPasswordChar(pch) {
        pchMarshal := pch is VarRef ? "char*" : "ptr"

        result := ComCall(32, this, pchMarshal, pch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost-txgetacceleratorpos
     */
    TxGetAcceleratorPos(pcp) {
        pcpMarshal := pcp is VarRef ? "int*" : "ptr"

        result := ComCall(33, this, pcpMarshal, pcp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SIZE>} lpExtent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost-txgetextent
     */
    TxGetExtent(lpExtent) {
        result := ComCall(34, this, "ptr", lpExtent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<CHARFORMATW>} pCF 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost-ontxcharformatchange
     */
    OnTxCharFormatChange(pCF) {
        result := ComCall(35, this, "ptr", pCF, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PARAFORMAT>} pPF 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost-ontxparaformatchange
     */
    OnTxParaFormatChange(pPF) {
        result := ComCall(36, this, "ptr", pPF, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMask 
     * @param {Pointer<Integer>} pdwBits 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost-txgetpropertybits
     */
    TxGetPropertyBits(dwMask, pdwBits) {
        pdwBitsMarshal := pdwBits is VarRef ? "uint*" : "ptr"

        result := ComCall(37, this, "uint", dwMask, pdwBitsMarshal, pdwBits, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iNotify 
     * @param {Pointer<Void>} pv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost-txnotify
     */
    TxNotify(iNotify, pv) {
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        result := ComCall(38, this, "uint", iNotify, pvMarshal, pv, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HIMC} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost-tximmgetcontext
     */
    TxImmGetContext() {
        result := ComCall(39, this, "ptr")
        return result
    }

    /**
     * 
     * @param {HIMC} himc 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost-tximmreleasecontext
     */
    TxImmReleaseContext(himc) {
        himc := himc is Win32Handle ? NumGet(himc, "ptr") : himc

        ComCall(40, this, "ptr", himc)
    }

    /**
     * 
     * @param {Pointer<Integer>} lSelBarWidth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itexthost-txgetselectionbarwidth
     */
    TxGetSelectionBarWidth(lSelBarWidth) {
        lSelBarWidthMarshal := lSelBarWidth is VarRef ? "int*" : "ptr"

        result := ComCall(41, this, lSelBarWidthMarshal, lSelBarWidth, "HRESULT")
        return result
    }
}
