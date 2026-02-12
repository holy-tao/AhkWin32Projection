#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUsbConfiguration.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about a USB configuration, its descriptors and the interfaces defined within that configuration. For an explanation of a USB configuration, see Section 9.6.3 in the Universal Serial Bus (USB) specification.
 * @remarks
 * Within a USB configuration, the number of interfaces and their alternate settings are variable, depending on the number of interfaces that the device supports. You can collect all that information by using: [UsbConfigurationDescriptor](usbconfigurationdescriptor.md) and [UsbConfigurationDescriptor.Descriptors](usbconfiguration_descriptors.md). The [UsbConfigurationDescriptor](usbconfigurationdescriptor.md) contains the first 9 bytes of the configuration descriptor. The [UsbConfigurationDescriptor.Descriptors](usbconfiguration_descriptors.md) object contains an array of descriptors associated with all interfaces and their settings.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbconfiguration
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class UsbConfiguration extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUsbConfiguration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUsbConfiguration.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets an array of USB interfaces available in the USB configuration.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbconfiguration.usbinterfaces
     * @type {IVectorView<UsbInterface>} 
     */
    UsbInterfaces {
        get => this.get_UsbInterfaces()
    }

    /**
     * Gets the object that contains the first 9 bytes of the descriptor associated with the USB configuration.
     * @remarks
     * The received [UsbConfigurationDescriptor](usbconfigurationdescriptor.md) object represents only the first 9 bytes of the configuration descriptor. To get the entire set of descriptors associated with a USB configuration, use the Descriptors property that gets the array of all descriptors within the configuration.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbconfiguration.configurationdescriptor
     * @type {UsbConfigurationDescriptor} 
     */
    ConfigurationDescriptor {
        get => this.get_ConfigurationDescriptor()
    }

    /**
     * Gets an array of objects that represent the full set of descriptors associated with a USB configuration.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbconfiguration.descriptors
     * @type {IVectorView<UsbDescriptor>} 
     */
    Descriptors {
        get => this.get_Descriptors()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<UsbInterface>} 
     */
    get_UsbInterfaces() {
        if (!this.HasProp("__IUsbConfiguration")) {
            if ((queryResult := this.QueryInterface(IUsbConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbConfiguration := IUsbConfiguration(outPtr)
        }

        return this.__IUsbConfiguration.get_UsbInterfaces()
    }

    /**
     * 
     * @returns {UsbConfigurationDescriptor} 
     */
    get_ConfigurationDescriptor() {
        if (!this.HasProp("__IUsbConfiguration")) {
            if ((queryResult := this.QueryInterface(IUsbConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbConfiguration := IUsbConfiguration(outPtr)
        }

        return this.__IUsbConfiguration.get_ConfigurationDescriptor()
    }

    /**
     * 
     * @returns {IVectorView<UsbDescriptor>} 
     */
    get_Descriptors() {
        if (!this.HasProp("__IUsbConfiguration")) {
            if ((queryResult := this.QueryInterface(IUsbConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbConfiguration := IUsbConfiguration(outPtr)
        }

        return this.__IUsbConfiguration.get_Descriptors()
    }

;@endregion Instance Methods
}
