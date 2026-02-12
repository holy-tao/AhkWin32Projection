#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDiagnosticsSettings.ahk
#Include .\IDiagnosticsSettingsStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides properties and methods to access the user's diagnostics settings.
 * @remarks
 * Diagnostics settings are per user and per device.
 * 
 * Call **GetForUser** if your app supports multiple users. Call **GetDefault** if your app supports a single user.
 * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.diagnosticssettings
 * @namespace Windows.System.UserProfile
 * @version WindowsRuntime 1.4
 */
class DiagnosticsSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDiagnosticsSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDiagnosticsSettings.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves the default diagnostics settings.
     * @returns {DiagnosticsSettings} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.diagnosticssettings.getdefault
     */
    static GetDefault() {
        if (!DiagnosticsSettings.HasProp("__IDiagnosticsSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.UserProfile.DiagnosticsSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDiagnosticsSettingsStatics.IID)
            DiagnosticsSettings.__IDiagnosticsSettingsStatics := IDiagnosticsSettingsStatics(factoryPtr)
        }

        return DiagnosticsSettings.__IDiagnosticsSettingsStatics.GetDefault()
    }

    /**
     * Retrieves the diagnostics settings for the specified user.
     * @param {User} user_ The user to get settings for.
     * @returns {DiagnosticsSettings} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.diagnosticssettings.getforuser
     */
    static GetForUser(user_) {
        if (!DiagnosticsSettings.HasProp("__IDiagnosticsSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.UserProfile.DiagnosticsSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDiagnosticsSettingsStatics.IID)
            DiagnosticsSettings.__IDiagnosticsSettingsStatics := IDiagnosticsSettingsStatics(factoryPtr)
        }

        return DiagnosticsSettings.__IDiagnosticsSettingsStatics.GetForUser(user_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a value that indicates whether the user has turned on access to diagnostic data for tailored experiences in the Windows *Feedback & diagnostics* settings.
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.diagnosticssettings.canusediagnosticstotailorexperiences
     * @type {Boolean} 
     */
    CanUseDiagnosticsToTailorExperiences {
        get => this.get_CanUseDiagnosticsToTailorExperiences()
    }

    /**
     * Gets the [User](./../windows.system/user.md) associated with this instance of diagnostics settings.
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.diagnosticssettings.user
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
    get_CanUseDiagnosticsToTailorExperiences() {
        if (!this.HasProp("__IDiagnosticsSettings")) {
            if ((queryResult := this.QueryInterface(IDiagnosticsSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDiagnosticsSettings := IDiagnosticsSettings(outPtr)
        }

        return this.__IDiagnosticsSettings.get_CanUseDiagnosticsToTailorExperiences()
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IDiagnosticsSettings")) {
            if ((queryResult := this.QueryInterface(IDiagnosticsSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDiagnosticsSettings := IDiagnosticsSettings(outPtr)
        }

        return this.__IDiagnosticsSettings.get_User()
    }

;@endregion Instance Methods
}
