#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines the methods necessary for a custom Gip controller interface.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.igipgamecontrollerinputsink
 * @namespace Windows.Gaming.Input.Custom
 * @version WindowsRuntime 1.4
 */
class IGipGameControllerInputSink extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGipGameControllerInputSink
     * @type {Guid}
     */
    static IID => Guid("{a2108abf-09f1-43bc-a140-80f899ec36fb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnKeyReceived", "OnMessageReceived"]

    /**
     * Event raised when a key is received.
     * @param {Integer} timestamp_ Timestamp for the event.
     * @param {Integer} keyCode The key code for the button that raised the event.
     * @param {Boolean} isPressed Boolean indicating whether the key is pressed or released.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.igipgamecontrollerinputsink.onkeyreceived
     */
    OnKeyReceived(timestamp_, keyCode, isPressed) {
        result := ComCall(6, this, "uint", timestamp_, "char", keyCode, "int", isPressed, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Event raised when a message is received.
     * @param {Integer} timestamp_ Timestamp of the event.
     * @param {Integer} messageClass The class of the message.
     * @param {Integer} messageId The ID of the message.
     * @param {Integer} sequenceId Sequence ID of the message.
     * @param {Integer} messageBuffer_length 
     * @param {Pointer<Integer>} messageBuffer Buffer containing the message.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.igipgamecontrollerinputsink.onmessagereceived
     */
    OnMessageReceived(timestamp_, messageClass, messageId, sequenceId, messageBuffer_length, messageBuffer) {
        messageBufferMarshal := messageBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "uint", timestamp_, "int", messageClass, "char", messageId, "char", sequenceId, "uint", messageBuffer_length, messageBufferMarshal, messageBuffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
