#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\Radios\Radio.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class IBluetoothAdapter extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBluetoothAdapter
     * @type {Guid}
     */
    static IID => Guid("{7974f04c-5f7a-4a34-9225-a855f84b1a8b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceId", "get_BluetoothAddress", "get_IsClassicSupported", "get_IsLowEnergySupported", "get_IsPeripheralRoleSupported", "get_IsCentralRoleSupported", "get_IsAdvertisementOffloadSupported", "GetRadioAsync"]

    /**
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * @type {Integer} 
     */
    BluetoothAddress {
        get => this.get_BluetoothAddress()
    }

    /**
     * @type {Boolean} 
     */
    IsClassicSupported {
        get => this.get_IsClassicSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsLowEnergySupported {
        get => this.get_IsLowEnergySupported()
    }

    /**
     * @type {Boolean} 
     */
    IsPeripheralRoleSupported {
        get => this.get_IsPeripheralRoleSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsCentralRoleSupported {
        get => this.get_IsCentralRoleSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsAdvertisementOffloadSupported {
        get => this.get_IsAdvertisementOffloadSupported()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BluetoothAddress() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsClassicSupported() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsLowEnergySupported() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPeripheralRoleSupported() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCentralRoleSupported() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAdvertisementOffloadSupported() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IAsyncOperation<Radio>} 
     */
    GetRadioAsync() {
        result := ComCall(13, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(Radio, operation)
    }
}
