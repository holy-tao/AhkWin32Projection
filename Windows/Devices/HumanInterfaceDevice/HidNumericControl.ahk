#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHidNumericControl.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a numeric control on a HID device that returns a range of values. An example would be the volume control on a speaker.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidnumericcontrol
 * @namespace Windows.Devices.HumanInterfaceDevice
 * @version WindowsRuntime 1.4
 */
class HidNumericControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHidNumericControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHidNumericControl.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the identifier for the given numeric control.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidnumericcontrol.id
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets a Boolean value that indicates whether the given numeric control is grouped with other, related controls.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidnumericcontrol.isgrouped
     * @type {Boolean} 
     */
    IsGrouped {
        get => this.get_IsGrouped()
    }

    /**
     * Gets the usage page for the given numeric control.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidnumericcontrol.usagepage
     * @type {Integer} 
     */
    UsagePage {
        get => this.get_UsagePage()
    }

    /**
     * Gets the usage identifier for the given numeric control.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidnumericcontrol.usageid
     * @type {Integer} 
     */
    UsageId {
        get => this.get_UsageId()
    }

    /**
     * Gets or sets the numeric value for a given control.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidnumericcontrol.value
     * @type {Integer} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

    /**
     * Gets or sets a scaled numeric-value for the given control.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidnumericcontrol.scaledvalue
     * @type {Integer} 
     */
    ScaledValue {
        get => this.get_ScaledValue()
        set => this.put_ScaledValue(value)
    }

    /**
     * Gets a control description for the given numeric control.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidnumericcontrol.controldescription
     * @type {HidNumericControlDescription} 
     */
    ControlDescription {
        get => this.get_ControlDescription()
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
        if (!this.HasProp("__IHidNumericControl")) {
            if ((queryResult := this.QueryInterface(IHidNumericControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidNumericControl := IHidNumericControl(outPtr)
        }

        return this.__IHidNumericControl.get_Id()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsGrouped() {
        if (!this.HasProp("__IHidNumericControl")) {
            if ((queryResult := this.QueryInterface(IHidNumericControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidNumericControl := IHidNumericControl(outPtr)
        }

        return this.__IHidNumericControl.get_IsGrouped()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UsagePage() {
        if (!this.HasProp("__IHidNumericControl")) {
            if ((queryResult := this.QueryInterface(IHidNumericControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidNumericControl := IHidNumericControl(outPtr)
        }

        return this.__IHidNumericControl.get_UsagePage()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UsageId() {
        if (!this.HasProp("__IHidNumericControl")) {
            if ((queryResult := this.QueryInterface(IHidNumericControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidNumericControl := IHidNumericControl(outPtr)
        }

        return this.__IHidNumericControl.get_UsageId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Value() {
        if (!this.HasProp("__IHidNumericControl")) {
            if ((queryResult := this.QueryInterface(IHidNumericControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidNumericControl := IHidNumericControl(outPtr)
        }

        return this.__IHidNumericControl.get_Value()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Value(value) {
        if (!this.HasProp("__IHidNumericControl")) {
            if ((queryResult := this.QueryInterface(IHidNumericControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidNumericControl := IHidNumericControl(outPtr)
        }

        return this.__IHidNumericControl.put_Value(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ScaledValue() {
        if (!this.HasProp("__IHidNumericControl")) {
            if ((queryResult := this.QueryInterface(IHidNumericControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidNumericControl := IHidNumericControl(outPtr)
        }

        return this.__IHidNumericControl.get_ScaledValue()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ScaledValue(value) {
        if (!this.HasProp("__IHidNumericControl")) {
            if ((queryResult := this.QueryInterface(IHidNumericControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidNumericControl := IHidNumericControl(outPtr)
        }

        return this.__IHidNumericControl.put_ScaledValue(value)
    }

    /**
     * 
     * @returns {HidNumericControlDescription} 
     */
    get_ControlDescription() {
        if (!this.HasProp("__IHidNumericControl")) {
            if ((queryResult := this.QueryInterface(IHidNumericControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidNumericControl := IHidNumericControl(outPtr)
        }

        return this.__IHidNumericControl.get_ControlDescription()
    }

;@endregion Instance Methods
}
