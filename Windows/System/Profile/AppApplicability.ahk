#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppApplicabilityStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * This class exposes a single static method used to check if a list of [App Capabilities](/windows/uwp/packaging/app-capability-declarations) is supported on the current device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.profile.appapplicability
 * @namespace Windows.System.Profile
 * @version WindowsRuntime 1.4
 */
class AppApplicability extends IInspectable {
;@region Static Methods
    /**
     * Given a list of [App Capabilities](/windows/uwp/packaging/app-capability-declarations) required by an app, returns a list of [UnsupportedAppRequirement](unsupportedapprequirement.md) objects representing capabilities in the list that are not supported on the current device
     * @param {IIterable<HSTRING>} capabilities A list of [App Capability](/windows/uwp/packaging/app-capability-declarations) strings
     * @returns {IVectorView<UnsupportedAppRequirement>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.appapplicability.getunsupportedapprequirements
     */
    static GetUnsupportedAppRequirements(capabilities) {
        if (!AppApplicability.HasProp("__IAppApplicabilityStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.AppApplicability")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppApplicabilityStatics.IID)
            AppApplicability.__IAppApplicabilityStatics := IAppApplicabilityStatics(factoryPtr)
        }

        return AppApplicability.__IAppApplicabilityStatics.GetUnsupportedAppRequirements(capabilities)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
