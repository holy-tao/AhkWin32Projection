#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Gdi\HDC.ahk
#Include .\IOleInPlaceSiteEx.ahk

/**
 * Extends the IOleInPlaceSiteEx interface.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/nn-ocidl-ioleinplacesitewindowless
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleInPlaceSiteWindowless extends IOleInPlaceSiteEx{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOleInPlaceSiteWindowless
     * @type {Guid}
     */
    static IID => Guid("{922eada0-3424-11cf-b670-00aa004cd6d8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CanWindowlessActivate", "GetCapture", "SetCapture", "GetFocus", "SetFocus", "GetDC", "ReleaseDC", "InvalidateRect", "InvalidateRgn", "ScrollRect", "AdjustRect", "OnDefWindowMessage"]

    /**
     * Informs an object if its container can support it as a windowless object that can be in-place activated.
     * @remarks
     * If this method returns S_OK, the container can dispatch events to it using <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ioleinplaceobjectwindowless">IOleInPlaceObjectWindowless</a>.
     * 
     * If this method returns S_FALSE, the object should create a window and behave as a normal compound document object.
     * @returns {HRESULT} This method returns S_OK if the object can activate in-place without a window.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ioleinplacesitewindowless-canwindowlessactivate
     */
    CanWindowlessActivate() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * Called by an in-place active, windowless object to determine whether it still has the mouse capture.
     * @remarks
     * As an alternative to calling this method, the object can cache information about whether it has the mouse capture.
     * @returns {HRESULT} This method returns S_OK on success. Other possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object does not currently have the mouse capture.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ioleinplacesitewindowless-getcapture
     */
    GetCapture() {
        result := ComCall(19, this, "HRESULT")
        return result
    }

    /**
     * Enables an in-place active, windowless object to capture all mouse messages.
     * @remarks
     * A windowless object captures the mouse input, by calling <b>IOleInPlaceSiteWindowless::SetCapture</b> with <b>TRUE</b> on its site object. The container can deny mouse capture, in which case this method returns S_FALSE. If the capture is granted, the container must set the Windows mouse capture to its own window and dispatch any subsequent mouse message to the object, regardless of whether the mouse cursor position is over this object or not.
     * 
     * The object can later release mouse capture by calling <b>IOleInPlaceSiteWindowless::SetCapture</b> with <b>FALSE</b> on its site object. The capture can also be released because of an external event, such as the ESC key being pressed. In this case, the object is notified by a <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-cancelmode">WM_CANCELMODE</a> message that the container dispatches along with the keyboard focus.
     * 
     * 
     * 
     * Containers should dispatch all mouse messages, including <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-setcursor">WM_SETCURSOR</a>, to the windowless OLE object that has captured the mouse. If no object has captured the mouse, the container should dispatch the mouse message to the object under the mouse cursor.
     * 
     * The container dispatches these window messages by calling <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ioleinplaceobjectwindowless-onwindowmessage">IOleInPlaceObjectWindowless::OnWindowMessage</a> on the windowless object. The windowless object can return S_FALSE to this method to indicate that it did not process the mouse message. Then, the container should perform the default behavior for the message by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-defwindowproca">DefWindowProc</a> function. For <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-setcursor">WM_SETCURSOR</a>, the container can either set the cursor itself or do nothing.
     * 
     * Objects can also use <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ioleinplacesitewindowless-ondefwindowmessage">IOleInPlaceSiteWindowless::OnDefWindowMessage</a> to invoke the default message processing from the container. In the case of the <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-setcursor">WM_SETCURSOR</a> message, this allows an object to take action if the container does not set the cursor.
     * @param {BOOL} fCapture If <b>TRUE</b>, the container should capture the mouse for the object. If <b>FALSE</b>, the container should release mouse capture for the object.
     * @returns {HRESULT} This method returns S_OK if the mouse capture was successfully granted to the object. If called to release the mouse capture, this method must not fail. Other possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Mouse capture was denied to the object.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ioleinplacesitewindowless-setcapture
     */
    SetCapture(fCapture) {
        result := ComCall(20, this, "int", fCapture, "HRESULT")
        return result
    }

    /**
     * Called by an in-place active, windowless object to determine whether it still has the keyboard focus.
     * @remarks
     * A windowless object calls this method to find out if it currently has the focus or not. As an alternative to calling this method, the object can cache information about whether it has the keyboard focus or not.
     * @returns {HRESULT} This method returns S_OK on success. Other possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object does not currently have the keyboard focus.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ioleinplacesitewindowless-getfocus
     */
    GetFocus() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * Sets the keyboard focus for a UI-active, windowless object.
     * @remarks
     * A windowless object calls this method whenever a windowed object would call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iresourcemanager-setfocus">SetFocus</a> function. Through this call, the windowless object obtains the keyboard focus and can respond to window messages. Normally, this call is made during the UI activation process and within the notification methods <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplaceactiveobject-ondocwindowactivate">IOleInPlaceActiveObject::OnDocWindowActivate</a> with <b>TRUE</b> and <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplaceactiveobject-onframewindowactivate">IOleInPlaceActiveObject::OnFrameWindowActivate</a> with <b>TRUE</b>.
     * 
     * In response to this call, the container sets the Windows focus to the window being used to get keyboard messages (usually the container window) and redirects any subsequent keyboard messages to the windowless object that requested the focus.
     * 
     * A windowless object also calls the <b>IOleInPlaceSiteWindowless::SetFocus</b> method with the <i>fFocus</i> parameter set to <b>FALSE</b> to release the keyboard focus without assigning it to any other object. In this case, the container must call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iresourcemanager-setfocus">SetFocus</a> function with a <b>NULL</b> parameter so that no window has the focus.
     * @param {BOOL} fFocus If <b>TRUE</b>, sets the keyboard focus to the calling object. If <b>FALSE</b>, removes the keyboard focus from the calling object, provided that the object has the focus.
     * @returns {HRESULT} This method returns S_OK if the keyboard focus was successfully given to the object. If this method is called to release the focus, it should never fail. Other possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Keyboard focus was denied to the object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ioleinplacesitewindowless-setfocus
     */
    SetFocus(fFocus) {
        result := ComCall(22, this, "int", fFocus, "HRESULT")
        return result
    }

    /**
     * Provides an object with a handle to a device context for a screen or compatible device from its container.
     * @remarks
     * A device context obtained by this method should be released by calling <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ioleinplacesitewindowless-releasedc">IOleInPlaceSiteWindowless::ReleaseDC</a>.
     * 
     * Like other methods in this interface, rectangles are specified in client coordinates of the containing window. The container is expected to intersect this rectangle with the object's site rectangle and clip out everything outside the resulting rectangle. This prevents objects from inadvertently drawing where they are not supposed to.
     * 
     * Containers are also expected to map the device context origin so the object can draw in client coordinates of the containing window, usually the container's window. If the container is merely passing its window device context, this occurs automatically. If it is returning another device context, for example, an offscreen memory device context, then the viewport origin should be set appropriately.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Depending whether it is returning an on-screen or off-screen device context and depending on how sophisticated it is, container can use one of the following algorithms:
     * 
     * <ol>
     * <li>
     * On-screen, One Pass Drawing
     * 
     * <ol>
     * <li>In the <b>IOleInPlaceSiteWindowless::GetDC</b> method, the container should:<ul>
     * <li>Get the window device context.</li>
     * <li>If <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ne-ocidl-oledcflags">OLEDC</a>_PAINTBKGND is set, draw the <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-dvaspect">DVASPECT</a>_CONTENT aspect of every object behind the object requesting the device context.</li>
     * <li>Return the device context.</li>
     * </ul>
     * </li>
     * <li>In the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ioleinplacesitewindowless-releasedc">ReleaseDC</a> method, the container should:<ul>
     * <li>Draw the DVASPECT_CONTENT of every overlapping object.</li>
     * <li>Release the device context.</li>
     * </ul>
     * </li>
     * </ol>
     * </li>
     * <li>
     * On-screen, Two Pass Drawing
     * 
     * <ol>
     * <li>In the <b>IOleInPlaceSiteWindowless::GetDC</b> method, the container should:<ul>
     * <li>Get the window device context.</li>
     * <li>Clip out the opaque regions of any overlapping object. These regions do not need to be redrawn since they are already correct on the screen.
     * </li>
     * <li>If OLEDC_PAINTBKGND is not set, return the device context.</li>
     * <li>Otherwise, clip out the opaque parts of the object requesting the device context and draw the opaque parts of every object behind it going front to back.</li>
     * <li>Draw the transparent aspects of every object behind going back to front, setting the clipping region appropriately each time.</li>
     * <li>Finally return the device context.</li>
     * </ul>
     * </li>
     * <li>In the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ioleinplacesitewindowless-releasedc">IOleInPlaceSiteWindowless::ReleaseDC</a> method, the container should:<ul>
     * <li>Draw the transparent parts of every overlapping object.</li>
     * <li>Release the device context.</li>
     * </ul>
     * </li>
     * </ol>
     * </li>
     * <li>
     *  Off-screen Drawing
     * 
     * <ol>
     * <li>In the <b>IOleInPlaceSiteWindowless::GetDC</b> method, the container should:<ul>
     * <li>Create a screen compatible memory device context, containing a compatible bitmap of appropriate size.</li>
     * <li>Map the viewport origin of the device context to ensure that the calling object can draw using client area coordinates of the containing window.</li>
     * <li>If OLEDC_PAINTBKGND is set, draw the DVASPECT_CONTENT of every object behind the calling object.</li>
     * <li>Return the device context.</li>
     * </ul>
     * </li>
     * <li>In the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ioleinplacesitewindowless-releasedc">IOleInPlaceSiteWindowless::ReleaseDC</a> method, the container should:<ul>
     * <li>Draw the DVASPECT_CONTENT aspect of every overlapping object.</li>
     * <li>Copy the off-screen bitmap to the screen at the location the calling object originally requested in <b>IOleInPlaceSiteWindowless::GetDC</b>.</li>
     * <li>Delete and release the memory device context.</li>
     * </ul>
     * </li>
     * </ol>
     * </li>
     * </ol>
     * When this method returns, the clipping region in the device context should be set so that the object can't paint in any area it is not supposed to. If the object is not opaque, the background should have been painted. If the device context is a screen, any overlapping opaque areas should be clipped out.
     * @param {Pointer<RECT>} pRect A pointer to the rectangle that the object wants to redraw, in client coordinates of the containing window. If this parameter is <b>NULL</b>, the object's full extent is redrawn.
     * @param {Integer} grfFlags A combination of values from the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ne-ocidl-oledcflags">OLEDCFLAGS</a> enumeration.
     * @returns {HDC} A pointer to a returned device context.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ioleinplacesitewindowless-getdc
     */
    GetDC(pRect, grfFlags) {
        phDC := HDC()
        result := ComCall(23, this, "ptr", pRect, "uint", grfFlags, "ptr", phDC, "HRESULT")
        return phDC
    }

    /**
     * Releases the device context previously obtained by a call to IOleInPlaceSiteWindowless::GetDC.
     * @remarks
     * An object calls this method to notify its container that the object is done with the device context. If the device context was used for drawing, the container should ensure that all overlapping objects are repainted correctly. If the device context was an offscreen device context, its content should also be copied to the screen in the rectangle originally passed to <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ioleinplacesitewindowless-getdc">IOleInPlaceSiteWindowless::GetDC</a>. See <b>IOleInPlaceSiteWindowless::GetDC</b> for implementation notes relevant to <b>IOleInPlaceSiteWindowless::ReleaseDC</b>.
     * @param {HDC} _hDC 
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ioleinplacesitewindowless-releasedc
     */
    ReleaseDC(_hDC) {
        _hDC := _hDC is Win32Handle ? NumGet(_hDC, "ptr") : _hDC

        result := ComCall(24, this, "ptr", _hDC, "HRESULT")
        return result
    }

    /**
     * Enables an object to invalidate a specified rectangle of its in-place image on the screen.
     * @remarks
     * An object is only allowed to invalidate pixels contained in its own site rectangle. Any attempt to invalidate an area outside of that rectangle should result in a no-op.
     * @param {Pointer<RECT>} pRect The rectangle to be invalidated, in client coordinates of the containing window. If this parameter is <b>NULL</b>, the object's full extent is invalidated.
     * @param {BOOL} fErase Specifies whether the background within the update region is to be erased when the region is updated. If this parameter is <b>TRUE</b>, the background is erased. If this parameter is <b>FALSE</b>, the background remains unchanged.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ioleinplacesitewindowless-invalidaterect
     */
    InvalidateRect(pRect, fErase) {
        result := ComCall(25, this, "ptr", pRect, "int", fErase, "HRESULT")
        return result
    }

    /**
     * Enables an object to invalidate a specified region of its in-place image on the screen.
     * @remarks
     * An object is only allowed to invalidate pixels contained in its own site region. Any attempt to invalidate an area outside of that region should result in a no-op.
     * @param {HRGN} _hRGN 
     * @param {BOOL} fErase Specifies whether the background within the update region is to be erased when the region is updated. If this parameter is <b>TRUE</b>, the background is erased. If this parameter is <b>FALSE</b>, the background remains unchanged.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ioleinplacesitewindowless-invalidatergn
     */
    InvalidateRgn(_hRGN, fErase) {
        _hRGN := _hRGN is Win32Handle ? NumGet(_hRGN, "ptr") : _hRGN

        result := ComCall(26, this, "ptr", _hRGN, "int", fErase, "HRESULT")
        return result
    }

    /**
     * Enables an object to scroll an area within its in-place active image on the screen.
     * @remarks
     * This method should take in account the fact that the caller may be transparent and that there may be opaque or transparent overlapping objects. See Notes to Implementers below for suggestions on algorithms this method can use.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Containers can implement this method in a variety of ways. However, all of them should account for the possibility that the object requesting scrolling may be transparent or may not have a solid background. Containers should also take into account that there may be overlapping objects.
     * 
     * The simplest way to implement this method consists in simply redrawing the rectangle to scroll.
     * 
     * An added refinement to this simple implementation is to use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-scrolldc">ScrollDC</a> function when the object requesting the scroll is opaque, the object has a solid background, and there are no overlapping objects.
     * 
     * More sophisticated implementations can use the following procedure:
     * 
     * <ul>
     * <li>Check whether the object is opaque and has a solid background, using <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iviewobjectex-getviewstatus">IViewObjectEx::GetViewStatus</a>. If not, simply invalidate the rectangle to scroll. An added refinement is to check whether the scrolling rectangle is entirely in the opaque region of a partially transparent object.</li>
     * <li>Get the window device context.</li>
     * <li>Clip out the opaque parts of any overlapping object returned by <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iviewobjectex-getrect">IViewObjectEx::GetRect</a>.</li>
     * <li>Finally, call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-scrolldc">ScrollDC</a> function.</li>
     * <li>Redraw the previously invalidated transparent parts of any overlapping object.</li>
     * </ul>
     * Regardless of the scrolling and clipping rectangle, only pixels contained in the object's site rectangle will be painted. The area uncovered by the scrolling operation is invalidated and redrawn immediately, before this method returns.
     * 
     * All redraw generated by this method should happen synchronously before this method returns.
     * 
     * This method should automatically hide the caret during the scrolling operation and should move the caret by the scrolling amounts if it is inside the clip rectangle.
     * @param {Integer} dx The amount to scroll the x-axis.
     * @param {Integer} dy The amount to scroll the y-axis.
     * @param {Pointer<RECT>} pRectScroll The rectangle to scroll, in client coordinates of the containing window. A value of <b>NULL</b> indicates the full object.
     * @param {Pointer<RECT>} pRectClip The rectangle to clip. Only pixels scrolling into this rectangle are drawn. Pixels scrolling out are not. If this parameter is <b>NULL</b>, the rectangle is not clipped.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ioleinplacesitewindowless-scrollrect
     */
    ScrollRect(dx, dy, pRectScroll, pRectClip) {
        result := ComCall(27, this, "int", dx, "int", dy, "ptr", pRectScroll, "ptr", pRectClip, "HRESULT")
        return result
    }

    /**
     * Adjusts a specified rectangle if it is entirely or partially covered by overlapping, opaque objects.
     * @remarks
     * The main use of this method is to adjust the size of the caret. An object willing to create a caret should submit the caret rectangle to its site object by calling this method and using the adjusted rectangle returned from it for the caret. If the caret is entirely hidden, this method will return S_FALSE and the caret should not be shown at all in this case.
     * 
     * In a situation where objects are overlapping this method should return the largest rectangle that is fully visible.
     * 
     * This method can also be used to figure whether a point or a rectangular area is visible or hidden by overlapping objects.
     * @param {Pointer<RECT>} prc The rectangle to be adjusted.
     * @returns {HRESULT} This method returns S_OK if rectangle was adjusted successfully; meaning that the rectangle was not completely covered. Other possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The rectangle was adjusted successfully. Note S_FALSE means that the rectangle was completely covered. Its width and height are now <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ioleinplacesitewindowless-adjustrect
     */
    AdjustRect(prc) {
        result := ComCall(28, this, "ptr", prc, "HRESULT")
        return result
    }

    /**
     * Invokes the default processing for all messages passed to an object.
     * @remarks
     * A windowless object can explicitly invoke the default processing for a window message by calling this method. A container dispatches window messages to its windowless objects by calling <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ioleinplaceobjectwindowless">IOleInPlaceObjectWindowless::OnWindowMessage</a>. The object usually returns S_FALSE to indicate that it did not process the message. Then, the container can perform the default behavior for the message by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-defwindowproca">DefWindowProc</a> function.
     * 
     * Instead, the object can call this method on the container's site object to explicitly invoke the default processing. Then, the object can take action on its own if the container does not handle the message.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * The container must pass the following window messages to its default window procedure (the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-defwindowproca">DefWindowProc</a> function) and return S_OK. Note that *<i>plResult</i> should contain the value returned by <b>DefWindowProc</b>.
     * 
     * <ul>
     * <li>WM_CHAR</li>
     * <li>WM_DEADCHAR</li>
     * <li>WM_IMExxx</li>
     * <li>WM_KEYDOWN</li>
     * <li>WM_KEYUP</li>
     * <li>WM_MOUSEMOVE</li>
     * <li>WM_SYSCHAR</li>
     * <li>WM_SYSDEADCHAR</li>
     * <li>WM_SYSKEYUP</li>
     * <li>WM_XBUTTONDOWN</li>
     * <li>WM_XBUTTONUP</li>
     * <li>WM_XBUTTONDBLCLK</li>
     * </ul>
     * The container can either process the window messages as its own and return S_OK or not do anything and return S_FALSE.
     * 
     * <ul>
     * <li>WM_CONTEXTMENU</li>
     * <li>WM_HELP</li>
     * <li>WM_SETCURSOR</li>
     * </ul>
     * If the container returns S_FALSE, the object can take action to process the window message on its own.
     * @param {Integer} _msg 
     * @param {WPARAM} _wParam 
     * @param {LPARAM} _lParam 
     * @returns {LRESULT} A pointer to result code for the window message.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ioleinplacesitewindowless-ondefwindowmessage
     */
    OnDefWindowMessage(_msg, _wParam, _lParam) {
        result := ComCall(29, this, "uint", _msg, "ptr", _wParam, "ptr", _lParam, "ptr*", &plResult := 0, "HRESULT")
        return plResult
    }
}
