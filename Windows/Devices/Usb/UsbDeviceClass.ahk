#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUsbDeviceClass.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides a way for the app to get an Advanced Query Syntax (AQS) string by specifying the class code, subclass code, and the protocol code defined by the device. The properties in this class are passed in the call to [GetDeviceClassSelector](usbdevice_getdeviceclassselector_1975723348.md).
 * @remarks
 * You can create a UsbDeviceClass object by specifying any one of the following sets of properties:
 * + Class code.
 * + Class and subclass codes.
 * + Class, subclass, and protocol codes.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbdeviceclass
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class UsbDeviceClass extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUsbDeviceClass

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUsbDeviceClass.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the class code of the device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbdeviceclass.classcode
     * @type {Integer} 
     */
    ClassCode {
        get => this.get_ClassCode()
        set => this.put_ClassCode(value)
    }

    /**
     * Gets or sets the subclass code of the device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbdeviceclass.subclasscode
     * @type {IReference<Integer>} 
     */
    SubclassCode {
        get => this.get_SubclassCode()
        set => this.put_SubclassCode(value)
    }

    /**
     * Gets or sets the protocol code of the device.
     * @remarks
     * You can set the ProtocolCode value only when [SubclassCode](usbdeviceclass_subclasscode.md) value is set to a non-null value.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbdeviceclass.protocolcode
     * @type {IReference<Integer>} 
     */
    ProtocolCode {
        get => this.get_ProtocolCode()
        set => this.put_ProtocolCode(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a [UsbDeviceClass](usbdeviceclass.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.Usb.UsbDeviceClass")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ClassCode() {
        if (!this.HasProp("__IUsbDeviceClass")) {
            if ((queryResult := this.QueryInterface(IUsbDeviceClass.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbDeviceClass := IUsbDeviceClass(outPtr)
        }

        return this.__IUsbDeviceClass.get_ClassCode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ClassCode(value) {
        if (!this.HasProp("__IUsbDeviceClass")) {
            if ((queryResult := this.QueryInterface(IUsbDeviceClass.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbDeviceClass := IUsbDeviceClass(outPtr)
        }

        return this.__IUsbDeviceClass.put_ClassCode(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_SubclassCode() {
        if (!this.HasProp("__IUsbDeviceClass")) {
            if ((queryResult := this.QueryInterface(IUsbDeviceClass.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbDeviceClass := IUsbDeviceClass(outPtr)
        }

        return this.__IUsbDeviceClass.get_SubclassCode()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_SubclassCode(value) {
        if (!this.HasProp("__IUsbDeviceClass")) {
            if ((queryResult := this.QueryInterface(IUsbDeviceClass.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbDeviceClass := IUsbDeviceClass(outPtr)
        }

        return this.__IUsbDeviceClass.put_SubclassCode(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ProtocolCode() {
        if (!this.HasProp("__IUsbDeviceClass")) {
            if ((queryResult := this.QueryInterface(IUsbDeviceClass.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbDeviceClass := IUsbDeviceClass(outPtr)
        }

        return this.__IUsbDeviceClass.get_ProtocolCode()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_ProtocolCode(value) {
        if (!this.HasProp("__IUsbDeviceClass")) {
            if ((queryResult := this.QueryInterface(IUsbDeviceClass.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbDeviceClass := IUsbDeviceClass(outPtr)
        }

        return this.__IUsbDeviceClass.put_ProtocolCode(value)
    }

;@endregion Instance Methods
}
