#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables an object to remain inactive most of the time, yet still participate in interaction with the mouse, including drag and drop.
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-ipointerinactive
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IPointerInactive extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPointerInactive
     * @type {Guid}
     */
    static IID => Guid("{55980ba0-35aa-11cf-b671-00aa004cd6d8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetActivationPolicy", "OnInactiveMouseMove", "OnInactiveSetCursor"]

    /**
     * Retrieves the current activation policy for the object. This method is called by the container on receipt of a WM_SETCURSOR or WM_MOUSEMOVE message when an inactive object is under the mouse pointer.
     * @returns {Integer} A pointer to a variable that receives the activation policy. Possible values come from the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ne-ocidl-pointerinactive">POINTERINACTIVE</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ipointerinactive-getactivationpolicy
     */
    GetActivationPolicy() {
        result := ComCall(3, this, "int*", &pdwPolicy := 0, "HRESULT")
        return pdwPolicy
    }

    /**
     * Notifies the object that the mouse pointer has moved over it so the object can fire mouse events. This method is called by the container on receipt of a WM_MOUSEMOVE method when an inactive object is under the mouse pointer.
     * @param {Pointer<RECT>} pRectBounds The object bounding rectangle, in client coordinates of the containing window. This parameter tells the object its exact position and size on the screen when the WM_MOUSEMOVE message was received. This value is specified in units of the client's coordinate system.
     * @param {Integer} x The horizontal coordinate of mouse location in units of the client's containing window.
     * @param {Integer} y The vertical coordinate of mouse location in units of the client's containing window.
     * @param {Integer} grfKeyState The current state of the keyboard modifier keys on the keyboard. Possible values can be a combination of any of the values MK_CONTROL, MK_SHIFT, MK_ALT, MK_BUTTON, MK_LBUTTON, MK_MBUTTON, and MK_RBUTTON.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, it is E_FAIL.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ipointerinactive-oninactivemousemove
     */
    OnInactiveMouseMove(pRectBounds, x, y, grfKeyState) {
        result := ComCall(4, this, "ptr", pRectBounds, "int", x, "int", y, "uint", grfKeyState, "HRESULT")
        return result
    }

    /**
     * Sets the mouse pointer for an inactive object. This method is called by the container on receipt of a WM_SETCURSOR method when an inactive object is under the mouse pointer.
     * @param {Pointer<RECT>} pRectBounds The object bounding rectangle specified in client coordinate units of the containing window. This parameter tells the object its exact position and size on the screen when the WM_SETCURSOR message was received. This value is specified in units of the client's coordinate system.
     * @param {Integer} x The horizontal coordinate of mouse location in units of the client's containing window.
     * @param {Integer} y The vertical coordinate of mouse location in units of the client's containing window.
     * @param {Integer} dwMouseMsg The identifier of the mouse message for which a WM_SETCURSOR occurred.
     * @param {BOOL} fSetAlways If this value is <b>TRUE</b>, the object must set the cursor; if this value is <b>FALSE</b>, the object is not obligated to set the cursor, and should return S_FALSE in that case.
     * @returns {HRESULT} This method can return the standard return value E_FAIL, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The mouse pointer was successfully set.
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
     * The object did not set the cursor; the container should either set the cursor or call the object again with the parameter <i>fSetAlways</i> set to <b>TRUE</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ipointerinactive-oninactivesetcursor
     */
    OnInactiveSetCursor(pRectBounds, x, y, dwMouseMsg, fSetAlways) {
        result := ComCall(5, this, "ptr", pRectBounds, "int", x, "int", y, "uint", dwMouseMsg, "int", fSetAlways, "HRESULT")
        return result
    }
}
