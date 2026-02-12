#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICustomDevice.ahk
#Include .\ICustomDeviceStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a custom device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.custom.customdevice
 * @namespace Windows.Devices.Custom
 * @version WindowsRuntime 1.4
 */
class CustomDevice extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICustomDevice

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICustomDevice.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets a device selector.
     * @remarks
     * For more info about the Device Interface Class [GUID](/windows/win32/api/guiddef/ns-guiddef-guid), see [Overview of Device Interface Classes](/windows-hardware/drivers/install/overview-of-device-interface-classes).
     * @param {Guid} classGuid The Device Interface Class GUID of the device interface to create a device selector for.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.custom.customdevice.getdeviceselector
     */
    static GetDeviceSelector(classGuid) {
        if (!CustomDevice.HasProp("__ICustomDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Custom.CustomDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICustomDeviceStatics.IID)
            CustomDevice.__ICustomDeviceStatics := ICustomDeviceStatics(factoryPtr)
        }

        return CustomDevice.__ICustomDeviceStatics.GetDeviceSelector(classGuid)
    }

    /**
     * Creates a [CustomDevice](customdevice.md) object asynchronously for the specified [DeviceInformation.Id](../windows.devices.enumeration/deviceinformation_id.md).
     * @param {HSTRING} deviceId The [DeviceInformation.Id](../windows.devices.enumeration/deviceinformation_id.md) of the device .
     * @param {Integer} desiredAccess The desired access.
     * @param {Integer} sharingMode The sharing mode.
     * @returns {IAsyncOperation<CustomDevice>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.custom.customdevice.fromidasync
     */
    static FromIdAsync(deviceId, desiredAccess, sharingMode) {
        if (!CustomDevice.HasProp("__ICustomDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Custom.CustomDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICustomDeviceStatics.IID)
            CustomDevice.__ICustomDeviceStatics := ICustomDeviceStatics(factoryPtr)
        }

        return CustomDevice.__ICustomDeviceStatics.FromIdAsync(deviceId, desiredAccess, sharingMode)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The input stream.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.custom.customdevice.inputstream
     * @type {IInputStream} 
     */
    InputStream {
        get => this.get_InputStream()
    }

    /**
     * The output stream.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.custom.customdevice.outputstream
     * @type {IOutputStream} 
     */
    OutputStream {
        get => this.get_OutputStream()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IInputStream} 
     */
    get_InputStream() {
        if (!this.HasProp("__ICustomDevice")) {
            if ((queryResult := this.QueryInterface(ICustomDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICustomDevice := ICustomDevice(outPtr)
        }

        return this.__ICustomDevice.get_InputStream()
    }

    /**
     * 
     * @returns {IOutputStream} 
     */
    get_OutputStream() {
        if (!this.HasProp("__ICustomDevice")) {
            if ((queryResult := this.QueryInterface(ICustomDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICustomDevice := ICustomDevice(outPtr)
        }

        return this.__ICustomDevice.get_OutputStream()
    }

    /**
     * Sends an IO control code.
     * @remarks
     * SendIOControlAsync is like [TrySendIOControlAsync](customdevice_trysendiocontrolasync_260174567.md), except this method throws an exception if the operation fails. If you want to handle any exceptions that occur during the operation, use the SendIOControlAsync method. If you just want to be notified whether the operation is successful, but not handle any specific exceptions, use [TrySendIOControlAsync](customdevice_trysendiocontrolasync_260174567.md).
     * @param {IIOControlCode} ioControlCode_ The IO control code.
     * @param {IBuffer} inputBuffer The input buffer.
     * @param {IBuffer} outputBuffer The output buffer.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.custom.customdevice.sendiocontrolasync
     */
    SendIOControlAsync(ioControlCode_, inputBuffer, outputBuffer) {
        if (!this.HasProp("__ICustomDevice")) {
            if ((queryResult := this.QueryInterface(ICustomDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICustomDevice := ICustomDevice(outPtr)
        }

        return this.__ICustomDevice.SendIOControlAsync(ioControlCode_, inputBuffer, outputBuffer)
    }

    /**
     * Sends an IO control code. A return value indicates whether the operation succeeded.
     * @remarks
     * TrySendIOControlAsync is like [SendIOControlAsync](customdevice_sendiocontrolasync_1607685722.md), except this method doesn't throw an exception if the operation fails. Instead, it returns **false**. If you want to handle any exceptions that occur during the operation, use the [SendIOControlAsync](customdevice_sendiocontrolasync_1607685722.md) method.
     * @param {IIOControlCode} ioControlCode_ The IO control code.
     * @param {IBuffer} inputBuffer The input buffer.
     * @param {IBuffer} outputBuffer The output buffer.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.custom.customdevice.trysendiocontrolasync
     */
    TrySendIOControlAsync(ioControlCode_, inputBuffer, outputBuffer) {
        if (!this.HasProp("__ICustomDevice")) {
            if ((queryResult := this.QueryInterface(ICustomDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICustomDevice := ICustomDevice(outPtr)
        }

        return this.__ICustomDevice.TrySendIOControlAsync(ioControlCode_, inputBuffer, outputBuffer)
    }

;@endregion Instance Methods
}
