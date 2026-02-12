#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ContentControl.ahk
#Include .\ISplitButton.ahk
#Include .\ISplitButtonFactory.ahk
#Include .\ISplitButtonStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\SplitButton.ahk
#Include .\SplitButtonClickEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a button with two parts that can be invoked separately. One part behaves like a standard button and the other part invokes a flyout.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SplitButton](/windows/winui/api/microsoft.ui.xaml.controls.splitbutton) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.splitbutton
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class SplitButton extends ContentControl {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISplitButton

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISplitButton.IID

    /**
     * Identifies the Flyout dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SplitButton.FlyoutProperty](/windows/winui/api/microsoft.ui.xaml.controls.splitbutton.flyoutproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.splitbutton.flyoutproperty
     * @type {DependencyProperty} 
     */
    static FlyoutProperty {
        get => SplitButton.get_FlyoutProperty()
    }

    /**
     * Identifies the Command dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SplitButton.CommandProperty](/windows/winui/api/microsoft.ui.xaml.controls.splitbutton.commandproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.splitbutton.commandproperty
     * @type {DependencyProperty} 
     */
    static CommandProperty {
        get => SplitButton.get_CommandProperty()
    }

    /**
     * Identifies the CommandParameter dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SplitButton.CommandParameterProperty](/windows/winui/api/microsoft.ui.xaml.controls.splitbutton.commandparameterproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.splitbutton.commandparameterproperty
     * @type {DependencyProperty} 
     */
    static CommandParameterProperty {
        get => SplitButton.get_CommandParameterProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {SplitButton} 
     */
    static CreateInstance() {
        if (!SplitButton.HasProp("__ISplitButtonFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SplitButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISplitButtonFactory.IID)
            SplitButton.__ISplitButtonFactory := ISplitButtonFactory(factoryPtr)
        }

        return SplitButton.__ISplitButtonFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FlyoutProperty() {
        if (!SplitButton.HasProp("__ISplitButtonStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SplitButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISplitButtonStatics.IID)
            SplitButton.__ISplitButtonStatics := ISplitButtonStatics(factoryPtr)
        }

        return SplitButton.__ISplitButtonStatics.get_FlyoutProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CommandProperty() {
        if (!SplitButton.HasProp("__ISplitButtonStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SplitButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISplitButtonStatics.IID)
            SplitButton.__ISplitButtonStatics := ISplitButtonStatics(factoryPtr)
        }

        return SplitButton.__ISplitButtonStatics.get_CommandProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CommandParameterProperty() {
        if (!SplitButton.HasProp("__ISplitButtonStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SplitButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISplitButtonStatics.IID)
            SplitButton.__ISplitButtonStatics := ISplitButtonStatics(factoryPtr)
        }

        return SplitButton.__ISplitButtonStatics.get_CommandParameterProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the flyout associated with this button.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SplitButton.Flyout](/windows/winui/api/microsoft.ui.xaml.controls.splitbutton.flyout) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.splitbutton.flyout
     * @type {FlyoutBase} 
     */
    Flyout {
        get => this.get_Flyout()
        set => this.put_Flyout(value)
    }

    /**
     * Gets or sets the command to invoke when this button is pressed.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SplitButton.Command](/windows/winui/api/microsoft.ui.xaml.controls.splitbutton.command) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.splitbutton.command
     * @type {ICommand} 
     */
    Command {
        get => this.get_Command()
        set => this.put_Command(value)
    }

    /**
     * Gets or sets the parameter to pass to the [Command](splitbutton_command.md) property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SplitButton.CommandParameter](/windows/winui/api/microsoft.ui.xaml.controls.splitbutton.commandparameter) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.splitbutton.commandparameter
     * @type {IInspectable} 
     */
    CommandParameter {
        get => this.get_CommandParameter()
        set => this.put_CommandParameter(value)
    }

    /**
     * Occurs when a button control is clicked.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SplitButton.Click](/windows/winui/api/microsoft.ui.xaml.controls.splitbutton.click) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @type {TypedEventHandler<SplitButton, SplitButtonClickEventArgs>}
    */
    OnClick {
        get {
            if(!this.HasProp("__OnClick")){
                this.__OnClick := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{267c3ed4-307a-513e-9d6c-9d81957791ff}"),
                    SplitButton,
                    SplitButtonClickEventArgs
                )
                this.__OnClickToken := this.add_Click(this.__OnClick.iface)
            }
            return this.__OnClick
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnClickToken")) {
            this.remove_Click(this.__OnClickToken)
            this.__OnClick.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {FlyoutBase} 
     */
    get_Flyout() {
        if (!this.HasProp("__ISplitButton")) {
            if ((queryResult := this.QueryInterface(ISplitButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitButton := ISplitButton(outPtr)
        }

        return this.__ISplitButton.get_Flyout()
    }

    /**
     * 
     * @param {FlyoutBase} value 
     * @returns {HRESULT} 
     */
    put_Flyout(value) {
        if (!this.HasProp("__ISplitButton")) {
            if ((queryResult := this.QueryInterface(ISplitButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitButton := ISplitButton(outPtr)
        }

        return this.__ISplitButton.put_Flyout(value)
    }

    /**
     * 
     * @returns {ICommand} 
     */
    get_Command() {
        if (!this.HasProp("__ISplitButton")) {
            if ((queryResult := this.QueryInterface(ISplitButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitButton := ISplitButton(outPtr)
        }

        return this.__ISplitButton.get_Command()
    }

    /**
     * 
     * @param {ICommand} value 
     * @returns {HRESULT} 
     */
    put_Command(value) {
        if (!this.HasProp("__ISplitButton")) {
            if ((queryResult := this.QueryInterface(ISplitButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitButton := ISplitButton(outPtr)
        }

        return this.__ISplitButton.put_Command(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_CommandParameter() {
        if (!this.HasProp("__ISplitButton")) {
            if ((queryResult := this.QueryInterface(ISplitButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitButton := ISplitButton(outPtr)
        }

        return this.__ISplitButton.get_CommandParameter()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_CommandParameter(value) {
        if (!this.HasProp("__ISplitButton")) {
            if ((queryResult := this.QueryInterface(ISplitButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitButton := ISplitButton(outPtr)
        }

        return this.__ISplitButton.put_CommandParameter(value)
    }

    /**
     * 
     * @param {TypedEventHandler<SplitButton, SplitButtonClickEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Click(handler) {
        if (!this.HasProp("__ISplitButton")) {
            if ((queryResult := this.QueryInterface(ISplitButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitButton := ISplitButton(outPtr)
        }

        return this.__ISplitButton.add_Click(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Click(token) {
        if (!this.HasProp("__ISplitButton")) {
            if ((queryResult := this.QueryInterface(ISplitButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitButton := ISplitButton(outPtr)
        }

        return this.__ISplitButton.remove_Click(token)
    }

;@endregion Instance Methods
}
