#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAdvertisingManagerForUser.ahk
#Include ..\..\..\Guid.ahk

/**
 * Associates a user with an advertising ID.
 * @remarks
 * An instance of this class is returned by the [AdvertisingManager.GetForUser](advertisingmanager_getforuser_2058550280.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.advertisingmanagerforuser
 * @namespace Windows.System.UserProfile
 * @version WindowsRuntime 1.4
 */
class AdvertisingManagerForUser extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAdvertisingManagerForUser

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAdvertisingManagerForUser.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a unique ID used to provide more relevant advertising to a user.
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.advertisingmanagerforuser.advertisingid
     * @type {HSTRING} 
     */
    AdvertisingId {
        get => this.get_AdvertisingId()
    }

    /**
     * Gets the user who is associated with the advertising ID.
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.advertisingmanagerforuser.user
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
     * @returns {HSTRING} 
     */
    get_AdvertisingId() {
        if (!this.HasProp("__IAdvertisingManagerForUser")) {
            if ((queryResult := this.QueryInterface(IAdvertisingManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvertisingManagerForUser := IAdvertisingManagerForUser(outPtr)
        }

        return this.__IAdvertisingManagerForUser.get_AdvertisingId()
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IAdvertisingManagerForUser")) {
            if ((queryResult := this.QueryInterface(IAdvertisingManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvertisingManagerForUser := IAdvertisingManagerForUser(outPtr)
        }

        return this.__IAdvertisingManagerForUser.get_User()
    }

;@endregion Instance Methods
}
