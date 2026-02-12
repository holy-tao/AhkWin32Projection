#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUsbDescriptor.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about the type of descriptor, its size (in bytes), and gets the descriptor data.
 * @remarks
 * A USB device provides information about itself in data structures called USB descriptors. See section 9.5 of the Universal Serial Bus (USB) specification.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbdescriptor
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class UsbDescriptor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUsbDescriptor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUsbDescriptor.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the length of the descriptor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbdescriptor.length
     * @type {Integer} 
     */
    Length {
        get => this.get_Length()
    }

    /**
     * Gets the type of descriptor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbdescriptor.descriptortype
     * @type {Integer} 
     */
    DescriptorType {
        get => this.get_DescriptorType()
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
    get_Length() {
        if (!this.HasProp("__IUsbDescriptor")) {
            if ((queryResult := this.QueryInterface(IUsbDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbDescriptor := IUsbDescriptor(outPtr)
        }

        return this.__IUsbDescriptor.get_Length()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DescriptorType() {
        if (!this.HasProp("__IUsbDescriptor")) {
            if ((queryResult := this.QueryInterface(IUsbDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbDescriptor := IUsbDescriptor(outPtr)
        }

        return this.__IUsbDescriptor.get_DescriptorType()
    }

    /**
     * Reads descriptor data in the caller-supplied buffer.
     * @param {IBuffer} buffer_ A caller-supplied buffer that receives descriptor data.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbdescriptor.readdescriptorbuffer
     */
    ReadDescriptorBuffer(buffer_) {
        if (!this.HasProp("__IUsbDescriptor")) {
            if ((queryResult := this.QueryInterface(IUsbDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbDescriptor := IUsbDescriptor(outPtr)
        }

        return this.__IUsbDescriptor.ReadDescriptorBuffer(buffer_)
    }

;@endregion Instance Methods
}
