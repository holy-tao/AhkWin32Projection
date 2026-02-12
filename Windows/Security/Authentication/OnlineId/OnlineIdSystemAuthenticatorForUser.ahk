#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IOnlineIdSystemAuthenticatorForUser.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the authentication info for a single user entity on a single device (system).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.onlineidsystemauthenticatorforuser
 * @namespace Windows.Security.Authentication.OnlineId
 * @version WindowsRuntime 1.4
 */
class OnlineIdSystemAuthenticatorForUser extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IOnlineIdSystemAuthenticatorForUser

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IOnlineIdSystemAuthenticatorForUser.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The unique id value of the calling application. Windows desktop applications that are to use the System Ticket feature must set this value explicitly before calling [GetTicketAsync](onlineidsystemauthenticatorforuser_getticketasync_693125757.md).
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.onlineidsystemauthenticatorforuser.applicationid
     * @type {Guid} 
     */
    ApplicationId {
        get => this.get_ApplicationId()
        set => this.put_ApplicationId(value)
    }

    /**
     * Gets the corresponding Windows user for this [OnlineIdSystemAuthenticatorForUser](OnlineIdSystemAuthenticatorForUser.md).
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.onlineidsystemauthenticatorforuser.user
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
     * Attempts to retrieve the system ticket for the device.
     * @param {OnlineIdServiceTicketRequest} request The [OnlineIdServiceTicketRequest](OnlineIdServiceTicketRequest.md) representing the specifications for authenticating this user account.
     * @returns {IAsyncOperation<OnlineIdSystemTicketResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.onlineidsystemauthenticatorforuser.getticketasync
     */
    GetTicketAsync(request) {
        if (!this.HasProp("__IOnlineIdSystemAuthenticatorForUser")) {
            if ((queryResult := this.QueryInterface(IOnlineIdSystemAuthenticatorForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOnlineIdSystemAuthenticatorForUser := IOnlineIdSystemAuthenticatorForUser(outPtr)
        }

        return this.__IOnlineIdSystemAuthenticatorForUser.GetTicketAsync(request)
    }

    /**
     * 
     * @param {Guid} value 
     * @returns {HRESULT} 
     */
    put_ApplicationId(value) {
        if (!this.HasProp("__IOnlineIdSystemAuthenticatorForUser")) {
            if ((queryResult := this.QueryInterface(IOnlineIdSystemAuthenticatorForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOnlineIdSystemAuthenticatorForUser := IOnlineIdSystemAuthenticatorForUser(outPtr)
        }

        return this.__IOnlineIdSystemAuthenticatorForUser.put_ApplicationId(value)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ApplicationId() {
        if (!this.HasProp("__IOnlineIdSystemAuthenticatorForUser")) {
            if ((queryResult := this.QueryInterface(IOnlineIdSystemAuthenticatorForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOnlineIdSystemAuthenticatorForUser := IOnlineIdSystemAuthenticatorForUser(outPtr)
        }

        return this.__IOnlineIdSystemAuthenticatorForUser.get_ApplicationId()
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IOnlineIdSystemAuthenticatorForUser")) {
            if ((queryResult := this.QueryInterface(IOnlineIdSystemAuthenticatorForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOnlineIdSystemAuthenticatorForUser := IOnlineIdSystemAuthenticatorForUser(outPtr)
        }

        return this.__IOnlineIdSystemAuthenticatorForUser.get_User()
    }

;@endregion Instance Methods
}
