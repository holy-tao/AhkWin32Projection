#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\IToggleSwitchTemplateSettings.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides calculated values that can be referenced as **TemplatedParent** sources when defining templates for a [ToggleSwitch](../windows.ui.xaml.controls/toggleswitch.md) control. Not intended for general use.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.toggleswitchtemplatesettings
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class ToggleSwitchTemplateSettings extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IToggleSwitchTemplateSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IToggleSwitchTemplateSettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the calculated value of the offset for the "knob" element of the [ToggleSwitch](../windows.ui.xaml.controls/toggleswitch.md), calculated for an "On" action and current switch position.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.toggleswitchtemplatesettings.knobcurrenttoonoffset
     * @type {Float} 
     */
    KnobCurrentToOnOffset {
        get => this.get_KnobCurrentToOnOffset()
    }

    /**
     * Gets the calculated value of the offset for the "knob" element of the [ToggleSwitch](../windows.ui.xaml.controls/toggleswitch.md), calculated for an "Off" action and current switch position.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.toggleswitchtemplatesettings.knobcurrenttooffoffset
     * @type {Float} 
     */
    KnobCurrentToOffOffset {
        get => this.get_KnobCurrentToOffOffset()
    }

    /**
     * Gets the calculated value of the offset for the "knob" element of the [ToggleSwitch](../windows.ui.xaml.controls/toggleswitch.md), in "On" to "Off" direction.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.toggleswitchtemplatesettings.knobontooffoffset
     * @type {Float} 
     */
    KnobOnToOffOffset {
        get => this.get_KnobOnToOffOffset()
    }

    /**
     * Gets the calculated value of the offset for the "knob" element of the [ToggleSwitch](../windows.ui.xaml.controls/toggleswitch.md), in "Off" to "On" direction.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.toggleswitchtemplatesettings.knobofftoonoffset
     * @type {Float} 
     */
    KnobOffToOnOffset {
        get => this.get_KnobOffToOnOffset()
    }

    /**
     * Gets the calculated value of the offset for the "curtain" element of the [ToggleSwitch](../windows.ui.xaml.controls/toggleswitch.md), calculated for an "On" action and current switch position.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.toggleswitchtemplatesettings.curtaincurrenttoonoffset
     * @type {Float} 
     */
    CurtainCurrentToOnOffset {
        get => this.get_CurtainCurrentToOnOffset()
    }

    /**
     * Gets the calculated value of the offset for the "curtain" element of the [ToggleSwitch](../windows.ui.xaml.controls/toggleswitch.md), calculated for an "Off" action and current switch position.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.toggleswitchtemplatesettings.curtaincurrenttooffoffset
     * @type {Float} 
     */
    CurtainCurrentToOffOffset {
        get => this.get_CurtainCurrentToOffOffset()
    }

    /**
     * Gets the calculated value of the offset for the "curtain" element of the [ToggleSwitch](../windows.ui.xaml.controls/toggleswitch.md), in "On" to "Off" direction.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.toggleswitchtemplatesettings.curtainontooffoffset
     * @type {Float} 
     */
    CurtainOnToOffOffset {
        get => this.get_CurtainOnToOffOffset()
    }

    /**
     * Gets the calculated value of the offset for the "curtain" element of the [ToggleSwitch](../windows.ui.xaml.controls/toggleswitch.md), in "Off" to "On" direction.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.toggleswitchtemplatesettings.curtainofftoonoffset
     * @type {Float} 
     */
    CurtainOffToOnOffset {
        get => this.get_CurtainOffToOnOffset()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_KnobCurrentToOnOffset() {
        if (!this.HasProp("__IToggleSwitchTemplateSettings")) {
            if ((queryResult := this.QueryInterface(IToggleSwitchTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleSwitchTemplateSettings := IToggleSwitchTemplateSettings(outPtr)
        }

        return this.__IToggleSwitchTemplateSettings.get_KnobCurrentToOnOffset()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_KnobCurrentToOffOffset() {
        if (!this.HasProp("__IToggleSwitchTemplateSettings")) {
            if ((queryResult := this.QueryInterface(IToggleSwitchTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleSwitchTemplateSettings := IToggleSwitchTemplateSettings(outPtr)
        }

        return this.__IToggleSwitchTemplateSettings.get_KnobCurrentToOffOffset()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_KnobOnToOffOffset() {
        if (!this.HasProp("__IToggleSwitchTemplateSettings")) {
            if ((queryResult := this.QueryInterface(IToggleSwitchTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleSwitchTemplateSettings := IToggleSwitchTemplateSettings(outPtr)
        }

        return this.__IToggleSwitchTemplateSettings.get_KnobOnToOffOffset()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_KnobOffToOnOffset() {
        if (!this.HasProp("__IToggleSwitchTemplateSettings")) {
            if ((queryResult := this.QueryInterface(IToggleSwitchTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleSwitchTemplateSettings := IToggleSwitchTemplateSettings(outPtr)
        }

        return this.__IToggleSwitchTemplateSettings.get_KnobOffToOnOffset()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CurtainCurrentToOnOffset() {
        if (!this.HasProp("__IToggleSwitchTemplateSettings")) {
            if ((queryResult := this.QueryInterface(IToggleSwitchTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleSwitchTemplateSettings := IToggleSwitchTemplateSettings(outPtr)
        }

        return this.__IToggleSwitchTemplateSettings.get_CurtainCurrentToOnOffset()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CurtainCurrentToOffOffset() {
        if (!this.HasProp("__IToggleSwitchTemplateSettings")) {
            if ((queryResult := this.QueryInterface(IToggleSwitchTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleSwitchTemplateSettings := IToggleSwitchTemplateSettings(outPtr)
        }

        return this.__IToggleSwitchTemplateSettings.get_CurtainCurrentToOffOffset()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CurtainOnToOffOffset() {
        if (!this.HasProp("__IToggleSwitchTemplateSettings")) {
            if ((queryResult := this.QueryInterface(IToggleSwitchTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleSwitchTemplateSettings := IToggleSwitchTemplateSettings(outPtr)
        }

        return this.__IToggleSwitchTemplateSettings.get_CurtainOnToOffOffset()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CurtainOffToOnOffset() {
        if (!this.HasProp("__IToggleSwitchTemplateSettings")) {
            if ((queryResult := this.QueryInterface(IToggleSwitchTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleSwitchTemplateSettings := IToggleSwitchTemplateSettings(outPtr)
        }

        return this.__IToggleSwitchTemplateSettings.get_CurtainOffToOnOffset()
    }

;@endregion Instance Methods
}
