#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\GattSession.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattSubscribedClient extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattSubscribedClient
     * @type {Guid}
     */
    static IID => Guid("{736e9001-15a4-4ec2-9248-e3f20d463be9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Session", "get_MaxNotificationSize", "add_MaxNotificationSizeChanged", "remove_MaxNotificationSizeChanged"]

    /**
     * @type {GattSession} 
     */
    Session {
        get => this.get_Session()
    }

    /**
     * @type {Integer} 
     */
    MaxNotificationSize {
        get => this.get_MaxNotificationSize()
    }

    /**
     * 
     * @returns {GattSession} 
     */
    get_Session() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GattSession(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxNotificationSize() {
        result := ComCall(7, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<GattSubscribedClient, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MaxNotificationSizeChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(8, this, "ptr", handler, "ptr", token, "int")
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
    remove_MaxNotificationSizeChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
