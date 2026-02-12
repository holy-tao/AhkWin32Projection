#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHidGameControllerProvider.ahk
#Include .\IGameControllerProvider.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the underlying device for a HID (Human Interface Device) game controller.
 * @remarks
 * This class provides functions for sending raw HID output reports, as well as reading and writing raw HID feature reports. These reports are in their original format&mdash;no parsing is done on them.
 * 
 * This class also exposes the HID page and usage of the TLC (top-level collection), so that you can interface correctly with each supported TLC.
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.hidgamecontrollerprovider
 * @namespace Windows.Gaming.Input.Custom
 * @version WindowsRuntime 1.4
 */
class HidGameControllerProvider extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHidGameControllerProvider

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHidGameControllerProvider.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The usage ID of the top-level collection.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.hidgamecontrollerprovider.usageid
     * @type {Integer} 
     */
    UsageId {
        get => this.get_UsageId()
    }

    /**
     * The usage page of the top-level collection.
     * @remarks
     * The **UsagePage** is retrieved from the HID (Human Interface Device) report descriptor.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.hidgamecontrollerprovider.usagepage
     * @type {Integer} 
     */
    UsagePage {
        get => this.get_UsagePage()
    }

    /**
     * The firmware version of the controller.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.hidgamecontrollerprovider.firmwareversioninfo
     * @type {GameControllerVersionInfo} 
     */
    FirmwareVersionInfo {
        get => this.get_FirmwareVersionInfo()
    }

    /**
     * The hardware product ID of the controller.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.hidgamecontrollerprovider.hardwareproductid
     * @type {Integer} 
     */
    HardwareProductId {
        get => this.get_HardwareProductId()
    }

    /**
     * The hardware vendor ID of the controller.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.hidgamecontrollerprovider.hardwarevendorid
     * @type {Integer} 
     */
    HardwareVendorId {
        get => this.get_HardwareVendorId()
    }

    /**
     * Contains information on the hardware version of the controller.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.hidgamecontrollerprovider.hardwareversioninfo
     * @type {GameControllerVersionInfo} 
     */
    HardwareVersionInfo {
        get => this.get_HardwareVersionInfo()
    }

    /**
     * Boolean value indicating whether the controller is connected.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.hidgamecontrollerprovider.isconnected
     * @type {Boolean} 
     */
    IsConnected {
        get => this.get_IsConnected()
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
    get_UsageId() {
        if (!this.HasProp("__IHidGameControllerProvider")) {
            if ((queryResult := this.QueryInterface(IHidGameControllerProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidGameControllerProvider := IHidGameControllerProvider(outPtr)
        }

        return this.__IHidGameControllerProvider.get_UsageId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UsagePage() {
        if (!this.HasProp("__IHidGameControllerProvider")) {
            if ((queryResult := this.QueryInterface(IHidGameControllerProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidGameControllerProvider := IHidGameControllerProvider(outPtr)
        }

        return this.__IHidGameControllerProvider.get_UsagePage()
    }

    /**
     * Gets the specified HID (Human Interface Device) feature report from the controller.
     * @remarks
     * When using this method for your own custom classes, make sure to pass in a valid report ID that is supported by your device; otherwise, the report buffer will be unchanged. Also make sure that your report buffer is the correct size for the type of report that you're requesting.
     * 
     * The report that you get from this method is the raw, unmodified version in its original format; no parsing is done on it.
     * @param {Integer} reportId The ID of the report to get.
     * @param {Pointer<Integer>} reportBuffer_length 
     * @param {Pointer<Pointer<Integer>>} reportBuffer The buffer in which the report data is returned.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.hidgamecontrollerprovider.getfeaturereport
     */
    GetFeatureReport(reportId, reportBuffer_length, reportBuffer) {
        if (!this.HasProp("__IHidGameControllerProvider")) {
            if ((queryResult := this.QueryInterface(IHidGameControllerProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidGameControllerProvider := IHidGameControllerProvider(outPtr)
        }

        return this.__IHidGameControllerProvider.GetFeatureReport(reportId, reportBuffer_length, reportBuffer)
    }

    /**
     * Sends the specified HID (Human Interface Device) feature report to the device.
     * @remarks
     * When using this method for your own custom classes, make sure to pass in a valid report ID that is supported by your device; otherwise, the device will ignore it. Also make sure that your report buffer is the correct size and has valid contents.
     * 
     * The report that you send from this method is the raw, unmodified version in its original format; no parsing is done on it.
     * @param {Integer} reportId The ID of the report to send.
     * @param {Integer} reportBuffer_length 
     * @param {Pointer<Integer>} reportBuffer The buffer containing the report data to send.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.hidgamecontrollerprovider.sendfeaturereport
     */
    SendFeatureReport(reportId, reportBuffer_length, reportBuffer) {
        if (!this.HasProp("__IHidGameControllerProvider")) {
            if ((queryResult := this.QueryInterface(IHidGameControllerProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidGameControllerProvider := IHidGameControllerProvider(outPtr)
        }

        return this.__IHidGameControllerProvider.SendFeatureReport(reportId, reportBuffer_length, reportBuffer)
    }

    /**
     * Sends the specified HID (Human Interface Device) output report to the device.
     * @remarks
     * When using this method for your own custom classes, make sure to pass in a valid report ID that is supported by your device; otherwise, the device will ignore it. Also make sure that your report buffer is the correct size and has valid contents.
     * 
     * The report that you send from this function is the raw, unmodified version in its original format; no parsing is done on it.
     * @param {Integer} reportId The ID of the report to send.
     * @param {Integer} reportBuffer_length 
     * @param {Pointer<Integer>} reportBuffer The buffer containing the report data to send.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.hidgamecontrollerprovider.sendoutputreport
     */
    SendOutputReport(reportId, reportBuffer_length, reportBuffer) {
        if (!this.HasProp("__IHidGameControllerProvider")) {
            if ((queryResult := this.QueryInterface(IHidGameControllerProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidGameControllerProvider := IHidGameControllerProvider(outPtr)
        }

        return this.__IHidGameControllerProvider.SendOutputReport(reportId, reportBuffer_length, reportBuffer)
    }

    /**
     * 
     * @returns {GameControllerVersionInfo} 
     */
    get_FirmwareVersionInfo() {
        if (!this.HasProp("__IGameControllerProvider")) {
            if ((queryResult := this.QueryInterface(IGameControllerProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameControllerProvider := IGameControllerProvider(outPtr)
        }

        return this.__IGameControllerProvider.get_FirmwareVersionInfo()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HardwareProductId() {
        if (!this.HasProp("__IGameControllerProvider")) {
            if ((queryResult := this.QueryInterface(IGameControllerProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameControllerProvider := IGameControllerProvider(outPtr)
        }

        return this.__IGameControllerProvider.get_HardwareProductId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HardwareVendorId() {
        if (!this.HasProp("__IGameControllerProvider")) {
            if ((queryResult := this.QueryInterface(IGameControllerProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameControllerProvider := IGameControllerProvider(outPtr)
        }

        return this.__IGameControllerProvider.get_HardwareVendorId()
    }

    /**
     * 
     * @returns {GameControllerVersionInfo} 
     */
    get_HardwareVersionInfo() {
        if (!this.HasProp("__IGameControllerProvider")) {
            if ((queryResult := this.QueryInterface(IGameControllerProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameControllerProvider := IGameControllerProvider(outPtr)
        }

        return this.__IGameControllerProvider.get_HardwareVersionInfo()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsConnected() {
        if (!this.HasProp("__IGameControllerProvider")) {
            if ((queryResult := this.QueryInterface(IGameControllerProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameControllerProvider := IGameControllerProvider(outPtr)
        }

        return this.__IGameControllerProvider.get_IsConnected()
    }

;@endregion Instance Methods
}
