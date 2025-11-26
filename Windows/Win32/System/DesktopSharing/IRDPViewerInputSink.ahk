#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Sends mouse and keyboard events, and supports touch input.
 * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nn-rdpencomapi-irdpviewerinputsink
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class IRDPViewerInputSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRDPViewerInputSink
     * @type {Guid}
     */
    static IID => Guid("{bb590853-a6c5-4a7b-8dd4-76b69eea12d5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SendMouseButtonEvent", "SendMouseMoveEvent", "SendMouseWheelEvent", "SendKeyboardEvent", "SendSyncEvent", "BeginTouchFrame", "AddTouchInput", "EndTouchFrame"]

    /**
     * Sends a mouse button event message.
     * @param {Integer} buttonType The button that is pressed or released.
     * @param {VARIANT_BOOL} vbButtonDown The button state:  <b>TRUE</b> if the button is down and <b>FALSE</b> otherwise.
     * @param {Integer} xPos The mouse position in  pixels along the horizontal axis.
     * @param {Integer} yPos The mouse position in pixels along the vertical axis.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpviewerinputsink-sendmousebuttonevent
     */
    SendMouseButtonEvent(buttonType, vbButtonDown, xPos, yPos) {
        result := ComCall(3, this, "int", buttonType, "short", vbButtonDown, "uint", xPos, "uint", yPos, "HRESULT")
        return result
    }

    /**
     * Sends a mouse move event message.
     * @param {Integer} xPos The mouse position in  pixels along the horizontal axis.
     * @param {Integer} yPos The mouse position in pixels along the vertical axis.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpviewerinputsink-sendmousemoveevent
     */
    SendMouseMoveEvent(xPos, yPos) {
        result := ComCall(4, this, "uint", xPos, "uint", yPos, "HRESULT")
        return result
    }

    /**
     * Sends a mouse wheel event message.
     * @param {Integer} wheelRotation The number of increments that the wheel is moved.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpviewerinputsink-sendmousewheelevent
     */
    SendMouseWheelEvent(wheelRotation) {
        result := ComCall(5, this, "ushort", wheelRotation, "HRESULT")
        return result
    }

    /**
     * Sends a keyboard event message.
     * @param {Integer} codeType The encoding of the key code.
     * @param {Integer} keycode The key code of the pressed or released key.
     * @param {VARIANT_BOOL} vbKeyUp The state of the key:  <b>TRUE</b> if the key is released, <b>FALSE</b> if the key is pressed.
     * @param {VARIANT_BOOL} vbRepeat The key code is a repeated code:  <b>FALSE</b> if this is the initial key code from a key press, <b>TRUE</b> if this is repeated code from a single key press.
     * @param {VARIANT_BOOL} vbExtended The key code is extended:  <b>TRUE</b> if the code is extended, <b>FALSE</b> otherwise.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpviewerinputsink-sendkeyboardevent
     */
    SendKeyboardEvent(codeType, keycode, vbKeyUp, vbRepeat, vbExtended) {
        result := ComCall(6, this, "int", codeType, "ushort", keycode, "short", vbKeyUp, "short", vbRepeat, "short", vbExtended, "HRESULT")
        return result
    }

    /**
     * Sends an event message to indicate a change in the state of the keyboard, such as when the Caps Lock key is pressed.
     * @param {Integer} syncFlags For possible values, see the <a href="https://docs.microsoft.com/windows/win32/api/rdpencomapi/ne-rdpencomapi-rdpsrapi_kbd_sync_flag">RDPSRAPI_KBD_SYNC_FLAG</a> enumeration.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpviewerinputsink-sendsyncevent
     */
    SendSyncEvent(syncFlags) {
        result := ComCall(7, this, "uint", syncFlags, "HRESULT")
        return result
    }

    /**
     * Begins to accept a series of touch inputs.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpviewerinputsink-begintouchframe
     */
    BeginTouchFrame() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Accepts a description of a touch input.
     * @param {Integer} contactId The identifier of the contact that generated the touch input.
     * @param {Integer} event The event that results from the input.
     * @param {Integer} x The touch position in the x-axis.
     * @param {Integer} y The touch position in the y-axis.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpviewerinputsink-addtouchinput
     */
    AddTouchInput(contactId, event, x, y) {
        result := ComCall(9, this, "uint", contactId, "uint", event, "int", x, "int", y, "HRESULT")
        return result
    }

    /**
     * Stops to accept a series of touch inputs.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpviewerinputsink-endtouchframe
     */
    EndTouchFrame() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
