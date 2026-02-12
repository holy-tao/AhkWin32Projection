#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISystemSetupInfoStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides a property and an event that describe the current stage in the lifecycle of the Out-of-Box Experience (OOBE).
 * @remarks
 * The Out-of-Box Experience (OOBE) is the flow that occurs the first time the user turns on a Windows 10 device. The OOBE obtains acceptance of the EULA, sets the system default locale, and helps set up the initial user account.
 * @see https://learn.microsoft.com/uwp/api/windows.system.profile.systemsetupinfo
 * @namespace Windows.System.Profile
 * @version WindowsRuntime 1.4
 */
class SystemSetupInfo extends IInspectable {
;@region Static Properties
    /**
     * Gets a value representing the current stage in the lifecycle of the Out-of-Box Experience (OOBE).
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.systemsetupinfo.outofboxexperiencestate
     * @type {Integer} 
     */
    static OutOfBoxExperienceState {
        get => SystemSetupInfo.get_OutOfBoxExperienceState()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Integer} 
     */
    static get_OutOfBoxExperienceState() {
        if (!SystemSetupInfo.HasProp("__ISystemSetupInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.SystemSetupInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemSetupInfoStatics.IID)
            SystemSetupInfo.__ISystemSetupInfoStatics := ISystemSetupInfoStatics(factoryPtr)
        }

        return SystemSetupInfo.__ISystemSetupInfoStatics.get_OutOfBoxExperienceState()
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_OutOfBoxExperienceStateChanged(handler) {
        if (!SystemSetupInfo.HasProp("__ISystemSetupInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.SystemSetupInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemSetupInfoStatics.IID)
            SystemSetupInfo.__ISystemSetupInfoStatics := ISystemSetupInfoStatics(factoryPtr)
        }

        return SystemSetupInfo.__ISystemSetupInfoStatics.add_OutOfBoxExperienceStateChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_OutOfBoxExperienceStateChanged(token) {
        if (!SystemSetupInfo.HasProp("__ISystemSetupInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.SystemSetupInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemSetupInfoStatics.IID)
            SystemSetupInfo.__ISystemSetupInfoStatics := ISystemSetupInfoStatics(factoryPtr)
        }

        return SystemSetupInfo.__ISystemSetupInfoStatics.remove_OutOfBoxExperienceStateChanged(token)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
