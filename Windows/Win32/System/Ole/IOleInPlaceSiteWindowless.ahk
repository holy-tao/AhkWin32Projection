#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Gdi\HDC.ahk
#Include .\IOleInPlaceSiteEx.ahk

/**
 * Extends the IOleInPlaceSiteEx interface.
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-ioleinplacesitewindowless
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
     * @returns {HRESULT} This method returns S_OK if the object can activate in-place without a window.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ioleinplacesitewindowless-canwindowlessactivate
     */
    CanWindowlessActivate() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * Called by an in-place active, windowless object to determine whether it still has the mouse capture.
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
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ioleinplacesitewindowless-getcapture
     */
    GetCapture() {
        result := ComCall(19, this, "HRESULT")
        return result
    }

    /**
     * Enables an in-place active, windowless object to capture all mouse messages.
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
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ioleinplacesitewindowless-setcapture
     */
    SetCapture(fCapture) {
        result := ComCall(20, this, "int", fCapture, "HRESULT")
        return result
    }

    /**
     * Called by an in-place active, windowless object to determine whether it still has the keyboard focus.
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
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ioleinplacesitewindowless-getfocus
     */
    GetFocus() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * Sets the keyboard focus for a UI-active, windowless object.
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
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ioleinplacesitewindowless-setfocus
     */
    SetFocus(fFocus) {
        result := ComCall(22, this, "int", fFocus, "HRESULT")
        return result
    }

    /**
     * Provides an object with a handle to a device context for a screen or compatible device from its container.
     * @param {Pointer<RECT>} pRect A pointer to the rectangle that the object wants to redraw, in client coordinates of the containing window. If this parameter is <b>NULL</b>, the object's full extent is redrawn.
     * @param {Integer} grfFlags A combination of values from the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ne-ocidl-oledcflags">OLEDCFLAGS</a> enumeration.
     * @returns {HDC} A pointer to a returned device context.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ioleinplacesitewindowless-getdc
     */
    GetDC(pRect, grfFlags) {
        phDC := HDC()
        result := ComCall(23, this, "ptr", pRect, "uint", grfFlags, "ptr", phDC, "HRESULT")
        return phDC
    }

    /**
     * Releases the device context previously obtained by a call to IOleInPlaceSiteWindowless::GetDC.
     * @param {HDC} hDC The device context to be released.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ioleinplacesitewindowless-releasedc
     */
    ReleaseDC(hDC) {
        hDC := hDC is Win32Handle ? NumGet(hDC, "ptr") : hDC

        result := ComCall(24, this, "ptr", hDC, "HRESULT")
        return result
    }

    /**
     * Enables an object to invalidate a specified rectangle of its in-place image on the screen.
     * @param {Pointer<RECT>} pRect The rectangle to be invalidated, in client coordinates of the containing window. If this parameter is <b>NULL</b>, the object's full extent is invalidated.
     * @param {BOOL} fErase Specifies whether the background within the update region is to be erased when the region is updated. If this parameter is <b>TRUE</b>, the background is erased. If this parameter is <b>FALSE</b>, the background remains unchanged.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ioleinplacesitewindowless-invalidaterect
     */
    InvalidateRect(pRect, fErase) {
        result := ComCall(25, this, "ptr", pRect, "int", fErase, "HRESULT")
        return result
    }

    /**
     * Enables an object to invalidate a specified region of its in-place image on the screen.
     * @param {HRGN} hRGN The region to invalidate, in client coordinates of the containing window. If this parameter is <b>NULL</b>, the object's full extent is invalidated.
     * @param {BOOL} fErase Specifies whether the background within the update region is to be erased when the region is updated. If this parameter is <b>TRUE</b>, the background is erased. If this parameter is <b>FALSE</b>, the background remains unchanged.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ioleinplacesitewindowless-invalidatergn
     */
    InvalidateRgn(hRGN, fErase) {
        hRGN := hRGN is Win32Handle ? NumGet(hRGN, "ptr") : hRGN

        result := ComCall(26, this, "ptr", hRGN, "int", fErase, "HRESULT")
        return result
    }

    /**
     * Enables an object to scroll an area within its in-place active image on the screen.
     * @param {Integer} dx The amount to scroll the x-axis.
     * @param {Integer} dy The amount to scroll the y-axis.
     * @param {Pointer<RECT>} pRectScroll The rectangle to scroll, in client coordinates of the containing window. A value of <b>NULL</b> indicates the full object.
     * @param {Pointer<RECT>} pRectClip The rectangle to clip. Only pixels scrolling into this rectangle are drawn. Pixels scrolling out are not. If this parameter is <b>NULL</b>, the rectangle is not clipped.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ioleinplacesitewindowless-scrollrect
     */
    ScrollRect(dx, dy, pRectScroll, pRectClip) {
        result := ComCall(27, this, "int", dx, "int", dy, "ptr", pRectScroll, "ptr", pRectClip, "HRESULT")
        return result
    }

    /**
     * Adjusts a specified rectangle if it is entirely or partially covered by overlapping, opaque objects.
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
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ioleinplacesitewindowless-adjustrect
     */
    AdjustRect(prc) {
        result := ComCall(28, this, "ptr", prc, "HRESULT")
        return result
    }

    /**
     * Invokes the default processing for all messages passed to an object.
     * @param {Integer} msg The identifier for the window message provided to the container by Windows.
     * @param {WPARAM} wParam A parameter for the window message provided to the container by Windows.
     * @param {LPARAM} lParam A parameter for the window message provided to the container by Windows.
     * @returns {LRESULT} A pointer to result code for the window message.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ioleinplacesitewindowless-ondefwindowmessage
     */
    OnDefWindowMessage(msg, wParam, lParam) {
        result := ComCall(29, this, "uint", msg, "ptr", wParam, "ptr", lParam, "ptr*", &plResult := 0, "HRESULT")
        return plResult
    }
}
