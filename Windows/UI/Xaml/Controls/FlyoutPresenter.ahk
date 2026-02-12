#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ContentControl.ahk
#Include .\IFlyoutPresenter.ahk
#Include .\IFlyoutPresenter2.ahk
#Include .\IFlyoutPresenterFactory.ahk
#Include .\IFlyoutPresenterStatics2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Displays the content of a [Flyout](flyout.md).
 * @remarks
 * You don't typically declare object elements for FlyoutPresenter in XAML. There are no properties that a FlyoutPresenter can set in XAML syntax and there's no reason to declare a FlyoutPresenter as a resource.
 * 
 * The main purpose of the FlyoutPresenter class is to be the default internal presenter for the [Content](flyout_content.md) value of a [Flyout](flyout.md). The [Content](flyout_content.md) property can be any [UIElement](../windows.ui.xaml/uielement.md). The FlyoutPresenter can apply presentation that can modify presentation info declared on the element used as [Content](flyout_content.md). You extend presentation behavior of the FlyoutPresenter by setting a value for the [FlyoutPresenterStyle](flyout_flyoutpresenterstyle.md) property of the [Flyout](flyout.md). The [Style](../windows.ui.xaml/style.md) you declare that fills the [FlyoutPresenterStyle](flyout_flyoutpresenterstyle.md) property must specify `TargetType="FlyoutPresenter"`. The properties that can be styled are the dependency properties of the base [ContentControl](contentcontrol.md) class or [Control](control.md) class, such as [FontSize](control_fontsize.md) or [Padding](control_padding.md), or base element properties such as [FrameworkElement.Margin](../windows.ui.xaml/frameworkelement_margin.md) that the FlyoutPresenter class inherits.
 * 
 * FlyoutPresenter exists as a class and has a default constructor basically to satisfy XAML infrastructure support, when it's specified as the [TargetType](../windows.ui.xaml/style_targettype.md) of the [Style](../windows.ui.xaml/style.md) used for a [FlyoutPresenterStyle](flyout_flyoutpresenterstyle.md) value.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.flyoutpresenter
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class FlyoutPresenter extends ContentControl {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFlyoutPresenter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFlyoutPresenter.IID

    /**
     * Identifies the [IsDefaultShadowEnabled](flyoutpresenter_isdefaultshadowenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.flyoutpresenter.isdefaultshadowenabledproperty
     * @type {DependencyProperty} 
     */
    static IsDefaultShadowEnabledProperty {
        get => FlyoutPresenter.get_IsDefaultShadowEnabledProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {FlyoutPresenter} 
     */
    static CreateInstance() {
        if (!FlyoutPresenter.HasProp("__IFlyoutPresenterFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.FlyoutPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFlyoutPresenterFactory.IID)
            FlyoutPresenter.__IFlyoutPresenterFactory := IFlyoutPresenterFactory(factoryPtr)
        }

        return FlyoutPresenter.__IFlyoutPresenterFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsDefaultShadowEnabledProperty() {
        if (!FlyoutPresenter.HasProp("__IFlyoutPresenterStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.FlyoutPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFlyoutPresenterStatics2.IID)
            FlyoutPresenter.__IFlyoutPresenterStatics2 := IFlyoutPresenterStatics2(factoryPtr)
        }

        return FlyoutPresenter.__IFlyoutPresenterStatics2.get_IsDefaultShadowEnabledProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether the default shadow effect is shown.
     * @remarks
     * > [!TIP]
     * > For more info, design guidance, and code examples, see [Z-depth and shadow](/windows/uwp/design/layout/depth-shadow).
     * 
     * Many common controls automatically cast shadows using a [ThemeShadow](../windows.ui.xaml.media/themeshadow.md). 
     * 
     * If the default shadow doesn't look correct on your Flyout's content then you can disable it by setting this property to `false`.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.flyoutpresenter.isdefaultshadowenabled
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
     * @returns {Boolean} 
     */
    get_IsDefaultShadowEnabled() {
        if (!this.HasProp("__IFlyoutPresenter2")) {
            if ((queryResult := this.QueryInterface(IFlyoutPresenter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutPresenter2 := IFlyoutPresenter2(outPtr)
        }

        return this.__IFlyoutPresenter2.get_IsDefaultShadowEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsDefaultShadowEnabled(value) {
        if (!this.HasProp("__IFlyoutPresenter2")) {
            if ((queryResult := this.QueryInterface(IFlyoutPresenter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutPresenter2 := IFlyoutPresenter2(outPtr)
        }

        return this.__IFlyoutPresenter2.put_IsDefaultShadowEnabled(value)
    }

;@endregion Instance Methods
}
