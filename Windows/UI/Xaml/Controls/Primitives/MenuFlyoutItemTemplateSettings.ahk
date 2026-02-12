#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\IMenuFlyoutItemTemplateSettings.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides calculated values that can be referenced as **TemplatedParent** sources when defining templates for a [MenuFlyoutItem](../windows.ui.xaml.controls/menuflyoutitem.md) control. Not intended for general use.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.menuflyoutitemtemplatesettings
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class MenuFlyoutItemTemplateSettings extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMenuFlyoutItemTemplateSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMenuFlyoutItemTemplateSettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the minimum width allocated for the accelerator keytip of a [MenuFlyout](../windows.ui.xaml.controls/menuflyout.md).
     * @remarks
     * Keytips are badges displayed next to controls that support access keys when the user presses the Alt key. Each keytip contains the alphanumeric keys that activate the associated control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.menuflyoutitemtemplatesettings.keyboardacceleratortextminwidth
     * @type {Float} 
     */
    KeyboardAcceleratorTextMinWidth {
        get => this.get_KeyboardAcceleratorTextMinWidth()
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
    get_KeyboardAcceleratorTextMinWidth() {
        if (!this.HasProp("__IMenuFlyoutItemTemplateSettings")) {
            if ((queryResult := this.QueryInterface(IMenuFlyoutItemTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMenuFlyoutItemTemplateSettings := IMenuFlyoutItemTemplateSettings(outPtr)
        }

        return this.__IMenuFlyoutItemTemplateSettings.get_KeyboardAcceleratorTextMinWidth()
    }

;@endregion Instance Methods
}
