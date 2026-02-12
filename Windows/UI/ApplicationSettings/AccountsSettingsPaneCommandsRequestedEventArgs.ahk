#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAccountsSettingsPaneCommandsRequestedEventArgs.ahk
#Include .\IAccountsSettingsPaneCommandsRequestedEventArgs2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [AccountCommandsRequested](accountssettingspane_accountcommandsrequested.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.accountssettingspanecommandsrequestedeventargs
 * @namespace Windows.UI.ApplicationSettings
 * @version WindowsRuntime 1.4
 */
class AccountsSettingsPaneCommandsRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAccountsSettingsPaneCommandsRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAccountsSettingsPaneCommandsRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [WebAccountProviderCommand](webaccountprovidercommand.md) collection for the account settings pane.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.accountssettingspanecommandsrequestedeventargs.webaccountprovidercommands
     * @type {IVector<WebAccountProviderCommand>} 
     */
    WebAccountProviderCommands {
        get => this.get_WebAccountProviderCommands()
    }

    /**
     * Gets the [WebAccountCommand](webaccountcommand.md) collection for the account settings pane.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.accountssettingspanecommandsrequestedeventargs.webaccountcommands
     * @type {IVector<WebAccountCommand>} 
     */
    WebAccountCommands {
        get => this.get_WebAccountCommands()
    }

    /**
     * Gets the [CredentialCommand](credentialcommand.md) collection for the account settings pane.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.accountssettingspanecommandsrequestedeventargs.credentialcommands
     * @type {IVector<CredentialCommand>} 
     */
    CredentialCommands {
        get => this.get_CredentialCommands()
    }

    /**
     * Gets the [SettingsCommand](settingscommand.md) collection for the account settings pane.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.accountssettingspanecommandsrequestedeventargs.commands
     * @type {IVector<SettingsCommand>} 
     */
    Commands {
        get => this.get_Commands()
    }

    /**
     * Gets or sets the header text for the account settings pane.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.accountssettingspanecommandsrequestedeventargs.headertext
     * @type {HSTRING} 
     */
    HeaderText {
        get => this.get_HeaderText()
        set => this.put_HeaderText(value)
    }

    /**
     * Gets the user for the account settings pane.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.accountssettingspanecommandsrequestedeventargs.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<WebAccountProviderCommand>} 
     */
    get_WebAccountProviderCommands() {
        if (!this.HasProp("__IAccountsSettingsPaneCommandsRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAccountsSettingsPaneCommandsRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccountsSettingsPaneCommandsRequestedEventArgs := IAccountsSettingsPaneCommandsRequestedEventArgs(outPtr)
        }

        return this.__IAccountsSettingsPaneCommandsRequestedEventArgs.get_WebAccountProviderCommands()
    }

    /**
     * 
     * @returns {IVector<WebAccountCommand>} 
     */
    get_WebAccountCommands() {
        if (!this.HasProp("__IAccountsSettingsPaneCommandsRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAccountsSettingsPaneCommandsRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccountsSettingsPaneCommandsRequestedEventArgs := IAccountsSettingsPaneCommandsRequestedEventArgs(outPtr)
        }

        return this.__IAccountsSettingsPaneCommandsRequestedEventArgs.get_WebAccountCommands()
    }

    /**
     * 
     * @returns {IVector<CredentialCommand>} 
     */
    get_CredentialCommands() {
        if (!this.HasProp("__IAccountsSettingsPaneCommandsRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAccountsSettingsPaneCommandsRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccountsSettingsPaneCommandsRequestedEventArgs := IAccountsSettingsPaneCommandsRequestedEventArgs(outPtr)
        }

        return this.__IAccountsSettingsPaneCommandsRequestedEventArgs.get_CredentialCommands()
    }

    /**
     * 
     * @returns {IVector<SettingsCommand>} 
     */
    get_Commands() {
        if (!this.HasProp("__IAccountsSettingsPaneCommandsRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAccountsSettingsPaneCommandsRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccountsSettingsPaneCommandsRequestedEventArgs := IAccountsSettingsPaneCommandsRequestedEventArgs(outPtr)
        }

        return this.__IAccountsSettingsPaneCommandsRequestedEventArgs.get_Commands()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HeaderText() {
        if (!this.HasProp("__IAccountsSettingsPaneCommandsRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAccountsSettingsPaneCommandsRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccountsSettingsPaneCommandsRequestedEventArgs := IAccountsSettingsPaneCommandsRequestedEventArgs(outPtr)
        }

        return this.__IAccountsSettingsPaneCommandsRequestedEventArgs.get_HeaderText()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_HeaderText(value) {
        if (!this.HasProp("__IAccountsSettingsPaneCommandsRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAccountsSettingsPaneCommandsRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccountsSettingsPaneCommandsRequestedEventArgs := IAccountsSettingsPaneCommandsRequestedEventArgs(outPtr)
        }

        return this.__IAccountsSettingsPaneCommandsRequestedEventArgs.put_HeaderText(value)
    }

    /**
     * Gets the deferral object for the [AccountCommandsRequested](accountssettingspane_accountcommandsrequested.md) event.
     * @returns {AccountsSettingsPaneEventDeferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.accountssettingspanecommandsrequestedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IAccountsSettingsPaneCommandsRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAccountsSettingsPaneCommandsRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccountsSettingsPaneCommandsRequestedEventArgs := IAccountsSettingsPaneCommandsRequestedEventArgs(outPtr)
        }

        return this.__IAccountsSettingsPaneCommandsRequestedEventArgs.GetDeferral()
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IAccountsSettingsPaneCommandsRequestedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IAccountsSettingsPaneCommandsRequestedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccountsSettingsPaneCommandsRequestedEventArgs2 := IAccountsSettingsPaneCommandsRequestedEventArgs2(outPtr)
        }

        return this.__IAccountsSettingsPaneCommandsRequestedEventArgs2.get_User()
    }

;@endregion Instance Methods
}
