#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUICommand.ahk
#Include .\IUICommandFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a command in a context menu.
 * @remarks
 * Use the [PopupMenu.Commands](popupmenu_commands.md) property to add or modify the commands in a context menu.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.popups.uicommand
 * @namespace Windows.UI.Popups
 * @version WindowsRuntime 1.4
 */
class UICommand extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUICommand

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUICommand.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new instance of the [UICommand](uicommand.md) class using the specified label.
     * @param {HSTRING} label The label for the [UICommand](uicommand.md).
     * @returns {UICommand} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.popups.uicommand.#ctor
     */
    static Create(label) {
        if (!UICommand.HasProp("__IUICommandFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Popups.UICommand")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUICommandFactory.IID)
            UICommand.__IUICommandFactory := IUICommandFactory(factoryPtr)
        }

        return UICommand.__IUICommandFactory.Create(label)
    }

    /**
     * Creates a new instance of the [UICommand](uicommand.md) class using the specified label and event handler.
     * @param {HSTRING} label The label for the new command.
     * @param {UICommandInvokedHandler} action The event handler for the new command.
     * @returns {UICommand} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.popups.uicommand.#ctor
     */
    static CreateWithHandler(label, action) {
        if (!UICommand.HasProp("__IUICommandFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Popups.UICommand")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUICommandFactory.IID)
            UICommand.__IUICommandFactory := IUICommandFactory(factoryPtr)
        }

        return UICommand.__IUICommandFactory.CreateWithHandler(label, action)
    }

    /**
     * Creates a new instance of the [UICommand](uicommand.md) class using the specified label, event handler, and command identifier.
     * @param {HSTRING} label The label for the new command.
     * @param {UICommandInvokedHandler} action The event handler for the new command.
     * @param {IInspectable} commandId The command identifier for the new command.
     * @returns {UICommand} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.popups.uicommand.#ctor
     */
    static CreateWithHandlerAndId(label, action, commandId) {
        if (!UICommand.HasProp("__IUICommandFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Popups.UICommand")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUICommandFactory.IID)
            UICommand.__IUICommandFactory := IUICommandFactory(factoryPtr)
        }

        return UICommand.__IUICommandFactory.CreateWithHandlerAndId(label, action, commandId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the label for the command.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.popups.uicommand.label
     * @type {HSTRING} 
     */
    Label {
        get => this.get_Label()
        set => this.put_Label(value)
    }

    /**
     * Gets or sets the handler for the event that is fired when the user selects the [UICommand](uicommand.md).
     * @remarks
     * This property may be **null**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.popups.uicommand.invoked
     * @type {UICommandInvokedHandler} 
     */
    Invoked {
        get => this.get_Invoked()
        set => this.put_Invoked(value)
    }

    /**
     * Gets or sets the identifier of the command.
     * @remarks
     * If you assign a unique identifier to each menu command, you can implement a single [UICommandInvokedHandler](uicommandinvokedhandler.md) method that handles events from multiple commands.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.popups.uicommand.id
     * @type {IInspectable} 
     */
    Id {
        get => this.get_Id()
        set => this.put_Id(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [UICommand](uicommand.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Popups.UICommand")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Label() {
        if (!this.HasProp("__IUICommand")) {
            if ((queryResult := this.QueryInterface(IUICommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUICommand := IUICommand(outPtr)
        }

        return this.__IUICommand.get_Label()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Label(value) {
        if (!this.HasProp("__IUICommand")) {
            if ((queryResult := this.QueryInterface(IUICommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUICommand := IUICommand(outPtr)
        }

        return this.__IUICommand.put_Label(value)
    }

    /**
     * 
     * @returns {UICommandInvokedHandler} 
     */
    get_Invoked() {
        if (!this.HasProp("__IUICommand")) {
            if ((queryResult := this.QueryInterface(IUICommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUICommand := IUICommand(outPtr)
        }

        return this.__IUICommand.get_Invoked()
    }

    /**
     * 
     * @param {UICommandInvokedHandler} value 
     * @returns {HRESULT} 
     */
    put_Invoked(value) {
        if (!this.HasProp("__IUICommand")) {
            if ((queryResult := this.QueryInterface(IUICommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUICommand := IUICommand(outPtr)
        }

        return this.__IUICommand.put_Invoked(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Id() {
        if (!this.HasProp("__IUICommand")) {
            if ((queryResult := this.QueryInterface(IUICommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUICommand := IUICommand(outPtr)
        }

        return this.__IUICommand.get_Id()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Id(value) {
        if (!this.HasProp("__IUICommand")) {
            if ((queryResult := this.QueryInterface(IUICommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUICommand := IUICommand(outPtr)
        }

        return this.__IUICommand.put_Id(value)
    }

;@endregion Instance Methods
}
