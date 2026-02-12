#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include .\User.ahk
#Include ..\Foundation\EventRegistrationToken.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IUserDeviceAssociationStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserDeviceAssociationStatics
     * @type {Guid}
     */
    static IID => Guid("{7e491e14-f85a-4c07-8da9-7fe3d0542343}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindUserFromDeviceId", "add_UserDeviceAssociationChanged", "remove_UserDeviceAssociationChanged"]

    /**
     * 
     * @param {HSTRING} deviceId 
     * @returns {User} 
     */
    FindUserFromDeviceId(deviceId) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(6, this, "ptr", deviceId, "ptr*", &user_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return User(user_)
    }

    /**
     * 
     * @param {EventHandler<UserDeviceAssociationChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_UserDeviceAssociationChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(7, this, "ptr", handler, "ptr", token, "int")
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
    remove_UserDeviceAssociationChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(8, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
