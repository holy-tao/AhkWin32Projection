#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhoneCallHistoryManagerForUser.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides APIs for the application to get access to the [PhoneCallHistoryStore](phonecallhistorystore.md) for a specific user.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistorymanagerforuser
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneCallHistoryManagerForUser extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhoneCallHistoryManagerForUser

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhoneCallHistoryManagerForUser.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the user of an app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistorymanagerforuser.user
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
     * Requests the [PhoneCallHistoryStore](phonecallhistorystore.md) associated with the associated user and the calling application.
     * @param {Integer} accessType The type of access requested for the [PhoneCallHistoryStore](phonecallhistorystore.md) object.
     * @returns {IAsyncOperation<PhoneCallHistoryStore>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistorymanagerforuser.requeststoreasync
     */
    RequestStoreAsync(accessType) {
        if (!this.HasProp("__IPhoneCallHistoryManagerForUser")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryManagerForUser := IPhoneCallHistoryManagerForUser(outPtr)
        }

        return this.__IPhoneCallHistoryManagerForUser.RequestStoreAsync(accessType)
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IPhoneCallHistoryManagerForUser")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryManagerForUser := IPhoneCallHistoryManagerForUser(outPtr)
        }

        return this.__IPhoneCallHistoryManagerForUser.get_User()
    }

;@endregion Instance Methods
}
