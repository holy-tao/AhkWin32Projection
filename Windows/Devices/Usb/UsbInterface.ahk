#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUsbInterface.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about the USB interface including its endpoints, the number of alternate settings the interface supports, and gets the entire descriptor set for those settings. It also obtains pipes associated with the endpoints that the interface supports.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterface
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class UsbInterface extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUsbInterface

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUsbInterface.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets an array of objects that represent pipes that the host opened to communicate with bulk IN endpoints defined in the current setting of the USB interface setting.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterface.bulkinpipes
     * @type {IVectorView<UsbBulkInPipe>} 
     */
    BulkInPipes {
        get => this.get_BulkInPipes()
    }

    /**
     * Gets an array of objects that represent pipes that the host opened to communicate with interrupt IN endpoints defined in the current setting of the USB interface.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterface.interruptinpipes
     * @type {IVectorView<UsbInterruptInPipe>} 
     */
    InterruptInPipes {
        get => this.get_InterruptInPipes()
    }

    /**
     * Gets an array of objects that represent pipes that the host opened to communicate with bulk OUT endpoints defined in the current setting of the USB interface.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterface.bulkoutpipes
     * @type {IVectorView<UsbBulkOutPipe>} 
     */
    BulkOutPipes {
        get => this.get_BulkOutPipes()
    }

    /**
     * Gets an array of objects that represent pipes that the host opened to communicate with interrupt OUT endpoints defined in the current setting of the USB interface.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterface.interruptoutpipes
     * @type {IVectorView<UsbInterruptOutPipe>} 
     */
    InterruptOutPipes {
        get => this.get_InterruptOutPipes()
    }

    /**
     * Gets an array of objects that represent alternate settings defined for the USB interface.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterface.interfacesettings
     * @type {IVectorView<UsbInterfaceSetting>} 
     */
    InterfaceSettings {
        get => this.get_InterfaceSettings()
    }

    /**
     * Gets the interface number that identifies the USB interface. This value is the **bInterfaceNumber** field of a standard USB interface descriptor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterface.interfacenumber
     * @type {Integer} 
     */
    InterfaceNumber {
        get => this.get_InterfaceNumber()
    }

    /**
     * Gets an array of objects that represent descriptors for all alternate settings that are part of this USB interface.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterface.descriptors
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
     * @returns {IVectorView<UsbBulkInPipe>} 
     */
    get_BulkInPipes() {
        if (!this.HasProp("__IUsbInterface")) {
            if ((queryResult := this.QueryInterface(IUsbInterface.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbInterface := IUsbInterface(outPtr)
        }

        return this.__IUsbInterface.get_BulkInPipes()
    }

    /**
     * 
     * @returns {IVectorView<UsbInterruptInPipe>} 
     */
    get_InterruptInPipes() {
        if (!this.HasProp("__IUsbInterface")) {
            if ((queryResult := this.QueryInterface(IUsbInterface.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbInterface := IUsbInterface(outPtr)
        }

        return this.__IUsbInterface.get_InterruptInPipes()
    }

    /**
     * 
     * @returns {IVectorView<UsbBulkOutPipe>} 
     */
    get_BulkOutPipes() {
        if (!this.HasProp("__IUsbInterface")) {
            if ((queryResult := this.QueryInterface(IUsbInterface.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbInterface := IUsbInterface(outPtr)
        }

        return this.__IUsbInterface.get_BulkOutPipes()
    }

    /**
     * 
     * @returns {IVectorView<UsbInterruptOutPipe>} 
     */
    get_InterruptOutPipes() {
        if (!this.HasProp("__IUsbInterface")) {
            if ((queryResult := this.QueryInterface(IUsbInterface.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbInterface := IUsbInterface(outPtr)
        }

        return this.__IUsbInterface.get_InterruptOutPipes()
    }

    /**
     * 
     * @returns {IVectorView<UsbInterfaceSetting>} 
     */
    get_InterfaceSettings() {
        if (!this.HasProp("__IUsbInterface")) {
            if ((queryResult := this.QueryInterface(IUsbInterface.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbInterface := IUsbInterface(outPtr)
        }

        return this.__IUsbInterface.get_InterfaceSettings()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InterfaceNumber() {
        if (!this.HasProp("__IUsbInterface")) {
            if ((queryResult := this.QueryInterface(IUsbInterface.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbInterface := IUsbInterface(outPtr)
        }

        return this.__IUsbInterface.get_InterfaceNumber()
    }

    /**
     * 
     * @returns {IVectorView<UsbDescriptor>} 
     */
    get_Descriptors() {
        if (!this.HasProp("__IUsbInterface")) {
            if ((queryResult := this.QueryInterface(IUsbInterface.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbInterface := IUsbInterface(outPtr)
        }

        return this.__IUsbInterface.get_Descriptors()
    }

;@endregion Instance Methods
}
