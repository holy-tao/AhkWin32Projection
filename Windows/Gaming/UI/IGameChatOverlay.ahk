#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Gaming.UI
 * @version WindowsRuntime 1.4
 */
class IGameChatOverlay extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGameChatOverlay
     * @type {Guid}
     */
    static IID => Guid("{fbc64865-f6fc-4a48-ae07-03ac6ed43704}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DesiredPosition", "put_DesiredPosition", "AddMessage"]

    /**
     * @type {Integer} 
     */
    DesiredPosition {
        get => this.get_DesiredPosition()
        set => this.put_DesiredPosition(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DesiredPosition() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DesiredPosition(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} sender 
     * @param {HSTRING} message 
     * @param {Integer} origin 
     * @returns {HRESULT} 
     */
    AddMessage(sender, message, origin) {
        if(sender is String) {
            pin := HSTRING.Create(sender)
            sender := pin.Value
        }
        sender := sender is Win32Handle ? NumGet(sender, "ptr") : sender
        if(message is String) {
            pin := HSTRING.Create(message)
            message := pin.Value
        }
        message := message is Win32Handle ? NumGet(message, "ptr") : message

        result := ComCall(8, this, "ptr", sender, "ptr", message, "int", origin, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
