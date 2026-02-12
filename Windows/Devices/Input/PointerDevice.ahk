#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPointerDevice.ahk
#Include .\IPointerDevice2.ahk
#Include .\IPointerDeviceStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Supports the ability to identify the connected pointer devices and determine their capabilities.
 * @remarks
 * The values returned by the properties discussed here are based on the total number of pointer devices connected: Boolean properties return true if one device supports a specific capability and numeric properties return the maximum value exposed by all devices.
 * 
 * The [Device Capabilities Sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/411c271e537727d737a53fa2cbe99eaecac00cc0/Official%20Windows%20Platform%20Sample/Input%20Device%20capabilities%20sample) demonstrates how to detect the presence of input devices and retrieve the capabilities and attributes of each device.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.input.pointerdevice
 * @namespace Windows.Devices.Input
 * @version WindowsRuntime 1.4
 */
class PointerDevice extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPointerDevice

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPointerDevice.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets information about the pointer device associated with the specified input pointer ID.
     * @remarks
     * GetPointerDevice is a static method.
     * 
     * The input pointer specified by *pointerId* must identify an active input.
     * @param {Integer} pointerId The ID of the pointer input.
     * @returns {PointerDevice} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.pointerdevice.getpointerdevice
     */
    static GetPointerDevice(pointerId) {
        if (!PointerDevice.HasProp("__IPointerDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Input.PointerDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPointerDeviceStatics.IID)
            PointerDevice.__IPointerDeviceStatics := IPointerDeviceStatics(factoryPtr)
        }

        return PointerDevice.__IPointerDeviceStatics.GetPointerDevice(pointerId)
    }

    /**
     * Gets information about the pointer devices attached to the system.
     * @remarks
     * GetPointerDevices is a static method.
     * @returns {IVectorView<PointerDevice>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.pointerdevice.getpointerdevices
     */
    static GetPointerDevices() {
        if (!PointerDevice.HasProp("__IPointerDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Input.PointerDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPointerDeviceStatics.IID)
            PointerDevice.__IPointerDeviceStatics := IPointerDeviceStatics(factoryPtr)
        }

        return PointerDevice.__IPointerDeviceStatics.GetPointerDevices()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the pointer device type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.pointerdevice.pointerdevicetype
     * @type {Integer} 
     */
    PointerDeviceType {
        get => this.get_PointerDeviceType()
    }

    /**
     * Gets a value indicating whether the pointer device is an integrated device. For example, a video display with an integrated touch digitizer compared to an external pen/stylus digitizer.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.pointerdevice.isintegrated
     * @type {Boolean} 
     */
    IsIntegrated {
        get => this.get_IsIntegrated()
    }

    /**
     * Gets a value indicating the maximum number of contacts supported by the input device.
     * @remarks
     * This property typically returns a value of 5 or more for touch devices and 1 for mouse and pen/stylus devices.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.pointerdevice.maxcontacts
     * @type {Integer} 
     */
    MaxContacts {
        get => this.get_MaxContacts()
    }

    /**
     * Gets the coordinates of the bounding rectangle supported by the input device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.pointerdevice.physicaldevicerect
     * @type {RECT} 
     */
    PhysicalDeviceRect {
        get => this.get_PhysicalDeviceRect()
    }

    /**
     * Gets the screen coordinates that are mapped to the bounding rectangle supported by the input device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.pointerdevice.screenrect
     * @type {RECT} 
     */
    ScreenRect {
        get => this.get_ScreenRect()
    }

    /**
     * Gets a collection containing the supported [pointer device usages](pointerdeviceusage.md).
     * @remarks
     * A Human Interface Device (HID) usage describes what a Human Interface Device (HID)-compliant control is measuring or reporting and can also indicate the control's intended use. A specific control usage is defined by its usage page, a usage ID, a name, and a description. For more info, see [Device Class Definition for HID 1.11](https://www.usb.org/document-library/device-class-definition-hid-111).
     * 
     * > [!NOTE]
     * > The core of the Microsoft interactive input device architecture is based on the Universal Serial Bus (USB) standard Device Class Definition for Human Interface Device (HID), which is defined by the [ Implementers Forum, Inc.](https://www.usb.org/home)
     * 
     * The Universal Serial Bus (USB) Human Interface Device (HID) standard defines the configuration and communication protocols for Human Interface Device (HID), such as keyboards, mouse devices, joysticks, and virtual reality devices, that humans use to enter data directly into a computer. (For detailed information about the USB HID standard, see the [USB Implementers Forum](https://www.usb.org/home) website.)
     * 
     * Although the core of the Windows input architecture is based on the Universal Serial Bus (USB) Human Interface Device (HID) standard, the architecture is not limited to Universal Serial Bus (USB) devices. The input architecture also supports serial port devices, i8042 port devices, and proprietary input devices.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.pointerdevice.supportedusages
     * @type {IVectorView<PointerDeviceUsage>} 
     */
    SupportedUsages {
        get => this.get_SupportedUsages()
    }

    /**
     * Gets the maximum number of hover contacts supported by the input device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.pointerdevice.maxpointerswithzdistance
     * @type {Integer} 
     */
    MaxPointersWithZDistance {
        get => this.get_MaxPointersWithZDistance()
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
    get_PointerDeviceType() {
        if (!this.HasProp("__IPointerDevice")) {
            if ((queryResult := this.QueryInterface(IPointerDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerDevice := IPointerDevice(outPtr)
        }

        return this.__IPointerDevice.get_PointerDeviceType()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsIntegrated() {
        if (!this.HasProp("__IPointerDevice")) {
            if ((queryResult := this.QueryInterface(IPointerDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerDevice := IPointerDevice(outPtr)
        }

        return this.__IPointerDevice.get_IsIntegrated()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxContacts() {
        if (!this.HasProp("__IPointerDevice")) {
            if ((queryResult := this.QueryInterface(IPointerDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerDevice := IPointerDevice(outPtr)
        }

        return this.__IPointerDevice.get_MaxContacts()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_PhysicalDeviceRect() {
        if (!this.HasProp("__IPointerDevice")) {
            if ((queryResult := this.QueryInterface(IPointerDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerDevice := IPointerDevice(outPtr)
        }

        return this.__IPointerDevice.get_PhysicalDeviceRect()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_ScreenRect() {
        if (!this.HasProp("__IPointerDevice")) {
            if ((queryResult := this.QueryInterface(IPointerDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerDevice := IPointerDevice(outPtr)
        }

        return this.__IPointerDevice.get_ScreenRect()
    }

    /**
     * 
     * @returns {IVectorView<PointerDeviceUsage>} 
     */
    get_SupportedUsages() {
        if (!this.HasProp("__IPointerDevice")) {
            if ((queryResult := this.QueryInterface(IPointerDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerDevice := IPointerDevice(outPtr)
        }

        return this.__IPointerDevice.get_SupportedUsages()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxPointersWithZDistance() {
        if (!this.HasProp("__IPointerDevice2")) {
            if ((queryResult := this.QueryInterface(IPointerDevice2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerDevice2 := IPointerDevice2(outPtr)
        }

        return this.__IPointerDevice2.get_MaxPointersWithZDistance()
    }

;@endregion Instance Methods
}
