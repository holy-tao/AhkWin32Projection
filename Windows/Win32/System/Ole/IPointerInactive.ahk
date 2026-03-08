#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables an object to remain inactive most of the time, yet still participate in interaction with the mouse, including drag and drop.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/nn-ocidl-ipointerinactive
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
     * @remarks
     * The object can request to be in-place activated as soon as the mouse enters it through the POINTERINACTIVE_ACTIVATEONENTRY value. An object that provides more visual feedback than simply setting the mouse pointer would use this value. For example, if the object supports special visual feedback, it must enter the active state so it can draw the visual feedback that it supports.
     * 
     * An object can also use this method to request activation when the mouse is dragged over them during a drag and drop operation through the POINTERINACTIVE_ACTIVATEONDRAG.
     * 
     * If the object returns one of these values, the container should activate the object immediately and forward the Window message that triggered the call. The object then stays active and processes subsequent messages through its own window until the container gets another WM_SETCURSOR or WM_MOUSEMOVE. At this point, the container should deactivate the object.
     * 
     * For windowless OLE objects this mechanism is slightly different. See <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ioleinplacesitewindowless">IOleInPlaceSiteWindowless</a> for more information on drag and drop operations for windowless objects.
     * 
     * If the object returns both the POINTERINACTIVE_ACTIVATEONENTRY and the POINTERINACTIVE_DEACTIVATEONLEAVE values, the object is activated only when the mouse is over the object. If the POINTERINACTIVE_ACTIVATEONENTRY value alone is set, the object is activated once when the mouse first enters it, and it remains active.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * The activation policy should not be cached. The container should call this method each time the mouse enters an inactive object.
     * @returns {Integer} A pointer to a variable that receives the activation policy. Possible values come from the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ne-ocidl-pointerinactive">POINTERINACTIVE</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipointerinactive-getactivationpolicy
     */
    GetActivationPolicy() {
        result := ComCall(3, this, "int*", &pdwPolicy := 0, "HRESULT")
        return pdwPolicy
    }

    /**
     * Notifies the object that the mouse pointer has moved over it so the object can fire mouse events. This method is called by the container on receipt of a WM_MOUSEMOVE method when an inactive object is under the mouse pointer.
     * @remarks
     * The container calls this method to notify the object that the mouse pointer is over the object after checking the object's activation policy by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipointerinactive-getactivationpolicy">IPointerInactive::GetActivationPolicy</a> method. If the object has not requested to be activated in-place through that call, the container dispatches subsequent WM_MOUSEMOVE messages to the inactive object by calling <b>OnInactiveMouseMove</b> as long as the mouse pointer stays over the object. The object can then fire mouse move events.
     * 
     * To avoid rounding errors and to make the job easier on the object implementer, this method takes window coordinates in the units of its containing client window, that is, the window in which the object is displayed, instead of the usual <b>HIMETRIC</b> units. Thus, the same coordinates and code path can be used when the object is active and inactive. The window coordinates specify the mouse position. The bounding rectangle is also specified in the same coordinate system.
     * @param {Pointer<RECT>} pRectBounds The object bounding rectangle, in client coordinates of the containing window. This parameter tells the object its exact position and size on the screen when the WM_MOUSEMOVE message was received. This value is specified in units of the client's coordinate system.
     * @param {Integer} x The horizontal coordinate of mouse location in units of the client's containing window.
     * @param {Integer} y The vertical coordinate of mouse location in units of the client's containing window.
     * @param {Integer} grfKeyState The current state of the keyboard modifier keys on the keyboard. Possible values can be a combination of any of the values MK_CONTROL, MK_SHIFT, MK_ALT, MK_BUTTON, MK_LBUTTON, MK_MBUTTON, and MK_RBUTTON.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, it is E_FAIL.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipointerinactive-oninactivemousemove
     */
    OnInactiveMouseMove(pRectBounds, x, y, grfKeyState) {
        result := ComCall(4, this, "ptr", pRectBounds, "int", x, "int", y, "uint", grfKeyState, "HRESULT")
        return result
    }

    /**
     * Sets the mouse pointer for an inactive object. This method is called by the container on receipt of a WM_SETCURSOR method when an inactive object is under the mouse pointer.
     * @remarks
     * The container calls this method to set the mouse pointer over an inactive object after checking the object's activation policy by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipointerinactive-getactivationpolicy">IPointerInactive::GetActivationPolicy</a> method. If the object has not requested to be activated in-place through that call, the container dispatches subsequent WM_SETCURSOR messages to the inactive object by calling <b>OnInactiveSetCursor</b> as long as the mouse pointer stays over the object.
     * 
     * 
     * 
     * To avoid rounding errors and to make the job easier on the object implementer, this method takes window coordinates in the units of its containing client window, that is, the window in which the object is displayed, instead of the usual <b>HIMETRIC</b> units. Thus, the same coordinates and code path can be used when the object is active and inactive. The window coordinates specify the mouse position. The bounding rectangle is also specified in the same coordinate system.
     * 
     * <b>OnInactiveSetCursor</b> takes an additional parameter, <i>fSetAlways</i>, that indicates whether the object is obligated to set the cursor or not. Containers should first call this method with this parameter <b>FALSE</b>. The object may return S_FALSE to indicate that it did not set the cursor. In that case, the container should either set the cursor itself, or, if it does not wish to do this, call the <b>OnInactiveSetCursor</b> method again with <i>fSetAlways</i> being <b>TRUE</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipointerinactive-oninactivesetcursor
     */
    OnInactiveSetCursor(pRectBounds, x, y, dwMouseMsg, fSetAlways) {
        result := ComCall(5, this, "ptr", pRectBounds, "int", x, "int", y, "uint", dwMouseMsg, "int", fSetAlways, "HRESULT")
        return result
    }
}
