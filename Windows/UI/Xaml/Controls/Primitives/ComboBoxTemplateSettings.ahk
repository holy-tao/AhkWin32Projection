#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\IComboBoxTemplateSettings.ahk
#Include .\IComboBoxTemplateSettings2.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides calculated values that can be referenced as **TemplatedParent** sources when defining templates for a [ComboBox](../windows.ui.xaml.controls/combobox.md) control. Not intended for general use.
 * @remarks
 * Get instances of ComboBoxTemplateSettings by querying the value of [TemplateSettings](../windows.ui.xaml.controls/combobox_templatesettings.md).
 * 
 * The values from ComboBoxTemplateSettings are typically used as either the **To** or **From** values of theme animations or transitions.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.comboboxtemplatesettings
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class ComboBoxTemplateSettings extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IComboBoxTemplateSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IComboBoxTemplateSettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that reports the run-time layout slot height of the "Popup" part of a [ComboBox](../windows.ui.xaml.controls/combobox.md) in the "Opened" state.
     * @remarks
     * DropDownOpenedHeight is referenced in the default generic.xaml template animations for [ComboBox](../windows.ui.xaml.controls/combobox.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.comboboxtemplatesettings.dropdownopenedheight
     * @type {Float} 
     */
    DropDownOpenedHeight {
        get => this.get_DropDownOpenedHeight()
    }

    /**
     * Gets a value that reports the run-time layout slot height of the "Popup" part of a [ComboBox](../windows.ui.xaml.controls/combobox.md) in the "Closed" state.
     * @remarks
     * DropDownClosedHeight is referenced in the default generic.xaml template animations for [ComboBox](../windows.ui.xaml.controls/combobox.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.comboboxtemplatesettings.dropdownclosedheight
     * @type {Float} 
     */
    DropDownClosedHeight {
        get => this.get_DropDownClosedHeight()
    }

    /**
     * Gets a value that reports the run-time offset value that is useful for a **Split** animation of the "Popup" part of a [ComboBox](../windows.ui.xaml.controls/combobox.md).
     * @remarks
     * DropDownOffset is referenced in the default generic.xaml template animations for [ComboBox](../windows.ui.xaml.controls/combobox.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.comboboxtemplatesettings.dropdownoffset
     * @type {Float} 
     */
    DropDownOffset {
        get => this.get_DropDownOffset()
    }

    /**
     * Gets a value that reports the selection direction in a [ComboBox](../windows.ui.xaml.controls/combobox.md). This is either **Bottom** or **Top** depending on how [DropDownOffset](comboboxtemplatesettings_dropdownoffset.md) is set.
     * @remarks
     * SelectedItemDirection is referenced in the default generic.xaml template animations for [ComboBox](../windows.ui.xaml.controls/combobox.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.comboboxtemplatesettings.selecteditemdirection
     * @type {Integer} 
     */
    SelectedItemDirection {
        get => this.get_SelectedItemDirection()
    }

    /**
     * Gets the minimum width value of the drop down content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.comboboxtemplatesettings.dropdowncontentminwidth
     * @type {Float} 
     */
    DropDownContentMinWidth {
        get => this.get_DropDownContentMinWidth()
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
    get_DropDownOpenedHeight() {
        if (!this.HasProp("__IComboBoxTemplateSettings")) {
            if ((queryResult := this.QueryInterface(IComboBoxTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBoxTemplateSettings := IComboBoxTemplateSettings(outPtr)
        }

        return this.__IComboBoxTemplateSettings.get_DropDownOpenedHeight()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DropDownClosedHeight() {
        if (!this.HasProp("__IComboBoxTemplateSettings")) {
            if ((queryResult := this.QueryInterface(IComboBoxTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBoxTemplateSettings := IComboBoxTemplateSettings(outPtr)
        }

        return this.__IComboBoxTemplateSettings.get_DropDownClosedHeight()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DropDownOffset() {
        if (!this.HasProp("__IComboBoxTemplateSettings")) {
            if ((queryResult := this.QueryInterface(IComboBoxTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBoxTemplateSettings := IComboBoxTemplateSettings(outPtr)
        }

        return this.__IComboBoxTemplateSettings.get_DropDownOffset()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectedItemDirection() {
        if (!this.HasProp("__IComboBoxTemplateSettings")) {
            if ((queryResult := this.QueryInterface(IComboBoxTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBoxTemplateSettings := IComboBoxTemplateSettings(outPtr)
        }

        return this.__IComboBoxTemplateSettings.get_SelectedItemDirection()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DropDownContentMinWidth() {
        if (!this.HasProp("__IComboBoxTemplateSettings2")) {
            if ((queryResult := this.QueryInterface(IComboBoxTemplateSettings2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBoxTemplateSettings2 := IComboBoxTemplateSettings2(outPtr)
        }

        return this.__IComboBoxTemplateSettings2.get_DropDownContentMinWidth()
    }

;@endregion Instance Methods
}
