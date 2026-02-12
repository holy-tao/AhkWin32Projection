#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUsbDeviceClasses.ahk
#Include .\IUsbDeviceClassesStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides a way for you to retrieve a [UsbDeviceClass](usbdeviceclass.md) object based on the USB device class of a device. The properties defined in this class represent the supported USB device classes, and they return [UsbDeviceClass](usbdeviceclass.md) objects.
  * 
  * For information about USB device classes, see the official USB Website for [Approved Class Specification Documents](https://www.usb.org/documents?search=&type%5B0%5D=55&items_per_page=50).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbdeviceclasses
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class UsbDeviceClasses extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUsbDeviceClasses

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUsbDeviceClasses.IID

    /**
     * Gets the device class object for the device that conforms to the Communication Device Class (CDC).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbdeviceclasses.cdccontrol
     * @type {UsbDeviceClass} 
     */
    static CdcControl {
        get => UsbDeviceClasses.get_CdcControl()
    }

    /**
     * Gets the device class object for a device that conforms to the Physical Interface Devices (PID) specification.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbdeviceclasses.physical
     * @type {UsbDeviceClass} 
     */
    static Physical {
        get => UsbDeviceClasses.get_Physical()
    }

    /**
     * Gets the device class object for a device that conforms to the USB Personal Healthcare Device Class (PHDC).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbdeviceclasses.personalhealthcare
     * @type {UsbDeviceClass} 
     */
    static PersonalHealthcare {
        get => UsbDeviceClasses.get_PersonalHealthcare()
    }

    /**
     * Gets the device class object for the device that conforms to the Active Sync device class.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbdeviceclasses.activesync
     * @type {UsbDeviceClass} 
     */
    static ActiveSync {
        get => UsbDeviceClasses.get_ActiveSync()
    }

    /**
     * Gets the device class object for the device that conforms to the Palm Sync device class.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbdeviceclasses.palmsync
     * @type {UsbDeviceClass} 
     */
    static PalmSync {
        get => UsbDeviceClasses.get_PalmSync()
    }

    /**
     * Gets the device class object for the device that conforms to the Device Firmware Update device class.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbdeviceclasses.devicefirmwareupdate
     * @type {UsbDeviceClass} 
     */
    static DeviceFirmwareUpdate {
        get => UsbDeviceClasses.get_DeviceFirmwareUpdate()
    }

    /**
     * Gets the device class object for an infrared transceiver that conforms to the IrDA class defined as per the IrDA Bridge Device Definition 1.0 specification.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbdeviceclasses.irda
     * @type {UsbDeviceClass} 
     */
    static Irda {
        get => UsbDeviceClasses.get_Irda()
    }

    /**
     * Gets the device class object for a device that conforms to the USB test and measurement class (USBTMC).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbdeviceclasses.measurement
     * @type {UsbDeviceClass} 
     */
    static Measurement {
        get => UsbDeviceClasses.get_Measurement()
    }

    /**
     * Gets the device class object for a custom device that has 0xFF class code. This indicates that the device does not belong to a class approved by USB-IF.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbdeviceclasses.vendorspecific
     * @type {UsbDeviceClass} 
     */
    static VendorSpecific {
        get => UsbDeviceClasses.get_VendorSpecific()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {UsbDeviceClass} 
     */
    static get_CdcControl() {
        if (!UsbDeviceClasses.HasProp("__IUsbDeviceClassesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Usb.UsbDeviceClasses")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUsbDeviceClassesStatics.IID)
            UsbDeviceClasses.__IUsbDeviceClassesStatics := IUsbDeviceClassesStatics(factoryPtr)
        }

        return UsbDeviceClasses.__IUsbDeviceClassesStatics.get_CdcControl()
    }

    /**
     * 
     * @returns {UsbDeviceClass} 
     */
    static get_Physical() {
        if (!UsbDeviceClasses.HasProp("__IUsbDeviceClassesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Usb.UsbDeviceClasses")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUsbDeviceClassesStatics.IID)
            UsbDeviceClasses.__IUsbDeviceClassesStatics := IUsbDeviceClassesStatics(factoryPtr)
        }

        return UsbDeviceClasses.__IUsbDeviceClassesStatics.get_Physical()
    }

    /**
     * 
     * @returns {UsbDeviceClass} 
     */
    static get_PersonalHealthcare() {
        if (!UsbDeviceClasses.HasProp("__IUsbDeviceClassesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Usb.UsbDeviceClasses")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUsbDeviceClassesStatics.IID)
            UsbDeviceClasses.__IUsbDeviceClassesStatics := IUsbDeviceClassesStatics(factoryPtr)
        }

        return UsbDeviceClasses.__IUsbDeviceClassesStatics.get_PersonalHealthcare()
    }

    /**
     * 
     * @returns {UsbDeviceClass} 
     */
    static get_ActiveSync() {
        if (!UsbDeviceClasses.HasProp("__IUsbDeviceClassesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Usb.UsbDeviceClasses")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUsbDeviceClassesStatics.IID)
            UsbDeviceClasses.__IUsbDeviceClassesStatics := IUsbDeviceClassesStatics(factoryPtr)
        }

        return UsbDeviceClasses.__IUsbDeviceClassesStatics.get_ActiveSync()
    }

    /**
     * 
     * @returns {UsbDeviceClass} 
     */
    static get_PalmSync() {
        if (!UsbDeviceClasses.HasProp("__IUsbDeviceClassesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Usb.UsbDeviceClasses")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUsbDeviceClassesStatics.IID)
            UsbDeviceClasses.__IUsbDeviceClassesStatics := IUsbDeviceClassesStatics(factoryPtr)
        }

        return UsbDeviceClasses.__IUsbDeviceClassesStatics.get_PalmSync()
    }

    /**
     * 
     * @returns {UsbDeviceClass} 
     */
    static get_DeviceFirmwareUpdate() {
        if (!UsbDeviceClasses.HasProp("__IUsbDeviceClassesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Usb.UsbDeviceClasses")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUsbDeviceClassesStatics.IID)
            UsbDeviceClasses.__IUsbDeviceClassesStatics := IUsbDeviceClassesStatics(factoryPtr)
        }

        return UsbDeviceClasses.__IUsbDeviceClassesStatics.get_DeviceFirmwareUpdate()
    }

    /**
     * 
     * @returns {UsbDeviceClass} 
     */
    static get_Irda() {
        if (!UsbDeviceClasses.HasProp("__IUsbDeviceClassesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Usb.UsbDeviceClasses")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUsbDeviceClassesStatics.IID)
            UsbDeviceClasses.__IUsbDeviceClassesStatics := IUsbDeviceClassesStatics(factoryPtr)
        }

        return UsbDeviceClasses.__IUsbDeviceClassesStatics.get_Irda()
    }

    /**
     * 
     * @returns {UsbDeviceClass} 
     */
    static get_Measurement() {
        if (!UsbDeviceClasses.HasProp("__IUsbDeviceClassesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Usb.UsbDeviceClasses")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUsbDeviceClassesStatics.IID)
            UsbDeviceClasses.__IUsbDeviceClassesStatics := IUsbDeviceClassesStatics(factoryPtr)
        }

        return UsbDeviceClasses.__IUsbDeviceClassesStatics.get_Measurement()
    }

    /**
     * 
     * @returns {UsbDeviceClass} 
     */
    static get_VendorSpecific() {
        if (!UsbDeviceClasses.HasProp("__IUsbDeviceClassesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Usb.UsbDeviceClasses")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUsbDeviceClassesStatics.IID)
            UsbDeviceClasses.__IUsbDeviceClassesStatics := IUsbDeviceClassesStatics(factoryPtr)
        }

        return UsbDeviceClasses.__IUsbDeviceClassesStatics.get_VendorSpecific()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
