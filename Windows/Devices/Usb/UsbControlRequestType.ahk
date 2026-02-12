#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUsbControlRequestType.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about the USB control transfer, the type of control request, whether the data is sent from or to the host, and the recipient of the request in the device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbcontrolrequesttype
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class UsbControlRequestType extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUsbControlRequestType

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUsbControlRequestType.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the direction of the USB control transfer.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbcontrolrequesttype.direction
     * @type {Integer} 
     */
    Direction {
        get => this.get_Direction()
        set => this.put_Direction(value)
    }

    /**
     * Gets or sets the type of USB control transfer: standard, class, or vendor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbcontrolrequesttype.controltransfertype
     * @type {Integer} 
     */
    ControlTransferType {
        get => this.get_ControlTransferType()
        set => this.put_ControlTransferType(value)
    }

    /**
     * Gets or sets the recipient of the USB control transfer.
     * @remarks
     * If the recipient is the first interface of the active configuration ([DefaultInterface](usbdevice_defaultinterface.md)), [SendControlInTransferAsync](usbdevice_sendcontrolintransferasync_609557051.md) and [SendControlOutTransferAsync](usbdevice_sendcontrolouttransferasync_2044496736.md) methods overwrite the low byte of [UsbSetupPacket.Index](usbsetuppacket_index.md) with the interface number of the default interface.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbcontrolrequesttype.recipient
     * @type {Integer} 
     */
    Recipient {
        get => this.get_Recipient()
        set => this.put_Recipient(value)
    }

    /**
     * Gets or sets the **bmRequestType** value as a byte.
     * @remarks
     * If the hardware specification for the device defines the **bmRequestType** field value to be sent as a byte, you can use the AsByte property. Otherwise, you must individually get or set **bmRequestType** values, such as direction, type, and recipient by using [ControlTransferType](usbcontrolrequesttype_controltransfertype.md), [Direction](usbcontrolrequesttype_direction.md), and [Recipient](usbcontrolrequesttype_recipient.md) properties, respectively.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbcontrolrequesttype.asbyte
     * @type {Integer} 
     */
    AsByte {
        get => this.get_AsByte()
        set => this.put_AsByte(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a [UsbControlRequestType](usbcontrolrequesttype.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.Usb.UsbControlRequestType")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Direction() {
        if (!this.HasProp("__IUsbControlRequestType")) {
            if ((queryResult := this.QueryInterface(IUsbControlRequestType.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbControlRequestType := IUsbControlRequestType(outPtr)
        }

        return this.__IUsbControlRequestType.get_Direction()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Direction(value) {
        if (!this.HasProp("__IUsbControlRequestType")) {
            if ((queryResult := this.QueryInterface(IUsbControlRequestType.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbControlRequestType := IUsbControlRequestType(outPtr)
        }

        return this.__IUsbControlRequestType.put_Direction(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ControlTransferType() {
        if (!this.HasProp("__IUsbControlRequestType")) {
            if ((queryResult := this.QueryInterface(IUsbControlRequestType.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbControlRequestType := IUsbControlRequestType(outPtr)
        }

        return this.__IUsbControlRequestType.get_ControlTransferType()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ControlTransferType(value) {
        if (!this.HasProp("__IUsbControlRequestType")) {
            if ((queryResult := this.QueryInterface(IUsbControlRequestType.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbControlRequestType := IUsbControlRequestType(outPtr)
        }

        return this.__IUsbControlRequestType.put_ControlTransferType(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Recipient() {
        if (!this.HasProp("__IUsbControlRequestType")) {
            if ((queryResult := this.QueryInterface(IUsbControlRequestType.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbControlRequestType := IUsbControlRequestType(outPtr)
        }

        return this.__IUsbControlRequestType.get_Recipient()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Recipient(value) {
        if (!this.HasProp("__IUsbControlRequestType")) {
            if ((queryResult := this.QueryInterface(IUsbControlRequestType.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbControlRequestType := IUsbControlRequestType(outPtr)
        }

        return this.__IUsbControlRequestType.put_Recipient(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AsByte() {
        if (!this.HasProp("__IUsbControlRequestType")) {
            if ((queryResult := this.QueryInterface(IUsbControlRequestType.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbControlRequestType := IUsbControlRequestType(outPtr)
        }

        return this.__IUsbControlRequestType.get_AsByte()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AsByte(value) {
        if (!this.HasProp("__IUsbControlRequestType")) {
            if ((queryResult := this.QueryInterface(IUsbControlRequestType.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbControlRequestType := IUsbControlRequestType(outPtr)
        }

        return this.__IUsbControlRequestType.put_AsByte(value)
    }

;@endregion Instance Methods
}
