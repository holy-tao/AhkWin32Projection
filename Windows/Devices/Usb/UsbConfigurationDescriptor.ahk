#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUsbConfigurationDescriptor.ahk
#Include .\IUsbConfigurationDescriptorStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Derives information from the first 9 bytes of a USB configuration descriptor. The information includes the power capabilities of the device when the configuration is active and the number of interfaces included in that configuration. For an explanation of a configuration descriptor, Section 9.6.3 Universal Serial Bus Specification. For information about descriptor fields, see:
  * 
  * 
  * + Table 9.15 in the Universal Serial Bus 3.0 Specification
  * + Table 9.10 in the Universal Serial Bus Specification (version 2.0)
 * @remarks
 * A USB device exposes its capabilities in the form of a USB configuration. A USB configuration is described in a configuration descriptor that the UsbConfigurationDescriptor class represents. For information about the descriptor, see [USB configuration descriptors](/windows-hardware/drivers/ddi/content/index).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbconfigurationdescriptor
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class UsbConfigurationDescriptor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUsbConfigurationDescriptor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUsbConfigurationDescriptor.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves the first 9 bytes of a USB configuration descriptor in a [UsbConfigurationDescriptor](usbconfigurationdescriptor.md) object that is contained in a [UsbDescriptor](usbdescriptor.md) object.
     * @param {UsbDescriptor} descriptor The [UsbDescriptor](usbdescriptor.md) object to parse.
     * @param {Pointer<UsbConfigurationDescriptor>} parsed Receives a [UsbConfigurationDescriptor](usbconfigurationdescriptor.md) object.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbconfigurationdescriptor.tryparse
     */
    static TryParse(descriptor, parsed) {
        if (!UsbConfigurationDescriptor.HasProp("__IUsbConfigurationDescriptorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Usb.UsbConfigurationDescriptor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUsbConfigurationDescriptorStatics.IID)
            UsbConfigurationDescriptor.__IUsbConfigurationDescriptorStatics := IUsbConfigurationDescriptorStatics(factoryPtr)
        }

        return UsbConfigurationDescriptor.__IUsbConfigurationDescriptorStatics.TryParse(descriptor, parsed)
    }

    /**
     * Parses the specified USB descriptor and returns fields of a USB configuration descriptor.
     * @param {UsbDescriptor} descriptor A [UsbDescriptor](usbdescriptor.md) object that contains first 9 bytes of the USB configuration descriptor.
     * @returns {UsbConfigurationDescriptor} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbconfigurationdescriptor.parse
     */
    static Parse(descriptor) {
        if (!UsbConfigurationDescriptor.HasProp("__IUsbConfigurationDescriptorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Usb.UsbConfigurationDescriptor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUsbConfigurationDescriptorStatics.IID)
            UsbConfigurationDescriptor.__IUsbConfigurationDescriptorStatics := IUsbConfigurationDescriptorStatics(factoryPtr)
        }

        return UsbConfigurationDescriptor.__IUsbConfigurationDescriptorStatics.Parse(descriptor)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the **bConfigurationValue** field of a USB configuration descriptor. The value is the number that identifies the configuration.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbconfigurationdescriptor.configurationvalue
     * @type {Integer} 
     */
    ConfigurationValue {
        get => this.get_ConfigurationValue()
    }

    /**
     * Gets the **bMaxPower** field of a USB configuration descriptor. The value indicates the maximum power (in milliamp units) that the device can draw from the bus, when the device is bus-powered.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbconfigurationdescriptor.maxpowermilliamps
     * @type {Integer} 
     */
    MaxPowerMilliamps {
        get => this.get_MaxPowerMilliamps()
    }

    /**
     * Gets the D6 bit of the **bmAttributes** field in the USB configuration. This value indicates whether the device is drawing power from a local source or the bus.
     * @remarks
     * If **SelfPowered** is true, the device is drawing power from a local source, and also some power from the bus. Get the **MaxPowerMilliamps** property value to determine the amount of power the device is drawing from the bus.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbconfigurationdescriptor.selfpowered
     * @type {Boolean} 
     */
    SelfPowered {
        get => this.get_SelfPowered()
    }

    /**
     * Gets the D5 bit value of the **bmAttributes** field in the USB configuration descriptor. The value indicates whether the device can send a resume signal to wake up itself or the host system from a low power state.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbconfigurationdescriptor.remotewakeup
     * @type {Boolean} 
     */
    RemoteWakeup {
        get => this.get_RemoteWakeup()
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
    get_ConfigurationValue() {
        if (!this.HasProp("__IUsbConfigurationDescriptor")) {
            if ((queryResult := this.QueryInterface(IUsbConfigurationDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbConfigurationDescriptor := IUsbConfigurationDescriptor(outPtr)
        }

        return this.__IUsbConfigurationDescriptor.get_ConfigurationValue()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxPowerMilliamps() {
        if (!this.HasProp("__IUsbConfigurationDescriptor")) {
            if ((queryResult := this.QueryInterface(IUsbConfigurationDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbConfigurationDescriptor := IUsbConfigurationDescriptor(outPtr)
        }

        return this.__IUsbConfigurationDescriptor.get_MaxPowerMilliamps()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SelfPowered() {
        if (!this.HasProp("__IUsbConfigurationDescriptor")) {
            if ((queryResult := this.QueryInterface(IUsbConfigurationDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbConfigurationDescriptor := IUsbConfigurationDescriptor(outPtr)
        }

        return this.__IUsbConfigurationDescriptor.get_SelfPowered()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_RemoteWakeup() {
        if (!this.HasProp("__IUsbConfigurationDescriptor")) {
            if ((queryResult := this.QueryInterface(IUsbConfigurationDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbConfigurationDescriptor := IUsbConfigurationDescriptor(outPtr)
        }

        return this.__IUsbConfigurationDescriptor.get_RemoteWakeup()
    }

;@endregion Instance Methods
}
