#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\GattCharacteristic.ahk
#Include .\GattDeviceService.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattDeviceService extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattDeviceService
     * @type {Guid}
     */
    static IID => Guid("{ac7b7c05-b33c-47cf-990f-6b8f5577df71}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCharacteristics", "GetIncludedServices", "get_DeviceId", "get_Uuid", "get_AttributeHandle"]

    /**
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * @type {Guid} 
     */
    Uuid {
        get => this.get_Uuid()
    }

    /**
     * @type {Integer} 
     */
    AttributeHandle {
        get => this.get_AttributeHandle()
    }

    /**
     * 
     * @param {Guid} characteristicUuid 
     * @returns {IVectorView<GattCharacteristic>} 
     */
    GetCharacteristics(characteristicUuid) {
        result := ComCall(6, this, "ptr", characteristicUuid, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(GattCharacteristic, value)
    }

    /**
     * 
     * @param {Guid} serviceUuid 
     * @returns {IVectorView<GattDeviceService>} 
     */
    GetIncludedServices(serviceUuid) {
        result := ComCall(7, this, "ptr", serviceUuid, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(GattDeviceService, value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_Uuid() {
        value := Guid()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AttributeHandle() {
        result := ComCall(10, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
