#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBluetoothClassOfDevice.ahk
#Include .\IBluetoothClassOfDeviceStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides functionality to determine the Bluetooth Class Of Device (Bluetooth COD) information for a device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothclassofdevice
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class BluetoothClassOfDevice extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBluetoothClassOfDevice

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBluetoothClassOfDevice.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [BluetoothClassOfDevice](bluetoothclassofdevice.md) object from a raw integer value representing the Major Class, Minor Class and Service Capabilities of the device.
     * @param {Integer} rawValue The raw integer value from which to create the BluetoothClassOfDevice object.
     * @returns {BluetoothClassOfDevice} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothclassofdevice.fromrawvalue
     */
    static FromRawValue(rawValue) {
        if (!BluetoothClassOfDevice.HasProp("__IBluetoothClassOfDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothClassOfDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothClassOfDeviceStatics.IID)
            BluetoothClassOfDevice.__IBluetoothClassOfDeviceStatics := IBluetoothClassOfDeviceStatics(factoryPtr)
        }

        return BluetoothClassOfDevice.__IBluetoothClassOfDeviceStatics.FromRawValue(rawValue)
    }

    /**
     * Creates a [BluetoothClassOfDevice](bluetoothclassofdevice.md) object by supplying values for [BluetoothMajorClass](bluetoothmajorclass.md), [BluetoothMinorClass](bluetoothminorclass.md) and [BluetoothClassOfDevice](bluetoothclassofdevice.md).
     * @param {Integer} majorClass One of the enumeration values that specifies the device's main function.
     * @param {Integer} minorClass One of the enumeration values that specifies the minor class value to be used.
     * @param {Integer} serviceCapabilities One of the enumeration values that specifies the service the device supports.
     * @returns {BluetoothClassOfDevice} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothclassofdevice.fromparts
     */
    static FromParts(majorClass, minorClass, serviceCapabilities) {
        if (!BluetoothClassOfDevice.HasProp("__IBluetoothClassOfDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothClassOfDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothClassOfDeviceStatics.IID)
            BluetoothClassOfDevice.__IBluetoothClassOfDeviceStatics := IBluetoothClassOfDeviceStatics(factoryPtr)
        }

        return BluetoothClassOfDevice.__IBluetoothClassOfDeviceStatics.FromParts(majorClass, minorClass, serviceCapabilities)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the Bluetooth Class Of Device information, represented as an integer value.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothclassofdevice.rawvalue
     * @type {Integer} 
     */
    RawValue {
        get => this.get_RawValue()
    }

    /**
     * Gets the Major Class code of the Bluetooth device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothclassofdevice.majorclass
     * @type {Integer} 
     */
    MajorClass {
        get => this.get_MajorClass()
    }

    /**
     * Gets the Minor Class code of the device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothclassofdevice.minorclass
     * @type {Integer} 
     */
    MinorClass {
        get => this.get_MinorClass()
    }

    /**
     * Gets the service capabilities of the device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothclassofdevice.servicecapabilities
     * @type {Integer} 
     */
    ServiceCapabilities {
        get => this.get_ServiceCapabilities()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RawValue() {
        if (!this.HasProp("__IBluetoothClassOfDevice")) {
            if ((queryResult := this.QueryInterface(IBluetoothClassOfDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothClassOfDevice := IBluetoothClassOfDevice(outPtr)
        }

        return this.__IBluetoothClassOfDevice.get_RawValue()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MajorClass() {
        if (!this.HasProp("__IBluetoothClassOfDevice")) {
            if ((queryResult := this.QueryInterface(IBluetoothClassOfDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothClassOfDevice := IBluetoothClassOfDevice(outPtr)
        }

        return this.__IBluetoothClassOfDevice.get_MajorClass()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinorClass() {
        if (!this.HasProp("__IBluetoothClassOfDevice")) {
            if ((queryResult := this.QueryInterface(IBluetoothClassOfDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothClassOfDevice := IBluetoothClassOfDevice(outPtr)
        }

        return this.__IBluetoothClassOfDevice.get_MinorClass()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ServiceCapabilities() {
        if (!this.HasProp("__IBluetoothClassOfDevice")) {
            if ((queryResult := this.QueryInterface(IBluetoothClassOfDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothClassOfDevice := IBluetoothClassOfDevice(outPtr)
        }

        return this.__IBluetoothClassOfDevice.get_ServiceCapabilities()
    }

;@endregion Instance Methods
}
