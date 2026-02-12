#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBluetoothDeviceId.ahk
#Include .\IBluetoothDeviceIdStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a bluetooth device ID.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothdeviceid
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class BluetoothDeviceId extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBluetoothDeviceId

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBluetoothDeviceId.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a BluetoothDeviceId object from the device ID.
     * @param {HSTRING} deviceId The device ID.
     * @returns {BluetoothDeviceId} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothdeviceid.fromid
     */
    static FromId(deviceId) {
        if (!BluetoothDeviceId.HasProp("__IBluetoothDeviceIdStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothDeviceId")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothDeviceIdStatics.IID)
            BluetoothDeviceId.__IBluetoothDeviceIdStatics := IBluetoothDeviceIdStatics(factoryPtr)
        }

        return BluetoothDeviceId.__IBluetoothDeviceIdStatics.FromId(deviceId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the bluetooth device ID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothdeviceid.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets a boolean indicating if this is a classic device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothdeviceid.isclassicdevice
     * @type {Boolean} 
     */
    IsClassicDevice {
        get => this.get_IsClassicDevice()
    }

    /**
     * Gets a boolean indicating if this is a LowEnergy device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothdeviceid.islowenergydevice
     * @type {Boolean} 
     */
    IsLowEnergyDevice {
        get => this.get_IsLowEnergyDevice()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IBluetoothDeviceId")) {
            if ((queryResult := this.QueryInterface(IBluetoothDeviceId.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothDeviceId := IBluetoothDeviceId(outPtr)
        }

        return this.__IBluetoothDeviceId.get_Id()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsClassicDevice() {
        if (!this.HasProp("__IBluetoothDeviceId")) {
            if ((queryResult := this.QueryInterface(IBluetoothDeviceId.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothDeviceId := IBluetoothDeviceId(outPtr)
        }

        return this.__IBluetoothDeviceId.get_IsClassicDevice()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsLowEnergyDevice() {
        if (!this.HasProp("__IBluetoothDeviceId")) {
            if ((queryResult := this.QueryInterface(IBluetoothDeviceId.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothDeviceId := IBluetoothDeviceId(outPtr)
        }

        return this.__IBluetoothDeviceId.get_IsLowEnergyDevice()
    }

;@endregion Instance Methods
}
