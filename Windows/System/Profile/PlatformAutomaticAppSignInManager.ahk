#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlatformAutomaticAppSignInManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about the current Windows policy for automatic app sign in.
 * @remarks
 * > [!IMPORTANT]
 * > This class is intended for use by first-party applications.
 * @see https://learn.microsoft.com/uwp/api/windows.system.profile.platformautomaticappsigninmanager
 * @namespace Windows.System.Profile
 * @version WindowsRuntime 1.4
 */
class PlatformAutomaticAppSignInManager extends IInspectable {
;@region Static Properties
    /**
     * The Windows policy for automatic app sign in.
     * @remarks
     * > [!IMPORTANT]
     * > This method is intended for use by first-party applications.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.platformautomaticappsigninmanager.policy
     * @type {Integer} 
     */
    static Policy {
        get => PlatformAutomaticAppSignInManager.get_Policy()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Integer} 
     */
    static get_Policy() {
        if (!PlatformAutomaticAppSignInManager.HasProp("__IPlatformAutomaticAppSignInManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.PlatformAutomaticAppSignInManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlatformAutomaticAppSignInManagerStatics.IID)
            PlatformAutomaticAppSignInManager.__IPlatformAutomaticAppSignInManagerStatics := IPlatformAutomaticAppSignInManagerStatics(factoryPtr)
        }

        return PlatformAutomaticAppSignInManager.__IPlatformAutomaticAppSignInManagerStatics.get_Policy()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
