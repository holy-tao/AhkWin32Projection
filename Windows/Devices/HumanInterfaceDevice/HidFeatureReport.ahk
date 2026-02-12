#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHidFeatureReport.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a [HID Feature Report](/windows-hardware/drivers/hid/introduction-to-hid-concepts#reports).
  * 
  * Feature reports are issued by both the device and the host. Devices issue feature reports to describe their capabilities and default settings to a host. Hosts issue feature reports to make requests of the device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidfeaturereport
 * @namespace Windows.Devices.HumanInterfaceDevice
 * @version WindowsRuntime 1.4
 */
class HidFeatureReport extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHidFeatureReport

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHidFeatureReport.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the identifier associated with a given feature report.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidfeaturereport.id
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets or sets the data associated with a given feature report.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidfeaturereport.data
     * @type {IBuffer} 
     */
    Data {
        get => this.get_Data()
        set => this.put_Data(value)
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
    get_Id() {
        if (!this.HasProp("__IHidFeatureReport")) {
            if ((queryResult := this.QueryInterface(IHidFeatureReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidFeatureReport := IHidFeatureReport(outPtr)
        }

        return this.__IHidFeatureReport.get_Id()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Data() {
        if (!this.HasProp("__IHidFeatureReport")) {
            if ((queryResult := this.QueryInterface(IHidFeatureReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidFeatureReport := IHidFeatureReport(outPtr)
        }

        return this.__IHidFeatureReport.get_Data()
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_Data(value) {
        if (!this.HasProp("__IHidFeatureReport")) {
            if ((queryResult := this.QueryInterface(IHidFeatureReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidFeatureReport := IHidFeatureReport(outPtr)
        }

        return this.__IHidFeatureReport.put_Data(value)
    }

    /**
     * Retrieves the Boolean control associated with the usagePage and *usageId* parameter and found in the given feature report.
     * @param {Integer} usagePage The usage page of the top-level collection for the given HID device.
     * @param {Integer} usageId The usage identifier of the top-level collection for the given HID device.
     * @returns {HidBooleanControl} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidfeaturereport.getbooleancontrol
     */
    GetBooleanControl(usagePage, usageId) {
        if (!this.HasProp("__IHidFeatureReport")) {
            if ((queryResult := this.QueryInterface(IHidFeatureReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidFeatureReport := IHidFeatureReport(outPtr)
        }

        return this.__IHidFeatureReport.GetBooleanControl(usagePage, usageId)
    }

    /**
     * Retrieves the Boolean control described by the *controlDescription* parameter and found in the given feature report.
     * @param {HidBooleanControlDescription} controlDescription A **HidBooleanControlDescription** object.
     * @returns {HidBooleanControl} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidfeaturereport.getbooleancontrolbydescription
     */
    GetBooleanControlByDescription(controlDescription) {
        if (!this.HasProp("__IHidFeatureReport")) {
            if ((queryResult := this.QueryInterface(IHidFeatureReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidFeatureReport := IHidFeatureReport(outPtr)
        }

        return this.__IHidFeatureReport.GetBooleanControlByDescription(controlDescription)
    }

    /**
     * Retrieves the numeric control associated with the *usagePage* and *usageId* parameters and found in the given feature report.
     * @param {Integer} usagePage The usage page of the top-level collection for the given HID device.
     * @param {Integer} usageId The usage identifier of the top-level collection for the given HID device.
     * @returns {HidNumericControl} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidfeaturereport.getnumericcontrol
     */
    GetNumericControl(usagePage, usageId) {
        if (!this.HasProp("__IHidFeatureReport")) {
            if ((queryResult := this.QueryInterface(IHidFeatureReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidFeatureReport := IHidFeatureReport(outPtr)
        }

        return this.__IHidFeatureReport.GetNumericControl(usagePage, usageId)
    }

    /**
     * Retrieves the numeric control described by the *controlDescription* parameter and found in the given feature report.
     * @param {HidNumericControlDescription} controlDescription A **HidNumericControlDescription** object.
     * @returns {HidNumericControl} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidfeaturereport.getnumericcontrolbydescription
     */
    GetNumericControlByDescription(controlDescription) {
        if (!this.HasProp("__IHidFeatureReport")) {
            if ((queryResult := this.QueryInterface(IHidFeatureReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidFeatureReport := IHidFeatureReport(outPtr)
        }

        return this.__IHidFeatureReport.GetNumericControlByDescription(controlDescription)
    }

;@endregion Instance Methods
}
