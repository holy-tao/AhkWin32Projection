#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUsbEndpointDescriptor.ahk
#Include .\IUsbEndpointDescriptorStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Derives information from the USB endpoint descriptor of the endpoint, such as type, direction, and endpoint number. This object also gets the specific endpoint descriptors based on the type of endpoint. For an explanation of an endpoint descriptor, see Section 9.6.5 in the Universal Serial Bus Specification:
  * 
  * 
  * + Table 9.18 in the Universal Serial Bus 3.0 Specification
  * + Table 9.13 in the Universal Serial Bus Specification (version 2.0)
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbendpointdescriptor
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class UsbEndpointDescriptor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUsbEndpointDescriptor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUsbEndpointDescriptor.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves the USB endpoint descriptor in a [UsbEndpointDescriptor](usbendpointdescriptor.md) object that is contained in a [UsbDescriptor](usbdescriptor.md) object.
     * @param {UsbDescriptor} descriptor The [UsbDescriptor](usbdescriptor.md) object to parse.
     * @param {Pointer<UsbEndpointDescriptor>} parsed Receives a [UsbEndpointDescriptor](usbendpointdescriptor.md) object.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbendpointdescriptor.tryparse
     */
    static TryParse(descriptor, parsed) {
        if (!UsbEndpointDescriptor.HasProp("__IUsbEndpointDescriptorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Usb.UsbEndpointDescriptor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUsbEndpointDescriptorStatics.IID)
            UsbEndpointDescriptor.__IUsbEndpointDescriptorStatics := IUsbEndpointDescriptorStatics(factoryPtr)
        }

        return UsbEndpointDescriptor.__IUsbEndpointDescriptorStatics.TryParse(descriptor, parsed)
    }

    /**
     * Parses the specified USB descriptor and returns the USB endpoint descriptor in a [UsbEndpointDescriptor](usbendpointdescriptor.md) object.
     * @param {UsbDescriptor} descriptor A [UsbDescriptor](usbdescriptor.md) object that contains the USB endpoint descriptor.
     * @returns {UsbEndpointDescriptor} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbendpointdescriptor.parse
     */
    static Parse(descriptor) {
        if (!UsbEndpointDescriptor.HasProp("__IUsbEndpointDescriptorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Usb.UsbEndpointDescriptor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUsbEndpointDescriptorStatics.IID)
            UsbEndpointDescriptor.__IUsbEndpointDescriptorStatics := IUsbEndpointDescriptorStatics(factoryPtr)
        }

        return UsbEndpointDescriptor.__IUsbEndpointDescriptorStatics.Parse(descriptor)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the USB endpoint number.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbendpointdescriptor.endpointnumber
     * @type {Integer} 
     */
    EndpointNumber {
        get => this.get_EndpointNumber()
    }

    /**
     * Gets the direction of the USB endpoint.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbendpointdescriptor.direction
     * @type {Integer} 
     */
    Direction {
        get => this.get_Direction()
    }

    /**
     * Gets the type of USB endpoint.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbendpointdescriptor.endpointtype
     * @type {Integer} 
     */
    EndpointType {
        get => this.get_EndpointType()
    }

    /**
     * Gets an object that represents the endpoint descriptor for the USB bulk IN endpoint.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbendpointdescriptor.asbulkinendpointdescriptor
     * @type {UsbBulkInEndpointDescriptor} 
     */
    AsBulkInEndpointDescriptor {
        get => this.get_AsBulkInEndpointDescriptor()
    }

    /**
     * Gets an object that represents the endpoint descriptor for the USB interrupt IN endpoint.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbendpointdescriptor.asinterruptinendpointdescriptor
     * @type {UsbInterruptInEndpointDescriptor} 
     */
    AsInterruptInEndpointDescriptor {
        get => this.get_AsInterruptInEndpointDescriptor()
    }

    /**
     * Gets an object that represents the endpoint descriptor for the USB bulk OUT endpoint.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbendpointdescriptor.asbulkoutendpointdescriptor
     * @type {UsbBulkOutEndpointDescriptor} 
     */
    AsBulkOutEndpointDescriptor {
        get => this.get_AsBulkOutEndpointDescriptor()
    }

    /**
     * Gets an object that represents the endpoint descriptor for the USB interrupt OUT endpoint.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbendpointdescriptor.asinterruptoutendpointdescriptor
     * @type {UsbInterruptOutEndpointDescriptor} 
     */
    AsInterruptOutEndpointDescriptor {
        get => this.get_AsInterruptOutEndpointDescriptor()
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
    get_EndpointNumber() {
        if (!this.HasProp("__IUsbEndpointDescriptor")) {
            if ((queryResult := this.QueryInterface(IUsbEndpointDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbEndpointDescriptor := IUsbEndpointDescriptor(outPtr)
        }

        return this.__IUsbEndpointDescriptor.get_EndpointNumber()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Direction() {
        if (!this.HasProp("__IUsbEndpointDescriptor")) {
            if ((queryResult := this.QueryInterface(IUsbEndpointDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbEndpointDescriptor := IUsbEndpointDescriptor(outPtr)
        }

        return this.__IUsbEndpointDescriptor.get_Direction()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EndpointType() {
        if (!this.HasProp("__IUsbEndpointDescriptor")) {
            if ((queryResult := this.QueryInterface(IUsbEndpointDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbEndpointDescriptor := IUsbEndpointDescriptor(outPtr)
        }

        return this.__IUsbEndpointDescriptor.get_EndpointType()
    }

    /**
     * 
     * @returns {UsbBulkInEndpointDescriptor} 
     */
    get_AsBulkInEndpointDescriptor() {
        if (!this.HasProp("__IUsbEndpointDescriptor")) {
            if ((queryResult := this.QueryInterface(IUsbEndpointDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbEndpointDescriptor := IUsbEndpointDescriptor(outPtr)
        }

        return this.__IUsbEndpointDescriptor.get_AsBulkInEndpointDescriptor()
    }

    /**
     * 
     * @returns {UsbInterruptInEndpointDescriptor} 
     */
    get_AsInterruptInEndpointDescriptor() {
        if (!this.HasProp("__IUsbEndpointDescriptor")) {
            if ((queryResult := this.QueryInterface(IUsbEndpointDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbEndpointDescriptor := IUsbEndpointDescriptor(outPtr)
        }

        return this.__IUsbEndpointDescriptor.get_AsInterruptInEndpointDescriptor()
    }

    /**
     * 
     * @returns {UsbBulkOutEndpointDescriptor} 
     */
    get_AsBulkOutEndpointDescriptor() {
        if (!this.HasProp("__IUsbEndpointDescriptor")) {
            if ((queryResult := this.QueryInterface(IUsbEndpointDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbEndpointDescriptor := IUsbEndpointDescriptor(outPtr)
        }

        return this.__IUsbEndpointDescriptor.get_AsBulkOutEndpointDescriptor()
    }

    /**
     * 
     * @returns {UsbInterruptOutEndpointDescriptor} 
     */
    get_AsInterruptOutEndpointDescriptor() {
        if (!this.HasProp("__IUsbEndpointDescriptor")) {
            if ((queryResult := this.QueryInterface(IUsbEndpointDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbEndpointDescriptor := IUsbEndpointDescriptor(outPtr)
        }

        return this.__IUsbEndpointDescriptor.get_AsInterruptOutEndpointDescriptor()
    }

;@endregion Instance Methods
}
