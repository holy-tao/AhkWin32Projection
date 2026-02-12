#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAccountsSettingsPane.ahk
#Include .\IAccountsSettingsPaneStatics.ahk
#Include .\IAccountsSettingsPaneStatics3.ahk
#Include .\IAccountsSettingsPaneStatics2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\AccountsSettingsPane.ahk
#Include .\AccountsSettingsPaneCommandsRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides methods to show the accounts pane and also to enable the app to register callbacks when the accounts flyout is about to be displayed.
 * @remarks
 * The app provides the callbacks with account metadata for all of the web account providers, web accounts, global account commands, and credential locker credentials that the app displays. Examples of account providers are Facebook, LinkedIn, and Twitter.
 * 
 * The account and credential command classes in the [Windows.UI.ApplicationSettings](windows_ui_applicationsettings.md) namespace correspond with data objects in the [Windows.UI.ApplicationSettings](windows_ui_applicationsettings.md) namespace:
 * 
 * | Data Object ([Windows.Security.Credentials](../windows.security.credentials/windows_security_credentials.md)) | UI object ([Windows.UI.ApplicationSettings](windows_ui_applicationsettings.md)) |
 * |---|---|
 * | [WebAccount](../windows.security.credentials/webaccount.md) | [WebAccountCommand](webaccountcommand.md) |
 * | [WebAccountProvider](../windows.security.credentials/webaccountprovider.md) | [WebAccountProviderCommand](webaccountprovidercommand.md) |
 * | [PasswordCredential](../windows.security.credentials/passwordcredential.md) | [CredentialCommand](credentialcommand.md) |
 * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.accountssettingspane
 * @namespace Windows.UI.ApplicationSettings
 * @version WindowsRuntime 1.4
 */
class AccountsSettingsPane extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAccountsSettingsPane

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAccountsSettingsPane.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets an [AccountsSettingsPane](accountssettingspane.md) object that is associated with the current app view (that is, with [CoreWindow](../windows.ui.core/corewindow.md)).
     * @returns {AccountsSettingsPane} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.accountssettingspane.getforcurrentview
     */
    static GetForCurrentView() {
        if (!AccountsSettingsPane.HasProp("__IAccountsSettingsPaneStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.ApplicationSettings.AccountsSettingsPane")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAccountsSettingsPaneStatics.IID)
            AccountsSettingsPane.__IAccountsSettingsPaneStatics := IAccountsSettingsPaneStatics(factoryPtr)
        }

        return AccountsSettingsPane.__IAccountsSettingsPaneStatics.GetForCurrentView()
    }

    /**
     * Displays the account settings pane.
     * @remarks
     * You can modify the contents of the [AccountsSettingsPane](accountssettingspane.md) by registering for the [AccountCommandsRequested](accountssettingspane_accountcommandsrequested.md) event. If an error occurs while modifying the pane, Show will fail silently and the pane will not appear. 
     * 
     * Show will not notify the caller when the user has dismissed the account settings pane.
     * To receive an asynchronous action response use [ShowManageAccountsAsync](accountssettingspane_showmanageaccountsasync_541379460.md).
     * 
     * Do not call Show multiple times in rapid succession. If you call Show while an existing Show operation is still running, an exception will be thrown.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.accountssettingspane.show
     */
    static Show() {
        if (!AccountsSettingsPane.HasProp("__IAccountsSettingsPaneStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.ApplicationSettings.AccountsSettingsPane")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAccountsSettingsPaneStatics.IID)
            AccountsSettingsPane.__IAccountsSettingsPaneStatics := IAccountsSettingsPaneStatics(factoryPtr)
        }

        return AccountsSettingsPane.__IAccountsSettingsPaneStatics.Show()
    }

    /**
     * Displays the manage accounts screen for the specified user.
     * @param {User} user_ The user whose accounts will be accessed.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.accountssettingspane.showmanageaccountsforuserasync
     */
    static ShowManageAccountsForUserAsync(user_) {
        if (!AccountsSettingsPane.HasProp("__IAccountsSettingsPaneStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.ApplicationSettings.AccountsSettingsPane")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAccountsSettingsPaneStatics3.IID)
            AccountsSettingsPane.__IAccountsSettingsPaneStatics3 := IAccountsSettingsPaneStatics3(factoryPtr)
        }

        return AccountsSettingsPane.__IAccountsSettingsPaneStatics3.ShowManageAccountsForUserAsync(user_)
    }

    /**
     * Displays the add accounts screen for the specified user.
     * @param {User} user_ The user who will add an account.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.accountssettingspane.showaddaccountforuserasync
     */
    static ShowAddAccountForUserAsync(user_) {
        if (!AccountsSettingsPane.HasProp("__IAccountsSettingsPaneStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.ApplicationSettings.AccountsSettingsPane")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAccountsSettingsPaneStatics3.IID)
            AccountsSettingsPane.__IAccountsSettingsPaneStatics3 := IAccountsSettingsPaneStatics3(factoryPtr)
        }

        return AccountsSettingsPane.__IAccountsSettingsPaneStatics3.ShowAddAccountForUserAsync(user_)
    }

    /**
     * Displays the manage accounts screen.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.accountssettingspane.showmanageaccountsasync
     */
    static ShowManageAccountsAsync() {
        if (!AccountsSettingsPane.HasProp("__IAccountsSettingsPaneStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.ApplicationSettings.AccountsSettingsPane")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAccountsSettingsPaneStatics2.IID)
            AccountsSettingsPane.__IAccountsSettingsPaneStatics2 := IAccountsSettingsPaneStatics2(factoryPtr)
        }

        return AccountsSettingsPane.__IAccountsSettingsPaneStatics2.ShowManageAccountsAsync()
    }

    /**
     * Displays the add accounts screen.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.accountssettingspane.showaddaccountasync
     */
    static ShowAddAccountAsync() {
        if (!AccountsSettingsPane.HasProp("__IAccountsSettingsPaneStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.ApplicationSettings.AccountsSettingsPane")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAccountsSettingsPaneStatics2.IID)
            AccountsSettingsPane.__IAccountsSettingsPaneStatics2 := IAccountsSettingsPaneStatics2(factoryPtr)
        }

        return AccountsSettingsPane.__IAccountsSettingsPaneStatics2.ShowAddAccountAsync()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnAccountCommandsRequestedToken")) {
            this.remove_AccountCommandsRequested(this.__OnAccountCommandsRequestedToken)
            this.__OnAccountCommandsRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<AccountsSettingsPane, AccountsSettingsPaneCommandsRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AccountCommandsRequested(handler) {
        if (!this.HasProp("__IAccountsSettingsPane")) {
            if ((queryResult := this.QueryInterface(IAccountsSettingsPane.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccountsSettingsPane := IAccountsSettingsPane(outPtr)
        }

        return this.__IAccountsSettingsPane.add_AccountCommandsRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_AccountCommandsRequested(cookie) {
        if (!this.HasProp("__IAccountsSettingsPane")) {
            if ((queryResult := this.QueryInterface(IAccountsSettingsPane.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccountsSettingsPane := IAccountsSettingsPane(outPtr)
        }

        return this.__IAccountsSettingsPane.remove_AccountCommandsRequested(cookie)
    }

;@endregion Instance Methods
}
