#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\ContentControl.ahk
#Include .\IButtonBase.ahk
#Include .\IButtonBaseStatics.ahk
#Include ..\..\RoutedEventHandler.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\RoutedEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents the base class for all button controls, such as [Button](../windows.ui.xaml.controls/button.md), [RepeatButton](repeatbutton.md), and [HyperlinkButton](../windows.ui.xaml.controls/hyperlinkbutton.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.buttonbase
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class ButtonBase extends ContentControl {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IButtonBase

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IButtonBase.IID

    /**
     * Identifies the [ClickMode](buttonbase_clickmode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.buttonbase.clickmodeproperty
     * @type {DependencyProperty} 
     */
    static ClickModeProperty {
        get => ButtonBase.get_ClickModeProperty()
    }

    /**
     * Identifies the [IsPointerOver](buttonbase_ispointerover.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.buttonbase.ispointeroverproperty
     * @type {DependencyProperty} 
     */
    static IsPointerOverProperty {
        get => ButtonBase.get_IsPointerOverProperty()
    }

    /**
     * Identifies the [IsPressed](buttonbase_ispressed.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.buttonbase.ispressedproperty
     * @type {DependencyProperty} 
     */
    static IsPressedProperty {
        get => ButtonBase.get_IsPressedProperty()
    }

    /**
     * Identifier for the [Command](buttonbase_command.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.buttonbase.commandproperty
     * @type {DependencyProperty} 
     */
    static CommandProperty {
        get => ButtonBase.get_CommandProperty()
    }

    /**
     * Identifier for the [CommandParameter](buttonbase_commandparameter.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.buttonbase.commandparameterproperty
     * @type {DependencyProperty} 
     */
    static CommandParameterProperty {
        get => ButtonBase.get_CommandParameterProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ClickModeProperty() {
        if (!ButtonBase.HasProp("__IButtonBaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ButtonBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IButtonBaseStatics.IID)
            ButtonBase.__IButtonBaseStatics := IButtonBaseStatics(factoryPtr)
        }

        return ButtonBase.__IButtonBaseStatics.get_ClickModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsPointerOverProperty() {
        if (!ButtonBase.HasProp("__IButtonBaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ButtonBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IButtonBaseStatics.IID)
            ButtonBase.__IButtonBaseStatics := IButtonBaseStatics(factoryPtr)
        }

        return ButtonBase.__IButtonBaseStatics.get_IsPointerOverProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsPressedProperty() {
        if (!ButtonBase.HasProp("__IButtonBaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ButtonBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IButtonBaseStatics.IID)
            ButtonBase.__IButtonBaseStatics := IButtonBaseStatics(factoryPtr)
        }

        return ButtonBase.__IButtonBaseStatics.get_IsPressedProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CommandProperty() {
        if (!ButtonBase.HasProp("__IButtonBaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ButtonBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IButtonBaseStatics.IID)
            ButtonBase.__IButtonBaseStatics := IButtonBaseStatics(factoryPtr)
        }

        return ButtonBase.__IButtonBaseStatics.get_CommandProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CommandParameterProperty() {
        if (!ButtonBase.HasProp("__IButtonBaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ButtonBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IButtonBaseStatics.IID)
            ButtonBase.__IButtonBaseStatics := IButtonBaseStatics(factoryPtr)
        }

        return ButtonBase.__IButtonBaseStatics.get_CommandParameterProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that indicates when the [Click](buttonbase_click.md) event occurs, in terms of device behavior.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.buttonbase.clickmode
     * @type {Integer} 
     */
    ClickMode {
        get => this.get_ClickMode()
        set => this.put_ClickMode(value)
    }

    /**
     * Gets a value that indicates whether a device pointer is located over this button control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.buttonbase.ispointerover
     * @type {Boolean} 
     */
    IsPointerOver {
        get => this.get_IsPointerOver()
    }

    /**
     * Gets a value that indicates whether a [ButtonBase](buttonbase.md) is currently in a pressed state.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.buttonbase.ispressed
     * @type {Boolean} 
     */
    IsPressed {
        get => this.get_IsPressed()
    }

    /**
     * Gets or sets the command to invoke when this button is pressed.
     * @remarks
     * The **ICommand** interface comes from a different source depending on whether the data source is implemented in C++ or for Microsoft .NET. C++ implements [Windows::UI::Xaml::Input::ICommand](../windows.ui.xaml.input/icommand.md). Microsoft .NET implements [System.Windows.Input.ICommand](/dotnet/api/system.windows.input.icommand?view=dotnet-uwp-10.0&preserve-view=true). Both interfaces have the same template. Which interface you call from your app code is analogous: use [Windows::UI::Xaml::Input::ICommand](../windows.ui.xaml.input/icommand.md) for C++ code and [System.Windows.Input.ICommand](/dotnet/api/system.windows.input.icommand?view=dotnet-uwp-10.0&preserve-view=true) for Microsoft .NET code.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.buttonbase.command
     * @type {ICommand} 
     */
    Command {
        get => this.get_Command()
        set => this.put_Command(value)
    }

    /**
     * Gets or sets the parameter to pass to the [Command](buttonbase_command.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.buttonbase.commandparameter
     * @type {IInspectable} 
     */
    CommandParameter {
        get => this.get_CommandParameter()
        set => this.put_CommandParameter(value)
    }

    /**
     * Occurs when a button control is clicked.
     * @type {RoutedEventHandler}
    */
    OnClick {
        get {
            if(!this.HasProp("__OnClick")){
                this.__OnClick := WinRTEventHandler(
                    RoutedEventHandler,
                    RoutedEventHandler.IID,
                    IInspectable,
                    RoutedEventArgs
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
     * @returns {Integer} 
     */
    get_ClickMode() {
        if (!this.HasProp("__IButtonBase")) {
            if ((queryResult := this.QueryInterface(IButtonBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IButtonBase := IButtonBase(outPtr)
        }

        return this.__IButtonBase.get_ClickMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ClickMode(value) {
        if (!this.HasProp("__IButtonBase")) {
            if ((queryResult := this.QueryInterface(IButtonBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IButtonBase := IButtonBase(outPtr)
        }

        return this.__IButtonBase.put_ClickMode(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPointerOver() {
        if (!this.HasProp("__IButtonBase")) {
            if ((queryResult := this.QueryInterface(IButtonBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IButtonBase := IButtonBase(outPtr)
        }

        return this.__IButtonBase.get_IsPointerOver()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPressed() {
        if (!this.HasProp("__IButtonBase")) {
            if ((queryResult := this.QueryInterface(IButtonBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IButtonBase := IButtonBase(outPtr)
        }

        return this.__IButtonBase.get_IsPressed()
    }

    /**
     * 
     * @returns {ICommand} 
     */
    get_Command() {
        if (!this.HasProp("__IButtonBase")) {
            if ((queryResult := this.QueryInterface(IButtonBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IButtonBase := IButtonBase(outPtr)
        }

        return this.__IButtonBase.get_Command()
    }

    /**
     * 
     * @param {ICommand} value 
     * @returns {HRESULT} 
     */
    put_Command(value) {
        if (!this.HasProp("__IButtonBase")) {
            if ((queryResult := this.QueryInterface(IButtonBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IButtonBase := IButtonBase(outPtr)
        }

        return this.__IButtonBase.put_Command(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_CommandParameter() {
        if (!this.HasProp("__IButtonBase")) {
            if ((queryResult := this.QueryInterface(IButtonBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IButtonBase := IButtonBase(outPtr)
        }

        return this.__IButtonBase.get_CommandParameter()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_CommandParameter(value) {
        if (!this.HasProp("__IButtonBase")) {
            if ((queryResult := this.QueryInterface(IButtonBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IButtonBase := IButtonBase(outPtr)
        }

        return this.__IButtonBase.put_CommandParameter(value)
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Click(handler) {
        if (!this.HasProp("__IButtonBase")) {
            if ((queryResult := this.QueryInterface(IButtonBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IButtonBase := IButtonBase(outPtr)
        }

        return this.__IButtonBase.add_Click(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Click(token) {
        if (!this.HasProp("__IButtonBase")) {
            if ((queryResult := this.QueryInterface(IButtonBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IButtonBase := IButtonBase(outPtr)
        }

        return this.__IButtonBase.remove_Click(token)
    }

;@endregion Instance Methods
}
