#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUsbDevice.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IUsbDeviceStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a USB device. The object provides methods and properties that an app can use to enumerate WinUSB devices and send IN and OUT control transfers.
 * @remarks
 * Before getting a reference to the UsbDevice object, you must have one of these identifiers:
 * + The vendor and product identifiers for the physical device. Those identifiers are part of the hardware ID string. Alternatively, you can derive the identifiers from the **Hardware Ids** property in **Device Manager**. For example, if the **Hardware Id** is `USB\VID_045E&PID_078E`, the vendor ID is `0x045E` and product Id is `0x078E`.
 * + The device interface [GUID](/windows/win32/api/guiddef/ns-guiddef-guid). You can obtain that GUID from the **DeviceInterfaceGuids** registry entry under: **HKEY_LOCAL_MACHINE**\\**System**\\**CurrentControlSet**\\**Enum**\\**USB**\\**\<Device Identifier\>**\\**\<Instance Identifier\>**\\**Device Parameters**
 * + The device's class, subclass, and protocol codes. You can obtain that information from the **CompatibleIds** registry entry, found under the **Device Parameters** key.
 * 
 * 
 * To get the UsbDevice object:
 * 1. Get the Advanced Query Syntax (AQS) string that contains search criteria for finding the device in the enumerated device collection. If you want to search by the vendor ID/product ID or the device interface GUID, call [GetDeviceSelector](usbdevice_getdeviceselector_1242207979.md). If you want to search by the device class, call [GetDeviceClassSelector](usbdevice_getdeviceclassselector_1975723348.md). Both calls retrieve formatted AQS strings.
 * 1. Pass the retrieved string to [FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md). The call retrieves a [DeviceInformationCollection](../windows.devices.enumeration/deviceinformationcollection.md) object.
 * 1. Loop through the collection. Each iteration gets a [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) object.
 * 1. Get the [DeviceInformation.Id](../windows.devices.enumeration/deviceinformation_id.md) property value. The string value is the device instance path. For example, `\\?\USB#VID_045E&PID_078F#6&1b8ff026&0&5#{dee824ef-729b-4a0e-9c14-b7117d33a817}`.
 * 1. Call [FromIdAsync](usbdevice_fromidasync_1322863552.md) by passing the device instance string and get the UsbDevice object.
 *  You can then use the UsbDevice object to perform other operations, such as sending a control transfer. When the app has finished using the UsbDevice object, the app must release it by calling [Close](usbdevice_close_811482585.md).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbdevice
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class UsbDevice extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUsbDevice

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUsbDevice.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets an Advanced Query Syntax (AQS) string, based on the device interface [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) identifier, specified by the app. The app passes the string to [DeviceInformation.FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md) in order to find a specific type of USB device.
     * @remarks
     * You can obtain the device interface GUID from the **DeviceInterfaceGuids** registry entry under this key:**HKEY_LOCAL_MACHINE**\**System**\**CurrentControlSet**\**Enum**\**USB**\***&lt;Device Identifier&gt;***\***&lt;Instance Identifier&gt;***\**Device Parameters**
     * @param {Integer} vendorId 
     * @param {Integer} productId 
     * @param {Guid} winUsbInterfaceClass The device interface GUID exposed by the Winusb.sys driver. See the remarks section.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbdevice.getdeviceselector
     */
    static GetDeviceSelector(vendorId, productId, winUsbInterfaceClass) {
        if (!UsbDevice.HasProp("__IUsbDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Usb.UsbDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUsbDeviceStatics.IID)
            UsbDevice.__IUsbDeviceStatics := IUsbDeviceStatics(factoryPtr)
        }

        return UsbDevice.__IUsbDeviceStatics.GetDeviceSelector(vendorId, productId, winUsbInterfaceClass)
    }

    /**
     * Gets an Advanced Query Syntax (AQS) string, based on vendor and product identifiers, specified by the app. The app passes the string to [DeviceInformation.FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md) in order to find a specific type of USB device.
     * @param {Guid} winUsbInterfaceClass 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbdevice.getdeviceselector
     */
    static GetDeviceSelectorGuidOnly(winUsbInterfaceClass) {
        if (!UsbDevice.HasProp("__IUsbDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Usb.UsbDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUsbDeviceStatics.IID)
            UsbDevice.__IUsbDeviceStatics := IUsbDeviceStatics(factoryPtr)
        }

        return UsbDevice.__IUsbDeviceStatics.GetDeviceSelectorGuidOnly(winUsbInterfaceClass)
    }

    /**
     * Gets an Advanced Query Syntax (AQS) string, based on vendor, product, and device interface [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) identifiers, specified by the app. The app passes the string to [DeviceInformation.FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md) in order to find a specific type of USB device.
     * @remarks
     * You can obtain the device interface GUID from the **DeviceInterfaceGuids** registry entry under this key:**HKEY_LOCAL_MACHINE**\**System**\**CurrentControlSet**\**Enum**\**USB**\***&lt;Device Identifier&gt;***\***&lt;Instance Identifier&gt;***\**Device Parameters**
     * @param {Integer} vendorId Specifies the vendor identifier for the device as assigned by the USB specification committee. Possible values are 0 through 0xffff.
     * @param {Integer} productId Specifies the product identifier. This value is assigned by the manufacturer and is device-specific. Possible values are 0 through 0xffff.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbdevice.getdeviceselector
     */
    static GetDeviceSelectorVidPidOnly(vendorId, productId) {
        if (!UsbDevice.HasProp("__IUsbDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Usb.UsbDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUsbDeviceStatics.IID)
            UsbDevice.__IUsbDeviceStatics := IUsbDeviceStatics(factoryPtr)
        }

        return UsbDevice.__IUsbDeviceStatics.GetDeviceSelectorVidPidOnly(vendorId, productId)
    }

    /**
     * Gets an Advanced Query Syntax (AQS) string that the app can pass to [DeviceInformation.FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md) in order to find a specific type of USB device.
     * @remarks
     * You can search for a [UsbDevice](usbdevice.md) in the enumerated collection of devices by specifying class code, sub class code, or protocol code. To do this,
     * 1. Create a [UsbDeviceClass](usbdeviceclass.md) object by specifying [ClassCode](usbdeviceclass_classcode.md), [SubclassCode](usbdeviceclass_subclasscode.md), and [ProtocolCode](usbdeviceclass_protocolcode.md) property values. Alternatively, you can call the constructor by specifying a particular [UsbDeviceClasses](usbdeviceclasses.md) property.
     * 1. Call GetDeviceClassSelector and pass that new class. The call retrieves an AQS string.
     * 1. Call [FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md) and pass the string to get the [UsbDevice](usbdevice.md) object.
     * @param {UsbDeviceClass} usbClass A [UsbDeviceClass](usbdeviceclass.md) object for the device class specified by the app.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbdevice.getdeviceclassselector
     */
    static GetDeviceClassSelector(usbClass) {
        if (!UsbDevice.HasProp("__IUsbDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Usb.UsbDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUsbDeviceStatics.IID)
            UsbDevice.__IUsbDeviceStatics := IUsbDeviceStatics(factoryPtr)
        }

        return UsbDevice.__IUsbDeviceStatics.GetDeviceClassSelector(usbClass)
    }

    /**
     * Starts an asynchronous operation that creates a [UsbDevice](usbdevice.md) object.
     * @param {HSTRING} deviceId The device instance path of the device. To obtain that value, get the [DeviceInformation.Id](../windows.devices.enumeration/deviceinformation_id.md) property value.
     * @returns {IAsyncOperation<UsbDevice>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbdevice.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!UsbDevice.HasProp("__IUsbDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Usb.UsbDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUsbDeviceStatics.IID)
            UsbDevice.__IUsbDeviceStatics := IUsbDeviceStatics(factoryPtr)
        }

        return UsbDevice.__IUsbDeviceStatics.FromIdAsync(deviceId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the object that represents the default or the first interface in a USB configuration.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbdevice.defaultinterface
     * @type {UsbInterface} 
     */
    DefaultInterface {
        get => this.get_DefaultInterface()
    }

    /**
     * Gets the object that represents the USB device descriptor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbdevice.devicedescriptor
     * @type {UsbDeviceDescriptor} 
     */
    DeviceDescriptor {
        get => this.get_DeviceDescriptor()
    }

    /**
     * Gets an object that represents a USB configuration including all interfaces and their endpoints.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbdevice.configuration
     * @type {UsbConfiguration} 
     */
    Configuration {
        get => this.get_Configuration()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * Starts a zero-length USB control transfer that writes to the default control endpoint of the device.
     * @remarks
     * Most USB control transfers may be sent to the underlying WinUSB device, but the below are not permitted.  Attempting to send these message will fail and throw an exception.
     * 
     * + Set the address/configuration of the device.
     * + Set or clear the remote wake property of the device.
     * + Change to the alternate setting of an interface.
     * + Change change the suspend state of a function.
     * @param {UsbSetupPacket} setupPacket A [UsbSetupPacket](usbsetuppacket.md) object that contains the setup packet for the control transfer.
     * @param {IBuffer} buffer_ 
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbdevice.sendcontrolouttransferasync
     */
    SendControlOutTransferAsync(setupPacket, buffer_) {
        if (!this.HasProp("__IUsbDevice")) {
            if ((queryResult := this.QueryInterface(IUsbDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbDevice := IUsbDevice(outPtr)
        }

        return this.__IUsbDevice.SendControlOutTransferAsync(setupPacket, buffer_)
    }

    /**
     * Starts a USB control transfer to send data to the default control endpoint of the device.
     * @remarks
     * Most USB control transfers may be sent to the underlying WinUSB device, but the below are not permitted.  Attempting to send these message will fail and throw an exception.
     * 
     * + Set the address/configuration of the device.
     * + Set or clear the remote wake property of the device.
     * + Change to the alternate setting of an interface.
     * + Change change the suspend state of a function.
     * @param {UsbSetupPacket} setupPacket A [UsbSetupPacket](usbsetuppacket.md) object that contains the setup packet for the control transfer.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbdevice.sendcontrolouttransferasync
     */
    SendControlOutTransferAsyncNoBuffer(setupPacket) {
        if (!this.HasProp("__IUsbDevice")) {
            if ((queryResult := this.QueryInterface(IUsbDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbDevice := IUsbDevice(outPtr)
        }

        return this.__IUsbDevice.SendControlOutTransferAsyncNoBuffer(setupPacket)
    }

    /**
     * Starts a zero-length USB control transfer that reads from the default control endpoint of the device.
     * @param {UsbSetupPacket} setupPacket A [UsbSetupPacket](usbsetuppacket.md) object that contains the setup packet for the control transfer.
     * @param {IBuffer} buffer_ 
     * @returns {IAsyncOperation<IBuffer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbdevice.sendcontrolintransferasync
     */
    SendControlInTransferAsync(setupPacket, buffer_) {
        if (!this.HasProp("__IUsbDevice")) {
            if ((queryResult := this.QueryInterface(IUsbDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbDevice := IUsbDevice(outPtr)
        }

        return this.__IUsbDevice.SendControlInTransferAsync(setupPacket, buffer_)
    }

    /**
     * Starts a USB control transfer to receive data from the default control endpoint of the device.
     * @param {UsbSetupPacket} setupPacket A [UsbSetupPacket](usbsetuppacket.md) object that contains the setup packet for the control transfer.
     * @returns {IAsyncOperation<IBuffer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbdevice.sendcontrolintransferasync
     */
    SendControlInTransferAsyncNoBuffer(setupPacket) {
        if (!this.HasProp("__IUsbDevice")) {
            if ((queryResult := this.QueryInterface(IUsbDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbDevice := IUsbDevice(outPtr)
        }

        return this.__IUsbDevice.SendControlInTransferAsyncNoBuffer(setupPacket)
    }

    /**
     * 
     * @returns {UsbInterface} 
     */
    get_DefaultInterface() {
        if (!this.HasProp("__IUsbDevice")) {
            if ((queryResult := this.QueryInterface(IUsbDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbDevice := IUsbDevice(outPtr)
        }

        return this.__IUsbDevice.get_DefaultInterface()
    }

    /**
     * 
     * @returns {UsbDeviceDescriptor} 
     */
    get_DeviceDescriptor() {
        if (!this.HasProp("__IUsbDevice")) {
            if ((queryResult := this.QueryInterface(IUsbDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbDevice := IUsbDevice(outPtr)
        }

        return this.__IUsbDevice.get_DeviceDescriptor()
    }

    /**
     * 
     * @returns {UsbConfiguration} 
     */
    get_Configuration() {
        if (!this.HasProp("__IUsbDevice")) {
            if ((queryResult := this.QueryInterface(IUsbDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbDevice := IUsbDevice(outPtr)
        }

        return this.__IUsbDevice.get_Configuration()
    }

    /**
     * Releases the reference to the [UsbDevice](usbdevice.md) object that was previously obtained by calling [FromIdAsync](usbdevice_fromidasync_1322863552.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbdevice.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
