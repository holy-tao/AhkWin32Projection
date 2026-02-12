#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUsbInterfaceDescriptor.ahk
#Include .\IUsbInterfaceDescriptorStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Describes a USB alternate setting (of an interface) in an interface descriptor. For an explanation of an interface descriptor, see Section 9.6.5 in the Universal Serial Bus Specification:
  * 
  * 
  * + Table 9.15 in the Universal Serial Bus 3.0 Specification
  * + Table 9.12 in the Universal Serial Bus Specification (version 2.0)
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterfacedescriptor
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class UsbInterfaceDescriptor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUsbInterfaceDescriptor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUsbInterfaceDescriptor.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves information about the alternate setting in a [UsbInterfaceDescriptor](usbinterfacedescriptor.md) object that is contained in a [UsbDescriptor](usbdescriptor.md) object.
     * @param {UsbDescriptor} descriptor The [UsbDescriptor](usbdescriptor.md) object to parse.
     * @param {Pointer<UsbInterfaceDescriptor>} parsed Receives a [UsbInterfaceDescriptor](usbinterfacedescriptor.md) object.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterfacedescriptor.tryparse
     */
    static TryParse(descriptor, parsed) {
        if (!UsbInterfaceDescriptor.HasProp("__IUsbInterfaceDescriptorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Usb.UsbInterfaceDescriptor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUsbInterfaceDescriptorStatics.IID)
            UsbInterfaceDescriptor.__IUsbInterfaceDescriptorStatics := IUsbInterfaceDescriptorStatics(factoryPtr)
        }

        return UsbInterfaceDescriptor.__IUsbInterfaceDescriptorStatics.TryParse(descriptor, parsed)
    }

    /**
     * Parses the specified USB descriptor and returns alternate setting information in a [UsbInterfaceDescriptor](usbinterfacedescriptor.md) object.
     * @param {UsbDescriptor} descriptor A [UsbDescriptor](usbdescriptor.md) object that contains the USB interface descriptor.
     * @returns {UsbInterfaceDescriptor} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterfacedescriptor.parse
     */
    static Parse(descriptor) {
        if (!UsbInterfaceDescriptor.HasProp("__IUsbInterfaceDescriptorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Usb.UsbInterfaceDescriptor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUsbInterfaceDescriptorStatics.IID)
            UsbInterfaceDescriptor.__IUsbInterfaceDescriptorStatics := IUsbInterfaceDescriptorStatics(factoryPtr)
        }

        return UsbInterfaceDescriptor.__IUsbInterfaceDescriptorStatics.Parse(descriptor)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the **bInterfaceClass** field of the USB interface descriptor. The value indicates the USB-defined class to which the interface conforms.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterfacedescriptor.classcode
     * @type {Integer} 
     */
    ClassCode {
        get => this.get_ClassCode()
    }

    /**
     * Gets the **bInterfaceSubClass** field of the USB interface descriptor. The value is a USB-assigned identifier that specifies a USB-defined subclass to which the interface.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterfacedescriptor.subclasscode
     * @type {Integer} 
     */
    SubclassCode {
        get => this.get_SubclassCode()
    }

    /**
     * Gets the **bInterfaceProtocol** field of the interface descriptor. The value is a USB-assigned identifier that specifies a USB-defined protocol to which the interface conforms.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterfacedescriptor.protocolcode
     * @type {Integer} 
     */
    ProtocolCode {
        get => this.get_ProtocolCode()
    }

    /**
     * Gets the **bAlternateSetting** field of the USB interface descriptor. The value is a number that identifies the alternate setting defined by the interface.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterfacedescriptor.alternatesettingnumber
     * @type {Integer} 
     */
    AlternateSettingNumber {
        get => this.get_AlternateSettingNumber()
    }

    /**
     * Gets the **bInterfaceNumber** field of the USB interface descriptor. The value is the index that identifies the interface.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterfacedescriptor.interfacenumber
     * @type {Integer} 
     */
    InterfaceNumber {
        get => this.get_InterfaceNumber()
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
    get_ClassCode() {
        if (!this.HasProp("__IUsbInterfaceDescriptor")) {
            if ((queryResult := this.QueryInterface(IUsbInterfaceDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbInterfaceDescriptor := IUsbInterfaceDescriptor(outPtr)
        }

        return this.__IUsbInterfaceDescriptor.get_ClassCode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SubclassCode() {
        if (!this.HasProp("__IUsbInterfaceDescriptor")) {
            if ((queryResult := this.QueryInterface(IUsbInterfaceDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbInterfaceDescriptor := IUsbInterfaceDescriptor(outPtr)
        }

        return this.__IUsbInterfaceDescriptor.get_SubclassCode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProtocolCode() {
        if (!this.HasProp("__IUsbInterfaceDescriptor")) {
            if ((queryResult := this.QueryInterface(IUsbInterfaceDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbInterfaceDescriptor := IUsbInterfaceDescriptor(outPtr)
        }

        return this.__IUsbInterfaceDescriptor.get_ProtocolCode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AlternateSettingNumber() {
        if (!this.HasProp("__IUsbInterfaceDescriptor")) {
            if ((queryResult := this.QueryInterface(IUsbInterfaceDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbInterfaceDescriptor := IUsbInterfaceDescriptor(outPtr)
        }

        return this.__IUsbInterfaceDescriptor.get_AlternateSettingNumber()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InterfaceNumber() {
        if (!this.HasProp("__IUsbInterfaceDescriptor")) {
            if ((queryResult := this.QueryInterface(IUsbInterfaceDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbInterfaceDescriptor := IUsbInterfaceDescriptor(outPtr)
        }

        return this.__IUsbInterfaceDescriptor.get_InterfaceNumber()
    }

;@endregion Instance Methods
}
