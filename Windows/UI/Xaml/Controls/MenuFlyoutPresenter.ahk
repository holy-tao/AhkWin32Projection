#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ItemsControl.ahk
#Include .\IMenuFlyoutPresenter.ahk
#Include .\IMenuFlyoutPresenter2.ahk
#Include .\IMenuFlyoutPresenter3.ahk
#Include .\IMenuFlyoutPresenterStatics3.ahk
#Include .\IMenuFlyoutPresenterFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Displays the content of a [MenuFlyout](menuflyout.md) control.
 * @remarks
 * You don't typically use a MenuFlyoutPresenter directly, either in XAML or code. Instead, you reference the MenuFlyoutPresenter type as the [TargetType](../windows.ui.xaml/style_targettype.md) of the style you use for the [MenuFlyout.MenuFlyoutPresenterStyle](menuflyout_menuflyoutpresenterstyle.md) property. Then, you use style [Setter](../windows.ui.xaml/setter.md) elements to set the various [Control](control.md) properties that influence the appearance of the [MenuFlyout](menuflyout.md) through this presenter. For example you can use a [Setter](../windows.ui.xaml/setter.md) to set the [Width](../windows.ui.xaml/frameworkelement_width.md) of the [MenuFlyout](menuflyout.md):
 * ```xaml
 * <MenuFlyout x:Name="optionFlyout">
 *   <MenuFlyout.MenuFlyoutPresenterStyle>
 *     <Style TargetType="MenuFlyoutPresenter">
 *       <Setter Property="Width" Value="300"/>
 *     </Style>
 *   </MenuFlyout.MenuFlyoutPresenterStyle>
 * <!--menu items go here-->
 * </MenuFlyout>
 * ```
 * 
 * The MenuFlyoutPresenter class is not a [ContentPresenter](contentpresenter.md) derived class, it's actually a control (derived from [ItemsControl](itemscontrol.md)) that plays a special role when creating the visual tree for a [MenuFlyout](menuflyout.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.menuflyoutpresenter
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class MenuFlyoutPresenter extends ItemsControl {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMenuFlyoutPresenter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMenuFlyoutPresenter.IID

    /**
     * Identifies the [IsDefaultShadowEnabled](menuflyoutpresenter_isdefaultshadowenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.menuflyoutpresenter.isdefaultshadowenabledproperty
     * @type {DependencyProperty} 
     */
    static IsDefaultShadowEnabledProperty {
        get => MenuFlyoutPresenter.get_IsDefaultShadowEnabledProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsDefaultShadowEnabledProperty() {
        if (!MenuFlyoutPresenter.HasProp("__IMenuFlyoutPresenterStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MenuFlyoutPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMenuFlyoutPresenterStatics3.IID)
            MenuFlyoutPresenter.__IMenuFlyoutPresenterStatics3 := IMenuFlyoutPresenterStatics3(factoryPtr)
        }

        return MenuFlyoutPresenter.__IMenuFlyoutPresenterStatics3.get_IsDefaultShadowEnabledProperty()
    }

    /**
     * 
     * @returns {MenuFlyoutPresenter} 
     */
    static CreateInstance() {
        if (!MenuFlyoutPresenter.HasProp("__IMenuFlyoutPresenterFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MenuFlyoutPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMenuFlyoutPresenterFactory.IID)
            MenuFlyoutPresenter.__IMenuFlyoutPresenterFactory := IMenuFlyoutPresenterFactory(factoryPtr)
        }

        return MenuFlyoutPresenter.__IMenuFlyoutPresenterFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets an object that provides calculated values that can be referenced as [TemplateBinding](/previous-versions/windows/apps/hh758288(v=win.10)) sources when defining templates for a [MenuFlyoutPresenter](menuflyoutpresenter.md) control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.menuflyoutpresenter.templatesettings
     * @type {MenuFlyoutPresenterTemplateSettings} 
     */
    TemplateSettings {
        get => this.get_TemplateSettings()
    }

    /**
     * Gets or sets a value that indicates whether the default shadow effect is shown.
     * @remarks
     * > [!TIP]
     * > For more info, design guidance, and code examples, see [Z-depth and shadow](/windows/uwp/design/layout/depth-shadow).
     * 
     * Many common controls automatically cast shadows using a [ThemeShadow](../windows.ui.xaml.media/themeshadow.md). 
     * 
     * If a default shadow doesn't look correct on your MenuFlyout's content then you can disable it by setting this property to `false`.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.menuflyoutpresenter.isdefaultshadowenabled
     * @type {Boolean} 
     */
    IsDefaultShadowEnabled {
        get => this.get_IsDefaultShadowEnabled()
        set => this.put_IsDefaultShadowEnabled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {MenuFlyoutPresenterTemplateSettings} 
     */
    get_TemplateSettings() {
        if (!this.HasProp("__IMenuFlyoutPresenter2")) {
            if ((queryResult := this.QueryInterface(IMenuFlyoutPresenter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMenuFlyoutPresenter2 := IMenuFlyoutPresenter2(outPtr)
        }

        return this.__IMenuFlyoutPresenter2.get_TemplateSettings()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDefaultShadowEnabled() {
        if (!this.HasProp("__IMenuFlyoutPresenter3")) {
            if ((queryResult := this.QueryInterface(IMenuFlyoutPresenter3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMenuFlyoutPresenter3 := IMenuFlyoutPresenter3(outPtr)
        }

        return this.__IMenuFlyoutPresenter3.get_IsDefaultShadowEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsDefaultShadowEnabled(value) {
        if (!this.HasProp("__IMenuFlyoutPresenter3")) {
            if ((queryResult := this.QueryInterface(IMenuFlyoutPresenter3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMenuFlyoutPresenter3 := IMenuFlyoutPresenter3(outPtr)
        }

        return this.__IMenuFlyoutPresenter3.put_IsDefaultShadowEnabled(value)
    }

;@endregion Instance Methods
}
