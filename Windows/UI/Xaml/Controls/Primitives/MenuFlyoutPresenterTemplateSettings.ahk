#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\IMenuFlyoutPresenterTemplateSettings.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides calculated values that can be referenced as **TemplatedParent** sources when defining templates for a [MenuFlyoutPresenter](../windows.ui.xaml.controls/menuflyoutpresenter.md) control. Not intended for general use.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.menuflyoutpresentertemplatesettings
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class MenuFlyoutPresenterTemplateSettings extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMenuFlyoutPresenterTemplateSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMenuFlyoutPresenterTemplateSettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the minimum width of flyout content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.menuflyoutpresentertemplatesettings.flyoutcontentminwidth
     * @type {Float} 
     */
    FlyoutContentMinWidth {
        get => this.get_FlyoutContentMinWidth()
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
    get_FlyoutContentMinWidth() {
        if (!this.HasProp("__IMenuFlyoutPresenterTemplateSettings")) {
            if ((queryResult := this.QueryInterface(IMenuFlyoutPresenterTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMenuFlyoutPresenterTemplateSettings := IMenuFlyoutPresenterTemplateSettings(outPtr)
        }

        return this.__IMenuFlyoutPresenterTemplateSettings.get_FlyoutContentMinWidth()
    }

;@endregion Instance Methods
}
