#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattWriteRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattWriteRequest
     * @type {Guid}
     */
    static IID => Guid("{aeb6a9ed-de2f-4fc2-a9a8-94ea7844f13d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Value", "get_Offset", "get_Option", "get_State", "add_StateChanged", "remove_StateChanged", "Respond", "RespondWithProtocolError"]

    /**
     * @type {IBuffer} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * @type {Integer} 
     */
    Offset {
        get => this.get_Offset()
    }

    /**
     * @type {Integer} 
     */
    Option {
        get => this.get_Option()
    }

    /**
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Value() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Offset() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Option() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<GattWriteRequest, GattRequestStateChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StateChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(10, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StateChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Respond() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} protocolError 
     * @returns {HRESULT} 
     */
    RespondWithProtocolError(protocolError) {
        result := ComCall(13, this, "char", protocolError, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
