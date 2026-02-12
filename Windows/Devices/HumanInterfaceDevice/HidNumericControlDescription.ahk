#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHidNumericControlDescription.ahk
#Include ..\..\..\Guid.ahk

/**
 * Describes a numeric control for a given HID device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidnumericcontroldescription
 * @namespace Windows.Devices.HumanInterfaceDevice
 * @version WindowsRuntime 1.4
 */
class HidNumericControlDescription extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHidNumericControlDescription

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHidNumericControlDescription.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the identifier for a given numeric control.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidnumericcontroldescription.id
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the report ID of the HID report that contains the usage or usage range for the given numeric control.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidnumericcontroldescription.reportid
     * @type {Integer} 
     */
    ReportId {
        get => this.get_ReportId()
    }

    /**
     * Gets the type of [HID report](/windows-hardware/drivers/hid/introduction-to-hid-concepts#reports) associated with the given numeric control.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidnumericcontroldescription.reporttype
     * @type {Integer} 
     */
    ReportType {
        get => this.get_ReportType()
    }

    /**
     * Gets the size of the data field for the usage in a report.
     * @remarks
     * If [ReportCount](hidnumericcontroldescription_reportcount.md) is greater than one, each usage has a separate data field of this size.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidnumericcontroldescription.reportsize
     * @type {Integer} 
     */
    ReportSize {
        get => this.get_ReportSize()
    }

    /**
     * Gets the number of reports associated with the given control.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidnumericcontroldescription.reportcount
     * @type {Integer} 
     */
    ReportCount {
        get => this.get_ReportCount()
    }

    /**
     * Gets the usage page associated with the given numeric control.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidnumericcontroldescription.usagepage
     * @type {Integer} 
     */
    UsagePage {
        get => this.get_UsagePage()
    }

    /**
     * Gets the usage identifier associated with the given numeric control.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidnumericcontroldescription.usageid
     * @type {Integer} 
     */
    UsageId {
        get => this.get_UsageId()
    }

    /**
     * Gets the lowest possible value for the given control.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidnumericcontroldescription.logicalminimum
     * @type {Integer} 
     */
    LogicalMinimum {
        get => this.get_LogicalMinimum()
    }

    /**
     * Gets the highest possible value for the given control.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidnumericcontroldescription.logicalmaximum
     * @type {Integer} 
     */
    LogicalMaximum {
        get => this.get_LogicalMaximum()
    }

    /**
     * Gets the lowest possible value for the given control after scaling is applied to the [LogicalMinimum](hidnumericcontroldescription_logicalminimum.md) value.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidnumericcontroldescription.physicalminimum
     * @type {Integer} 
     */
    PhysicalMinimum {
        get => this.get_PhysicalMinimum()
    }

    /**
     * Gets the highest possible value for the given control after scaling is applied to the [LogicalMaximum](hidnumericcontroldescription_logicalmaximum.md)  value.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidnumericcontroldescription.physicalmaximum
     * @type {Integer} 
     */
    PhysicalMaximum {
        get => this.get_PhysicalMaximum()
    }

    /**
     * Gets the unit exponent for the given numeric control.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidnumericcontroldescription.unitexponent
     * @type {Integer} 
     */
    UnitExponent {
        get => this.get_UnitExponent()
    }

    /**
     * Specifies the units of the usage, as described by the USB HID Standard.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidnumericcontroldescription.unit
     * @type {Integer} 
     */
    Unit {
        get => this.get_Unit()
    }

    /**
     * Gets a value indicating whether the given numeric control values are absolute or relative (change in value from that previously reported).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidnumericcontroldescription.isabsolute
     * @type {Boolean} 
     */
    IsAbsolute {
        get => this.get_IsAbsolute()
    }

    /**
     * Gets a Boolean value which indicates whether the control supports a null, or out-of-range, value.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidnumericcontroldescription.hasnull
     * @type {Boolean} 
     */
    HasNull {
        get => this.get_HasNull()
    }

    /**
     * Gets the parent collections for a given numeric control.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidnumericcontroldescription.parentcollections
     * @type {IVectorView<HidCollection>} 
     */
    ParentCollections {
        get => this.get_ParentCollections()
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
        if (!this.HasProp("__IHidNumericControlDescription")) {
            if ((queryResult := this.QueryInterface(IHidNumericControlDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidNumericControlDescription := IHidNumericControlDescription(outPtr)
        }

        return this.__IHidNumericControlDescription.get_Id()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReportId() {
        if (!this.HasProp("__IHidNumericControlDescription")) {
            if ((queryResult := this.QueryInterface(IHidNumericControlDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidNumericControlDescription := IHidNumericControlDescription(outPtr)
        }

        return this.__IHidNumericControlDescription.get_ReportId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReportType() {
        if (!this.HasProp("__IHidNumericControlDescription")) {
            if ((queryResult := this.QueryInterface(IHidNumericControlDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidNumericControlDescription := IHidNumericControlDescription(outPtr)
        }

        return this.__IHidNumericControlDescription.get_ReportType()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReportSize() {
        if (!this.HasProp("__IHidNumericControlDescription")) {
            if ((queryResult := this.QueryInterface(IHidNumericControlDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidNumericControlDescription := IHidNumericControlDescription(outPtr)
        }

        return this.__IHidNumericControlDescription.get_ReportSize()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReportCount() {
        if (!this.HasProp("__IHidNumericControlDescription")) {
            if ((queryResult := this.QueryInterface(IHidNumericControlDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidNumericControlDescription := IHidNumericControlDescription(outPtr)
        }

        return this.__IHidNumericControlDescription.get_ReportCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UsagePage() {
        if (!this.HasProp("__IHidNumericControlDescription")) {
            if ((queryResult := this.QueryInterface(IHidNumericControlDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidNumericControlDescription := IHidNumericControlDescription(outPtr)
        }

        return this.__IHidNumericControlDescription.get_UsagePage()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UsageId() {
        if (!this.HasProp("__IHidNumericControlDescription")) {
            if ((queryResult := this.QueryInterface(IHidNumericControlDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidNumericControlDescription := IHidNumericControlDescription(outPtr)
        }

        return this.__IHidNumericControlDescription.get_UsageId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LogicalMinimum() {
        if (!this.HasProp("__IHidNumericControlDescription")) {
            if ((queryResult := this.QueryInterface(IHidNumericControlDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidNumericControlDescription := IHidNumericControlDescription(outPtr)
        }

        return this.__IHidNumericControlDescription.get_LogicalMinimum()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LogicalMaximum() {
        if (!this.HasProp("__IHidNumericControlDescription")) {
            if ((queryResult := this.QueryInterface(IHidNumericControlDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidNumericControlDescription := IHidNumericControlDescription(outPtr)
        }

        return this.__IHidNumericControlDescription.get_LogicalMaximum()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PhysicalMinimum() {
        if (!this.HasProp("__IHidNumericControlDescription")) {
            if ((queryResult := this.QueryInterface(IHidNumericControlDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidNumericControlDescription := IHidNumericControlDescription(outPtr)
        }

        return this.__IHidNumericControlDescription.get_PhysicalMinimum()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PhysicalMaximum() {
        if (!this.HasProp("__IHidNumericControlDescription")) {
            if ((queryResult := this.QueryInterface(IHidNumericControlDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidNumericControlDescription := IHidNumericControlDescription(outPtr)
        }

        return this.__IHidNumericControlDescription.get_PhysicalMaximum()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UnitExponent() {
        if (!this.HasProp("__IHidNumericControlDescription")) {
            if ((queryResult := this.QueryInterface(IHidNumericControlDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidNumericControlDescription := IHidNumericControlDescription(outPtr)
        }

        return this.__IHidNumericControlDescription.get_UnitExponent()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Unit() {
        if (!this.HasProp("__IHidNumericControlDescription")) {
            if ((queryResult := this.QueryInterface(IHidNumericControlDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidNumericControlDescription := IHidNumericControlDescription(outPtr)
        }

        return this.__IHidNumericControlDescription.get_Unit()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAbsolute() {
        if (!this.HasProp("__IHidNumericControlDescription")) {
            if ((queryResult := this.QueryInterface(IHidNumericControlDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidNumericControlDescription := IHidNumericControlDescription(outPtr)
        }

        return this.__IHidNumericControlDescription.get_IsAbsolute()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasNull() {
        if (!this.HasProp("__IHidNumericControlDescription")) {
            if ((queryResult := this.QueryInterface(IHidNumericControlDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidNumericControlDescription := IHidNumericControlDescription(outPtr)
        }

        return this.__IHidNumericControlDescription.get_HasNull()
    }

    /**
     * 
     * @returns {IVectorView<HidCollection>} 
     */
    get_ParentCollections() {
        if (!this.HasProp("__IHidNumericControlDescription")) {
            if ((queryResult := this.QueryInterface(IHidNumericControlDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidNumericControlDescription := IHidNumericControlDescription(outPtr)
        }

        return this.__IHidNumericControlDescription.get_ParentCollections()
    }

;@endregion Instance Methods
}
