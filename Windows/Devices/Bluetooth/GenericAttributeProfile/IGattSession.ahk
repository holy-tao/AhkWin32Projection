#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\BluetoothDeviceId.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattSession extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattSession
     * @type {Guid}
     */
    static IID => Guid("{d23b5143-e04e-4c24-999c-9c256f9856b1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceId", "get_CanMaintainConnection", "put_MaintainConnection", "get_MaintainConnection", "get_MaxPduSize", "get_SessionStatus", "add_MaxPduSizeChanged", "remove_MaxPduSizeChanged", "add_SessionStatusChanged", "remove_SessionStatusChanged"]

    /**
     * @type {BluetoothDeviceId} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * @type {Boolean} 
     */
    CanMaintainConnection {
        get => this.get_CanMaintainConnection()
    }

    /**
     * @type {Boolean} 
     */
    MaintainConnection {
        get => this.get_MaintainConnection()
        set => this.put_MaintainConnection(value)
    }

    /**
     * @type {Integer} 
     */
    MaxPduSize {
        get => this.get_MaxPduSize()
    }

    /**
     * @type {Integer} 
     */
    SessionStatus {
        get => this.get_SessionStatus()
    }

    /**
     * 
     * @returns {BluetoothDeviceId} 
     */
    get_DeviceId() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BluetoothDeviceId(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanMaintainConnection() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_MaintainConnection(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_MaintainConnection() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxPduSize() {
        result := ComCall(10, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SessionStatus() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<GattSession, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MaxPduSizeChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(12, this, "ptr", handler, "ptr", token, "int")
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
    remove_MaxPduSizeChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(13, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<GattSession, GattSessionStatusChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SessionStatusChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(14, this, "ptr", handler, "ptr", token, "int")
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
    remove_SessionStatusChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(15, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
