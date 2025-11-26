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
     * Requests the device context for the text host window.
     * @returns {HDC} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HDC</a></b>
     * 
     * If the method succeeds, return the handle of the device context for the client area of the text host window. 
     * 
     * If the method fails, return <b>NULL</b>. For more information on COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost-txgetdc
     */
    TxGetDC() {
        result := ComCall(3, this, "ptr")
        return HDC({Value: result}, True)
    }

    /**
     * Releases the device context obtained by the ITextHost::TxGetDC method.
     * @param {HDC} hdc Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
     * 
     * Handle to the device context to release.
     * @returns {Integer} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * Returns 1 if <i>hdc</i> was released; otherwise 0.
     *                     
     * 
     * For more information on COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost-txreleasedc
     */
    TxReleaseDC(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := ComCall(4, this, "ptr", hdc, "int")
        return result
    }

    /**
     * Shows or hides the scroll bar in the text host window.
     * @param {Integer} fnBar Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * @param {BOOL} fShow Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Flag. If <b>TRUE</b>, the scroll bars indicated by <i>fnBar</i> is visible. If <b>FALSE</b>, the scroll bar is hidden.
     * @returns {BOOL} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Return <b>TRUE</b> if the method succeeds. 
     * 
     * Return <b>FALSE</b> if the method fails.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost-txshowscrollbar
     */
    TxShowScrollBar(fnBar, fShow) {
        result := ComCall(5, this, "int", fnBar, "int", fShow, "int")
        return result
    }

    /**
     * Enables or disables one or both scroll bar arrows in the text host window.
     * @param {Integer} fuSBFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * @param {Integer} fuArrowflags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * @returns {BOOL} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Return nonzero if the arrows are enabled or disabled as specified. 
     * 
     * Return zero if the arrows are already in the requested state or an error occurs.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost-txenablescrollbar
     */
    TxEnableScrollBar(fuSBFlags, fuArrowflags) {
        result := ComCall(6, this, "int", fuSBFlags, "int", fuArrowflags, "int")
        return result
    }

    /**
     * Sets the minimum and maximum position values for the specified scroll bar in the text host window.
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
     * @returns {BOOL} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Return <b>TRUE</b> if the arrows are enabled or disabled as specified. 
     * 
     * Return <b>FALSE</b> if the arrows are already in the requested state or an error occurs.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost-txsetscrollrange
     */
    TxSetScrollRange(fnBar, nMinPos, nMaxPos, fRedraw) {
        result := ComCall(7, this, "int", fnBar, "int", nMinPos, "int", nMaxPos, "int", fRedraw, "int")
        return result
    }

    /**
     * Sets the position of the scroll box (thumb) in the specified scroll bar and, if requested, redraws the scroll bar to reflect the new position of the scroll box.
     * @param {Integer} fnBar Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * Scroll bar flag. If this is SB_HORZ, horizontal scrolling is done. By default, vertical scrolling is done.
     * @param {Integer} nPos Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * New position in scroll box. This must be within the range of scroll bar values set by <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-itexthost-txsetscrollrange">ITextHost::TxSetScrollRange</a>.
     * @param {BOOL} fRedraw Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Redraw flag. If <b>TRUE</b>, the scroll bar is redrawn with the new position of the scroll box. If <b>FALSE</b>, the scroll bar is not redrawn.
     * @returns {BOOL} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Return <b>TRUE</b> if the method succeeds. 
     * 
     * Return <b>FALSE</b> if the method fails.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost-txsetscrollpos
     */
    TxSetScrollPos(fnBar, nPos, fRedraw) {
        result := ComCall(8, this, "int", fnBar, "int", nPos, "int", fRedraw, "int")
        return result
    }

    /**
     * Specifies a rectangle for the text host to add to the update region of the text host window.
     * @remarks
     * 
     * This function may be called while inactive; however, the host implementation is free to invalidate an area greater than the requested 
     * 				<a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>.
     * 
     * 
     * @param {Pointer<RECT>} prc Type: <b>LPCRECT</b>
     * 
     * The invalid rectangle.
     * @param {BOOL} fMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Specifies whether the background within the update region is to be erased when the update region is processed. If this parameter is <b>TRUE</b>, the background is erased when the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-beginpaint">BeginPaint</a> function is called. If this parameter is <b>FALSE</b>, the background remains unchanged.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost-txinvalidaterect
     */
    TxInvalidateRect(prc, fMode) {
        ComCall(9, this, "ptr", prc, "int", fMode)
    }

    /**
     * Indicates to the text host that the update region has changed.
     * @remarks
     * 
     * The text services object must call <b>TxViewChange</b> every time its visual representation has changed, even if the control is inactive. If the control is active, then text services must also make sure the control's window is updated. It can do this in a number of ways: 
     * 
     * <ul>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-itexthost-txgetdc">ITextHost::TxGetDC</a> to get a device context for the control's window and then repaint or update the window. Afterward, call <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-itexthost-txreleasedc">ITextHost::TxReleaseDC</a>. </li>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-itexthost-txinvalidaterect">ITextHost::TxInvalidateRect</a> to invalidate the control's window. </li>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-itexthost-txscrollwindowex">ITextHost::TxScrollWindowEx</a> to scroll the control's window. </li>
     * </ul>
     * After the text services object has updated the active view, it can call <b>TxViewChange</b> and set <i>fUpdate</i> to <b>TRUE</b> along with the call. By passing <b>TRUE</b>, the text host calls <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-updatewindow">UpdateWindow</a> to make sure any unpainted areas of the active control are repainted.
     * 
     * 
     * @param {BOOL} fUpdate Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Update flag. If <b>TRUE</b>, the text host calls <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-updatewindow">UpdateWindow</a>; otherwise it does nothing. See the Remarks section.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost-txviewchange
     */
    TxViewChange(fUpdate) {
        ComCall(10, this, "int", fUpdate)
    }

    /**
     * Creates a new shape for windowless rich edit control's caret.
     * @param {HBITMAP} hbmp Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HBITMAP</a></b>
     * 
     * Handle to the bitmap for the new caret shape.
     * @param {Integer} xWidth Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * Caret width, in logical units.
     * @param {Integer} yHeight Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * Caret height, in logical units.
     * @returns {BOOL} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Return <b>TRUE</b> if the method succeeds. 
     * 
     * Return <b>FALSE</b> if the method fails.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost-txcreatecaret
     */
    TxCreateCaret(hbmp, xWidth, yHeight) {
        hbmp := hbmp is Win32Handle ? NumGet(hbmp, "ptr") : hbmp

        result := ComCall(11, this, "ptr", hbmp, "int", xWidth, "int", yHeight, "int")
        return result
    }

    /**
     * Shows or hides the caret at the caret position in the text host window.
     * @param {BOOL} fShow Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Flag. If <b>TRUE</b>, the caret is visible. If <b>FALSE</b>, the caret is hidden.
     * @returns {BOOL} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Return <b>TRUE</b> if the method succeeds. 
     * 
     * Return <b>FALSE</b> if the method fails.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost-txshowcaret
     */
    TxShowCaret(fShow) {
        result := ComCall(12, this, "int", fShow, "int")
        return result
    }

    /**
     * Moves the caret position to the specified coordinates in the text host window.
     * @param {Integer} x Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * Horizontal position (in client coordinates).
     * @param {Integer} y Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * Vertical position (in client coordinates).
     * @returns {BOOL} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Return <b>TRUE</b> if the method succeeds. 
     * 
     * Return <b>FALSE</b> if the method fails.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost-txsetcaretpos
     */
    TxSetCaretPos(x, y) {
        result := ComCall(13, this, "int", x, "int", y, "int")
        return result
    }

    /**
     * Requests the text host to create a timer with a specified time-out.
     * @param {Integer} idTimer Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Timer identifier.
     * @param {Integer} uTimeout Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Time-out in milliseconds.
     * @returns {BOOL} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Return <b>TRUE</b> if the method succeeds. 
     * 
     * Return <b>FALSE</b> if the method fails.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost-txsettimer
     */
    TxSetTimer(idTimer, uTimeout) {
        result := ComCall(14, this, "uint", idTimer, "uint", uTimeout, "int")
        return result
    }

    /**
     * Requests the text host to destroy the specified timer.
     * @remarks
     * 
     * This method may be called at any time, whether the control is active or inactive.
     * 
     * 
     * @param {Integer} idTimer Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Identifier of the timer created by the <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-itexthost-txsettimer">ITextHost::TxSetTimer</a> method.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost-txkilltimer
     */
    TxKillTimer(idTimer) {
        ComCall(15, this, "uint", idTimer)
    }

    /**
     * Requests the text host to scroll the content of the specified client area.
     * @remarks
     * 
     * This method is only valid when the control is in-place active; calls while the control is inactive may fail.
     * 
     * 
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
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost-txscrollwindowex
     */
    TxScrollWindowEx(dx, dy, lprcScroll, lprcClip, hrgnUpdate, lprcUpdate, fuScroll) {
        hrgnUpdate := hrgnUpdate is Win32Handle ? NumGet(hrgnUpdate, "ptr") : hrgnUpdate

        ComCall(16, this, "int", dx, "int", dy, "ptr", lprcScroll, "ptr", lprcClip, "ptr", hrgnUpdate, "ptr", lprcUpdate, "uint", fuScroll)
    }

    /**
     * Sets the mouse capture in the text host's window.
     * @remarks
     * 
     * This method is only valid when the control is in-place active; calls while the control is inactive may do nothing.
     * 
     * 
     * @param {BOOL} fCapture Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Indicates whether to set or release the mouse capture. If <b>TRUE</b>, the mouse capture is set. If <b>FALSE</b>, the mouse capture is released.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost-txsetcapture
     */
    TxSetCapture(fCapture) {
        ComCall(17, this, "int", fCapture)
    }

    /**
     * Sets the focus to the text host window.
     * @remarks
     * 
     * This method is only valid when the control is in-place active; calls while the control is inactive may fail.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost-txsetfocus
     */
    TxSetFocus() {
        ComCall(18, this)
    }

    /**
     * Establishes a new cursor shape (I-beam) in the text host's window.
     * @remarks
     * 
     * This method may be called at any time, whether the control is active or inactive.
     * 
     * <b>TxSetCursor</b> should be called by the text services object to set the mouse cursor. If the <i>fText</i> parameter is <b>TRUE</b>, the text services object is trying to set the text cursor (the cursor appears as an I-beam when it is over text that is not selected). In this case, the host can set it to whatever the control MousePointer property is. This is required for Microsoft Visual Basic compatibility since, through the MousePointer property, the Visual Basic programmer has control over the shape of the mouse cursor.
     * 
     * 
     * @param {HCURSOR} hcur Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HCURSOR</a></b>
     * 
     * Handle to the cursor.
     * @param {BOOL} fText Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * If <b>TRUE</b>, indicates the caller is trying to set the text cursor. See the Remarks section for more information.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost-txsetcursor
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
     * @returns {BOOL} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Return <b>TRUE</b> if the call succeeds. 
     * 
     * Return <b>FALSE</b> if the call fails.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost-txscreentoclient
     */
    TxScreenToClient(lppt) {
        result := ComCall(20, this, "ptr", lppt, "int")
        return result
    }

    /**
     * Converts text host coordinates to screen coordinates.
     * @param {Pointer<POINT>} lppt Type: <b>LPPOINT</b>
     * 
     * The client coordinates to convert.
     * @returns {BOOL} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Return <b>TRUE</b> if the method succeeds. 
     * 
     * Return <b>FALSE</b> if the method fails.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost-txclienttoscreen
     */
    TxClientToScreen(lppt) {
        result := ComCall(21, this, "ptr", lppt, "int")
        return result
    }

    /**
     * Notifies the text host that the control is active.
     * @param {Pointer<Integer>} plOldState Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a>*</b>
     * 
     * The previous activation state.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Return S_OK if the method succeeds. 
     * 
     * Return the following COM error code if the method fails. For more information on COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>. 
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
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost-txactivate
     */
    TxActivate(plOldState) {
        plOldStateMarshal := plOldState is VarRef ? "int*" : "ptr"

        result := ComCall(22, this, plOldStateMarshal, plOldState, "HRESULT")
        return result
    }

    /**
     * Notifies the text host that the control is now inactive.
     * @param {Integer} lNewState Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * New state of the control. Typically it is the value returned by <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-itexthost-txactivate">ITextHost::TxActivate</a>.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Return S_OK if the method succeeds. 
     * 
     * Return the following COM error code if the method fails. For more information on COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost-txdeactivate
     */
    TxDeactivate(lNewState) {
        result := ComCall(23, this, "int", lNewState, "HRESULT")
        return result
    }

    /**
     * Retrieves the client coordinates of the text host's client area.
     * @param {Pointer<RECT>} prc Type: <b>LPRECT</b>
     * 
     * The client coordinates of the text host's client area.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Return S_OK if the method succeeds. 
     * 
     * Return the following COM error code if the method fails. For more information on COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost-txgetclientrect
     */
    TxGetClientRect(prc) {
        result := ComCall(24, this, "ptr", prc, "HRESULT")
        return result
    }

    /**
     * Requests the dimensions of the white space inset around the text in the text host window.
     * @param {Pointer<RECT>} prc Type: <b>LPRECT</b>
     * 
     * The inset size, in client coordinates. The top, bottom, left, and right members of the 
     * 					<a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure indicate how far in each direction the drawing should be inset.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * The return value is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost-txgetviewinset
     */
    TxGetViewInset(prc) {
        result := ComCall(25, this, "ptr", prc, "HRESULT")
        return result
    }

    /**
     * Requests the text host's default character format.
     * @param {Pointer<Pointer<CHARFORMATW>>} ppCF Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-charformata">CHARFORMAT</a>**</b>
     * 
     * The default character format.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Return S_OK if the method succeeds. 
     * 
     * Return the following COM error code if the method fails. For more information on COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost-txgetcharformat
     */
    TxGetCharFormat(ppCF) {
        ppCFMarshal := ppCF is VarRef ? "ptr*" : "ptr"

        result := ComCall(26, this, ppCFMarshal, ppCF, "HRESULT")
        return result
    }

    /**
     * Requests the text host's default paragraph format.
     * @param {Pointer<Pointer<PARAFORMAT>>} ppPF Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-paraformat">PARAFORMAT</a>**</b>
     * 
     * The default paragraph format.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Return S_OK if the method succeeds. 
     * 
     * Return the following COM error code if the method fails. For more information on COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>. 
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
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost-txgetparaformat
     */
    TxGetParaFormat(ppPF) {
        ppPFMarshal := ppPF is VarRef ? "ptr*" : "ptr"

        result := ComCall(27, this, ppPFMarshal, ppPF, "HRESULT")
        return result
    }

    /**
     * Retrieves the text host's color for a specified display element.
     * @param {Integer} nIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * The display element whose color is to be retrieved. For a list of possible values for this parameter, see the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getsyscolor">GetSysColor</a> function.
     * @returns {COLORREF} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * The  value that identifies the red, green, and blue (RGB) color value of the specified element.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost-txgetsyscolor
     */
    TxGetSysColor(nIndex) {
        result := ComCall(28, this, "int", nIndex, "uint")
        return result
    }

    /**
     * Requests the background style of the text host.
     * @param {Pointer<Integer>} pstyle Type: <b>TXTBACKSTYLE*</b>
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * The return value is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost-txgetbackstyle
     */
    TxGetBackStyle(pstyle) {
        pstyleMarshal := pstyle is VarRef ? "int*" : "ptr"

        result := ComCall(29, this, pstyleMarshal, pstyle, "HRESULT")
        return result
    }

    /**
     * Gets the text host's maximum allowed length for the text.
     * @param {Pointer<Integer>} plength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * The maximum allowed text length, in number of characters. If INFINITE is returned, the text services object can use as much memory as needed to store any specified text.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * The return value is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost-txgetmaxlength
     */
    TxGetMaxLength(plength) {
        plengthMarshal := plength is VarRef ? "uint*" : "ptr"

        result := ComCall(30, this, plengthMarshal, plength, "HRESULT")
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
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * The return value is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost-txgetscrollbars
     */
    TxGetScrollBars(pdwScrollBar) {
        pdwScrollBarMarshal := pdwScrollBar is VarRef ? "uint*" : "ptr"

        result := ComCall(31, this, pdwScrollBarMarshal, pdwScrollBar, "HRESULT")
        return result
    }

    /**
     * Requests the text host's password character.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">TCHAR</a>*</b>
     * 
     * The password character.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost-txgetpasswordchar
     */
    TxGetPasswordChar() {
        result := ComCall(32, this, "char*", &pch := 0, "HRESULT")
        return pch
    }

    /**
     * Requests the special character to use for the underlining accelerator character.
     * @param {Pointer<Integer>} pcp Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a>*</b>
     * 
     * The character position of the character to underline. This variable is set by the text host. A character position of 
     * 					–1 (that is, negative one) indicates that no character should be underlined.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * The return value is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost-txgetacceleratorpos
     */
    TxGetAcceleratorPos(pcp) {
        pcpMarshal := pcp is VarRef ? "int*" : "ptr"

        result := ComCall(33, this, pcpMarshal, pcp, "HRESULT")
        return result
    }

    /**
     * Requests the native size of the control in HIMETRIC.
     * @param {Pointer<SIZE>} lpExtent Type: <b>LPSIZEL</b>
     * 
     * The size of the control in HIMETRIC, that is, where the unit is .01 millimeter.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Return S_OK if the method succeeds. 
     * 
     * Return the following COM error code if the method fails. For more information on COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost-txgetextent
     */
    TxGetExtent(lpExtent) {
        result := ComCall(34, this, "ptr", lpExtent, "HRESULT")
        return result
    }

    /**
     * Sets the default character format for the text host.
     * @param {Pointer<CHARFORMATW>} pCF Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-charformata">CHARFORMAT</a>*</b>
     * 
     * The new default-character format.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Return S_OK if the method succeeds. 
     * 
     * Return one of the following COM error codes if the method fails. For more information on COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>. 
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
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost-ontxcharformatchange
     */
    OnTxCharFormatChange(pCF) {
        result := ComCall(35, this, "ptr", pCF, "HRESULT")
        return result
    }

    /**
     * Sets the default paragraph format for the text host.
     * @param {Pointer<PARAFORMAT>} pPF Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-paraformat">PARAFORMAT</a>*</b>
     * 
     * The new default paragraph format.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Return S_OK if the method succeeds. 
     * 
     * Return one of the following COM error codes if the method fails. For more information on COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>. 
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
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost-ontxparaformatchange
     */
    OnTxParaFormatChange(pPF) {
        result := ComCall(36, this, "ptr", pPF, "HRESULT")
        return result
    }

    /**
     * Requests the bit property settings for the text host.
     * @param {Integer} dwMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Mask of properties in which the caller is interested. For the possible bit values, see 
     * 					<i>dwBits</i> in <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-itextservices-ontxpropertybitschange">OnTxPropertyBitsChange</a>.
     * @param {Pointer<Integer>} pdwBits Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * The current settings for the properties specified by 
     * 					<i>dwMask</i>.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * The return value is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost-txgetpropertybits
     */
    TxGetPropertyBits(dwMask, pdwBits) {
        pdwBitsMarshal := pdwBits is VarRef ? "uint*" : "ptr"

        result := ComCall(37, this, "uint", dwMask, pdwBitsMarshal, pdwBits, "HRESULT")
        return result
    }

    /**
     * Notifies the text host of various events.
     * @param {Integer} iNotify Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Event to notify host of. One of the 
     * 					<b>EN_</b> notification codes.
     * @param {Pointer<Void>} pv Type: <b>void*</b>
     * 
     * Extra data, dependent on 
     * 					<i>iNotify</i>.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Return S_OK if the method succeeds. 
     * 
     * Return S_FALSE if the method fails. For more information on COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost-txnotify
     */
    TxNotify(iNotify, pv) {
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        result := ComCall(38, this, "uint", iNotify, pvMarshal, pv, "HRESULT")
        return result
    }

    /**
     * Retrieves the Input Method Editor (IME) input context associated with the text services host. This method is used only in Asian-language versions of the operating system.
     * @returns {HIMC} Type: <b>HIMC</b>
     * 
     * The handle to the input context.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost-tximmgetcontext
     */
    TxImmGetContext() {
        result := ComCall(39, this, "ptr")
        return HIMC({Value: result}, True)
    }

    /**
     * Releases an input context returned by the ITextHost::TxImmGetContext method and unlocks the memory associated with the context. This method is used only in Asian-language versions of the operating system.
     * @param {HIMC} himc Type: <b>HIMC</b>
     * 
     * The input context.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost-tximmreleasecontext
     */
    TxImmReleaseContext(himc) {
        himc := himc is Win32Handle ? NumGet(himc, "ptr") : himc

        ComCall(40, this, "ptr", himc)
    }

    /**
     * Returns the size of selection bar in HIMETRIC.
     * @param {Pointer<Integer>} lSelBarWidth Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a>*</b>
     * 
     * The width, in HIMETRIC (that is, where the units are .01 millimeter), of the selection bar.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * The return value is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itexthost-txgetselectionbarwidth
     */
    TxGetSelectionBarWidth(lSelBarWidth) {
        lSelBarWidthMarshal := lSelBarWidth is VarRef ? "int*" : "ptr"

        result := ComCall(41, this, lSelBarWidthMarshal, lSelBarWidth, "HRESULT")
        return result
    }
}
