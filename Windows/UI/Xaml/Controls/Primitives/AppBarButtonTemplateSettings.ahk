#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\IAppBarButtonTemplateSettings.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides calculated values that can be referenced as **TemplatedParent** sources when defining templates for an [AppBarButton](../windows.ui.xaml.controls/appbarbutton.md) control. Not intended for general use.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.appbarbuttontemplatesettings
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class AppBarButtonTemplateSettings extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBarButtonTemplateSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBarButtonTemplateSettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the minimum width allocated for the accelerator keytip of an [AppBarButton](../windows.ui.xaml.controls/appbarbutton.md).
     * @remarks
     * Keytips are badges displayed next to controls that support access keys when the user presses the Alt key. Each keytip contains the alphanumeric keys that activate the associated control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.appbarbuttontemplatesettings.keyboardacceleratortextminwidth
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
        if (!this.HasProp("__IAppBarButtonTemplateSettings")) {
            if ((queryResult := this.QueryInterface(IAppBarButtonTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBarButtonTemplateSettings := IAppBarButtonTemplateSettings(outPtr)
        }

        return this.__IAppBarButtonTemplateSettings.get_KeyboardAcceleratorTextMinWidth()
    }

;@endregion Instance Methods
}
