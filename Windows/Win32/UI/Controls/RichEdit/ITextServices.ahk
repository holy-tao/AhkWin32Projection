#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Ole\IDropTarget.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Extends the Text Object Model (TOM) to provide extra functionality for windowless operation.
 * @remarks
 * 
 * In conjunction with the <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nl-textserv-itexthost">ITextHost</a> interface, <b>ITextServices</b> provides the means by which a rich edit control can be used <i>without</i> creating a window.
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Applications do not implement the <b>ITextServices</b> interface.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * Applications can call the <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-createtextservices">CreateTextServices</a> function to create a text services object. To retrieve an <b>ITextServices</b> pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the private <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointer returned by <b>CreateTextServices</b>. You can then call the <b>ITextServices</b> methods to send messages to the text services object.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//textserv/nl-textserv-itextservices
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class ITextServices extends IUnknown{

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
    static VTableNames => ["TxSendMessage", "TxDraw", "TxGetHScroll", "TxGetVScroll", "OnTxSetCursor", "TxQueryHitPoint", "OnTxInPlaceActivate", "OnTxInPlaceDeactivate", "OnTxUIActivate", "OnTxUIDeactivate", "TxGetText", "TxSetText", "TxGetCurTargetX", "TxGetBaseLinePos", "TxGetNaturalSize", "TxGetDropTarget", "OnTxPropertyBitsChange", "TxGetCachedSize"]

    /**
     * Used by the window host to forward messages sent from its window to the text services object.
     * @param {Integer} msg Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The message identifier.
     * @param {WPARAM} wparam Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WPARAM</a></b>
     * 
     * The <b>WPARAM</b> from the window's message.
     * @param {LPARAM} lparam Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * The <b>LPARAM</b> from the window's message.
     * @param {Pointer<LRESULT>} plresult Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LRESULT</a>*</b>
     * 
     * The message's return <b>LRESULT</b>.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is <b>S_OK</b>.
     * 
     * If the method fails, the return value is one of the following <b>HRESULT</b> codes. For more information on COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory. NOERROR Message was processed, and some action was taken. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Message was not processed. Typically indicates that the caller should process the message itself, potentially by calling <a href="/windows/desktop/api/winuser/nf-winuser-defwindowproca">DefWindowProc</a>. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_MSG_KEYIGNORED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Message processed, but no action was taken for the keystroke. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itextservices-txsendmessage
     */
    TxSendMessage(msg, wparam, lparam, plresult) {
        plresultMarshal := plresult is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "uint", msg, "ptr", wparam, "ptr", lparam, plresultMarshal, plresult, "HRESULT")
        return result
    }

    /**
     * Draws the text services object.
     * @param {Integer} dwDrawAspect Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * @param {Integer} lindex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Not supported.
     * @param {Pointer<Void>} pvAspect Type: <b>void*</b>
     * 
     * Information for drawing optimizations.
     * @param {Pointer<DVTARGETDEVICE>} ptd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-dvtargetdevice">DVTARGETDEVICE</a>*</b>
     * 
     * The target device.
     * @param {HDC} hdcDraw Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
     * 
     * Rendering device context.
     * @param {HDC} hicTargetDev Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
     * 
     * Target information context.
     * @param {Pointer<RECTL>} lprcBounds Type: <b>LPCRECTL</b>
     * 
     * The bounding (client) rectangle.
     * @param {Pointer<RECTL>} lprcWBounds Type: <b>LPCRECTL</b>
     * 
     * The clipping rectangle for metafiles.
     * @param {Pointer<RECT>} lprcUpdate Type: <b>LPRECT</b>
     * 
     * The update region inside <i>lprcBounds</i>.
     * @param {Pointer} pfnContinue Type: <b>BOOL CALLBACK*</b>
     * 
     * Not supported.
     * @param {Integer} dwContinue Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Parameter to pass to continue function.
     * @param {Integer} lViewId Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Specifies the view to draw.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTVIEW_ACTIVE"></a><a id="txtview_active"></a><dl>
     * <dt><b>TXTVIEW_ACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Draw the inplace   active view.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTVIEW_INACTIVE"></a><a id="txtview_inactive"></a><dl>
     * <dt><b>TXTVIEW_INACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Draw a view other than the inplace active view; for example, a print    preview. 
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * The return value is typically <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itextservices-txdraw
     */
    TxDraw(dwDrawAspect, lindex, pvAspect, ptd, hdcDraw, hicTargetDev, lprcBounds, lprcWBounds, lprcUpdate, pfnContinue, dwContinue, lViewId) {
        hdcDraw := hdcDraw is Win32Handle ? NumGet(hdcDraw, "ptr") : hdcDraw
        hicTargetDev := hicTargetDev is Win32Handle ? NumGet(hicTargetDev, "ptr") : hicTargetDev

        pvAspectMarshal := pvAspect is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "uint", dwDrawAspect, "int", lindex, pvAspectMarshal, pvAspect, "ptr", ptd, "ptr", hdcDraw, "ptr", hicTargetDev, "ptr", lprcBounds, "ptr", lprcWBounds, "ptr", lprcUpdate, "ptr", pfnContinue, "uint", dwContinue, "int", lViewId, "HRESULT")
        return result
    }

    /**
     * Returns horizontal scroll bar information.
     * @param {Pointer<Integer>} plMin Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a>*</b>
     * 
     * The minimum scroll position.
     * @param {Pointer<Integer>} plMax Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a>*</b>
     * 
     * The maximum scroll position.
     * @param {Pointer<Integer>} plPos Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a>*</b>
     * 
     * The current scroll position.
     * @param {Pointer<Integer>} plPage Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a>*</b>
     * 
     * The view width, in pixels.
     * @param {Pointer<BOOL>} pfEnabled Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * Indicates whether horizontal scrolling is enabled. If <b>TRUE</b>, horizontal scrolling is enabled.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * The method always returns <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itextservices-txgethscroll
     */
    TxGetHScroll(plMin, plMax, plPos, plPage, pfEnabled) {
        plMinMarshal := plMin is VarRef ? "int*" : "ptr"
        plMaxMarshal := plMax is VarRef ? "int*" : "ptr"
        plPosMarshal := plPos is VarRef ? "int*" : "ptr"
        plPageMarshal := plPage is VarRef ? "int*" : "ptr"
        pfEnabledMarshal := pfEnabled is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, plMinMarshal, plMin, plMaxMarshal, plMax, plPosMarshal, plPos, plPageMarshal, plPage, pfEnabledMarshal, pfEnabled, "HRESULT")
        return result
    }

    /**
     * Returns vertical scroll bar state information.
     * @param {Pointer<Integer>} plMin Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a>*</b>
     * 
     * The minimum scroll position.
     * @param {Pointer<Integer>} plMax Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a>*</b>
     * 
     * The maximum scroll position.
     * @param {Pointer<Integer>} plPos Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a>*</b>
     * 
     * The current scroll position.
     * @param {Pointer<Integer>} plPage Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a>*</b>
     * 
     * The height of view in pixels.
     * @param {Pointer<BOOL>} pfEnabled Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * Indicates whether the vertical scroll bar is enabled. If <b>TRUE</b>, the vertical scroll bar is enabled; otherwise it is disabled.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is <b>S_OK</b>.
     * 
     * If the method fails, the return value is one of the following <b>HRESULT</b> codes. For more information on COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itextservices-txgetvscroll
     */
    TxGetVScroll(plMin, plMax, plPos, plPage, pfEnabled) {
        plMinMarshal := plMin is VarRef ? "int*" : "ptr"
        plMaxMarshal := plMax is VarRef ? "int*" : "ptr"
        plPosMarshal := plPos is VarRef ? "int*" : "ptr"
        plPageMarshal := plPage is VarRef ? "int*" : "ptr"
        pfEnabledMarshal := pfEnabled is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, plMinMarshal, plMin, plMaxMarshal, plMax, plPosMarshal, plPos, plPageMarshal, plPage, pfEnabledMarshal, pfEnabled, "HRESULT")
        return result
    }

    /**
     * Notifies the text services object to set the cursor.
     * @param {Integer} dwDrawAspect Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * @param {Integer} lindex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Not supported.
     * @param {Pointer<Void>} pvAspect Type: <b>void*</b>
     * 
     * Information for drawing optimizations.
     * @param {Pointer<DVTARGETDEVICE>} ptd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-dvtargetdevice">DVTARGETDEVICE</a>*</b>
     * 
     * The target device.
     * @param {HDC} hdcDraw Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
     * 
     * Rendering device context.
     * @param {HDC} hicTargetDev Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
     * 
     * Target information context.
     * @param {Pointer<RECT>} lprcClient Type: <b>LPCRECT</b>
     * 
     * The control's client rectangle. The coordinates of the rectangle are in client coordinates of the containing window. <b>NULL</b> is a legal value.
     * @param {Integer} x Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * x position of cursor, in the client coordinates of the containing window.
     * @param {Integer} y Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * y position of cursor, in the client coordinates of the containing window.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is <b>S_OK</b>.
     * 
     * If the method fails, the return value is the following <b>HRESULT</b> code. For more information on COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * One or more illegal parameters.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itextservices-ontxsetcursor
     */
    OnTxSetCursor(dwDrawAspect, lindex, pvAspect, ptd, hdcDraw, hicTargetDev, lprcClient, x, y) {
        hdcDraw := hdcDraw is Win32Handle ? NumGet(hdcDraw, "ptr") : hdcDraw
        hicTargetDev := hicTargetDev is Win32Handle ? NumGet(hicTargetDev, "ptr") : hicTargetDev

        pvAspectMarshal := pvAspect is VarRef ? "ptr" : "ptr"

        result := ComCall(7, this, "uint", dwDrawAspect, "int", lindex, pvAspectMarshal, pvAspect, "ptr", ptd, "ptr", hdcDraw, "ptr", hicTargetDev, "ptr", lprcClient, "int", x, "int", y, "HRESULT")
        return result
    }

    /**
     * Tests whether a specified point is within the rectangle of the text services object.
     * @param {Integer} dwDrawAspect Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * @param {Integer} lindex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Not supported.
     * @param {Pointer<Void>} pvAspect Type: <b>void*</b>
     * 
     * Information for drawing optimizations.
     * @param {Pointer<DVTARGETDEVICE>} ptd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-dvtargetdevice">DVTARGETDEVICE</a>*</b>
     * 
     * Information on the target device.
     * @param {HDC} hdcDraw Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
     * 
     * Rendering device context.
     * @param {HDC} hicTargetDev Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
     * 
     * Target information context.
     * @param {Pointer<RECT>} lprcClient Type: <b>LPCRECT</b>
     * 
     * The control's client rectangle, in client (device) coordinates of the view in which the hit testing is done.
     * @param {Integer} x Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * x-coordinate to check, in client coordinates, of the view in which hit testing is done.
     * @param {Integer} y Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * y-coordinate to check, in client coordinates, of the view in which hit testing is done.
     * @param {Pointer<Integer>} pHitResult Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * The result of the hit test. It can be any of the following <b>TXTHITRESULT</b> enumeration values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTHITRESULT_CLOSE"></a><a id="txthitresult_close"></a><dl>
     * <dt><b>TXTHITRESULT_CLOSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The point is in the client rectangle and close to a nontransparent area.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTHITRESULT_HIT"></a><a id="txthitresult_hit"></a><dl>
     * <dt><b>TXTHITRESULT_HIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The point is in the client rectangle and either over text or the background is not transparent.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTHITRESULT_NOHIT"></a><a id="txthitresult_nohit"></a><dl>
     * <dt><b>TXTHITRESULT_NOHIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The point is outside of the client rectangle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTHITRESULT_TRANSPARENT"></a><a id="txthitresult_transparent"></a><dl>
     * <dt><b>TXTHITRESULT_TRANSPARENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The point is in the client rectangle and either not over text or the background was transparent.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * The return value is an <b>HRESULT</b> code.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itextservices-txqueryhitpoint
     */
    TxQueryHitPoint(dwDrawAspect, lindex, pvAspect, ptd, hdcDraw, hicTargetDev, lprcClient, x, y, pHitResult) {
        hdcDraw := hdcDraw is Win32Handle ? NumGet(hdcDraw, "ptr") : hdcDraw
        hicTargetDev := hicTargetDev is Win32Handle ? NumGet(hicTargetDev, "ptr") : hicTargetDev

        pvAspectMarshal := pvAspect is VarRef ? "ptr" : "ptr"
        pHitResultMarshal := pHitResult is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", dwDrawAspect, "int", lindex, pvAspectMarshal, pvAspect, "ptr", ptd, "ptr", hdcDraw, "ptr", hicTargetDev, "ptr", lprcClient, "int", x, "int", y, pHitResultMarshal, pHitResult, "HRESULT")
        return result
    }

    /**
     * Notifies the text services object that this control is in-place active.
     * @param {Pointer<RECT>} prcClient Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * The control's client rectangle.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the object is successfully activated, the return value is <b>S_OK</b>.
     * 
     * If the object could not be activated due to error, the return value is E_FAIL. For more information on COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itextservices-ontxinplaceactivate
     */
    OnTxInPlaceActivate(prcClient) {
        result := ComCall(9, this, "ptr", prcClient, "HRESULT")
        return result
    }

    /**
     * Notifies the text services object that this control is no longer in-place active.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * The return value is always <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itextservices-ontxinplacedeactivate
     */
    OnTxInPlaceDeactivate() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Informs the text services object that the control is now UI active.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * The method always returns <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itextservices-ontxuiactivate
     */
    OnTxUIActivate() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Informs the text services object that the control is no longer UI active.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * The method always returns <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itextservices-ontxuideactivate
     */
    OnTxUIDeactivate() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Returns all of the Unicode plain text in the control as a BSTR.
     * @param {Pointer<BSTR>} pbstrText Type: <b>BSTR
     *           *</b>
     * 
     * The Unicode plain text.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the text is successfully returned in the output argument, the return value is <b>S_OK</b>.
     * 
     * If the method fails, the return value is one of the following <b>HRESULT</b> codes. For more information on COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * Invalid <b>BSTR</b> pointer passed in.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not allocate memory for copy of the text.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itextservices-txgettext
     */
    TxGetText(pbstrText) {
        result := ComCall(13, this, "ptr", pbstrText, "HRESULT")
        return result
    }

    /**
     * Sets all of the text in the control.
     * @param {PWSTR} pszText Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCTSTR</a></b>
     * 
     * The string which will replace the current text.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is <b>S_OK</b>.
     * 
     * If the method fails, the return value is the following <b>HRESULT</b> code. For more information on COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * Text could not be updated.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itextservices-txsettext
     */
    TxSetText(pszText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(14, this, "ptr", pszText, "HRESULT")
        return result
    }

    /**
     * Gets the target x position, that is, the current horizontal position of the caret.
     * @param {Pointer<Integer>} param0 
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the x position of the caret is returned, the return value is <b>S_OK</b>.
     * 
     * If the method fails, the return value is the following <b>HRESULT</b> code. For more information on COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * There is no selection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input argument is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itextservices-txgetcurtargetx
     */
    TxGetCurTargetX(param0) {
        param0Marshal := param0 is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, param0Marshal, param0, "HRESULT")
        return result
    }

    /**
     * Gets the base line position of the first visible line, in pixels, relative to the text services client rectangle. This permits aligning controls on their base lines.
     * @param {Pointer<Integer>} param0 
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is <b>S_OK</b>.
     * 
     * If the method fails, the return value is the following <b>HRESULT</b> code. For more information on COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itextservices-txgetbaselinepos
     */
    TxGetBaseLinePos(param0) {
        param0Marshal := param0 is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, param0Marshal, param0, "HRESULT")
        return result
    }

    /**
     * Allows a control to be resized so it fits its content appropriately.
     * @param {Integer} dwAspect Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * The aspect for the drawing. It can be any of the values from the <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-dvaspect">DVASPECT</a> enumeration.
     * @param {HDC} hdcDraw Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
     * 
     * The device context into which drawing occurs.
     * @param {HDC} hicTargetDev Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
     * 
     * The device context for which text should be formatted (that is, for WYSIWYG).
     * @param {Pointer<DVTARGETDEVICE>} ptd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-dvtargetdevice">DVTARGETDEVICE</a>*</b>
     * 
     * More information on the target device.
     * @param {Integer} dwMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * The type of fitting requested. It can be one of the following.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTNS_EMU"></a><a id="txtns_emu"></a><dl>
     * <dt><b>TXTNS_EMU</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Use English Metric Units (EMUs) instead of pixels as  										the measuring units for this method's parameters.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTNS_FITTOCONTENT"></a><a id="txtns_fittocontent"></a><dl>
     * <dt><b>TXTNS_FITTOCONTENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Resize the control to fit the entire text by formatting the text to the width that is passed in. The text services object returns the height of the entire text and the width of the widest line.
     * 
     * For example, this should be done when the user double-clicks one of the control's handles.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTNS_FITTOCONTENT2"></a><a id="txtns_fittocontent2"></a><dl>
     * <dt><b>TXTNS_FITTOCONTENT2</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Resize the control so that it fits indented content.  
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTNS_FITTOCONTENT3"></a><a id="txtns_fittocontent3"></a><dl>
     * <dt><b>TXTNS_FITTOCONTENT3</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Resize the control so that it fits indented  										content and trailing whitespace.  
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTNS_FITTOCONTENTWSP"></a><a id="txtns_fittocontentwsp"></a><dl>
     * <dt><b>TXTNS_FITTOCONTENTWSP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Resize the control so that it fits unindented  										content and trailing whitespace.  
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTNS_INCLUDELASTLINE"></a><a id="txtns_includelastline"></a><dl>
     * <dt><b>TXTNS_INCLUDELASTLINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  For a plain-text control, include the height of the final carriage return when calculating the size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTNS_ROUNDTOLINE"></a><a id="txtns_roundtoline"></a><dl>
     * <dt><b>TXTNS_ROUNDTOLINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Resize the control to show an integral number of lines (no line is clipped). Format enough text to fill the width and height that is passed in, and then return a height that is rounded to the nearest line boundary.
     * 
     * 
     * <div class="alert"><b>Note</b>  The passed and returned width and height correspond to the view rectangle. The host should adjust back to the client rectangle as needed. Because these values represent the extent of the text object, they are input and output in HIMETRIC coordinates (each HIMETRIC unit is .01 millimeter), and measuring does not include any zoom factor. For a discussion of the zoom factor, see <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-itexthost-txgetextent">TxGetExtent</a>.</div>
     * <div> </div>
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<SIZE>} psizelExtent Type: <b>const SIZEL*</b>
     * 
     * Not supported.
     * @param {Pointer<Integer>} pwidth Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a>*</b>
     * 
     * The width for the fitting defined by <i>dwMode</i>.
     * @param {Pointer<Integer>} pheight Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a>*</b>
     * 
     * The height for the fitting defined by <i>dwMode</i>.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is <b>S_OK</b>.
     * 
     * If text services could not activate the object, the return value is one of the following <b>HRESULT</b> codes. For more information on COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * Unable to determine correct size.
     * 
     * </td>
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itextservices-txgetnaturalsize
     */
    TxGetNaturalSize(dwAspect, hdcDraw, hicTargetDev, ptd, dwMode, psizelExtent, pwidth, pheight) {
        hdcDraw := hdcDraw is Win32Handle ? NumGet(hdcDraw, "ptr") : hdcDraw
        hicTargetDev := hicTargetDev is Win32Handle ? NumGet(hicTargetDev, "ptr") : hicTargetDev

        pwidthMarshal := pwidth is VarRef ? "int*" : "ptr"
        pheightMarshal := pheight is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, "uint", dwAspect, "ptr", hdcDraw, "ptr", hicTargetDev, "ptr", ptd, "uint", dwMode, "ptr", psizelExtent, pwidthMarshal, pwidth, pheightMarshal, pheight, "HRESULT")
        return result
    }

    /**
     * Gets the drop target for the text control.
     * @returns {IDropTarget} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-idroptarget">IDropTarget</a>**</b>
     * 
     * The target of a drag-and-drop operation in a specified window.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itextservices-txgetdroptarget
     */
    TxGetDropTarget() {
        result := ComCall(18, this, "ptr*", &ppDropTarget := 0, "HRESULT")
        return IDropTarget(ppDropTarget)
    }

    /**
     * Sets properties (represented by bits) for the control.
     * @param {Integer} dwMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Bits representing properties to be changed. For the possible bit values, see the TXTBIT_* values list in <i>dwBits</i>.
     * @param {Integer} dwBits Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * New values for bit properties. It can be any combination of the following.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTBIT_ALLOWBEEP"></a><a id="txtbit_allowbeep"></a><dl>
     * <dt><b>TXTBIT_ALLOWBEEP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If <b>TRUE</b>, beeping is enabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTBIT_AUTOWORDSEL"></a><a id="txtbit_autowordsel"></a><dl>
     * <dt><b>TXTBIT_AUTOWORDSEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If <b>TRUE</b>, the AutoWordSelect feature is enabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTBIT_BACKSTYLECHANGE"></a><a id="txtbit_backstylechange"></a><dl>
     * <dt><b>TXTBIT_BACKSTYLECHANGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If <b>TRUE</b>, the backstyle changed. See <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-itexthost-txgetbackstyle">TxGetBackStyle</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTBIT_CHARFORMATCHANGE"></a><a id="txtbit_charformatchange"></a><dl>
     * <dt><b>TXTBIT_CHARFORMATCHANGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If <b>TRUE</b>, the character format changed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTBIT_CLIENTRECTCHANGE"></a><a id="txtbit_clientrectchange"></a><dl>
     * <dt><b>TXTBIT_CLIENTRECTCHANGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If <b>TRUE</b>, the client rectangle changed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTBIT_DISABLEDRAG"></a><a id="txtbit_disabledrag"></a><dl>
     * <dt><b>TXTBIT_DISABLEDRAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If <b>TRUE</b>, dragging is disabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTBIT_D2DDWRITE"></a><a id="txtbit_d2ddwrite"></a><dl>
     * <dt><b>TXTBIT_D2DDWRITE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Use Direct2D/DirectWrite for this instance, and not GDI/Uniscribe.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTBIT_D2DPIXELSNAPPED"></a><a id="txtbit_d2dpixelsnapped"></a><dl>
     * <dt><b>TXTBIT_D2DPIXELSNAPPED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Render glyphs to the nearest pixel positions. Valid only if D2DDWRITE is set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTBIT_D2DSUBPIXELLINES"></a><a id="txtbit_d2dsubpixellines"></a><dl>
     * <dt><b>TXTBIT_D2DSUBPIXELLINES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Draw lines with subpixel precision. Don't pixel-snap text lines, underline, and strikethrough
     * 												in the secondary text flow direction (usually vertical). Valid only if D2DDWRITE is set and D2DPIXELSNAPPED is not set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTBIT_D2DSIMPLETYPOGRAPHY"></a><a id="txtbit_d2dsimpletypography"></a><dl>
     * <dt><b>TXTBIT_D2DSIMPLETYPOGRAPHY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Render text using simple typography (no glyph rendering). This value is valid only if TXTBIT_D2DDWRITE is also specified. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTBIT_EXTENTCHANGE"></a><a id="txtbit_extentchange"></a><dl>
     * <dt><b>TXTBIT_EXTENTCHANGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If <b>TRUE</b>, the size of the client rectangle changed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTBIT_HIDESELECTION"></a><a id="txtbit_hideselection"></a><dl>
     * <dt><b>TXTBIT_HIDESELECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If <b>TRUE</b>, the text services object should hide the selection when the control is inactive. If <b>FALSE</b>, the selection should be displayed when the control is inactive.
     * 
     * Note, this implies <b>TXTBIT_SAVESELECTION</b> is <b>TRUE</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTBIT_MAXLENGTHCHANGE"></a><a id="txtbit_maxlengthchange"></a><dl>
     * <dt><b>TXTBIT_MAXLENGTHCHANGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If <b>TRUE</b>, the maximum length for text in the control changed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTBIT_MULTILINE"></a><a id="txtbit_multiline"></a><dl>
     * <dt><b>TXTBIT_MULTILINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If <b>TRUE</b>, the text services object should work in multiline mode. Use the <b>TXTBIT_WORDWRAP</b> value to determine whether to wrap the lines to the view rectangle or clip them.
     * 
     * If <b>FALSE</b>, the text services object should not process a carriage return/line feed from the ENTER key and it should truncate incoming text containing hard line breaks just before the first line break. It is also acceptable to truncate text that is set with <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-itextservices-txsettext">ITextServices::TxSetText</a>, because it is the responsibility of the host not to use a single-line control when bound to a multiline field.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTBIT_NOTHREADREFCOUNT"></a><a id="txtbit_nothreadrefcount"></a><dl>
     * <dt><b>TXTBIT_NOTHREADREFCOUNT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Don't reference TLS data on behalf of this instance.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTBIT_PARAFORMATCHANGE"></a><a id="txtbit_paraformatchange"></a><dl>
     * <dt><b>TXTBIT_PARAFORMATCHANGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If <b>TRUE</b>, the paragraph format changed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTBIT_READONLY"></a><a id="txtbit_readonly"></a><dl>
     * <dt><b>TXTBIT_READONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If <b>TRUE</b>, the text services object should not accept any editing change through the user interface. However, it should still accept programmatic changes through <a href="https://docs.microsoft.com/windows/desktop/Controls/em-settextex">EM_SETTEXTEX</a>, 	<a href="https://docs.microsoft.com/windows/desktop/Controls/em-replacesel">EM_REPLACESEL</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-itextservices-txsettext">ITextServices::TxSetText</a>. Also, the user should still be able to move the insertion point, select text, and carry out other operations that don't modify content, such as Copy.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTBIT_RICHTEXT"></a><a id="txtbit_richtext"></a><dl>
     * <dt><b>TXTBIT_RICHTEXT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If <b>TRUE</b>, the text services object should be in rich-text mode.
     * 
     * If <b>FALSE</b>, it is in plain-text mode.
     * 
     * Note, this affects how editing commands are applied. For example, applying bold to part of the text in a plain-edit control makes the entire text bold. However, for a rich-edit control, this makes only the selected text bold.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTBIT_SAVESELECTION"></a><a id="txtbit_saveselection"></a><dl>
     * <dt><b>TXTBIT_SAVESELECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If <b>TRUE</b>, the boundaries of the selection should be saved when the control is inactive.
     * 
     * If <b>FALSE</b>, when the control goes active again the selection boundaries can be reset to start = 0, length = 0.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTBIT_SCROLLBARCHANGE"></a><a id="txtbit_scrollbarchange"></a><dl>
     * <dt><b>TXTBIT_SCROLLBARCHANGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If <b>TRUE</b>, the scroll bar has changed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTBIT_SELBARCHANGE"></a><a id="txtbit_selbarchange"></a><dl>
     * <dt><b>TXTBIT_SELBARCHANGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If <b>TRUE</b>, the selection bar width has changed
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTBIT_SHOWACCELERATOR"></a><a id="txtbit_showaccelerator"></a><dl>
     * <dt><b>TXTBIT_SHOWACCELERATOR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set, the accelerator character should be underlined.
     * 
     * This must be set in order to call <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-itexthost-txgetacceleratorpos">TxGetAcceleratorPos</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTBIT_SHOWPASSWORD"></a><a id="txtbit_showpassword"></a><dl>
     * <dt><b>TXTBIT_SHOWPASSWORD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Show password strings.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTBIT_USECURRENTBKG"></a><a id="txtbit_usecurrentbkg"></a><dl>
     * <dt><b>TXTBIT_USECURRENTBKG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTBIT_USEPASSWORD"></a><a id="txtbit_usepassword"></a><dl>
     * <dt><b>TXTBIT_USEPASSWORD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If <b>TRUE</b>, display text using the password character obtained by <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-itexthost-txgetpasswordchar">TxGetPasswordChar</a>.
     * 
     * The notification on this property can mean either that the password character changed or that the password character was not used before but is used now (or vice versa).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTBIT_VERTICAL"></a><a id="txtbit_vertical"></a><dl>
     * <dt><b>TXTBIT_VERTICAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTBIT_VIEWINSETCHANGE"></a><a id="txtbit_viewinsetchange"></a><dl>
     * <dt><b>TXTBIT_VIEWINSETCHANGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If <b>TRUE</b>, the inset changed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXTBIT_WORDWRAP"></a><a id="txtbit_wordwrap"></a><dl>
     * <dt><b>TXTBIT_WORDWRAP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If <b>TRUE</b> and TXTBIT_MULTILINE is also <b>TRUE</b>, multiline controls should wrap the line to the view rectangle. If this property is <b>FALSE</b> and <b>TXTBIT_MULTILINE</b> is <b>TRUE</b>, the lines should not be wrapped but clipped. The right side of the view rectangle should be ignored.
     * 
     * If <b>TXTBIT_MULTILINE</b> is <b>FALSE</b>, this property has no effect.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is <b>S_OK</b>.
     * 
     * If the method fails, the return value is the following <a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a> code. For more information on COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itextservices-ontxpropertybitschange
     */
    OnTxPropertyBitsChange(dwMask, dwBits) {
        result := ComCall(19, this, "uint", dwMask, "uint", dwBits, "HRESULT")
        return result
    }

    /**
     * Returns the cached drawing logical size (if any) that text services is using. Typically, this will be the size of the last client rectangle used in ITextServices::TxDraw, ITextServices::OnTxSetCursor, and so forth, although it is not guaranteed to be.
     * @param {Pointer<Integer>} pdwWidth Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * The width, in client coordinates.
     * @param {Pointer<Integer>} pdwHeight Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * The height (in client coordinates).
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is an <b>HRESULT</b> code.
     * @see https://docs.microsoft.com/windows/win32/api//textserv/nf-textserv-itextservices-txgetcachedsize
     */
    TxGetCachedSize(pdwWidth, pdwHeight) {
        pdwWidthMarshal := pdwWidth is VarRef ? "uint*" : "ptr"
        pdwHeightMarshal := pdwHeight is VarRef ? "uint*" : "ptr"

        result := ComCall(20, this, pdwWidthMarshal, pdwWidth, pdwHeightMarshal, pdwHeight, "HRESULT")
        return result
    }
}
