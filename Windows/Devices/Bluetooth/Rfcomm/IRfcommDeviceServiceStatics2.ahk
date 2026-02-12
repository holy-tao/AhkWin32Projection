#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.Rfcomm
 * @version WindowsRuntime 1.4
 */
class IRfcommDeviceServiceStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRfcommDeviceServiceStatics2
     * @type {Guid}
     */
    static IID => Guid("{aa8cb1c9-e78d-4be4-8076-0a3d87a0a05f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeviceSelectorForBluetoothDevice", "GetDeviceSelectorForBluetoothDeviceWithCacheMode", "GetDeviceSelectorForBluetoothDeviceAndServiceId", "GetDeviceSelectorForBluetoothDeviceAndServiceIdWithCacheMode"]

    /**
     * 
     * @param {BluetoothDevice} bluetoothDevice_ 
     * @returns {HSTRING} 
     */
    GetDeviceSelectorForBluetoothDevice(bluetoothDevice_) {
        selector_ := HSTRING()
        result := ComCall(6, this, "ptr", bluetoothDevice_, "ptr", selector_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return selector_
    }

    /**
     * 
     * @param {BluetoothDevice} bluetoothDevice_ 
     * @param {Integer} cacheMode_ 
     * @returns {HSTRING} 
     */
    GetDeviceSelectorForBluetoothDeviceWithCacheMode(bluetoothDevice_, cacheMode_) {
        selector_ := HSTRING()
        result := ComCall(7, this, "ptr", bluetoothDevice_, "int", cacheMode_, "ptr", selector_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return selector_
    }

    /**
     * 
     * @param {BluetoothDevice} bluetoothDevice_ 
     * @param {RfcommServiceId} serviceId 
     * @returns {HSTRING} 
     */
    GetDeviceSelectorForBluetoothDeviceAndServiceId(bluetoothDevice_, serviceId) {
        selector_ := HSTRING()
        result := ComCall(8, this, "ptr", bluetoothDevice_, "ptr", serviceId, "ptr", selector_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return selector_
    }

    /**
     * 
     * @param {BluetoothDevice} bluetoothDevice_ 
     * @param {RfcommServiceId} serviceId 
     * @param {Integer} cacheMode_ 
     * @returns {HSTRING} 
     */
    GetDeviceSelectorForBluetoothDeviceAndServiceIdWithCacheMode(bluetoothDevice_, serviceId, cacheMode_) {
        selector_ := HSTRING()
        result := ComCall(9, this, "ptr", bluetoothDevice_, "ptr", serviceId, "int", cacheMode_, "ptr", selector_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return selector_
    }
}
