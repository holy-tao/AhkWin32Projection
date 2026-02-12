#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\BluetoothClassOfDevice.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class IBluetoothClassOfDeviceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBluetoothClassOfDeviceStatics
     * @type {Guid}
     */
    static IID => Guid("{e46135bd-0fa2-416c-91b4-c1e48ca061c1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FromRawValue", "FromParts"]

    /**
     * 
     * @param {Integer} rawValue 
     * @returns {BluetoothClassOfDevice} 
     */
    FromRawValue(rawValue) {
        result := ComCall(6, this, "uint", rawValue, "ptr*", &classOfDevice := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BluetoothClassOfDevice(classOfDevice)
    }

    /**
     * 
     * @param {Integer} majorClass 
     * @param {Integer} minorClass 
     * @param {Integer} serviceCapabilities 
     * @returns {BluetoothClassOfDevice} 
     */
    FromParts(majorClass, minorClass, serviceCapabilities) {
        result := ComCall(7, this, "int", majorClass, "int", minorClass, "uint", serviceCapabilities, "ptr*", &classOfDevice := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BluetoothClassOfDevice(classOfDevice)
    }
}
