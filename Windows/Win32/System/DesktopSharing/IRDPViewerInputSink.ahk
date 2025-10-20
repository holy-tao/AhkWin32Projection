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
     * 
     * @param {Integer} buttonType 
     * @param {VARIANT_BOOL} vbButtonDown 
     * @param {Integer} xPos 
     * @param {Integer} yPos 
     * @returns {HRESULT} 
     */
    SendMouseButtonEvent(buttonType, vbButtonDown, xPos, yPos) {
        result := ComCall(3, this, "int", buttonType, "short", vbButtonDown, "uint", xPos, "uint", yPos, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} xPos 
     * @param {Integer} yPos 
     * @returns {HRESULT} 
     */
    SendMouseMoveEvent(xPos, yPos) {
        result := ComCall(4, this, "uint", xPos, "uint", yPos, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wheelRotation 
     * @returns {HRESULT} 
     */
    SendMouseWheelEvent(wheelRotation) {
        result := ComCall(5, this, "ushort", wheelRotation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} codeType 
     * @param {Integer} keycode 
     * @param {VARIANT_BOOL} vbKeyUp 
     * @param {VARIANT_BOOL} vbRepeat 
     * @param {VARIANT_BOOL} vbExtended 
     * @returns {HRESULT} 
     */
    SendKeyboardEvent(codeType, keycode, vbKeyUp, vbRepeat, vbExtended) {
        result := ComCall(6, this, "int", codeType, "ushort", keycode, "short", vbKeyUp, "short", vbRepeat, "short", vbExtended, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} syncFlags 
     * @returns {HRESULT} 
     */
    SendSyncEvent(syncFlags) {
        result := ComCall(7, this, "uint", syncFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    BeginTouchFrame() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} contactId 
     * @param {Integer} event 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     */
    AddTouchInput(contactId, event, x, y) {
        result := ComCall(9, this, "uint", contactId, "uint", event, "int", x, "int", y, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndTouchFrame() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
