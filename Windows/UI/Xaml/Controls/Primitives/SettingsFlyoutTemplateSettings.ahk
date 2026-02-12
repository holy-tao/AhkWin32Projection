#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\ISettingsFlyoutTemplateSettings.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides calculated values that can be referenced as **TemplatedParent** sources when defining templates for a SettingsFlyout control. Not intended for general use.
 * @remarks
 * Get instances of SettingsFlyoutTemplateSettings by querying the value of [TemplateSettings](../windows.ui.xaml.controls/settingsflyout_templatesettings.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.settingsflyouttemplatesettings
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class SettingsFlyoutTemplateSettings extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISettingsFlyoutTemplateSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISettingsFlyoutTemplateSettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the brush that fills the background of the [SettingsFlyout](../windows.ui.xaml.controls/settingsflyout.md) header area.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.settingsflyouttemplatesettings.headerbackground
     * @type {Brush} 
     */
    HeaderBackground {
        get => this.get_HeaderBackground()
    }

    /**
     * Gets the brush that renders the header text of the [SettingsFlyout](../windows.ui.xaml.controls/settingsflyout.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.settingsflyouttemplatesettings.headerforeground
     * @type {Brush} 
     */
    HeaderForeground {
        get => this.get_HeaderForeground()
    }

    /**
     * Gets the brush that fills the border area of the [SettingsFlyout](../windows.ui.xaml.controls/settingsflyout.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.settingsflyouttemplatesettings.borderbrush
     * @type {Brush} 
     */
    BorderBrush {
        get => this.get_BorderBrush()
    }

    /**
     * Gets the thickness of the SettingsFlyout border.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.settingsflyouttemplatesettings.borderthickness
     * @type {Thickness} 
     */
    BorderThickness {
        get => this.get_BorderThickness()
    }

    /**
     * Gets the source image for the SettingsFlyout icon.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.settingsflyouttemplatesettings.iconsource
     * @type {ImageSource} 
     */
    IconSource {
        get => this.get_IconSource()
    }

    /**
     * Gets the collection of content transitions used by the SettingsFlyout.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.settingsflyouttemplatesettings.contenttransitions
     * @type {TransitionCollection} 
     */
    ContentTransitions {
        get => this.get_ContentTransitions()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_HeaderBackground() {
        if (!this.HasProp("__ISettingsFlyoutTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ISettingsFlyoutTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISettingsFlyoutTemplateSettings := ISettingsFlyoutTemplateSettings(outPtr)
        }

        return this.__ISettingsFlyoutTemplateSettings.get_HeaderBackground()
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_HeaderForeground() {
        if (!this.HasProp("__ISettingsFlyoutTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ISettingsFlyoutTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISettingsFlyoutTemplateSettings := ISettingsFlyoutTemplateSettings(outPtr)
        }

        return this.__ISettingsFlyoutTemplateSettings.get_HeaderForeground()
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_BorderBrush() {
        if (!this.HasProp("__ISettingsFlyoutTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ISettingsFlyoutTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISettingsFlyoutTemplateSettings := ISettingsFlyoutTemplateSettings(outPtr)
        }

        return this.__ISettingsFlyoutTemplateSettings.get_BorderBrush()
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_BorderThickness() {
        if (!this.HasProp("__ISettingsFlyoutTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ISettingsFlyoutTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISettingsFlyoutTemplateSettings := ISettingsFlyoutTemplateSettings(outPtr)
        }

        return this.__ISettingsFlyoutTemplateSettings.get_BorderThickness()
    }

    /**
     * 
     * @returns {ImageSource} 
     */
    get_IconSource() {
        if (!this.HasProp("__ISettingsFlyoutTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ISettingsFlyoutTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISettingsFlyoutTemplateSettings := ISettingsFlyoutTemplateSettings(outPtr)
        }

        return this.__ISettingsFlyoutTemplateSettings.get_IconSource()
    }

    /**
     * 
     * @returns {TransitionCollection} 
     */
    get_ContentTransitions() {
        if (!this.HasProp("__ISettingsFlyoutTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ISettingsFlyoutTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISettingsFlyoutTemplateSettings := ISettingsFlyoutTemplateSettings(outPtr)
        }

        return this.__ISettingsFlyoutTemplateSettings.get_ContentTransitions()
    }

;@endregion Instance Methods
}
