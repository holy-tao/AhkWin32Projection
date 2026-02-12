#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUsbSetupPacket.ahk
#Include .\IUsbSetupPacketFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Describes the setup packet for a USB control transfer. For an explanation of the setup packet, see Table 9.2 in the Universal Serial Bus (USB) specification.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbsetuppacket
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class UsbSetupPacket extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUsbSetupPacket

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUsbSetupPacket.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [UsbSetupPacket](usbsetuppacket.md) object from a formatted buffer (eight bytes) that contains the setup packet.
     * @param {IBuffer} eightByteBuffer A caller-supplied buffer that contains the setup packet formatted as per the standard USB specification. The length of the buffer must be eight bytes because that is the size of a setup packet on the bus.
     * @returns {UsbSetupPacket} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbsetuppacket.#ctor
     */
    static CreateWithEightByteBuffer(eightByteBuffer) {
        if (!UsbSetupPacket.HasProp("__IUsbSetupPacketFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Usb.UsbSetupPacket")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUsbSetupPacketFactory.IID)
            UsbSetupPacket.__IUsbSetupPacketFactory := IUsbSetupPacketFactory(factoryPtr)
        }

        return UsbSetupPacket.__IUsbSetupPacketFactory.CreateWithEightByteBuffer(eightByteBuffer)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the **bmRequestType** field in the setup packet of the USB control transfer. That field is represented by a [UsbControlRequestType](usbcontrolrequesttype.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbsetuppacket.requesttype
     * @type {UsbControlRequestType} 
     */
    RequestType {
        get => this.get_RequestType()
        set => this.put_RequestType(value)
    }

    /**
     * Gets or sets the **bRequest** field in the setup packet of the USB control transfer.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbsetuppacket.request
     * @type {Integer} 
     */
    Request {
        get => this.get_Request()
        set => this.put_Request(value)
    }

    /**
     * Gets or sets the **wValue** field in the setup packet of the USB control transfer.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbsetuppacket.value
     * @type {Integer} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

    /**
     * Gets or sets the **wIndex** field in the setup packet of the USB control transfer.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbsetuppacket.index
     * @type {Integer} 
     */
    Index {
        get => this.get_Index()
        set => this.put_Index(value)
    }

    /**
     * Gets the length, in bytes, of the setup packet.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbsetuppacket.length
     * @type {Integer} 
     */
    Length {
        get => this.get_Length()
        set => this.put_Length(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a [UsbSetupPacket](usbsetuppacket.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.Usb.UsbSetupPacket")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {UsbControlRequestType} 
     */
    get_RequestType() {
        if (!this.HasProp("__IUsbSetupPacket")) {
            if ((queryResult := this.QueryInterface(IUsbSetupPacket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbSetupPacket := IUsbSetupPacket(outPtr)
        }

        return this.__IUsbSetupPacket.get_RequestType()
    }

    /**
     * 
     * @param {UsbControlRequestType} value 
     * @returns {HRESULT} 
     */
    put_RequestType(value) {
        if (!this.HasProp("__IUsbSetupPacket")) {
            if ((queryResult := this.QueryInterface(IUsbSetupPacket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbSetupPacket := IUsbSetupPacket(outPtr)
        }

        return this.__IUsbSetupPacket.put_RequestType(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Request() {
        if (!this.HasProp("__IUsbSetupPacket")) {
            if ((queryResult := this.QueryInterface(IUsbSetupPacket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbSetupPacket := IUsbSetupPacket(outPtr)
        }

        return this.__IUsbSetupPacket.get_Request()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Request(value) {
        if (!this.HasProp("__IUsbSetupPacket")) {
            if ((queryResult := this.QueryInterface(IUsbSetupPacket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbSetupPacket := IUsbSetupPacket(outPtr)
        }

        return this.__IUsbSetupPacket.put_Request(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Value() {
        if (!this.HasProp("__IUsbSetupPacket")) {
            if ((queryResult := this.QueryInterface(IUsbSetupPacket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbSetupPacket := IUsbSetupPacket(outPtr)
        }

        return this.__IUsbSetupPacket.get_Value()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Value(value) {
        if (!this.HasProp("__IUsbSetupPacket")) {
            if ((queryResult := this.QueryInterface(IUsbSetupPacket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbSetupPacket := IUsbSetupPacket(outPtr)
        }

        return this.__IUsbSetupPacket.put_Value(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Index() {
        if (!this.HasProp("__IUsbSetupPacket")) {
            if ((queryResult := this.QueryInterface(IUsbSetupPacket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbSetupPacket := IUsbSetupPacket(outPtr)
        }

        return this.__IUsbSetupPacket.get_Index()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Index(value) {
        if (!this.HasProp("__IUsbSetupPacket")) {
            if ((queryResult := this.QueryInterface(IUsbSetupPacket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbSetupPacket := IUsbSetupPacket(outPtr)
        }

        return this.__IUsbSetupPacket.put_Index(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Length() {
        if (!this.HasProp("__IUsbSetupPacket")) {
            if ((queryResult := this.QueryInterface(IUsbSetupPacket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbSetupPacket := IUsbSetupPacket(outPtr)
        }

        return this.__IUsbSetupPacket.get_Length()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Length(value) {
        if (!this.HasProp("__IUsbSetupPacket")) {
            if ((queryResult := this.QueryInterface(IUsbSetupPacket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbSetupPacket := IUsbSetupPacket(outPtr)
        }

        return this.__IUsbSetupPacket.put_Length(value)
    }

;@endregion Instance Methods
}
