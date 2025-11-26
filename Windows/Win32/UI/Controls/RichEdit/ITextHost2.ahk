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
     * Discovers whether the message queue contains a WM_LBUTTONDBLCLK message that is pending for the text host window.
     * @returns {BOOL} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Returns <b>TRUE</b> if a <a href="/windows/desktop/inputdev/wm-lbuttondblclk">WM_LBUTTONDBLCLK</a> message is pending, or <b>FALSE</b> if not.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost2-txisdoubleclickpending
     */
    TxIsDoubleClickPending() {
        result := ComCall(42, this, "int")
        return result
    }

    /**
     * Retrieves the handle of the text host window for the rich edit control.
     * @param {Pointer<HWND>} phwnd Type: <b>HWND*</b>
     * 
     * The handle of the text host window.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost2-txgetwindow
     */
    TxGetWindow(phwnd) {
        result := ComCall(43, this, "ptr", phwnd, "HRESULT")
        return result
    }

    /**
     * Sets the rich edit control's host window as the foreground window.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost2-txsetforegroundwindow
     */
    TxSetForegroundWindow() {
        result := ComCall(44, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the color palette of the rich edit control.
     * @returns {HPALETTE} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HPALETTE</a></b>
     * 
     * Returns the color palette, or <b>NULL</b> if the control uses the system default color palette.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost2-txgetpalette
     */
    TxGetPalette() {
        result := ComCall(45, this, "ptr")
        return HPALETTE({Value: result}, True)
    }

    /**
     * Gets whether Input Method Editor (IME) input is allowed and whether the edit styles include ES_SELFIME.
     * @param {Pointer<Integer>} pFlags Type: <b>LONG*</b>
     * 
     * The East Asian flags. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ES_NOIME"></a><a id="es_noime"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/Controls/rich-edit-control-styles">ES_NOIME</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IME input is suppressed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ES_SELFIME"></a><a id="es_selfime"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/Controls/rich-edit-control-styles">ES_SELFIME</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The rich edit client handles IME imput.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost2-txgeteastasianflags
     */
    TxGetEastAsianFlags(pFlags) {
        pFlagsMarshal := pFlags is VarRef ? "int*" : "ptr"

        result := ComCall(46, this, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }

    /**
     * Sets the shape of the cursor in the text host window.
     * @param {HCURSOR} hcur Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HCURSOR</a></b>
     * 
     * The new cursor shape.
     * @param {BOOL} bText Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> if the cursor is used for text, or <b>FALSE</b> if not.
     * @returns {HCURSOR} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HCURSOR</a></b>
     * 
     * Returns the cursor that <i>hcur</i> is replacing.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost2-txsetcursor2
     */
    TxSetCursor2(hcur, bText) {
        hcur := hcur is Win32Handle ? NumGet(hcur, "ptr") : hcur

        result := ComCall(47, this, "ptr", hcur, "int", bText, "ptr")
        return HCURSOR({Value: result}, True)
    }

    /**
     * Notifies the text host that text services have been freed.
     * @remarks
     * 
     * If the text host hasn't received this notification when the text host is shutting down, the text host can tell text services to release its text host reference count.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost2-txfreetextservicesnotification
     */
    TxFreeTextServicesNotification() {
        ComCall(48, this)
    }

    /**
     * Gets whether a rich edit control is in a dialog box.
     * @param {Integer} dwItem Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Mask that indicates the edit style flags to retrieve. It can be the following value.  
     * 
     * <a id="TXES_ISDIALOG"></a>
     * <a id="txes_isdialog"></a>
     * @param {Pointer<Integer>} pdwData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXES_ISDIALOG"></a><a id="txes_isdialog"></a><dl>
     * <dt><b>TXES_ISDIALOG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the host of the rich edit control is a dialog box.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost2-txgeteditstyle
     */
    TxGetEditStyle(dwItem, pdwData) {
        pdwDataMarshal := pdwData is VarRef ? "uint*" : "ptr"

        result := ComCall(49, this, "uint", dwItem, pdwDataMarshal, pdwData, "HRESULT")
        return result
    }

    /**
     * Retrieves the window styles and extended windows styles of the text host window.
     * @param {Pointer<Integer>} pdwStyle Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * The window styles. For a description of the possible values, see <a href="https://docs.microsoft.com/windows/desktop/winmsg/window-styles">Window Styles</a>.
     * @param {Pointer<Integer>} pdwExStyle Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * The extended windows styles. For a description of the possible values, see <a href="https://docs.microsoft.com/windows/desktop/winmsg/extended-window-styles">Extended Window Styles</a>.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost2-txgetwindowstyles
     */
    TxGetWindowStyles(pdwStyle, pdwExStyle) {
        pdwStyleMarshal := pdwStyle is VarRef ? "uint*" : "ptr"
        pdwExStyleMarshal := pdwExStyle is VarRef ? "uint*" : "ptr"

        result := ComCall(50, this, pdwStyleMarshal, pdwStyle, pdwExStyleMarshal, pdwExStyle, "HRESULT")
        return result
    }

    /**
     * Shows or hides the caret during the drop portion of a drag-and-drop operation (Direct2D only).
     * @param {BOOL} fShow Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Show or hide flag. <b>TRUE</b> shows the drop caret, and <b>FALSE</b> hides it.
     * @param {HDC} hdc Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
     * 
     * The HDC.
     * @param {Pointer<RECT>} prc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">LPCRECT</a></b>
     * 
     * The drop caret rectangle.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost2-txshowdropcaret
     */
    TxShowDropCaret(fShow, hdc, prc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := ComCall(51, this, "int", fShow, "ptr", hdc, "ptr", prc, "HRESULT")
        return result
    }

    /**
     * Destroys the caret (Direct2D only).
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost2-txdestroycaret
     */
    TxDestroyCaret() {
        result := ComCall(52, this, "HRESULT")
        return result
    }

    /**
     * Gets the horizontal scroll extent of the text host window.
     * @param {Pointer<Integer>} plHorzExtent Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a>*</b>
     * 
     * The horizontal scroll extent.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost2-txgethorzextent
     */
    TxGetHorzExtent(plHorzExtent) {
        plHorzExtentMarshal := plHorzExtent is VarRef ? "int*" : "ptr"

        result := ComCall(53, this, plHorzExtentMarshal, plHorzExtent, "HRESULT")
        return result
    }
}
