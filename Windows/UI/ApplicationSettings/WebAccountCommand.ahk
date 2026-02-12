#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebAccountCommand.ahk
#Include .\IWebAccountCommandFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Associates a command with a [WebAccount](../windows.security.credentials/webaccount.md) in the account settings pane..
 * @remarks
 * Add instances of the WebAccountCommand class to the [WebAccountCommands](accountssettingspanecommandsrequestedeventargs_webaccountcommands.md) collection.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.webaccountcommand
 * @namespace Windows.UI.ApplicationSettings
 * @version WindowsRuntime 1.4
 */
class WebAccountCommand extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebAccountCommand

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebAccountCommand.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [WebAccountCommand](webaccountcommand.md) class.
     * @remarks
     * Add instances of the [WebAccountCommand](webaccountcommand.md) class to the [WebAccountCommands](accountssettingspanecommandsrequestedeventargs_webaccountcommands.md) collection.
     * @param {WebAccount} webAccount_ The web account to associate with the current command.
     * @param {WebAccountCommandInvokedHandler} invoked The delegate that handles the command.
     * @param {Integer} actions A bitmask of web account actions.
     * @returns {WebAccountCommand} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.webaccountcommand.#ctor
     */
    static CreateWebAccountCommand(webAccount_, invoked, actions) {
        if (!WebAccountCommand.HasProp("__IWebAccountCommandFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.ApplicationSettings.WebAccountCommand")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAccountCommandFactory.IID)
            WebAccountCommand.__IWebAccountCommandFactory := IWebAccountCommandFactory(factoryPtr)
        }

        return WebAccountCommand.__IWebAccountCommandFactory.CreateWebAccountCommand(webAccount_, invoked, actions)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the web account that's associated with the current command.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.webaccountcommand.webaccount
     * @type {WebAccount} 
     */
    WebAccount {
        get => this.get_WebAccount()
    }

    /**
     * Gets the delegate that's invoked when the user selects an account and a specific action in the account settings pane.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.webaccountcommand.invoked
     * @type {WebAccountCommandInvokedHandler} 
     */
    Invoked {
        get => this.get_Invoked()
    }

    /**
     * Gets the actions that the command performs on the web account in the accounts pane.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.webaccountcommand.actions
     * @type {Integer} 
     */
    Actions {
        get => this.get_Actions()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {WebAccount} 
     */
    get_WebAccount() {
        if (!this.HasProp("__IWebAccountCommand")) {
            if ((queryResult := this.QueryInterface(IWebAccountCommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountCommand := IWebAccountCommand(outPtr)
        }

        return this.__IWebAccountCommand.get_WebAccount()
    }

    /**
     * 
     * @returns {WebAccountCommandInvokedHandler} 
     */
    get_Invoked() {
        if (!this.HasProp("__IWebAccountCommand")) {
            if ((queryResult := this.QueryInterface(IWebAccountCommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountCommand := IWebAccountCommand(outPtr)
        }

        return this.__IWebAccountCommand.get_Invoked()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Actions() {
        if (!this.HasProp("__IWebAccountCommand")) {
            if ((queryResult := this.QueryInterface(IWebAccountCommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountCommand := IWebAccountCommand(outPtr)
        }

        return this.__IWebAccountCommand.get_Actions()
    }

;@endregion Instance Methods
}
