#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\II2cDevice.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\II2cDeviceStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a communications channel to a device on an inter-integrated circuit (I<sup>2</sup> C) bus.
 * @remarks
 * To get an instance of I2cDevice, use the [I2cDevice.FromIdAsync](i2cdevice_fromidasync_1693757112.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.i2cdevice
 * @namespace Windows.Devices.I2c
 * @version WindowsRuntime 1.4
 */
class I2cDevice extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => II2cDevice

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => II2cDevice.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves an Advanced Query Syntax (AQS) string for the inter-integrated circuit (I<sup>2</sup> C) bus that has the specified friendly name. You can use this string with the [DeviceInformation.FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md) method to get a [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) object for that bus.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.i2cdevice.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!I2cDevice.HasProp("__II2cDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.I2c.I2cDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, II2cDeviceStatics.IID)
            I2cDevice.__II2cDeviceStatics := II2cDeviceStatics(factoryPtr)
        }

        return I2cDevice.__II2cDeviceStatics.GetDeviceSelector()
    }

    /**
     * Retrieves an Advanced Query Syntax (AQS) string for all of the inter-integrated circuit (I<sup>2</sup> C) bus controllers on the system. You can use this string with the [DeviceInformation.FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md) method to get [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) objects for those bus controllers.
     * @param {HSTRING} friendlyName 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.i2cdevice.getdeviceselector
     */
    static GetDeviceSelectorFromFriendlyName(friendlyName) {
        if (!I2cDevice.HasProp("__II2cDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.I2c.I2cDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, II2cDeviceStatics.IID)
            I2cDevice.__II2cDeviceStatics := II2cDeviceStatics(factoryPtr)
        }

        return I2cDevice.__II2cDeviceStatics.GetDeviceSelectorFromFriendlyName(friendlyName)
    }

    /**
     * Retrieves an [I2cDevice](i2cdevice.md) object asynchronously for the inter-integrated circuit (I<sup>2</sup> C) bus controller that has the specified plug and play device identifier, using the specified connection settings.
     * @param {HSTRING} deviceId The plug and play device identifier of the I<sup>2</sup> C bus controller for which you want to create an [I2cDevice](i2cdevice.md) object.
     * @param {I2cConnectionSettings} settings The connection settings to use for communication with the I<sup>2</sup> C bus controller that *deviceId* specifies.
     * @returns {IAsyncOperation<I2cDevice>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.i2cdevice.fromidasync
     */
    static FromIdAsync(deviceId, settings) {
        if (!I2cDevice.HasProp("__II2cDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.I2c.I2cDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, II2cDeviceStatics.IID)
            I2cDevice.__II2cDeviceStatics := II2cDeviceStatics(factoryPtr)
        }

        return I2cDevice.__II2cDeviceStatics.FromIdAsync(deviceId, settings)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the plug and play device identifier of the inter-integrated circuit (I<sup>2</sup> C) bus controller for the device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.i2cdevice.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets the connection settings used for communication with the inter-integrated circuit (I<sup>2</sup> C) device.
     * @remarks
     * If you try to change the values of the [I2cConnectionSettings](i2cconnectionsettings.md) object that you get through this property, those changes will have no effect. You cannot change the connection settings after you create the [I2cDevice](i2cdevice.md) object. To specify the connection settings, use the [I2cConnectionSettings(Int32)](i2cconnectionsettings_i2cconnectionsettings_745845612.md) constructor to create an [I2cConnectionSettings](i2cconnectionsettings.md) object, and set the property values for that [I2cConnectionSettings](i2cconnectionsettings.md) object before you pass it to the [FromIdAsync](i2cdevice_fromidasync_1693757112.md) method to create the [I2cDevice](i2cdevice.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.i2cdevice.connectionsettings
     * @type {I2cConnectionSettings} 
     */
    ConnectionSettings {
        get => this.get_ConnectionSettings()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__II2cDevice")) {
            if ((queryResult := this.QueryInterface(II2cDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__II2cDevice := II2cDevice(outPtr)
        }

        return this.__II2cDevice.get_DeviceId()
    }

    /**
     * 
     * @returns {I2cConnectionSettings} 
     */
    get_ConnectionSettings() {
        if (!this.HasProp("__II2cDevice")) {
            if ((queryResult := this.QueryInterface(II2cDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__II2cDevice := II2cDevice(outPtr)
        }

        return this.__II2cDevice.get_ConnectionSettings()
    }

    /**
     * Writes data to the inter-integrated circuit (I<sup>2</sup> C) bus on which the device is connected, based on the bus address specified in the [I2cConnectionSetting](i2cconnectionsettings.md)s object that you used to create the [I2cDevice](i2cdevice.md) object.
     * @param {Integer} buffer_length 
     * @param {Pointer<Integer>} buffer A buffer that contains the data that you want to write to the I<sup>2</sup> C device. This data should not include the bus address.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.i2cdevice.write
     */
    Write(buffer_length, buffer) {
        if (!this.HasProp("__II2cDevice")) {
            if ((queryResult := this.QueryInterface(II2cDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__II2cDevice := II2cDevice(outPtr)
        }

        return this.__II2cDevice.Write(buffer_length, buffer)
    }

    /**
     * Writes data to the inter-integrated circuit (I<sup>2</sup> C) bus on which the device is connected, and returns information about the success of the operation that you can use for error handling.
     * @param {Integer} buffer_length 
     * @param {Pointer<Integer>} buffer A buffer that contains the data that you want to write to the I<sup>2</sup> C device. This data should not include the bus address.
     * @returns {I2cTransferResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.i2cdevice.writepartial
     */
    WritePartial(buffer_length, buffer) {
        if (!this.HasProp("__II2cDevice")) {
            if ((queryResult := this.QueryInterface(II2cDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__II2cDevice := II2cDevice(outPtr)
        }

        return this.__II2cDevice.WritePartial(buffer_length, buffer)
    }

    /**
     * Reads data from the inter-integrated circuit (I<sup>2</sup> C) bus on which the device is connected into the specified buffer.
     * @param {Pointer<Integer>} buffer_length 
     * @param {Pointer<Pointer<Integer>>} buffer The buffer to which you want to read the data from the I<sup>2</sup> C bus. The length of the buffer determines how much data to request from the device.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.i2cdevice.read
     */
    Read(buffer_length, buffer) {
        if (!this.HasProp("__II2cDevice")) {
            if ((queryResult := this.QueryInterface(II2cDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__II2cDevice := II2cDevice(outPtr)
        }

        return this.__II2cDevice.Read(buffer_length, buffer)
    }

    /**
     * Reads data from the inter-integrated circuit (I<sup>2</sup> C) bus on which the device is connected into the specified buffer, and returns information about the success of the operation that you can use for error handling.
     * @param {Pointer<Integer>} buffer_length 
     * @param {Pointer<Pointer<Integer>>} buffer The buffer to which you want to read the data from the I<sup>2</sup> C bus. The length of the buffer determines how much data to request from the device.
     * @returns {I2cTransferResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.i2cdevice.readpartial
     */
    ReadPartial(buffer_length, buffer) {
        if (!this.HasProp("__II2cDevice")) {
            if ((queryResult := this.QueryInterface(II2cDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__II2cDevice := II2cDevice(outPtr)
        }

        return this.__II2cDevice.ReadPartial(buffer_length, buffer)
    }

    /**
     * Performs an atomic operation to write data to and then read data from the inter-integrated circuit (I<sup>2</sup> C) bus on which the device is connected, and sends a restart condition between the write and read operations.
     * @param {Integer} writeBuffer_length 
     * @param {Pointer<Integer>} writeBuffer A buffer that contains the data that you want to write to the I<sup>2</sup> C device. This data should not include the bus address.
     * @param {Pointer<Integer>} readBuffer_length 
     * @param {Pointer<Pointer<Integer>>} readBuffer The buffer to which you want to read the data from the I<sup>2</sup> C bus. The length of the buffer determines how much data to request from the device.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.i2cdevice.writeread
     */
    WriteRead(writeBuffer_length, writeBuffer, readBuffer_length, readBuffer) {
        if (!this.HasProp("__II2cDevice")) {
            if ((queryResult := this.QueryInterface(II2cDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__II2cDevice := II2cDevice(outPtr)
        }

        return this.__II2cDevice.WriteRead(writeBuffer_length, writeBuffer, readBuffer_length, readBuffer)
    }

    /**
     * Performs an atomic operation to write data to and then read data from the inter-integrated circuit (I<sup>2</sup> C) bus on which the device is connected, and returns information about the success of the operation that you can use for error handling.
     * @param {Integer} writeBuffer_length 
     * @param {Pointer<Integer>} writeBuffer A buffer that contains the data that you want to write to the I<sup>2</sup> C device. This data should not include the bus address.
     * @param {Pointer<Integer>} readBuffer_length 
     * @param {Pointer<Pointer<Integer>>} readBuffer The buffer to which you want to read the data from the I<sup>2</sup> C bus. The length of the buffer determines how much data to request from the device.
     * @returns {I2cTransferResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.i2cdevice.writereadpartial
     */
    WriteReadPartial(writeBuffer_length, writeBuffer, readBuffer_length, readBuffer) {
        if (!this.HasProp("__II2cDevice")) {
            if ((queryResult := this.QueryInterface(II2cDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__II2cDevice := II2cDevice(outPtr)
        }

        return this.__II2cDevice.WriteReadPartial(writeBuffer_length, writeBuffer, readBuffer_length, readBuffer)
    }

    /**
     * Closes the connection to the inter-integrated circuit (I<sup>2</sup> C) device.
     * @remarks
     * You cannot call [Close](../windows.foundation/iclosable_close_811482585.md) methods through Visual C++ component extensions (C++/CX) on Windows Runtime class instances where the class implemented [IClosable](../windows.foundation/iclosable.md). Instead, Visual C++ component extensions (C++/CX) code for runtime classes should call the destructor or set the last reference to **null**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.i2cdevice.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
