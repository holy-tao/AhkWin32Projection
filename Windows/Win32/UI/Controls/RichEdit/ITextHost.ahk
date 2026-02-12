#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Graphics\Gdi\HDC.ahk
#Include ..\..\Input\Ime\HIMC.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The ITextHost interface is used by a text services object to obtain text host services.
 * @remarks
 * You must implement the <b>ITextHost</b> interface before you call the <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-createtextservices">CreateTextServices</a> function.
 * 
 * Applications do not call the <b>ITextHost</b> methods. A text services object created by the <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-createtextservices">CreateTextServices</a> function calls the interface methods.
 * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nl-textserv-itexthost
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
     * Requests the device context for the text host window.
     * @remarks
     * This method is only valid when the control is in-place active; calls while the control is inactive may fail.
     * @returns {HDC} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
     * 
     * If the method succeeds, return the handle of the device context for the client area of the text host window. 
     * 
     * If the method fails, return <b>NULL</b>. For more information on COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nf-textserv-itexthost-txgetdc
     */
    TxGetDC() {
        result := ComCall(3, this, "ptr")
        resultHandle := HDC({Value: result}, True)
        return resultHandle
    }

    /**
     * Releases the device context obtained by the ITextHost::TxGetDC method.
     * @remarks
     * This method is only valid when the control is in-place active; calls while the control is inactive may fail.
     * @param {HDC} hdc_ Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
     * 
     * Handle to the device context to release.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * Returns 1 if <i>hdc</i> was released; otherwise 0.
     *                     
     * 
     * For more information on COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nf-textserv-itexthost-txreleasedc
     */
    TxReleaseDC(hdc_) {
        hdc_ := hdc_ is Win32Handle ? NumGet(hdc_, "ptr") : hdc_

        result := ComCall(4, this, "ptr", hdc_, "int")
        return result
    }

    /**
     * Shows or hides the scroll bar in the text host window.
     * @remarks
     * This method is only valid when the control is in-place active; calls while the control is inactive may fail.
     * @param {Integer} fnBar Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * @param {BOOL} fShow Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Flag. If <b>TRUE</b>, the scroll bars indicated by <i>fnBar</i> is visible. If <b>FALSE</b>, the scroll bar is hidden.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Return <b>TRUE</b> if the method succeeds. 
     * 
     * Return <b>FALSE</b> if the method fails.
     * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nf-textserv-itexthost-txshowscrollbar
     */
    TxShowScrollBar(fnBar, fShow) {
        result := ComCall(5, this, "int", fnBar, "int", fShow, "int")
        return result
    }

    /**
     * Enables or disables one or both scroll bar arrows in the text host window.
     * @remarks
     * This method is only valid when the control is in-place active; calls while the control is inactive may fail.
     * @param {Integer} fuSBFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * @param {Integer} fuArrowflags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Return nonzero if the arrows are enabled or disabled as specified. 
     * 
     * Return zero if the arrows are already in the requested state or an error occurs.
     * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nf-textserv-itexthost-txenablescrollbar
     */
    TxEnableScrollBar(fuSBFlags, fuArrowflags) {
        result := ComCall(6, this, "int", fuSBFlags, "int", fuArrowflags, "int")
        return result
    }

    /**
     * Sets the minimum and maximum position values for the specified scroll bar in the text host window.
     * @remarks
     * This method is only valid when the control is in-place active; calls while the control is inactive may fail.
     * @param {Integer} fnBar Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * Scroll bar flag. If this is SB_HORZ, horizontal scrolling is done. By default, vertical scrolling is done.
     * @param {Integer} nMinPos Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Minimum scrolling position.
     * @param {Integer} nMaxPos Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * Maximum scrolling position.
     * @param {BOOL} fRedraw Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Redraw flag. If <b>TRUE</b>, the scroll bar is redrawn to reflect the changes. If <b>FALSE</b>, the scroll bar is not redrawn.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Return <b>TRUE</b> if the arrows are enabled or disabled as specified. 
     * 
     * Return <b>FALSE</b> if the arrows are already in the requested state or an error occurs.
     * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nf-textserv-itexthost-txsetscrollrange
     */
    TxSetScrollRange(fnBar, nMinPos, nMaxPos, fRedraw) {
        result := ComCall(7, this, "int", fnBar, "int", nMinPos, "int", nMaxPos, "int", fRedraw, "int")
        return result
    }

    /**
     * Sets the position of the scroll box (thumb) in the specified scroll bar and, if requested, redraws the scroll bar to reflect the new position of the scroll box. (ITextHost.TxSetScrollPos)
     * @remarks
     * This method is only valid when the control is in-place active; calls while the control is inactive may fail.
     * @param {Integer} fnBar Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * Scroll bar flag. If this is SB_HORZ, horizontal scrolling is done. By default, vertical scrolling is done.
     * @param {Integer} nPos Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * New position in scroll box. This must be within the range of scroll bar values set by <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-itexthost-txsetscrollrange">ITextHost::TxSetScrollRange</a>.
     * @param {BOOL} fRedraw Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Redraw flag. If <b>TRUE</b>, the scroll bar is redrawn with the new position of the scroll box. If <b>FALSE</b>, the scroll bar is not redrawn.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Return <b>TRUE</b> if the method succeeds. 
     * 
     * Return <b>FALSE</b> if the method fails.
     * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nf-textserv-itexthost-txsetscrollpos
     */
    TxSetScrollPos(fnBar, nPos, fRedraw) {
        result := ComCall(8, this, "int", fnBar, "int", nPos, "int", fRedraw, "int")
        return result
    }

    /**
     * Specifies a rectangle for the text host to add to the update region of the text host window.
     * @remarks
     * This function may be called while inactive; however, the host implementation is free to invalidate an area greater than the requested 
     * 				<a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>.
     * @param {Pointer<RECT>} prc Type: <b>LPCRECT</b>
     * 
     * The invalid rectangle.
     * @param {BOOL} fMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Specifies whether the background within the update region is to be erased when the update region is processed. If this parameter is <b>TRUE</b>, the background is erased when the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-beginpaint">BeginPaint</a> function is called. If this parameter is <b>FALSE</b>, the background remains unchanged.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nf-textserv-itexthost-txinvalidaterect
     */
    TxInvalidateRect(prc, fMode) {
        ComCall(9, this, "ptr", prc, "int", fMode)
    }

    /**
     * Indicates to the text host that the update region has changed.
     * @remarks
     * The text services object must call <b>TxViewChange</b> every time its visual representation has changed, even if the control is inactive. If the control is active, then text services must also make sure the control's window is updated. It can do this in a number of ways: 
     * 
     * <ul>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-itexthost-txgetdc">ITextHost::TxGetDC</a> to get a device context for the control's window and then repaint or update the window. Afterward, call <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-itexthost-txreleasedc">ITextHost::TxReleaseDC</a>. </li>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-itexthost-txinvalidaterect">ITextHost::TxInvalidateRect</a> to invalidate the control's window. </li>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-itexthost-txscrollwindowex">ITextHost::TxScrollWindowEx</a> to scroll the control's window. </li>
     * </ul>
     * After the text services object has updated the active view, it can call <b>TxViewChange</b> and set <i>fUpdate</i> to <b>TRUE</b> along with the call. By passing <b>TRUE</b>, the text host calls <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-updatewindow">UpdateWindow</a> to make sure any unpainted areas of the active control are repainted.
     * @param {BOOL} fUpdate Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Update flag. If <b>TRUE</b>, the text host calls <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-updatewindow">UpdateWindow</a>; otherwise it does nothing. See the Remarks section.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nf-textserv-itexthost-txviewchange
     */
    TxViewChange(fUpdate) {
        ComCall(10, this, "int", fUpdate)
    }

    /**
     * Creates a new shape for windowless rich edit control's caret.
     * @remarks
     * This method is only valid when the control is in-place active; calls while the control is inactive may fail.
     * @param {HBITMAP} hbmp Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HBITMAP</a></b>
     * 
     * Handle to the bitmap for the new caret shape.
     * @param {Integer} xWidth Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * Caret width, in logical units.
     * @param {Integer} yHeight Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * Caret height, in logical units.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Return <b>TRUE</b> if the method succeeds. 
     * 
     * Return <b>FALSE</b> if the method fails.
     * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nf-textserv-itexthost-txcreatecaret
     */
    TxCreateCaret(hbmp, xWidth, yHeight) {
        hbmp := hbmp is Win32Handle ? NumGet(hbmp, "ptr") : hbmp

        result := ComCall(11, this, "ptr", hbmp, "int", xWidth, "int", yHeight, "int")
        return result
    }

    /**
     * Shows or hides the caret at the caret position in the text host window.
     * @remarks
     * This method is only valid when the control is in-place active; calls while the control is inactive may fail.
     * @param {BOOL} fShow Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Flag. If <b>TRUE</b>, the caret is visible. If <b>FALSE</b>, the caret is hidden.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Return <b>TRUE</b> if the method succeeds. 
     * 
     * Return <b>FALSE</b> if the method fails.
     * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nf-textserv-itexthost-txshowcaret
     */
    TxShowCaret(fShow) {
        result := ComCall(12, this, "int", fShow, "int")
        return result
    }

    /**
     * Moves the caret position to the specified coordinates in the text host window.
     * @remarks
     * This method is only valid when the control is in-place active; calls while the control is inactive may fail.
     * @param {Integer} x Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * Horizontal position (in client coordinates).
     * @param {Integer} y Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * Vertical position (in client coordinates).
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Return <b>TRUE</b> if the method succeeds. 
     * 
     * Return <b>FALSE</b> if the method fails.
     * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nf-textserv-itexthost-txsetcaretpos
     */
    TxSetCaretPos(x, y) {
        result := ComCall(13, this, "int", x, "int", y, "int")
        return result
    }

    /**
     * Requests the text host to create a timer with a specified time-out.
     * @remarks
     * <i>idTimer</i> is used in <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-itexthost-txkilltimer">ITextHost::TxKillTimer</a>.
     * @param {Integer} idTimer Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Timer identifier.
     * @param {Integer} uTimeout Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Time-out in milliseconds.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Return <b>TRUE</b> if the method succeeds. 
     * 
     * Return <b>FALSE</b> if the method fails.
     * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nf-textserv-itexthost-txsettimer
     */
    TxSetTimer(idTimer, uTimeout) {
        result := ComCall(14, this, "uint", idTimer, "uint", uTimeout, "int")
        return result
    }

    /**
     * Requests the text host to destroy the specified timer.
     * @remarks
     * This method may be called at any time, whether the control is active or inactive.
     * @param {Integer} idTimer Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Identifier of the timer created by the <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-itexthost-txsettimer">ITextHost::TxSetTimer</a> method.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nf-textserv-itexthost-txkilltimer
     */
    TxKillTimer(idTimer) {
        ComCall(15, this, "uint", idTimer)
    }

    /**
     * Requests the text host to scroll the content of the specified client area.
     * @remarks
     * This method is only valid when the control is in-place active; calls while the control is inactive may fail.
     * @param {Integer} dx Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * Amount of horizontal scrolling.
     * @param {Integer} dy Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * Amount of vertical scrolling.
     * @param {Pointer<RECT>} lprcScroll Type: <b>LPCRECT</b>
     * 
     * The coordinates for the scroll rectangle.
     * @param {Pointer<RECT>} lprcClip Type: <b>LPCRECT</b>
     * 
     * The coordinates for the clip rectangle.
     * @param {HRGN} hrgnUpdate Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRGN</a></b>
     * 
     * Handle to the update region.
     * @param {Pointer<RECT>} lprcUpdate Type: <b>LPRECT</b>
     * 
     * The coordinates for the update rectangle.
     * @param {Integer} fuScroll Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nf-textserv-itexthost-txscrollwindowex
     */
    TxScrollWindowEx(dx, dy, lprcScroll, lprcClip, hrgnUpdate, lprcUpdate, fuScroll) {
        hrgnUpdate := hrgnUpdate is Win32Handle ? NumGet(hrgnUpdate, "ptr") : hrgnUpdate

        ComCall(16, this, "int", dx, "int", dy, "ptr", lprcScroll, "ptr", lprcClip, "ptr", hrgnUpdate, "ptr", lprcUpdate, "uint", fuScroll)
    }

    /**
     * Sets the mouse capture in the text host's window.
     * @remarks
     * This method is only valid when the control is in-place active; calls while the control is inactive may do nothing.
     * @param {BOOL} fCapture Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Indicates whether to set or release the mouse capture. If <b>TRUE</b>, the mouse capture is set. If <b>FALSE</b>, the mouse capture is released.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nf-textserv-itexthost-txsetcapture
     */
    TxSetCapture(fCapture) {
        ComCall(17, this, "int", fCapture)
    }

    /**
     * Sets the focus to the text host window.
     * @remarks
     * This method is only valid when the control is in-place active; calls while the control is inactive may fail.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nf-textserv-itexthost-txsetfocus
     */
    TxSetFocus() {
        ComCall(18, this)
    }

    /**
     * Establishes a new cursor shape (I-beam) in the text host's window.
     * @remarks
     * This method may be called at any time, whether the control is active or inactive.
     * 
     * <b>TxSetCursor</b> should be called by the text services object to set the mouse cursor. If the <i>fText</i> parameter is <b>TRUE</b>, the text services object is trying to set the text cursor (the cursor appears as an I-beam when it is over text that is not selected). In this case, the host can set it to whatever the control MousePointer property is. This is required for Microsoft Visual Basic compatibility since, through the MousePointer property, the Visual Basic programmer has control over the shape of the mouse cursor.
     * @param {HCURSOR} hcur Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HCURSOR</a></b>
     * 
     * Handle to the cursor.
     * @param {BOOL} fText Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * If <b>TRUE</b>, indicates the caller is trying to set the text cursor. See the Remarks section for more information.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nf-textserv-itexthost-txsetcursor
     */
    TxSetCursor(hcur, fText) {
        hcur := hcur is Win32Handle ? NumGet(hcur, "ptr") : hcur

        ComCall(19, this, "ptr", hcur, "int", fText)
    }

    /**
     * Converts the screen coordinates to the text host window coordinates.
     * @param {Pointer<POINT>} lppt Type: <b>LPPOINT</b>
     * 
     * The screen coordinates to convert.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Return <b>TRUE</b> if the call succeeds. 
     * 
     * Return <b>FALSE</b> if the call fails.
     * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nf-textserv-itexthost-txscreentoclient
     */
    TxScreenToClient(lppt) {
        result := ComCall(20, this, "ptr", lppt, "int")
        return result
    }

    /**
     * Converts text host coordinates to screen coordinates.
     * @remarks
     * This call is valid at any time, although it is allowed to fail. In general, if the text services object needs to translate from client coordinates (for example, for the TOM <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-getpoint">GetPoint</a> method) the text services object is visible.
     * 
     * However, if no conversion is possible, then the method fails.
     * @param {Pointer<POINT>} lppt Type: <b>LPPOINT</b>
     * 
     * The client coordinates to convert.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Return <b>TRUE</b> if the method succeeds. 
     * 
     * Return <b>FALSE</b> if the method fails.
     * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nf-textserv-itexthost-txclienttoscreen
     */
    TxClientToScreen(lppt) {
        result := ComCall(21, this, "ptr", lppt, "int")
        return result
    }

    /**
     * Notifies the text host that the control is active.
     * @remarks
     * It is legal for the host to refuse an activation request; for example, the control may be minimized and thus invisible.
     * 
     * The caller should be able to gracefully handle failure to activate.
     * 
     * No matter how many times this method is called, only one <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-itexthost-txdeactivate">ITextHost::TxDeactivate</a> call is necessary to deactivate the control.
     * 
     * This function returns an opaque handle in 
     * 				<i>plOldState</i>. The caller (the text services object) should save this handle and use it in a subsequent call to <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-itexthost-txdeactivate">ITextHost::TxDeactivate</a>.
     * @param {Pointer<Integer>} plOldState Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a>*</b>
     * 
     * The previous activation state.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Return S_OK if the method succeeds. 
     * 
     * Return the following COM error code if the method fails. For more information on COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>. 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Activation is not possible at this time.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nf-textserv-itexthost-txactivate
     */
    TxActivate(plOldState) {
        plOldStateMarshal := plOldState is VarRef ? "int*" : "ptr"

        result := ComCall(22, this, plOldStateMarshal, plOldState, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Notifies the text host that the control is now inactive.
     * @remarks
     * No matter how many times this method is called, only one call to <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-itexthost-txactivate">ITextHost::TxActivate</a> is necessary to activate the control.
     * @param {Integer} lNewState Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * New state of the control. Typically it is the value returned by <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-itexthost-txactivate">ITextHost::TxActivate</a>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Return S_OK if the method succeeds. 
     * 
     * Return the following COM error code if the method fails. For more information on COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unspecified error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nf-textserv-itexthost-txdeactivate
     */
    TxDeactivate(lNewState) {
        result := ComCall(23, this, "int", lNewState, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the client coordinates of the text host's client area.
     * @remarks
     * The client rectangle is the rectangle that the text services object is responsible for painting and managing. The host relies on the text services object for painting that area. And, the text services object must not paint or invalidate areas outside of that rectangle.
     * 
     * The host forwards mouse messages to the text services object when the cursor is over the client rectangle.
     * 
     * The client rectangle is expressed in client coordinates of the containing window.
     * 
     * <div class="alert"><b>Important</b>  The <b>ITextHost::TxGetClientRect</b> method will fail if called at an inactive time.</div>
     * <div> </div>
     * @param {Pointer<RECT>} prc Type: <b>LPRECT</b>
     * 
     * The client coordinates of the text host's client area.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Return S_OK if the method succeeds. 
     * 
     * Return the following COM error code if the method fails. For more information on COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unspecified error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nf-textserv-itexthost-txgetclientrect
     */
    TxGetClientRect(prc) {
        result := ComCall(24, this, "ptr", prc, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Requests the dimensions of the white space inset around the text in the text host window.
     * @remarks
     * The view inset is the amount of space on each side between the client rectangle and the view rectangle. The view rectangle (also called the Formatting rectangle) is the rectangle in which the text should be formatted .
     * 
     * The view insets are passed in a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure, but this is not really a rectangle. It should be treated as four independent values to subtract on each side of the client rectangle to figure the view rectangle.
     * 
     * The view insets are passed in HIMETRIC (each HIMETRIC unit corresponds to 0.01 millimeter) so that they do not depend on the client rectangle and the rendering device context.
     * 
     * View insets can be negative on either side of the client rectangle, leading to a bigger view rectangle than the client rectangle. The text should then be clipped to the client rectangle. If the view rectangle is wider than the client rectangle, then the host may add a horizontal scroll bar to the control.
     * 
     * Single line–text services objects ignore the right boundary of the view rectangle when formatting text.
     * 
     * The view inset is available from the host at all times, active or inactive.
     * @param {Pointer<RECT>} prc Type: <b>LPRECT</b>
     * 
     * The inset size, in client coordinates. The top, bottom, left, and right members of the 
     * 					<a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure indicate how far in each direction the drawing should be inset.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * The return value is <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nf-textserv-itexthost-txgetviewinset
     */
    TxGetViewInset(prc) {
        result := ComCall(25, this, "ptr", prc, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Requests the text host's default character format.
     * @remarks
     * The text host retains ownership of the <a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-charformata">CHARFORMAT</a> returned. However, the pointer returned must remain valid until the text host notifies the text services object through <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-itextservices-ontxpropertybitschange">OnTxPropertyBitsChange</a> that the default character format has changed.
     * @param {Pointer<Pointer<CHARFORMATW>>} ppCF Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-charformata">CHARFORMAT</a>**</b>
     * 
     * The default character format.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Return S_OK if the method succeeds. 
     * 
     * Return the following COM error code if the method fails. For more information on COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nf-textserv-itexthost-txgetcharformat
     */
    TxGetCharFormat(ppCF) {
        ppCFMarshal := ppCF is VarRef ? "ptr*" : "ptr"

        result := ComCall(26, this, ppCFMarshal, ppCF, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Requests the text host's default paragraph format.
     * @remarks
     * The host object retains ownership of the <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-paraformat">PARAFORMAT</a> structure that is returned. However, the pointer returned must remain valid until the host notifies the text services object, through <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-itextservices-ontxpropertybitschange">OnTxPropertyBitsChange</a>, that the default paragraph format has changed.
     * @param {Pointer<Pointer<PARAFORMAT>>} ppPF Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-paraformat">PARAFORMAT</a>**</b>
     * 
     * The default paragraph format.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Return S_OK if the method succeeds. 
     * 
     * Return the following COM error code if the method fails. For more information on COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>. 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nf-textserv-itexthost-txgetparaformat
     */
    TxGetParaFormat(ppPF) {
        ppPFMarshal := ppPF is VarRef ? "ptr*" : "ptr"

        result := ComCall(27, this, ppPFMarshal, ppPF, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the text host's color for a specified display element.
     * @remarks
     * Note that the color returned may be 
     * 				<i>different</i> than the color that would be returned from a call to <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getsyscolor">GetSysColor</a>. This is the case if the host overrides the default system behavior.
     * 
     * <div class="alert"><b>Note</b>  Hosts should be careful about overriding normal system behavior because it can result in inconsistent UI (particularly with respect to Accessibility options).</div>
     * <div> </div>
     * @param {Integer} nIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * The display element whose color is to be retrieved. For a list of possible values for this parameter, see the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getsyscolor">GetSysColor</a> function.
     * @returns {COLORREF} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * The  value that identifies the red, green, and blue (RGB) color value of the specified element.
     * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nf-textserv-itexthost-txgetsyscolor
     */
    TxGetSysColor(nIndex) {
        result := ComCall(28, this, "int", nIndex, "uint")
        return result
    }

    /**
     * Requests the background style of the text host.
     * @param {Pointer<Integer>} pstyle Type: <b>TXTBACKSTYLE*</b>
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * The return value is <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nf-textserv-itexthost-txgetbackstyle
     */
    TxGetBackStyle(pstyle) {
        pstyleMarshal := pstyle is VarRef ? "int*" : "ptr"

        result := ComCall(29, this, pstyleMarshal, pstyle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the text host's maximum allowed length for the text.
     * @remarks
     * When this maximum is reached, the text services object should reject any further character insertion and pasted text. 
     * 				<a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-itextservices-txsettext">TxSetText</a> however should still accept (and set) text longer than the maximum length. This is because this method is used for binding and is critical to maintaining the integrity of the data to which the control is bound.
     * 
     * This method parallels the <a href="https://docs.microsoft.com/windows/desktop/Controls/em-limittext">EM_LIMITTEXT</a> message. 
     * 
     * If the limit returned is less than the number of characters currently in the text services object, no data is lost. Instead, no edits are allowed to the text 
     * 				<i>other</i> than deletion until the text is reduced to below the limit.
     * @param {Pointer<Integer>} plength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * The maximum allowed text length, in number of characters. If INFINITE is returned, the text services object can use as much memory as needed to store any specified text.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * The return value is <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nf-textserv-itexthost-txgetmaxlength
     */
    TxGetMaxLength(plength) {
        plengthMarshal := plength is VarRef ? "uint*" : "ptr"

        result := ComCall(30, this, plengthMarshal, plength, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Requests information about the scroll bars supported by the text host.
     * @param {Pointer<Integer>} pdwScrollBar Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * The scroll bar. This parameter can be a combination of the following window styles related to scroll bars. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WS_VSCROLL"></a><a id="ws_vscroll"></a><dl>
     * <dt><b>WS_VSCROLL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Supports a vertical scroll bar.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WS_HSCROLL"></a><a id="ws_hscroll"></a><dl>
     * <dt><b>WS_HSCROLL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Supports a horizontal scroll bar.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ES_AUTOVSCROLL"></a><a id="es_autovscroll"></a><dl>
     * <dt><b>ES_AUTOVSCROLL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Automatically scrolls text up one page when the user presses ENTER on the last line.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ES_AUTOHSCROLL"></a><a id="es_autohscroll"></a><dl>
     * <dt><b>ES_AUTOHSCROLL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Automatically scrolls text to the right by 10 characters when the user types a character at the end of the line. When the user presses ENTER, the control scrolls all text back to position zero.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ES_DISABLENOSCROLL"></a><a id="es_disablenoscroll"></a><dl>
     * <dt><b>ES_DISABLENOSCROLL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disables scroll bars instead of hiding them when they are not needed.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * The return value is <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nf-textserv-itexthost-txgetscrollbars
     */
    TxGetScrollBars(pdwScrollBar) {
        pdwScrollBarMarshal := pdwScrollBar is VarRef ? "uint*" : "ptr"

        result := ComCall(31, this, pdwScrollBarMarshal, pdwScrollBar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Requests the text host's password character.
     * @remarks
     * The password character is only shown if the TXTBIT_USEPASSWORD bit is enabled in the text services object. If the password character changes, re-enable the TXTBIT_USEPASSWORD bit through <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-itextservices-ontxpropertybitschange">OnTxPropertyBitsChange</a>.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">TCHAR</a>*</b>
     * 
     * The password character.
     * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nf-textserv-itexthost-txgetpasswordchar
     */
    TxGetPasswordChar() {
        result := ComCall(32, this, "char*", &pch := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pch
    }

    /**
     * Requests the special character to use for the underlining accelerator character.
     * @remarks
     * Accelerators allow keyboard shortcuts, or accelerator keys, to various UI elements (such as buttons). Typically, the shortcut character is underlined.
     * 
     * This method tells the text services object which character is the accelerator and thus should be underlined. Note that the text services object does 
     * 				<i>not</i> process accelerators; that is the responsibility of the host.
     * 
     * This method is typically only called if the TXTBIT_SHOWACCELERATOR bit is set in the text services object. See <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-itextservices-ontxpropertybitschange">OnTxPropertyBitsChange</a>.
     * 
     * <div class="alert"><b>Note</b>  <i>Any</i> change to the text in the text services object results in the invalidation of the accelerator underlining. In this case, it is the host's responsibility to recalculate the appropriate character position and inform the text services object that a new accelerator is available.</div>
     * <div> </div>
     * @param {Pointer<Integer>} pcp Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a>*</b>
     * 
     * The character position of the character to underline. This variable is set by the text host. A character position of 
     * 					–1 (that is, negative one) indicates that no character should be underlined.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * The return value is <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nf-textserv-itexthost-txgetacceleratorpos
     */
    TxGetAcceleratorPos(pcp) {
        pcpMarshal := pcp is VarRef ? "int*" : "ptr"

        result := ComCall(33, this, pcpMarshal, pcp, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Requests the native size of the control in HIMETRIC.
     * @remarks
     * This method is used by the text services object to implement zooming. The text services object derives the zoom factor from the ratio between the himetric and device pixel extent of the client rectangle. Each HIMETRIC unit corresponds to 0.01 millimeter.
     * 
     * [vertical zoom factor] = [pixel height of the client rect] * 2540 / [HIMETRIC vertical extent] * [pixel per vertical inch (from device context)]
     * 
     * If the vertical and horizontal zoom factors are not the same, the text services object can ignore the horizontal zoom factor and assume it is the same as the vertical one.
     * @param {Pointer<SIZE>} lpExtent Type: <b>LPSIZEL</b>
     * 
     * The size of the control in HIMETRIC, that is, where the unit is .01 millimeter.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Return S_OK if the method succeeds. 
     * 
     * Return the following COM error code if the method fails. For more information on COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nf-textserv-itexthost-txgetextent
     */
    TxGetExtent(lpExtent) {
        result := ComCall(34, this, "ptr", lpExtent, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the default character format for the text host.
     * @param {Pointer<CHARFORMATW>} pCF Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-charformata">CHARFORMAT</a>*</b>
     * 
     * The new default-character format.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Return S_OK if the method succeeds. 
     * 
     * Return one of the following COM error codes if the method fails. For more information on COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>. 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not valid. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unspecified error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nf-textserv-itexthost-ontxcharformatchange
     */
    OnTxCharFormatChange(pCF) {
        result := ComCall(35, this, "ptr", pCF, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the default paragraph format for the text host.
     * @param {Pointer<PARAFORMAT>} pPF Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-paraformat">PARAFORMAT</a>*</b>
     * 
     * The new default paragraph format.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Return S_OK if the method succeeds. 
     * 
     * Return one of the following COM error codes if the method fails. For more information on COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>. 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not valid. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unspecified error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nf-textserv-itexthost-ontxparaformatchange
     */
    OnTxParaFormatChange(pPF) {
        result := ComCall(36, this, "ptr", pPF, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Requests the bit property settings for the text host.
     * @remarks
     * This call is valid at any time, for any combination of requested property bits.
     * @param {Integer} dwMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Mask of properties in which the caller is interested. For the possible bit values, see 
     * 					<i>dwBits</i> in <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-itextservices-ontxpropertybitschange">OnTxPropertyBitsChange</a>.
     * @param {Pointer<Integer>} pdwBits Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * The current settings for the properties specified by 
     * 					<i>dwMask</i>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * The return value is <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nf-textserv-itexthost-txgetpropertybits
     */
    TxGetPropertyBits(dwMask, pdwBits) {
        pdwBitsMarshal := pdwBits is VarRef ? "uint*" : "ptr"

        result := ComCall(37, this, "uint", dwMask, pdwBitsMarshal, pdwBits, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Notifies the text host of various events.
     * @remarks
     * Note that there are two basic categories of events, 
     * 				<i>direct</i> and 
     * 				<i>delayed</i> . Direct events are sent immediately because they need some processing, for example, <a href="https://docs.microsoft.com/windows/desktop/Controls/en-protected">EN_PROTECTED</a>. Delayed events are sent after all processing has occurred; the control is thus in a stable state. Examples of delayed notifications are <a href="https://docs.microsoft.com/windows/desktop/Controls/en-change">EN_CHANGE</a>, <a href="https://docs.microsoft.com/windows/desktop/Controls/en-errspace">EN_ERRSPACE</a>, and <a href="https://docs.microsoft.com/windows/desktop/Controls/en-selchange">EN_SELCHANGE</a>.
     * 
     * The notification events are the same as the notification codes sent to the parent window of a rich edit window. The firing of events may be controlled with a mask set through the <a href="https://docs.microsoft.com/windows/desktop/Controls/em-seteventmask">EM_SETEVENTMASK</a> message.
     * 
     * In general, it is legal to make calls to the text services object while processing this method; however, implementers are cautioned to avoid excessive recursion.
     * 
     * The following is a list of the notifications that may be sent.
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Notification</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/en-change">EN_CHANGE</a>
     * </td>
     * <td>Sent after the system updates the screen, when the user takes an action that may have altered text in the control. </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/en-dropfiles">EN_DROPFILES</a>
     * </td>
     * <td>Sent when either a 
     * 							<a href="https://docs.microsoft.com/windows/desktop/shell/wm-dropfiles">WM_DROPFILES</a> message or an 
     * 							<a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-idroptarget-dragenter">IDropTarget::DragEnter</a> notification is received.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/en-errspace">EN_ERRSPACE</a>
     * </td>
     * <td>Sent when a control cannot allocate enough memory to meet a specified request.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/en-hscroll">EN_HSCROLL</a>
     * </td>
     * <td>Sent when the user clicks the control's horizontal scroll bar before the screen is updated.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/en-killfocus">EN_KILLFOCUS</a>
     * </td>
     * <td>Sent when the control loses the keyboard focus.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/en-link">EN_LINK</a>
     * </td>
     * <td>Sent when a rich edit control receives various messages, such as mouse click messages, when the mouse pointer is over text that has the CFE_LINK effect. </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/en-maxtext">EN_MAXTEXT</a>
     * </td>
     * <td>Sent when the current text insertion has exceeded the maximum number of characters for the control.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/en-oleopfailed">EN_OLEOPFAILED</a>
     * </td>
     * <td>Sent when a user action on an OLE object has failed.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/en-protected">EN_PROTECTED</a>
     * </td>
     * <td>Sent when the user takes an action that changes the protected range of text.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/en-requestresize">EN_REQUESTRESIZE</a>
     * </td>
     * <td>Sent when a rich edit control's contents are different from the control's window size. </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/en-saveclipboard">EN_SAVECLIPBOARD</a>
     * </td>
     * <td>Sent when an edit control is being destroyed. The text host should indicate whether <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleflushclipboard">OleFlushClipboard</a> should be called. Data indicating the number of characters and objects to be flushed is sent in the 
     * 							<a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-ensaveclipboard">ENSAVECLIPBOARD</a> data structure. Mask value is nothing.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/en-selchange">EN_SELCHANGE</a>
     * </td>
     * <td>Sent when the current selection has changed. A <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-selchange">SELCHANGE</a> data structure is also sent, which indicates the new selection range at the type of data the selection is currently over. Controlled through the <a href="https://docs.microsoft.com/windows/desktop/Controls/rich-edit-control-event-mask-flags">ENM_SELCHANGE</a> mask.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/en-setfocus">EN_SETFOCUS</a>
     * </td>
     * <td>Sent when the edit control receives the keyboard focus. No extra data is sent; there is no mask.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/en-stopnoundo">EN_STOPNOUNDO</a>
     * </td>
     * <td>Sent when an action occurs for which the control cannot allocate enough memory to maintain the undo state. If S_FALSE is returned, the action will be stopped; otherwise, the action will continue.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/en-update">EN_UPDATE</a>
     * </td>
     * <td>Sent before an edit control requests a redraw of altered data or text. No additional data is sent. This event is controlled through the <a href="https://docs.microsoft.com/windows/desktop/Controls/rich-edit-control-event-mask-flags">ENM_UPDATE</a> mask. 
     * 							<b>Rich Edit 2.0 and later:</b> The <a href="https://docs.microsoft.com/windows/desktop/Controls/rich-edit-control-event-mask-flags">ENM_UPDATE</a> mask is ignored and the <a href="https://docs.microsoft.com/windows/desktop/Controls/en-update">EN_UPDATE</a> notification code is always sent. However, when Microsoft Rich Edit 3.0 emulates Microsoft Rich Edit 1.0, the <b>ENM_UPDATE</b> mask controls this notification.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/en-vscroll">EN_VSCROLL</a>
     * </td>
     * <td>Sent when the user clicks an edit control's vertical scroll bar or when the user scrolls the mouse wheel over the edit control, before the screen is updated. This is controlled through the <a href="https://docs.microsoft.com/windows/desktop/Controls/rich-edit-control-event-mask-flags">ENM_SCROLL</a> mask; no extra data is sent.</td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/Controls/en-msgfilter">EN_MSGFILTER</a> is not sent to <b>TxNotify</b>. To filter window messages, use <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-itextservices-txsendmessage">TxSendMessage</a>.</div>
     * <div> </div>
     * @param {Integer} iNotify Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Event to notify host of. One of the 
     * 					<b>EN_</b> notification codes.
     * @param {Pointer<Void>} pv Type: <b>void*</b>
     * 
     * Extra data, dependent on 
     * 					<i>iNotify</i>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Return S_OK if the method succeeds. 
     * 
     * Return S_FALSE if the method fails. For more information on COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nf-textserv-itexthost-txnotify
     */
    TxNotify(iNotify, pv) {
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        result := ComCall(38, this, "uint", iNotify, pvMarshal, pv, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the Input Method Editor (IME) input context associated with the text services host. This method is used only in Asian-language versions of the operating system.
     * @returns {HIMC} Type: <b>HIMC</b>
     * 
     * The handle to the input context.
     * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nf-textserv-itexthost-tximmgetcontext
     */
    TxImmGetContext() {
        result := ComCall(39, this, "ptr")
        resultHandle := HIMC({Value: result}, True)
        return resultHandle
    }

    /**
     * Releases an input context returned by the ITextHost::TxImmGetContext method and unlocks the memory associated with the context. This method is used only in Asian-language versions of the operating system.
     * @param {HIMC} himc_ Type: <b>HIMC</b>
     * 
     * The input context.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nf-textserv-itexthost-tximmreleasecontext
     */
    TxImmReleaseContext(himc_) {
        himc_ := himc_ is Win32Handle ? NumGet(himc_, "ptr") : himc_

        ComCall(40, this, "ptr", himc_)
    }

    /**
     * Returns the size of selection bar in HIMETRIC.
     * @param {Pointer<Integer>} lSelBarWidth Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a>*</b>
     * 
     * The width, in HIMETRIC (that is, where the units are .01 millimeter), of the selection bar.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * The return value is <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/textserv/nf-textserv-itexthost-txgetselectionbarwidth
     */
    TxGetSelectionBarWidth(lSelBarWidth) {
        lSelBarWidthMarshal := lSelBarWidth is VarRef ? "int*" : "ptr"

        result := ComCall(41, this, lSelBarWidthMarshal, lSelBarWidth, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
