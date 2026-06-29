#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\RDPSRAPI_MOUSE_BUTTON_TYPE.ahk" { RDPSRAPI_MOUSE_BUTTON_TYPE }
#Import ".\RDPSRAPI_KBD_CODE_TYPE.ahk" { RDPSRAPI_KBD_CODE_TYPE }

/**
 * Sends mouse and keyboard events, and supports touch input.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nn-rdpencomapi-irdpviewerinputsink
 * @namespace Windows.Win32.System.DesktopSharing
 */
export default struct IRDPViewerInputSink extends IUnknown {
    /**
     * The interface identifier for IRDPViewerInputSink
     * @type {Guid}
     */
    static IID := Guid("{bb590853-a6c5-4a7b-8dd4-76b69eea12d5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRDPViewerInputSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SendMouseButtonEvent : IntPtr
        SendMouseMoveEvent   : IntPtr
        SendMouseWheelEvent  : IntPtr
        SendKeyboardEvent    : IntPtr
        SendSyncEvent        : IntPtr
        BeginTouchFrame      : IntPtr
        AddTouchInput        : IntPtr
        EndTouchFrame        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRDPViewerInputSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sends a mouse button event message.
     * @param {RDPSRAPI_MOUSE_BUTTON_TYPE} buttonType The button that is pressed or released.
     * @param {VARIANT_BOOL} vbButtonDown The button state:  <b>TRUE</b> if the button is down and <b>FALSE</b> otherwise.
     * @param {Integer} xPos The mouse position in  pixels along the horizontal axis.
     * @param {Integer} yPos The mouse position in pixels along the vertical axis.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpviewerinputsink-sendmousebuttonevent
     */
    SendMouseButtonEvent(buttonType, vbButtonDown, xPos, yPos) {
        result := ComCall(3, this, RDPSRAPI_MOUSE_BUTTON_TYPE, buttonType, VARIANT_BOOL, vbButtonDown, "uint", xPos, "uint", yPos, "HRESULT")
        return result
    }

    /**
     * Sends a mouse move event message.
     * @param {Integer} xPos The mouse position in  pixels along the horizontal axis.
     * @param {Integer} yPos The mouse position in pixels along the vertical axis.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpviewerinputsink-sendmousemoveevent
     */
    SendMouseMoveEvent(xPos, yPos) {
        result := ComCall(4, this, "uint", xPos, "uint", yPos, "HRESULT")
        return result
    }

    /**
     * Sends a mouse wheel event message.
     * @param {Integer} wheelRotation The number of increments that the wheel is moved.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpviewerinputsink-sendmousewheelevent
     */
    SendMouseWheelEvent(wheelRotation) {
        result := ComCall(5, this, "ushort", wheelRotation, "HRESULT")
        return result
    }

    /**
     * Sends a keyboard event message.
     * @param {RDPSRAPI_KBD_CODE_TYPE} codeType The encoding of the key code.
     * @param {Integer} keycode The key code of the pressed or released key.
     * @param {VARIANT_BOOL} vbKeyUp The state of the key:  <b>TRUE</b> if the key is released, <b>FALSE</b> if the key is pressed.
     * @param {VARIANT_BOOL} vbRepeat The key code is a repeated code:  <b>FALSE</b> if this is the initial key code from a key press, <b>TRUE</b> if this is repeated code from a single key press.
     * @param {VARIANT_BOOL} vbExtended The key code is extended:  <b>TRUE</b> if the code is extended, <b>FALSE</b> otherwise.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpviewerinputsink-sendkeyboardevent
     */
    SendKeyboardEvent(codeType, keycode, vbKeyUp, vbRepeat, vbExtended) {
        result := ComCall(6, this, RDPSRAPI_KBD_CODE_TYPE, codeType, "ushort", keycode, VARIANT_BOOL, vbKeyUp, VARIANT_BOOL, vbRepeat, VARIANT_BOOL, vbExtended, "HRESULT")
        return result
    }

    /**
     * Sends an event message to indicate a change in the state of the keyboard, such as when the Caps Lock key is pressed.
     * @param {Integer} syncFlags For possible values, see the <a href="https://docs.microsoft.com/windows/win32/api/rdpencomapi/ne-rdpencomapi-rdpsrapi_kbd_sync_flag">RDPSRAPI_KBD_SYNC_FLAG</a> enumeration.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpviewerinputsink-sendsyncevent
     */
    SendSyncEvent(syncFlags) {
        result := ComCall(7, this, "uint", syncFlags, "HRESULT")
        return result
    }

    /**
     * Begins to accept a series of touch inputs.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpviewerinputsink-begintouchframe
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
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpviewerinputsink-addtouchinput
     */
    AddTouchInput(contactId, event, x, y) {
        result := ComCall(9, this, "uint", contactId, "uint", event, "int", x, "int", y, "HRESULT")
        return result
    }

    /**
     * Stops to accept a series of touch inputs.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpviewerinputsink-endtouchframe
     */
    EndTouchFrame() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRDPViewerInputSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SendMouseButtonEvent := CallbackCreate(GetMethod(implObj, "SendMouseButtonEvent"), flags, 5)
        this.vtbl.SendMouseMoveEvent := CallbackCreate(GetMethod(implObj, "SendMouseMoveEvent"), flags, 3)
        this.vtbl.SendMouseWheelEvent := CallbackCreate(GetMethod(implObj, "SendMouseWheelEvent"), flags, 2)
        this.vtbl.SendKeyboardEvent := CallbackCreate(GetMethod(implObj, "SendKeyboardEvent"), flags, 6)
        this.vtbl.SendSyncEvent := CallbackCreate(GetMethod(implObj, "SendSyncEvent"), flags, 2)
        this.vtbl.BeginTouchFrame := CallbackCreate(GetMethod(implObj, "BeginTouchFrame"), flags, 1)
        this.vtbl.AddTouchInput := CallbackCreate(GetMethod(implObj, "AddTouchInput"), flags, 5)
        this.vtbl.EndTouchFrame := CallbackCreate(GetMethod(implObj, "EndTouchFrame"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SendMouseButtonEvent)
        CallbackFree(this.vtbl.SendMouseMoveEvent)
        CallbackFree(this.vtbl.SendMouseWheelEvent)
        CallbackFree(this.vtbl.SendKeyboardEvent)
        CallbackFree(this.vtbl.SendSyncEvent)
        CallbackFree(this.vtbl.BeginTouchFrame)
        CallbackFree(this.vtbl.AddTouchInput)
        CallbackFree(this.vtbl.EndTouchFrame)
    }
}
