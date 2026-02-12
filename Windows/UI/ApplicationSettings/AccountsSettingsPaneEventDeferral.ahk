#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAccountsSettingsPaneEventDeferral.ahk
#Include ..\..\..\Guid.ahk

/**
 * Enables the app to signal when it has finished populating command collections while handling the [AccountCommandsRequested](accountssettingspane_accountcommandsrequested.md) event.
 * @remarks
 * Use the [Complete](accountssettingspaneeventdeferral_complete_1807836922.md) method to signal when your app has fulfilled the request.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.accountssettingspaneeventdeferral
 * @namespace Windows.UI.ApplicationSettings
 * @version WindowsRuntime 1.4
 */
class AccountsSettingsPaneEventDeferral extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAccountsSettingsPaneEventDeferral

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAccountsSettingsPaneEventDeferral.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Signals that the app has finished populating command collections while handling the [AccountCommandsRequested](accountssettingspane_accountcommandsrequested.md) event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.accountssettingspaneeventdeferral.complete
     */
    Complete() {
        if (!this.HasProp("__IAccountsSettingsPaneEventDeferral")) {
            if ((queryResult := this.QueryInterface(IAccountsSettingsPaneEventDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccountsSettingsPaneEventDeferral := IAccountsSettingsPaneEventDeferral(outPtr)
        }

        return this.__IAccountsSettingsPaneEventDeferral.Complete()
    }

;@endregion Instance Methods
}
