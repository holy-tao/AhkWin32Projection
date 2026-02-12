#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAssignedAccessSettings.ahk
#Include .\IAssignedAccessSettingsStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides properties and methods to access the user's assigned access settings.
 * @remarks
 * Assigned access settings are per user and per device.
 * 
 * Call **GetForUser** if your app supports multiple users. Call **GetDefault** if your app supports a single user.
 * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.assignedaccesssettings
 * @namespace Windows.System.UserProfile
 * @version WindowsRuntime 1.4
 */
class AssignedAccessSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAssignedAccessSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAssignedAccessSettings.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves the default assigned access settings.
     * @returns {AssignedAccessSettings} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.assignedaccesssettings.getdefault
     */
    static GetDefault() {
        if (!AssignedAccessSettings.HasProp("__IAssignedAccessSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.UserProfile.AssignedAccessSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAssignedAccessSettingsStatics.IID)
            AssignedAccessSettings.__IAssignedAccessSettingsStatics := IAssignedAccessSettingsStatics(factoryPtr)
        }

        return AssignedAccessSettings.__IAssignedAccessSettingsStatics.GetDefault()
    }

    /**
     * Retrieves the assigned access settings for the specified user.
     * @param {User} user_ The user to get settings for.
     * @returns {AssignedAccessSettings} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.assignedaccesssettings.getforuser
     */
    static GetForUser(user_) {
        if (!AssignedAccessSettings.HasProp("__IAssignedAccessSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.UserProfile.AssignedAccessSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAssignedAccessSettingsStatics.IID)
            AssignedAccessSettings.__IAssignedAccessSettingsStatics := IAssignedAccessSettingsStatics(factoryPtr)
        }

        return AssignedAccessSettings.__IAssignedAccessSettingsStatics.GetForUser(user_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a value that indicates whether the user has configured _Assigned Access_ in the Windows settings.
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.assignedaccesssettings.isenabled
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
    }

    /**
     * Gets a value that indicates whether the kiosk account is configured as a single-app kiosk.
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.assignedaccesssettings.issingleappkioskmode
     * @type {Boolean} 
     */
    IsSingleAppKioskMode {
        get => this.get_IsSingleAppKioskMode()
    }

    /**
     * Gets the [User](./../windows.system/user.md) associated with this instance of assigned access settings.
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.assignedaccesssettings.user
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
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        if (!this.HasProp("__IAssignedAccessSettings")) {
            if ((queryResult := this.QueryInterface(IAssignedAccessSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAssignedAccessSettings := IAssignedAccessSettings(outPtr)
        }

        return this.__IAssignedAccessSettings.get_IsEnabled()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSingleAppKioskMode() {
        if (!this.HasProp("__IAssignedAccessSettings")) {
            if ((queryResult := this.QueryInterface(IAssignedAccessSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAssignedAccessSettings := IAssignedAccessSettings(outPtr)
        }

        return this.__IAssignedAccessSettings.get_IsSingleAppKioskMode()
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IAssignedAccessSettings")) {
            if ((queryResult := this.QueryInterface(IAssignedAccessSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAssignedAccessSettings := IAssignedAccessSettings(outPtr)
        }

        return this.__IAssignedAccessSettings.get_User()
    }

;@endregion Instance Methods
}
