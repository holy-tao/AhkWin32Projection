#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUsbInterfaceSetting.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about an alternate setting and select that setting. The app can get the USB interface descriptors for the setting and its endpoints, and determine whether this setting is currently selected.
 * @remarks
 * For code example, see [UsbInterface](usbinterface.md).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterfacesetting
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class UsbInterfaceSetting extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUsbInterfaceSetting

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUsbInterfaceSetting.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets an array of objects that represent descriptors associated with USB bulk IN endpoints that are defined in the alternate setting.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterfacesetting.bulkinendpoints
     * @type {IVectorView<UsbBulkInEndpointDescriptor>} 
     */
    BulkInEndpoints {
        get => this.get_BulkInEndpoints()
    }

    /**
     * Gets an array of objects that represent descriptors associated with USB interrupt IN endpoints that are defined in the alternate setting.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterfacesetting.interruptinendpoints
     * @type {IVectorView<UsbInterruptInEndpointDescriptor>} 
     */
    InterruptInEndpoints {
        get => this.get_InterruptInEndpoints()
    }

    /**
     * Gets an array of objects that represent descriptors associated with USB bulk OUT endpoints that are defined in the alternate setting.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterfacesetting.bulkoutendpoints
     * @type {IVectorView<UsbBulkOutEndpointDescriptor>} 
     */
    BulkOutEndpoints {
        get => this.get_BulkOutEndpoints()
    }

    /**
     * Gets an array of objects that represent descriptors associated with USB interrupt OUT endpoints that are defined in the alternate setting.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterfacesetting.interruptoutendpoints
     * @type {IVectorView<UsbInterruptOutEndpointDescriptor>} 
     */
    InterruptOutEndpoints {
        get => this.get_InterruptOutEndpoints()
    }

    /**
     * Determines whether the alternate setting is currently selected.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterfacesetting.selected
     * @type {Boolean} 
     */
    Selected {
        get => this.get_Selected()
    }

    /**
     * Gets an object that represents the descriptor that describes the alternate setting.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterfacesetting.interfacedescriptor
     * @type {UsbInterfaceDescriptor} 
     */
    InterfaceDescriptor {
        get => this.get_InterfaceDescriptor()
    }

    /**
     * Gets an array of objects that represent descriptors associated with the alternate setting.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterfacesetting.descriptors
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
     * @returns {IVectorView<UsbBulkInEndpointDescriptor>} 
     */
    get_BulkInEndpoints() {
        if (!this.HasProp("__IUsbInterfaceSetting")) {
            if ((queryResult := this.QueryInterface(IUsbInterfaceSetting.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbInterfaceSetting := IUsbInterfaceSetting(outPtr)
        }

        return this.__IUsbInterfaceSetting.get_BulkInEndpoints()
    }

    /**
     * 
     * @returns {IVectorView<UsbInterruptInEndpointDescriptor>} 
     */
    get_InterruptInEndpoints() {
        if (!this.HasProp("__IUsbInterfaceSetting")) {
            if ((queryResult := this.QueryInterface(IUsbInterfaceSetting.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbInterfaceSetting := IUsbInterfaceSetting(outPtr)
        }

        return this.__IUsbInterfaceSetting.get_InterruptInEndpoints()
    }

    /**
     * 
     * @returns {IVectorView<UsbBulkOutEndpointDescriptor>} 
     */
    get_BulkOutEndpoints() {
        if (!this.HasProp("__IUsbInterfaceSetting")) {
            if ((queryResult := this.QueryInterface(IUsbInterfaceSetting.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbInterfaceSetting := IUsbInterfaceSetting(outPtr)
        }

        return this.__IUsbInterfaceSetting.get_BulkOutEndpoints()
    }

    /**
     * 
     * @returns {IVectorView<UsbInterruptOutEndpointDescriptor>} 
     */
    get_InterruptOutEndpoints() {
        if (!this.HasProp("__IUsbInterfaceSetting")) {
            if ((queryResult := this.QueryInterface(IUsbInterfaceSetting.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbInterfaceSetting := IUsbInterfaceSetting(outPtr)
        }

        return this.__IUsbInterfaceSetting.get_InterruptOutEndpoints()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Selected() {
        if (!this.HasProp("__IUsbInterfaceSetting")) {
            if ((queryResult := this.QueryInterface(IUsbInterfaceSetting.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbInterfaceSetting := IUsbInterfaceSetting(outPtr)
        }

        return this.__IUsbInterfaceSetting.get_Selected()
    }

    /**
     * Selects the alternate setting as the current setting in the USB interface.
     * @remarks
     * SelectSettingAsync disables the endpoints of the previous alternate setting and removes the pipes associated with them from the [UsbInterface](usbinterface.md) object. The method enables the endpoints of this setting, and adds the associated pipes to the [UsbInterface](usbinterface.md) object.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterfacesetting.selectsettingasync
     */
    SelectSettingAsync() {
        if (!this.HasProp("__IUsbInterfaceSetting")) {
            if ((queryResult := this.QueryInterface(IUsbInterfaceSetting.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbInterfaceSetting := IUsbInterfaceSetting(outPtr)
        }

        return this.__IUsbInterfaceSetting.SelectSettingAsync()
    }

    /**
     * 
     * @returns {UsbInterfaceDescriptor} 
     */
    get_InterfaceDescriptor() {
        if (!this.HasProp("__IUsbInterfaceSetting")) {
            if ((queryResult := this.QueryInterface(IUsbInterfaceSetting.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbInterfaceSetting := IUsbInterfaceSetting(outPtr)
        }

        return this.__IUsbInterfaceSetting.get_InterfaceDescriptor()
    }

    /**
     * 
     * @returns {IVectorView<UsbDescriptor>} 
     */
    get_Descriptors() {
        if (!this.HasProp("__IUsbInterfaceSetting")) {
            if ((queryResult := this.QueryInterface(IUsbInterfaceSetting.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbInterfaceSetting := IUsbInterfaceSetting(outPtr)
        }

        return this.__IUsbInterfaceSetting.get_Descriptors()
    }

;@endregion Instance Methods
}
