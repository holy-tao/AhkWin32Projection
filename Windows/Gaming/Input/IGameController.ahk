#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include .\Headset.ahk
#Include ..\..\System\User.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * The core interface required to be implemented by all controller devices, regardless of their actual type (gamepad, racing wheel, flight stick, and so on). This interface exists mainly to support extensibility for game controllers, which allows OEMs (Original Equipment Manufacturers) to publish WinRT (Windows Runtime) classes that provide rich access to their device's features, while integrating into the underlying game controller device enumeration framework.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.igamecontroller
 * @namespace Windows.Gaming.Input
 * @version WindowsRuntime 1.4
 */
class IGameController extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGameController
     * @type {Guid}
     */
    static IID => Guid("{1baf6522-5f64-42c5-8267-b9fe2215bfbd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_HeadsetConnected", "remove_HeadsetConnected", "add_HeadsetDisconnected", "remove_HeadsetDisconnected", "add_UserChanged", "remove_UserChanged", "get_Headset", "get_IsWireless", "get_User"]

    /**
     * The audio headset attached to the controller.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.igamecontroller.headset
     * @type {Headset} 
     */
    Headset {
        get => this.get_Headset()
    }

    /**
     * Gets a value that indicates the wireless state of the gamepad.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.igamecontroller.iswireless
     * @type {Boolean} 
     */
    IsWireless {
        get => this.get_IsWireless()
    }

    /**
     * The user associated with the controller.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.igamecontroller.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * 
     * @param {TypedEventHandler<IGameController, Headset>} value 
     * @returns {EventRegistrationToken} 
     */
    add_HeadsetConnected(value) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", value, "ptr", token, "int")
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
    remove_HeadsetConnected(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<IGameController, Headset>} value 
     * @returns {EventRegistrationToken} 
     */
    add_HeadsetDisconnected(value) {
        token := EventRegistrationToken()
        result := ComCall(8, this, "ptr", value, "ptr", token, "int")
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
    remove_HeadsetDisconnected(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<IGameController, UserChangedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_UserChanged(value) {
        token := EventRegistrationToken()
        result := ComCall(10, this, "ptr", value, "ptr", token, "int")
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
    remove_UserChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Headset} 
     */
    get_Headset() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Headset(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsWireless() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return User(value)
    }
}
