#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHidBooleanControlDescription.ahk
#Include .\IHidBooleanControlDescription2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Describes a Boolean control for a given HID device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidbooleancontroldescription
 * @namespace Windows.Devices.HumanInterfaceDevice
 * @version WindowsRuntime 1.4
 */
class HidBooleanControlDescription extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHidBooleanControlDescription

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHidBooleanControlDescription.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the identifier for a given Boolean control.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidbooleancontroldescription.id
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the report ID of the HID report that contains the usage or usage range for the given Boolean control.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidbooleancontroldescription.reportid
     * @type {Integer} 
     */
    ReportId {
        get => this.get_ReportId()
    }

    /**
     * Gets the type of [HID report](/windows-hardware/drivers/hid/introduction-to-hid-concepts#reports) associated with the given Boolean control.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidbooleancontroldescription.reporttype
     * @type {Integer} 
     */
    ReportType {
        get => this.get_ReportType()
    }

    /**
     * Gets the usage page associated with the given Boolean control.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidbooleancontroldescription.usagepage
     * @type {Integer} 
     */
    UsagePage {
        get => this.get_UsagePage()
    }

    /**
     * Gets the usage identifier associated with the given Boolean control.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidbooleancontroldescription.usageid
     * @type {Integer} 
     */
    UsageId {
        get => this.get_UsageId()
    }

    /**
     * Gets the parent collection for a given Boolean control.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidbooleancontroldescription.parentcollections
     * @type {IVectorView<HidCollection>} 
     */
    ParentCollections {
        get => this.get_ParentCollections()
    }

    /**
     * Gets a value indicating whether the given boolean control values are absolute or relative (change in value from that previously reported).
     * @remarks
     * This property is useful when an app provides similar functionality as the system and needs to keep the corresponding in-app control synchronized with the system setting. For example, an in-app (relative) mute button that doesn't affect the system volume, but which must correspond to any changes made to the system setting (absolute).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidbooleancontroldescription.isabsolute
     * @type {Boolean} 
     */
    IsAbsolute {
        get => this.get_IsAbsolute()
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
        if (!this.HasProp("__IHidBooleanControlDescription")) {
            if ((queryResult := this.QueryInterface(IHidBooleanControlDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidBooleanControlDescription := IHidBooleanControlDescription(outPtr)
        }

        return this.__IHidBooleanControlDescription.get_Id()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReportId() {
        if (!this.HasProp("__IHidBooleanControlDescription")) {
            if ((queryResult := this.QueryInterface(IHidBooleanControlDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidBooleanControlDescription := IHidBooleanControlDescription(outPtr)
        }

        return this.__IHidBooleanControlDescription.get_ReportId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReportType() {
        if (!this.HasProp("__IHidBooleanControlDescription")) {
            if ((queryResult := this.QueryInterface(IHidBooleanControlDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidBooleanControlDescription := IHidBooleanControlDescription(outPtr)
        }

        return this.__IHidBooleanControlDescription.get_ReportType()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UsagePage() {
        if (!this.HasProp("__IHidBooleanControlDescription")) {
            if ((queryResult := this.QueryInterface(IHidBooleanControlDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidBooleanControlDescription := IHidBooleanControlDescription(outPtr)
        }

        return this.__IHidBooleanControlDescription.get_UsagePage()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UsageId() {
        if (!this.HasProp("__IHidBooleanControlDescription")) {
            if ((queryResult := this.QueryInterface(IHidBooleanControlDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidBooleanControlDescription := IHidBooleanControlDescription(outPtr)
        }

        return this.__IHidBooleanControlDescription.get_UsageId()
    }

    /**
     * 
     * @returns {IVectorView<HidCollection>} 
     */
    get_ParentCollections() {
        if (!this.HasProp("__IHidBooleanControlDescription")) {
            if ((queryResult := this.QueryInterface(IHidBooleanControlDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidBooleanControlDescription := IHidBooleanControlDescription(outPtr)
        }

        return this.__IHidBooleanControlDescription.get_ParentCollections()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAbsolute() {
        if (!this.HasProp("__IHidBooleanControlDescription2")) {
            if ((queryResult := this.QueryInterface(IHidBooleanControlDescription2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidBooleanControlDescription2 := IHidBooleanControlDescription2(outPtr)
        }

        return this.__IHidBooleanControlDescription2.get_IsAbsolute()
    }

;@endregion Instance Methods
}
