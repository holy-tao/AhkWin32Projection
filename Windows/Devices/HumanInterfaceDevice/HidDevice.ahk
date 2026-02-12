#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHidDevice.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IHidDeviceStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\HidDevice.ahk
#Include .\HidInputReportReceivedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a top-level collection and the corresponding device.
 * @remarks
 * For more information about using this class, including limitations, see [Supporting human interface devices (HID)](/previous-versions/windows/apps/dn263140(v=win.10)) and [Custom HID device sample](https://github.com/microsoft/Windows-universal-samples/tree/master/Samples/CustomHidDeviceAccess).
 * 
 * Apps that use this class to access a HID device must include specific **DeviceCapability** data in the **Capabilities** node of its manifest. This data identifies the device and its purpose (or function). For more information, see [How to specify device capabilities for HID](/uwp/schemas/appxpackage/how-to-specify-device-capabilities-for-hid).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hiddevice
 * @namespace Windows.Devices.HumanInterfaceDevice
 * @version WindowsRuntime 1.4
 */
class HidDevice extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHidDevice

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHidDevice.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves an Advanced Query Syntax (AQS) string based on the given *usagePage* and *usageId*.
     * @param {Integer} usagePage Specifies the usage page of the top-level collection for the given HID device.
     * @param {Integer} usageId Specifies the usage identifier of the top-level collection for the given HID device.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hiddevice.getdeviceselector
     */
    static GetDeviceSelector(usagePage, usageId) {
        if (!HidDevice.HasProp("__IHidDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.HumanInterfaceDevice.HidDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHidDeviceStatics.IID)
            HidDevice.__IHidDeviceStatics := IHidDeviceStatics(factoryPtr)
        }

        return HidDevice.__IHidDeviceStatics.GetDeviceSelector(usagePage, usageId)
    }

    /**
     * Retrieves an Advanced Query Syntax (AQS) string based on the given *usagePage* and *usageId*.
     * @param {Integer} usagePage Specifies the usage page of the top-level collection for the given HID device.
     * @param {Integer} usageId Specifies the usage identifier of the top-level collection for the given HID device.
     * @param {Integer} vendorId 
     * @param {Integer} productId 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hiddevice.getdeviceselector
     */
    static GetDeviceSelectorVidPid(usagePage, usageId, vendorId, productId) {
        if (!HidDevice.HasProp("__IHidDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.HumanInterfaceDevice.HidDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHidDeviceStatics.IID)
            HidDevice.__IHidDeviceStatics := IHidDeviceStatics(factoryPtr)
        }

        return HidDevice.__IHidDeviceStatics.GetDeviceSelectorVidPid(usagePage, usageId, vendorId, productId)
    }

    /**
     * Opens a handle to the device identified by the *deviceId* parameter. The access type is specified by the *accessMode* parameter.
     * @remarks
     * The first time this method is invoked by a store app, it should be called from a UI thread in order to display the consent prompt. After the user has granted consent, the method can be invoked from any application thread.
     * 
     * The application manifest must declare HID device capabilities before invoking this method. If HID device capabilities are missing or incorrectly specified, the returned value will be `null` and no exception will be thrown.
     * 
     * The device must be opened with [FileAccessMode.ReadWrite](../windows.storage/fileaccessmode.md) to call [SendOutputReportAsync](hiddevice_sendoutputreportasync_1405795481.md) or the call will fail with a `System.UnauthorizedAccessException: Access is denied. (Excep_FromHResult 0x80070005)` exception. To call [SendFeatureReportAsync](hiddevice_sendfeaturereportasync_25126117.md), [GetFeatureReportAsync](hiddevice_getfeaturereportasync_706664006.md) or [GetInputReportAsync](hiddevice_getinputreportasync_2092816092.md), the device must be opened with either [FileAccessMode.Read](../windows.storage/fileaccessmode.md) or [FileAccessMode.ReadWrite](../windows.storage/fileaccessmode.md)
     * @param {HSTRING} deviceId The [DeviceInformation](/uwp/api/Windows.Devices.Enumeration.DeviceInformation) ID that identifies the HID device.
     * @param {Integer} accessMode Specifies the access mode. The supported access modes are Read and ReadWrite.
     * @returns {IAsyncOperation<HidDevice>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hiddevice.fromidasync
     */
    static FromIdAsync(deviceId, accessMode) {
        if (!HidDevice.HasProp("__IHidDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.HumanInterfaceDevice.HidDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHidDeviceStatics.IID)
            HidDevice.__IHidDeviceStatics := IHidDeviceStatics(factoryPtr)
        }

        return HidDevice.__IHidDeviceStatics.FromIdAsync(deviceId, accessMode)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the vendor identifier for the given HID device.
     * @remarks
     * Valid values are 0 through 0xFFFF.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hiddevice.vendorid
     * @type {Integer} 
     */
    VendorId {
        get => this.get_VendorId()
    }

    /**
     * Gets the product identifier for the given HID device.
     * @remarks
     * Valid values are 0 through 0xFFFF.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hiddevice.productid
     * @type {Integer} 
     */
    ProductId {
        get => this.get_ProductId()
    }

    /**
     * Gets the version, or revision, number for the given HID device.
     * @remarks
     * The version is retrieved from the device descriptor.
     * 
     * Valid values are 0 through 0xFFFF.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hiddevice.version
     * @type {Integer} 
     */
    Version {
        get => this.get_Version()
    }

    /**
     * Gets the usage page of the top-level collection.
     * @remarks
     * The **UsagePage** of the top-level collection is retrieved from the HID report descriptor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hiddevice.usagepage
     * @type {Integer} 
     */
    UsagePage {
        get => this.get_UsagePage()
    }

    /**
     * Gets the usage identifier for the given HID device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hiddevice.usageid
     * @type {Integer} 
     */
    UsageId {
        get => this.get_UsageId()
    }

    /**
     * Establishes an event listener to handle input reports issued by the device when either [GetInputReportAsync()](hiddevice_getinputreportasync_2092816092.md) or [GetInputReportAsync(System.UInt16 reportId)](hiddevice_getinputreportasync_294410273.md) is called.
     * @remarks
     * This method waits for the device to interrupt the host when it has data to send. Internally, the HID WinRT API sends a IOCTL read request to a lower driver in the stack.
     * 
     * The IOCTL is translated by the HID minidriver into a protocol-specific request. For a USB device, the minidriver translates this into an INTERRUPT IN request. And, for an I2C device that is running over the Microsoft HID-I2C miniport driver, the minidriver will wait for the device to assert an interrupt.
     * @type {TypedEventHandler<HidDevice, HidInputReportReceivedEventArgs>}
    */
    OnInputReportReceived {
        get {
            if(!this.HasProp("__OnInputReportReceived")){
                this.__OnInputReportReceived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{31e757c8-8f6a-540b-938b-aba79b6f03ec}"),
                    HidDevice,
                    HidInputReportReceivedEventArgs
                )
                this.__OnInputReportReceivedToken := this.add_InputReportReceived(this.__OnInputReportReceived.iface)
            }
            return this.__OnInputReportReceived
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnInputReportReceivedToken")) {
            this.remove_InputReportReceived(this.__OnInputReportReceivedToken)
            this.__OnInputReportReceived.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VendorId() {
        if (!this.HasProp("__IHidDevice")) {
            if ((queryResult := this.QueryInterface(IHidDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidDevice := IHidDevice(outPtr)
        }

        return this.__IHidDevice.get_VendorId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProductId() {
        if (!this.HasProp("__IHidDevice")) {
            if ((queryResult := this.QueryInterface(IHidDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidDevice := IHidDevice(outPtr)
        }

        return this.__IHidDevice.get_ProductId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Version() {
        if (!this.HasProp("__IHidDevice")) {
            if ((queryResult := this.QueryInterface(IHidDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidDevice := IHidDevice(outPtr)
        }

        return this.__IHidDevice.get_Version()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UsagePage() {
        if (!this.HasProp("__IHidDevice")) {
            if ((queryResult := this.QueryInterface(IHidDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidDevice := IHidDevice(outPtr)
        }

        return this.__IHidDevice.get_UsagePage()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UsageId() {
        if (!this.HasProp("__IHidDevice")) {
            if ((queryResult := this.QueryInterface(IHidDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidDevice := IHidDevice(outPtr)
        }

        return this.__IHidDevice.get_UsageId()
    }

    /**
     * Asynchronously retrieves an input report, identified by the *reportId* parameter, from the given HID device.
     * @remarks
     * When this method completes, the [InputReportReceived](hiddevice_inputreportreceived.md) event is triggered.
     * 
     * To access the content of the input report, you must set up a listener for the [InputReportReceived](hiddevice_inputreportreceived.md) event and get the [Report](/uwp/api/windows.devices.humaninterfacedevice.hidinputreportreceivedeventargs#Windows_Devices_HumanInterfaceDevice_HidInputReportReceivedEventArgs_Report) property of [HidInputReportReceivedEventArgs](/uwp/api/windows.devices.humaninterfacedevice.hidinputreportreceivedeventargs) object in the event handler.
     * 
     * The device must be opened with either [FileAccessMode.Read](../windows.storage/fileaccessmode.md) or [FileAccessMode.ReadWrite](../windows.storage/fileaccessmode.md).
     * @returns {IAsyncOperation<HidInputReport>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hiddevice.getinputreportasync
     */
    GetInputReportAsync() {
        if (!this.HasProp("__IHidDevice")) {
            if ((queryResult := this.QueryInterface(IHidDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidDevice := IHidDevice(outPtr)
        }

        return this.__IHidDevice.GetInputReportAsync()
    }

    /**
     * Asynchronously retrieves the default, or first, input report from the given HID device.
     * @remarks
     * When this method completes, the [InputReportReceived](hiddevice_inputreportreceived.md) event is triggered.
     * 
     * To access the content of the input report, you must set up a listener for the [InputReportReceived](hiddevice_inputreportreceived.md) event and get the [Report](/uwp/api/windows.devices.humaninterfacedevice.hidinputreportreceivedeventargs#Windows_Devices_HumanInterfaceDevice_HidInputReportReceivedEventArgs_Report) property of [HidInputReportReceivedEventArgs](/uwp/api/windows.devices.humaninterfacedevice.hidinputreportreceivedeventargs) object in the event handler.
     * 
     * The device must be opened with either [FileAccessMode.Read](../windows.storage/fileaccessmode.md) or [FileAccessMode.ReadWrite](../windows.storage/fileaccessmode.md).
     * @param {Integer} reportId 
     * @returns {IAsyncOperation<HidInputReport>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hiddevice.getinputreportasync
     */
    GetInputReportByIdAsync(reportId) {
        if (!this.HasProp("__IHidDevice")) {
            if ((queryResult := this.QueryInterface(IHidDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidDevice := IHidDevice(outPtr)
        }

        return this.__IHidDevice.GetInputReportByIdAsync(reportId)
    }

    /**
     * Asynchronously retrieves a feature report, identified by the *reportId* parameter, for the given HID device.
     * @remarks
     * The device must be opened with either [FileAccessMode.Read](../windows.storage/fileaccessmode.md) or [FileAccessMode.ReadWrite](../windows.storage/fileaccessmode.md).
     * @returns {IAsyncOperation<HidFeatureReport>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hiddevice.getfeaturereportasync
     */
    GetFeatureReportAsync() {
        if (!this.HasProp("__IHidDevice")) {
            if ((queryResult := this.QueryInterface(IHidDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidDevice := IHidDevice(outPtr)
        }

        return this.__IHidDevice.GetFeatureReportAsync()
    }

    /**
     * Asynchronously retrieves the first, or default, feature report from the given HID device.
     * @remarks
     * This instance of the method retrieves the first available feature report.
     * 
     * The device must be opened with either [FileAccessMode.Read](../windows.storage/fileaccessmode.md) or [FileAccessMode.ReadWrite](../windows.storage/fileaccessmode.md).
     * @param {Integer} reportId 
     * @returns {IAsyncOperation<HidFeatureReport>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hiddevice.getfeaturereportasync
     */
    GetFeatureReportByIdAsync(reportId) {
        if (!this.HasProp("__IHidDevice")) {
            if ((queryResult := this.QueryInterface(IHidDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidDevice := IHidDevice(outPtr)
        }

        return this.__IHidDevice.GetFeatureReportByIdAsync(reportId)
    }

    /**
     * Creates an output report, identified by the *reportId* parameter, that the host will send to the device.
     * @returns {HidOutputReport} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hiddevice.createoutputreport
     */
    CreateOutputReport() {
        if (!this.HasProp("__IHidDevice")) {
            if ((queryResult := this.QueryInterface(IHidDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidDevice := IHidDevice(outPtr)
        }

        return this.__IHidDevice.CreateOutputReport()
    }

    /**
     * Creates the only, or default, output report that the host will send to the device.
     * @param {Integer} reportId 
     * @returns {HidOutputReport} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hiddevice.createoutputreport
     */
    CreateOutputReportById(reportId) {
        if (!this.HasProp("__IHidDevice")) {
            if ((queryResult := this.QueryInterface(IHidDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidDevice := IHidDevice(outPtr)
        }

        return this.__IHidDevice.CreateOutputReportById(reportId)
    }

    /**
     * Creates a feature report, identified by the *reportId* parameter, that the host will send to the device.
     * @returns {HidFeatureReport} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hiddevice.createfeaturereport
     */
    CreateFeatureReport() {
        if (!this.HasProp("__IHidDevice")) {
            if ((queryResult := this.QueryInterface(IHidDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidDevice := IHidDevice(outPtr)
        }

        return this.__IHidDevice.CreateFeatureReport()
    }

    /**
     * Creates the only, or default, feature report that the host will send to the device.
     * @param {Integer} reportId 
     * @returns {HidFeatureReport} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hiddevice.createfeaturereport
     */
    CreateFeatureReportById(reportId) {
        if (!this.HasProp("__IHidDevice")) {
            if ((queryResult := this.QueryInterface(IHidDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidDevice := IHidDevice(outPtr)
        }

        return this.__IHidDevice.CreateFeatureReportById(reportId)
    }

    /**
     * Sends an output report asynchronously from the host to the device.
     * @remarks
     * The device must be opened with [FileAccessMode.ReadWrite](../windows.storage/fileaccessmode.md).
     * @param {HidOutputReport} outputReport The output report which the host sends to the device.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hiddevice.sendoutputreportasync
     */
    SendOutputReportAsync(outputReport) {
        if (!this.HasProp("__IHidDevice")) {
            if ((queryResult := this.QueryInterface(IHidDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidDevice := IHidDevice(outPtr)
        }

        return this.__IHidDevice.SendOutputReportAsync(outputReport)
    }

    /**
     * Sends an feature report asynchronously from the host to the device.
     * @remarks
     * The device must be opened with either [FileAccessMode.Read](../windows.storage/fileaccessmode.md) or [FileAccessMode.ReadWrite](../windows.storage/fileaccessmode.md).
     * @param {HidFeatureReport} featureReport The feature report which the host sends to the device.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hiddevice.sendfeaturereportasync
     */
    SendFeatureReportAsync(featureReport) {
        if (!this.HasProp("__IHidDevice")) {
            if ((queryResult := this.QueryInterface(IHidDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidDevice := IHidDevice(outPtr)
        }

        return this.__IHidDevice.SendFeatureReportAsync(featureReport)
    }

    /**
     * Retrieves the descriptions of the boolean controls for the given HID device.
     * @remarks
     * Boolean controls are simple controls that return On/Off values. (They are sometimes referred to as button controls.)
     * @param {Integer} reportType Specifies the type of report for which the control descriptions are requested.
     * @param {Integer} usagePage Identifies the usage page associated with the controls.
     * 
     * A value of 0 is treated as a wild card for all usage pages.
     * @param {Integer} usageId Identifies the usage associated with the controls.
     * 
     * A value of 0 is treated as a wild card for all usage IDs.
     * @returns {IVectorView<HidBooleanControlDescription>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hiddevice.getbooleancontroldescriptions
     */
    GetBooleanControlDescriptions(reportType, usagePage, usageId) {
        if (!this.HasProp("__IHidDevice")) {
            if ((queryResult := this.QueryInterface(IHidDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidDevice := IHidDevice(outPtr)
        }

        return this.__IHidDevice.GetBooleanControlDescriptions(reportType, usagePage, usageId)
    }

    /**
     * Retrieves the descriptions of the numeric controls for the given HID device.
     * @param {Integer} reportType Specifies the type of report for which the control descriptions are requested.
     * @param {Integer} usagePage Identifies the usage page associated with the controls.
     * 
     * A value of 0 is treated as a wild card for all usage pages.
     * @param {Integer} usageId Identifies the usage associated with the controls.
     * 
     * A value of 0 is treated as a wild card for all usage IDs.
     * @returns {IVectorView<HidNumericControlDescription>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hiddevice.getnumericcontroldescriptions
     */
    GetNumericControlDescriptions(reportType, usagePage, usageId) {
        if (!this.HasProp("__IHidDevice")) {
            if ((queryResult := this.QueryInterface(IHidDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidDevice := IHidDevice(outPtr)
        }

        return this.__IHidDevice.GetNumericControlDescriptions(reportType, usagePage, usageId)
    }

    /**
     * 
     * @param {TypedEventHandler<HidDevice, HidInputReportReceivedEventArgs>} reportHandler 
     * @returns {EventRegistrationToken} 
     */
    add_InputReportReceived(reportHandler) {
        if (!this.HasProp("__IHidDevice")) {
            if ((queryResult := this.QueryInterface(IHidDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidDevice := IHidDevice(outPtr)
        }

        return this.__IHidDevice.add_InputReportReceived(reportHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_InputReportReceived(token) {
        if (!this.HasProp("__IHidDevice")) {
            if ((queryResult := this.QueryInterface(IHidDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidDevice := IHidDevice(outPtr)
        }

        return this.__IHidDevice.remove_InputReportReceived(token)
    }

    /**
     * Closes the connection between the host and the given HID device.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hiddevice.close
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
