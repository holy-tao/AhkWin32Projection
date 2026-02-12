#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrint3DDevice.ahk
#Include .\IPrint3DDeviceStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a 3D printer.
 * @remarks
 * Use the AQS string returned by [GetDeviceSelector](print3ddevice_getdeviceselector_838466080.md) with the [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) APIs to find all 3D printers that are connected to the device. Once you have a [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) object for a 3D printer, you can use that object's [Id](../windows.devices.enumeration/deviceinformation_id.md) property value as the *deviceId* parameter in [FromIdAsync](print3ddevice_fromidasync_1322863552.md) to create a Print3DDevice object.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.print3ddevice
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class Print3DDevice extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrint3DDevice

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrint3DDevice.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [Print3DDevice](print3ddevice.md) object that represents a 3D printer connected to the device.
     * @param {HSTRING} deviceId The device ID of the 3D printer.
     * @returns {IAsyncOperation<Print3DDevice>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.print3ddevice.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!Print3DDevice.HasProp("__IPrint3DDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.Print3DDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPrint3DDeviceStatics.IID)
            Print3DDevice.__IPrint3DDeviceStatics := IPrint3DDeviceStatics(factoryPtr)
        }

        return Print3DDevice.__IPrint3DDeviceStatics.FromIdAsync(deviceId)
    }

    /**
     * Gets an Advanced Query Syntax (AQS) string that can be used to find all 3D printers that are connected to the device.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.print3ddevice.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!Print3DDevice.HasProp("__IPrint3DDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.Print3DDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPrint3DDeviceStatics.IID)
            Print3DDevice.__IPrint3DDeviceStatics := IPrint3DDeviceStatics(factoryPtr)
        }

        return Print3DDevice.__IPrint3DDeviceStatics.GetDeviceSelector()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the [PrintSchema](printschema.md) object for obtaining capabilities and print ticket information.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.print3ddevice.printschema
     * @type {PrintSchema} 
     */
    PrintSchema {
        get => this.get_PrintSchema()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {PrintSchema} 
     */
    get_PrintSchema() {
        if (!this.HasProp("__IPrint3DDevice")) {
            if ((queryResult := this.QueryInterface(IPrint3DDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrint3DDevice := IPrint3DDevice(outPtr)
        }

        return this.__IPrint3DDevice.get_PrintSchema()
    }

;@endregion Instance Methods
}
