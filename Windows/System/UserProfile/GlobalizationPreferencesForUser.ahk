#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGlobalizationPreferencesForUser.ahk
#Include ..\..\..\Guid.ahk

/**
 * A class for holding the various globalization preferences of a user. This API is part of support for multi-user apps (MUA).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.globalizationpreferencesforuser
 * @namespace Windows.System.UserProfile
 * @version WindowsRuntime 1.4
 */
class GlobalizationPreferencesForUser extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGlobalizationPreferencesForUser

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGlobalizationPreferencesForUser.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the user represented by this class instance.
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.globalizationpreferencesforuser.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * Gets the set of calendars that are preferred by the represented user, in order of preference.
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.globalizationpreferencesforuser.calendars
     * @type {IVectorView<HSTRING>} 
     */
    Calendars {
        get => this.get_Calendars()
    }

    /**
     * Gets the set of clocks that are preferred by the represented user, in order of preference.
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.globalizationpreferencesforuser.clocks
     * @type {IVectorView<HSTRING>} 
     */
    Clocks {
        get => this.get_Clocks()
    }

    /**
     * Gets the set of currencies that are preferred by the represented user, in order of preference.
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.globalizationpreferencesforuser.currencies
     * @type {IVectorView<HSTRING>} 
     */
    Currencies {
        get => this.get_Currencies()
    }

    /**
     * Gets the set of languages that are preferred by the represented user, in order of preference.
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.globalizationpreferencesforuser.languages
     * @type {IVectorView<HSTRING>} 
     */
    Languages {
        get => this.get_Languages()
    }

    /**
     * Gets the represented user's home geographic region.
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.globalizationpreferencesforuser.homegeographicregion
     * @type {HSTRING} 
     */
    HomeGeographicRegion {
        get => this.get_HomeGeographicRegion()
    }

    /**
     * Gets the day of the week that is considered by the represented user to be the first day of the week.
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.globalizationpreferencesforuser.weekstartson
     * @type {Integer} 
     */
    WeekStartsOn {
        get => this.get_WeekStartsOn()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IGlobalizationPreferencesForUser")) {
            if ((queryResult := this.QueryInterface(IGlobalizationPreferencesForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalizationPreferencesForUser := IGlobalizationPreferencesForUser(outPtr)
        }

        return this.__IGlobalizationPreferencesForUser.get_User()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_Calendars() {
        if (!this.HasProp("__IGlobalizationPreferencesForUser")) {
            if ((queryResult := this.QueryInterface(IGlobalizationPreferencesForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalizationPreferencesForUser := IGlobalizationPreferencesForUser(outPtr)
        }

        return this.__IGlobalizationPreferencesForUser.get_Calendars()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_Clocks() {
        if (!this.HasProp("__IGlobalizationPreferencesForUser")) {
            if ((queryResult := this.QueryInterface(IGlobalizationPreferencesForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalizationPreferencesForUser := IGlobalizationPreferencesForUser(outPtr)
        }

        return this.__IGlobalizationPreferencesForUser.get_Clocks()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_Currencies() {
        if (!this.HasProp("__IGlobalizationPreferencesForUser")) {
            if ((queryResult := this.QueryInterface(IGlobalizationPreferencesForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalizationPreferencesForUser := IGlobalizationPreferencesForUser(outPtr)
        }

        return this.__IGlobalizationPreferencesForUser.get_Currencies()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_Languages() {
        if (!this.HasProp("__IGlobalizationPreferencesForUser")) {
            if ((queryResult := this.QueryInterface(IGlobalizationPreferencesForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalizationPreferencesForUser := IGlobalizationPreferencesForUser(outPtr)
        }

        return this.__IGlobalizationPreferencesForUser.get_Languages()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HomeGeographicRegion() {
        if (!this.HasProp("__IGlobalizationPreferencesForUser")) {
            if ((queryResult := this.QueryInterface(IGlobalizationPreferencesForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalizationPreferencesForUser := IGlobalizationPreferencesForUser(outPtr)
        }

        return this.__IGlobalizationPreferencesForUser.get_HomeGeographicRegion()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WeekStartsOn() {
        if (!this.HasProp("__IGlobalizationPreferencesForUser")) {
            if ((queryResult := this.QueryInterface(IGlobalizationPreferencesForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalizationPreferencesForUser := IGlobalizationPreferencesForUser(outPtr)
        }

        return this.__IGlobalizationPreferencesForUser.get_WeekStartsOn()
    }

;@endregion Instance Methods
}
