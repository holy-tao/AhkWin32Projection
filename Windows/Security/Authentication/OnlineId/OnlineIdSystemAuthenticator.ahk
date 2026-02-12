#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IOnlineIdSystemAuthenticatorStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * This class handles an app's attempts to acquire the local user id on a device, for use with the System Ticket feature (see Remarks).
 * @remarks
 * With the System Ticket feature, an app can provide cloud services to a user and store user info even if the user is not signed on with their Microsoft account (MSA). The app can acquire information about the local user account on a system, as well as information about the system itself, in order to keep track of settings and data for this user.
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.onlineidsystemauthenticator
 * @namespace Windows.Security.Authentication.OnlineId
 * @version WindowsRuntime 1.4
 */
class OnlineIdSystemAuthenticator extends IInspectable {
;@region Static Properties
    /**
     * Gets an instance of [OnlineIdSystemAuthenticatorForUser](OnlineIdSystemAuthenticatorForUser.md) that corresponds to the user currently logged in to the device.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.onlineidsystemauthenticator.default
     * @type {OnlineIdSystemAuthenticatorForUser} 
     */
    static Default {
        get => OnlineIdSystemAuthenticator.get_Default()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {OnlineIdSystemAuthenticatorForUser} 
     */
    static get_Default() {
        if (!OnlineIdSystemAuthenticator.HasProp("__IOnlineIdSystemAuthenticatorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.OnlineId.OnlineIdSystemAuthenticator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IOnlineIdSystemAuthenticatorStatics.IID)
            OnlineIdSystemAuthenticator.__IOnlineIdSystemAuthenticatorStatics := IOnlineIdSystemAuthenticatorStatics(factoryPtr)
        }

        return OnlineIdSystemAuthenticator.__IOnlineIdSystemAuthenticatorStatics.get_Default()
    }

    /**
     * Gets an instance of [OnlineIdSystemAuthenticatorForUser](OnlineIdSystemAuthenticatorForUser.md) that corresponds to the specified user.
     * @param {User} user_ The local Windows user.
     * @returns {OnlineIdSystemAuthenticatorForUser} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.onlineidsystemauthenticator.getforuser
     */
    static GetForUser(user_) {
        if (!OnlineIdSystemAuthenticator.HasProp("__IOnlineIdSystemAuthenticatorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.OnlineId.OnlineIdSystemAuthenticator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IOnlineIdSystemAuthenticatorStatics.IID)
            OnlineIdSystemAuthenticator.__IOnlineIdSystemAuthenticatorStatics := IOnlineIdSystemAuthenticatorStatics(factoryPtr)
        }

        return OnlineIdSystemAuthenticator.__IOnlineIdSystemAuthenticatorStatics.GetForUser(user_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
