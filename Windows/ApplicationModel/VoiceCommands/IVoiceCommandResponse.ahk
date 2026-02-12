#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\VoiceCommandUserMessage.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\VoiceCommandContentTile.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.VoiceCommands
 * @version WindowsRuntime 1.4
 */
class IVoiceCommandResponse extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVoiceCommandResponse
     * @type {Guid}
     */
    static IID => Guid("{0284b30e-8a3b-4cc4-a6a1-cad5be2716b5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Message", "put_Message", "get_RepeatMessage", "put_RepeatMessage", "get_AppLaunchArgument", "put_AppLaunchArgument", "get_VoiceCommandContentTiles"]

    /**
     * @type {VoiceCommandUserMessage} 
     */
    Message {
        get => this.get_Message()
        set => this.put_Message(value)
    }

    /**
     * @type {VoiceCommandUserMessage} 
     */
    RepeatMessage {
        get => this.get_RepeatMessage()
        set => this.put_RepeatMessage(value)
    }

    /**
     * @type {HSTRING} 
     */
    AppLaunchArgument {
        get => this.get_AppLaunchArgument()
        set => this.put_AppLaunchArgument(value)
    }

    /**
     * @type {IVector<VoiceCommandContentTile>} 
     */
    VoiceCommandContentTiles {
        get => this.get_VoiceCommandContentTiles()
    }

    /**
     * 
     * @returns {VoiceCommandUserMessage} 
     */
    get_Message() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VoiceCommandUserMessage(value)
    }

    /**
     * 
     * @param {VoiceCommandUserMessage} value 
     * @returns {HRESULT} 
     */
    put_Message(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VoiceCommandUserMessage} 
     */
    get_RepeatMessage() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VoiceCommandUserMessage(value)
    }

    /**
     * 
     * @param {VoiceCommandUserMessage} value 
     * @returns {HRESULT} 
     */
    put_RepeatMessage(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppLaunchArgument() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_AppLaunchArgument(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<VoiceCommandContentTile>} 
     */
    get_VoiceCommandContentTiles() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(VoiceCommandContentTile, value)
    }
}
