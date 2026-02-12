#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DependencyObject.ahk
#Include .\IXamlUICommand.ahk
#Include .\ICommand.ahk
#Include .\IXamlUICommandFactory.ahk
#Include .\IXamlUICommandStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\XamlUICommand.ahk
#Include .\ExecuteRequestedEventArgs.ahk
#Include .\CanExecuteRequestedEventArgs.ahk
#Include ..\..\..\Foundation\EventHandler.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Provides a base class for defining the command behavior of an interactive UI element that performs an action when invoked (such as sending an email, deleting an item, or submitting a form).
 * @remarks
 * Implements the ICommand interface ([Windows.UI.Xaml.Input.ICommand](icommand.md) for C++ or [System.Windows.Input.ICommand](/dotnet/api/system.windows.input.icommand?view=dotnet-uwp-10.0&preserve-view=true) for C#), adding various UI properties, methods, and events.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.xamluicommand
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class XamlUICommand extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IXamlUICommand

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IXamlUICommand.IID

    /**
     * Identifies the [Label](xamluicommand_label.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.xamluicommand.labelproperty
     * @type {DependencyProperty} 
     */
    static LabelProperty {
        get => XamlUICommand.get_LabelProperty()
    }

    /**
     * Identifies the [IconSource](xamluicommand_iconsource.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.xamluicommand.iconsourceproperty
     * @type {DependencyProperty} 
     */
    static IconSourceProperty {
        get => XamlUICommand.get_IconSourceProperty()
    }

    /**
     * Identifies the [KeyboardAccelerators](xamluicommand_keyboardaccelerators.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.xamluicommand.keyboardacceleratorsproperty
     * @type {DependencyProperty} 
     */
    static KeyboardAcceleratorsProperty {
        get => XamlUICommand.get_KeyboardAcceleratorsProperty()
    }

    /**
     * Identifies the [AccessKey](xamluicommand_accesskey.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.xamluicommand.accesskeyproperty
     * @type {DependencyProperty} 
     */
    static AccessKeyProperty {
        get => XamlUICommand.get_AccessKeyProperty()
    }

    /**
     * Identifies the [Description](xamluicommand_description.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.xamluicommand.descriptionproperty
     * @type {DependencyProperty} 
     */
    static DescriptionProperty {
        get => XamlUICommand.get_DescriptionProperty()
    }

    /**
     * Identifies the [Command](xamluicommand_command.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.xamluicommand.commandproperty
     * @type {DependencyProperty} 
     */
    static CommandProperty {
        get => XamlUICommand.get_CommandProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {XamlUICommand} 
     */
    static CreateInstance() {
        if (!XamlUICommand.HasProp("__IXamlUICommandFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.XamlUICommand")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXamlUICommandFactory.IID)
            XamlUICommand.__IXamlUICommandFactory := IXamlUICommandFactory(factoryPtr)
        }

        return XamlUICommand.__IXamlUICommandFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LabelProperty() {
        if (!XamlUICommand.HasProp("__IXamlUICommandStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.XamlUICommand")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXamlUICommandStatics.IID)
            XamlUICommand.__IXamlUICommandStatics := IXamlUICommandStatics(factoryPtr)
        }

        return XamlUICommand.__IXamlUICommandStatics.get_LabelProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IconSourceProperty() {
        if (!XamlUICommand.HasProp("__IXamlUICommandStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.XamlUICommand")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXamlUICommandStatics.IID)
            XamlUICommand.__IXamlUICommandStatics := IXamlUICommandStatics(factoryPtr)
        }

        return XamlUICommand.__IXamlUICommandStatics.get_IconSourceProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_KeyboardAcceleratorsProperty() {
        if (!XamlUICommand.HasProp("__IXamlUICommandStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.XamlUICommand")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXamlUICommandStatics.IID)
            XamlUICommand.__IXamlUICommandStatics := IXamlUICommandStatics(factoryPtr)
        }

        return XamlUICommand.__IXamlUICommandStatics.get_KeyboardAcceleratorsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AccessKeyProperty() {
        if (!XamlUICommand.HasProp("__IXamlUICommandStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.XamlUICommand")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXamlUICommandStatics.IID)
            XamlUICommand.__IXamlUICommandStatics := IXamlUICommandStatics(factoryPtr)
        }

        return XamlUICommand.__IXamlUICommandStatics.get_AccessKeyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DescriptionProperty() {
        if (!XamlUICommand.HasProp("__IXamlUICommandStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.XamlUICommand")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXamlUICommandStatics.IID)
            XamlUICommand.__IXamlUICommandStatics := IXamlUICommandStatics(factoryPtr)
        }

        return XamlUICommand.__IXamlUICommandStatics.get_DescriptionProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CommandProperty() {
        if (!XamlUICommand.HasProp("__IXamlUICommandStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.XamlUICommand")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXamlUICommandStatics.IID)
            XamlUICommand.__IXamlUICommandStatics := IXamlUICommandStatics(factoryPtr)
        }

        return XamlUICommand.__IXamlUICommandStatics.get_CommandProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the label for this element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.xamluicommand.label
     * @type {HSTRING} 
     */
    Label {
        get => this.get_Label()
        set => this.put_Label(value)
    }

    /**
     * Gets or sets a glyph from the Segoe MDL2 Assets font for this element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.xamluicommand.iconsource
     * @type {IconSource} 
     */
    IconSource {
        get => this.get_IconSource()
        set => this.put_IconSource(value)
    }

    /**
     * Gets or sets the collection of key combinations for this element that invoke an action using the keyboard.
     * @remarks
     * Accelerators are typically assigned to buttons or menu items.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.xamluicommand.keyboardaccelerators
     * @type {IVector<KeyboardAccelerator>} 
     */
    KeyboardAccelerators {
        get => this.get_KeyboardAccelerators()
    }

    /**
     * Gets or sets the access key (mnemonic) for this element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.xamluicommand.accesskey
     * @type {HSTRING} 
     */
    AccessKey {
        get => this.get_AccessKey()
        set => this.put_AccessKey(value)
    }

    /**
     * Gets or sets a description for this element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.xamluicommand.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * Gets or sets the command behavior of an interactive UI element that performs an action when invoked, such as sending an email, deleting an item, or submitting a form.
     * @remarks
     * XamlUICommand implements the ICommand interface ([Windows.UI.Xaml.Input.ICommand](icommand.md) for C++ or [System.Windows.Input.ICommand](/dotnet/api/system.windows.input.icommand?view=dotnet-uwp-10.0&preserve-view=true) for C#), adding various UI properties, methods, and events.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.xamluicommand.command
     * @type {ICommand} 
     */
    Command {
        get => this.get_Command()
        set => this.put_Command(value)
    }

    /**
     * Occurs when an [Execute](xamluicommand_execute_171295283.md) call is made.
     * @type {TypedEventHandler<XamlUICommand, ExecuteRequestedEventArgs>}
    */
    OnExecuteRequested {
        get {
            if(!this.HasProp("__OnExecuteRequested")){
                this.__OnExecuteRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{35fb4834-1b34-541c-bd97-e6c60be9b4fb}"),
                    XamlUICommand,
                    ExecuteRequestedEventArgs
                )
                this.__OnExecuteRequestedToken := this.add_ExecuteRequested(this.__OnExecuteRequested.iface)
            }
            return this.__OnExecuteRequested
        }
    }

    /**
     * Occurs when a [CanExecute](xamluicommand_canexecute_508446764.md) call is made.
     * @type {TypedEventHandler<XamlUICommand, CanExecuteRequestedEventArgs>}
    */
    OnCanExecuteRequested {
        get {
            if(!this.HasProp("__OnCanExecuteRequested")){
                this.__OnCanExecuteRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{bc9f083e-f27f-51e3-847e-620e047b4a0c}"),
                    XamlUICommand,
                    CanExecuteRequestedEventArgs
                )
                this.__OnCanExecuteRequestedToken := this.add_CanExecuteRequested(this.__OnCanExecuteRequested.iface)
            }
            return this.__OnCanExecuteRequested
        }
    }

    /**
     * Occurs whenever something happens that affects whether the command can execute.
     * @remarks
     * Call [CanExecute](xamluicommand_canexecute_508446764.md) on the command element when this event occurs.
     * 
     * A command element typically disables itself if the command it is associated with cannot execute. For example, a MenuItem associated with the Paste command is disabled when the there is nothing on the clipboard to paste.
     * @type {EventHandler<IInspectable>}
    */
    OnCanExecuteChanged {
        get {
            if(!this.HasProp("__OnCanExecuteChanged")){
                this.__OnCanExecuteChanged := WinRTEventHandler(
                    EventHandler,
                    Guid("{074764f2-f0c0-5200-af2f-70e07638e4a7}"),
                    IInspectable,
                    IInspectable
                )
                this.__OnCanExecuteChangedToken := this.add_CanExecuteChanged(this.__OnCanExecuteChanged.iface)
            }
            return this.__OnCanExecuteChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnExecuteRequestedToken")) {
            this.remove_ExecuteRequested(this.__OnExecuteRequestedToken)
            this.__OnExecuteRequested.iface.Dispose()
        }

        if(this.HasProp("__OnCanExecuteRequestedToken")) {
            this.remove_CanExecuteRequested(this.__OnCanExecuteRequestedToken)
            this.__OnCanExecuteRequested.iface.Dispose()
        }

        if(this.HasProp("__OnCanExecuteChangedToken")) {
            this.remove_CanExecuteChanged(this.__OnCanExecuteChangedToken)
            this.__OnCanExecuteChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Label() {
        if (!this.HasProp("__IXamlUICommand")) {
            if ((queryResult := this.QueryInterface(IXamlUICommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlUICommand := IXamlUICommand(outPtr)
        }

        return this.__IXamlUICommand.get_Label()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Label(value) {
        if (!this.HasProp("__IXamlUICommand")) {
            if ((queryResult := this.QueryInterface(IXamlUICommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlUICommand := IXamlUICommand(outPtr)
        }

        return this.__IXamlUICommand.put_Label(value)
    }

    /**
     * 
     * @returns {IconSource} 
     */
    get_IconSource() {
        if (!this.HasProp("__IXamlUICommand")) {
            if ((queryResult := this.QueryInterface(IXamlUICommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlUICommand := IXamlUICommand(outPtr)
        }

        return this.__IXamlUICommand.get_IconSource()
    }

    /**
     * 
     * @param {IconSource} value 
     * @returns {HRESULT} 
     */
    put_IconSource(value) {
        if (!this.HasProp("__IXamlUICommand")) {
            if ((queryResult := this.QueryInterface(IXamlUICommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlUICommand := IXamlUICommand(outPtr)
        }

        return this.__IXamlUICommand.put_IconSource(value)
    }

    /**
     * 
     * @returns {IVector<KeyboardAccelerator>} 
     */
    get_KeyboardAccelerators() {
        if (!this.HasProp("__IXamlUICommand")) {
            if ((queryResult := this.QueryInterface(IXamlUICommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlUICommand := IXamlUICommand(outPtr)
        }

        return this.__IXamlUICommand.get_KeyboardAccelerators()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AccessKey() {
        if (!this.HasProp("__IXamlUICommand")) {
            if ((queryResult := this.QueryInterface(IXamlUICommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlUICommand := IXamlUICommand(outPtr)
        }

        return this.__IXamlUICommand.get_AccessKey()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_AccessKey(value) {
        if (!this.HasProp("__IXamlUICommand")) {
            if ((queryResult := this.QueryInterface(IXamlUICommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlUICommand := IXamlUICommand(outPtr)
        }

        return this.__IXamlUICommand.put_AccessKey(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IXamlUICommand")) {
            if ((queryResult := this.QueryInterface(IXamlUICommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlUICommand := IXamlUICommand(outPtr)
        }

        return this.__IXamlUICommand.get_Description()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Description(value) {
        if (!this.HasProp("__IXamlUICommand")) {
            if ((queryResult := this.QueryInterface(IXamlUICommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlUICommand := IXamlUICommand(outPtr)
        }

        return this.__IXamlUICommand.put_Description(value)
    }

    /**
     * 
     * @returns {ICommand} 
     */
    get_Command() {
        if (!this.HasProp("__IXamlUICommand")) {
            if ((queryResult := this.QueryInterface(IXamlUICommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlUICommand := IXamlUICommand(outPtr)
        }

        return this.__IXamlUICommand.get_Command()
    }

    /**
     * 
     * @param {ICommand} value 
     * @returns {HRESULT} 
     */
    put_Command(value) {
        if (!this.HasProp("__IXamlUICommand")) {
            if ((queryResult := this.QueryInterface(IXamlUICommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlUICommand := IXamlUICommand(outPtr)
        }

        return this.__IXamlUICommand.put_Command(value)
    }

    /**
     * 
     * @param {TypedEventHandler<XamlUICommand, ExecuteRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ExecuteRequested(handler) {
        if (!this.HasProp("__IXamlUICommand")) {
            if ((queryResult := this.QueryInterface(IXamlUICommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlUICommand := IXamlUICommand(outPtr)
        }

        return this.__IXamlUICommand.add_ExecuteRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ExecuteRequested(token) {
        if (!this.HasProp("__IXamlUICommand")) {
            if ((queryResult := this.QueryInterface(IXamlUICommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlUICommand := IXamlUICommand(outPtr)
        }

        return this.__IXamlUICommand.remove_ExecuteRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<XamlUICommand, CanExecuteRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CanExecuteRequested(handler) {
        if (!this.HasProp("__IXamlUICommand")) {
            if ((queryResult := this.QueryInterface(IXamlUICommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlUICommand := IXamlUICommand(outPtr)
        }

        return this.__IXamlUICommand.add_CanExecuteRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CanExecuteRequested(token) {
        if (!this.HasProp("__IXamlUICommand")) {
            if ((queryResult := this.QueryInterface(IXamlUICommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlUICommand := IXamlUICommand(outPtr)
        }

        return this.__IXamlUICommand.remove_CanExecuteRequested(token)
    }

    /**
     * Notifies the system that the command state has changed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.xamluicommand.notifycanexecutechanged
     */
    NotifyCanExecuteChanged() {
        if (!this.HasProp("__IXamlUICommand")) {
            if ((queryResult := this.QueryInterface(IXamlUICommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlUICommand := IXamlUICommand(outPtr)
        }

        return this.__IXamlUICommand.NotifyCanExecuteChanged()
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CanExecuteChanged(handler) {
        if (!this.HasProp("__ICommand")) {
            if ((queryResult := this.QueryInterface(ICommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommand := ICommand(outPtr)
        }

        return this.__ICommand.add_CanExecuteChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CanExecuteChanged(token) {
        if (!this.HasProp("__ICommand")) {
            if ((queryResult := this.QueryInterface(ICommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommand := ICommand(outPtr)
        }

        return this.__ICommand.remove_CanExecuteChanged(token)
    }

    /**
     * Retrieves whether the command can execute in its current state.
     * @remarks
     * A command source typically calls this method when the [CanExecuteChanged](xamluicommand_canexecutechanged.md) event is raised.
     * @param {IInspectable} parameter Data used by the command. If the command does not require data, this object can be set to null.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.xamluicommand.canexecute
     */
    CanExecute(parameter) {
        if (!this.HasProp("__ICommand")) {
            if ((queryResult := this.QueryInterface(ICommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommand := ICommand(outPtr)
        }

        return this.__ICommand.CanExecute(parameter)
    }

    /**
     * Invokes the command.
     * @param {IInspectable} parameter Data used by the command. If the command does not require data, this object can be set to null.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.xamluicommand.execute
     */
    Execute(parameter) {
        if (!this.HasProp("__ICommand")) {
            if ((queryResult := this.QueryInterface(ICommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommand := ICommand(outPtr)
        }

        return this.__ICommand.Execute(parameter)
    }

;@endregion Instance Methods
}
