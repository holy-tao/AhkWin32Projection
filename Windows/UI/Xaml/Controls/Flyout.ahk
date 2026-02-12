#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include Primitives\FlyoutBase.ahk
#Include .\IFlyout.ahk
#Include .\IFlyoutStatics.ahk
#Include .\IFlyoutFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a control that displays lightweight UI that is either information, or requires user interaction. Unlike a dialog, a Flyout can be light dismissed by clicking or tapping outside of it, pressing the device's back button, or pressing the 'Esc' key.
 * @remarks
 * A Flyout displays a message that requires user interaction.
 * 
 * <img src="images/controls/Flyout.png" alt="Flyout control" />
 * 
 * Use a Flyout control for collecting information, for displaying more info, or for warnings and confirmations. Unlike a dialog, a Flyout does not create a separate window, and does not block other user interaction. To show a menu of items, use a [MenuFlyout](menuflyout.md) instead. For more info, including XAML and code examples, see [Quickstart: Adding a Flyout](/previous-versions/windows/apps/dn308515(v=win.10)).
 * 
 * A Flyout control (or [MenuFlyout](menuflyout.md)) is used as the value of the [Button.Flyout](button_flyout.md) property. This is usually set in XAML as part of a UI definition of the page. [Button](button.md) is the only control that has a dedicated **Flyout** property. To associate a Flyout with other controls, use the [FlyoutBase.AttachedFlyout](/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.attachedflyout) attached property. When set as [Button.Flyout](button_flyout.md), the Flyout displays when the button is tapped or otherwise invoked. When a Flyout is assigned to other UI elements using [FlyoutBase.AttachedFlyout](/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.attachedflyout), you must call either the [ShowAt](../windows.ui.xaml.controls.primitives/flyoutbase_showat_157739403.md) method or the static [ShowAttachedFlyout](../windows.ui.xaml.controls.primitives/flyoutbase_showattachedflyout_1146189011.md) method to display the flyout.
 * 
 * In addition to the members listed in this reference topic, there are other members of the base class [FlyoutBase](../windows.ui.xaml.controls.primitives/flyoutbase.md) that are often used in typical Flyout scenarios:
 * 
 * + [FlyoutBase.AttachedFlyout](/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.attachedflyout): an attached property that associates a Flyout with a particular UI element (this can be any [FrameworkElement](../windows.ui.xaml/frameworkelement.md) derived class).
 * + [ShowAttachedFlyout](../windows.ui.xaml.controls.primitives/flyoutbase_showattachedflyout_1146189011.md): a static method that can determine whether a flyout is already associated with a UI element through a [FlyoutBase.AttachedFlyout](/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.attachedflyout) assignment. If so, the method calls [ShowAt](../windows.ui.xaml.controls.primitives/flyoutbase_showat_157739403.md) internally, using the [FrameworkElement](../windows.ui.xaml/frameworkelement.md) that you specified.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.flyout
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class Flyout extends FlyoutBase {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFlyout

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFlyout.IID

    /**
     * Gets the identifier for the [Content](flyout_content.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.flyout.contentproperty
     * @type {DependencyProperty} 
     */
    static ContentProperty {
        get => Flyout.get_ContentProperty()
    }

    /**
     * Gets the identifier for the [FlyoutPresenterStyle](flyout_flyoutpresenterstyle.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.flyout.flyoutpresenterstyleproperty
     * @type {DependencyProperty} 
     */
    static FlyoutPresenterStyleProperty {
        get => Flyout.get_FlyoutPresenterStyleProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ContentProperty() {
        if (!Flyout.HasProp("__IFlyoutStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Flyout")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFlyoutStatics.IID)
            Flyout.__IFlyoutStatics := IFlyoutStatics(factoryPtr)
        }

        return Flyout.__IFlyoutStatics.get_ContentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FlyoutPresenterStyleProperty() {
        if (!Flyout.HasProp("__IFlyoutStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Flyout")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFlyoutStatics.IID)
            Flyout.__IFlyoutStatics := IFlyoutStatics(factoryPtr)
        }

        return Flyout.__IFlyoutStatics.get_FlyoutPresenterStyleProperty()
    }

    /**
     * 
     * @returns {Flyout} 
     */
    static CreateInstance() {
        if (!Flyout.HasProp("__IFlyoutFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Flyout")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFlyoutFactory.IID)
            Flyout.__IFlyoutFactory := IFlyoutFactory(factoryPtr)
        }

        return Flyout.__IFlyoutFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the content of the [Flyout](flyout.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.flyout.content
     * @type {UIElement} 
     */
    Content {
        get => this.get_Content()
        set => this.put_Content(value)
    }

    /**
     * Gets or sets the [Style](../windows.ui.xaml/style.md) applied to the [Flyout](flyout.md) content.
     * @remarks
     * The [Style](../windows.ui.xaml/style.md) element you use for a FlyoutPresenterStyle value must specify `TargetType="FlyoutPresenter"`.
     * 
     * A [Flyout](flyout.md) itself isn't a control or even a [UIElement](../windows.ui.xaml/uielement.md), and thus doesn't have any properties to apply a [Style](../windows.ui.xaml/style.md) to. Instead, you can style the properties of the internal [FlyoutPresenter](flyoutpresenter.md) that is presenting the [Content](flyout_content.md) of a [Flyout](flyout.md). The properties that can be styled are the dependency properties of the base [ContentControl](contentcontrol.md) class or [Control](control.md) class, such as [FontSize](control_fontsize.md) or [Padding](control_padding.md), or base element properties such as [FrameworkElement.Margin](../windows.ui.xaml/frameworkelement_margin.md) that the [FlyoutPresenter](flyoutpresenter.md) class inherits. You also can use the properties that are available on whichever element you're setting as [Flyout.Content](flyout_content.md), and set values of those properties directly rather than styling the [FlyoutPresenter](flyoutpresenter.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.flyout.flyoutpresenterstyle
     * @type {Style} 
     */
    FlyoutPresenterStyle {
        get => this.get_FlyoutPresenterStyle()
        set => this.put_FlyoutPresenterStyle(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_Content() {
        if (!this.HasProp("__IFlyout")) {
            if ((queryResult := this.QueryInterface(IFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyout := IFlyout(outPtr)
        }

        return this.__IFlyout.get_Content()
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_Content(value) {
        if (!this.HasProp("__IFlyout")) {
            if ((queryResult := this.QueryInterface(IFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyout := IFlyout(outPtr)
        }

        return this.__IFlyout.put_Content(value)
    }

    /**
     * 
     * @returns {Style} 
     */
    get_FlyoutPresenterStyle() {
        if (!this.HasProp("__IFlyout")) {
            if ((queryResult := this.QueryInterface(IFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyout := IFlyout(outPtr)
        }

        return this.__IFlyout.get_FlyoutPresenterStyle()
    }

    /**
     * 
     * @param {Style} value 
     * @returns {HRESULT} 
     */
    put_FlyoutPresenterStyle(value) {
        if (!this.HasProp("__IFlyout")) {
            if ((queryResult := this.QueryInterface(IFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyout := IFlyout(outPtr)
        }

        return this.__IFlyout.put_FlyoutPresenterStyle(value)
    }

;@endregion Instance Methods
}
