#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include Primitives\ButtonBase.ahk
#Include .\IButton.ahk
#Include .\IButtonWithFlyout.ahk
#Include .\IButtonFactory.ahk
#Include .\IButtonStaticsWithFlyout.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a templated button control that interprets a [Click](../windows.ui.xaml.controls.primitives/buttonbase_click.md) user interaction.
 * @remarks
 * > [!TIP]
 * > For more info, design guidance, and code examples, see [Buttons](/windows/uwp/design/controls-and-patterns/buttons).
 * 
 * The Button class represents the most basic type of button control. For info on other similar button controls that are more specialized, see [HyperlinkButton](hyperlinkbutton.md) or [RepeatButton](../windows.ui.xaml.controls.primitives/repeatbutton.md).
 * 
 * <img src="images/controls/Button.png" alt="A standard button" />
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.button
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class Button extends ButtonBase {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IButton

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IButton.IID

    /**
     * Identifies the [Flyout](button_flyout.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.button.flyoutproperty
     * @type {DependencyProperty} 
     */
    static FlyoutProperty {
        get => Button.get_FlyoutProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Button} 
     */
    static CreateInstance() {
        if (!Button.HasProp("__IButtonFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Button")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IButtonFactory.IID)
            Button.__IButtonFactory := IButtonFactory(factoryPtr)
        }

        return Button.__IButtonFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FlyoutProperty() {
        if (!Button.HasProp("__IButtonStaticsWithFlyout")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Button")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IButtonStaticsWithFlyout.IID)
            Button.__IButtonStaticsWithFlyout := IButtonStaticsWithFlyout(factoryPtr)
        }

        return Button.__IButtonStaticsWithFlyout.get_FlyoutProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the flyout associated with this button.
     * @remarks
     * By default, the flyout that's set as the value of the Flyout property displays when the button is tapped or otherwise invoked, you don't need to call methods to display it. That differs from the behavior of flyouts assigned through the [FlyoutBase.AttachedFlyout](/uwp/api/windows.ui.xaml.controls.primitives.flyoutbase.attachedflyout) attached property; these flyouts must be explicitly displayed by calling [ShowAt](../windows.ui.xaml.controls.primitives/flyoutbase_showat_157739403.md) on the flyout instance, or the static [ShowAttachedFlyout](../windows.ui.xaml.controls.primitives/flyoutbase_showattachedflyout_1146189011.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.button.flyout
     * @type {FlyoutBase} 
     */
    Flyout {
        get => this.get_Flyout()
        set => this.put_Flyout(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {FlyoutBase} 
     */
    get_Flyout() {
        if (!this.HasProp("__IButtonWithFlyout")) {
            if ((queryResult := this.QueryInterface(IButtonWithFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IButtonWithFlyout := IButtonWithFlyout(outPtr)
        }

        return this.__IButtonWithFlyout.get_Flyout()
    }

    /**
     * 
     * @param {FlyoutBase} value 
     * @returns {HRESULT} 
     */
    put_Flyout(value) {
        if (!this.HasProp("__IButtonWithFlyout")) {
            if ((queryResult := this.QueryInterface(IButtonWithFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IButtonWithFlyout := IButtonWithFlyout(outPtr)
        }

        return this.__IButtonWithFlyout.put_Flyout(value)
    }

;@endregion Instance Methods
}
