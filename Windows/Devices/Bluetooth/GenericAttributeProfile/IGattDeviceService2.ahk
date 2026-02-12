#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\BluetoothLEDevice.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\GattDeviceService.ahk
#Include .\GattCharacteristic.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattDeviceService2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattDeviceService2
     * @type {Guid}
     */
    static IID => Guid("{fc54520b-0b0d-4708-bae0-9ffd9489bc59}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Device", "get_ParentServices", "GetAllCharacteristics", "GetAllIncludedServices"]

    /**
     * @type {BluetoothLEDevice} 
     */
    Device {
        get => this.get_Device()
    }

    /**
     * @type {IVectorView<GattDeviceService>} 
     */
    ParentServices {
        get => this.get_ParentServices()
    }

    /**
     * 
     * @returns {BluetoothLEDevice} 
     */
    get_Device() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BluetoothLEDevice(value)
    }

    /**
     * 
     * @returns {IVectorView<GattDeviceService>} 
     */
    get_ParentServices() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(GattDeviceService, value)
    }

    /**
     * 
     * @returns {IVectorView<GattCharacteristic>} 
     */
    GetAllCharacteristics() {
        result := ComCall(8, this, "ptr*", &characteristics := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(GattCharacteristic, characteristics)
    }

    /**
     * 
     * @returns {IVectorView<GattDeviceService>} 
     */
    GetAllIncludedServices() {
        result := ComCall(9, this, "ptr*", &includedServices := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(GattDeviceService, includedServices)
    }
}
