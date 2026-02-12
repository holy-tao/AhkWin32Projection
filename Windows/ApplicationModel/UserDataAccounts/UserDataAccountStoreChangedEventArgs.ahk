#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDataAccountStoreChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [StoreChanged](userdataaccountstore_storechanged.md) event.
 * @remarks
 * The system generates an instance of this class and passes it as an argument to the application's [StoreChanged](userdataaccountstore_storechanged.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccountstorechangedeventargs
 * @namespace Windows.ApplicationModel.UserDataAccounts
 * @version WindowsRuntime 1.4
 */
class UserDataAccountStoreChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserDataAccountStoreChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserDataAccountStoreChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets the deferral object for the [StoreChanged](userdataaccountstore_storechanged.md) event.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccountstorechangedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IUserDataAccountStoreChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IUserDataAccountStoreChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccountStoreChangedEventArgs := IUserDataAccountStoreChangedEventArgs(outPtr)
        }

        return this.__IUserDataAccountStoreChangedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
