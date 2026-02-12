#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWorkplaceSettingsStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Enables UWP apps to access select enterprise settings that are managed through group policy or other management services.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.workplace.workplacesettings
 * @namespace Windows.Management.Workplace
 * @version WindowsRuntime 1.4
 */
class WorkplaceSettings extends IInspectable {
;@region Static Properties
    /**
     * Gets a value that indicates whether an enterprise ID can be used instead of a Microsoft account.
     * @remarks
     * Some apps, such as the Mail app, require that a user sign in with a Microsoft account. If IsMicrosoftAccountOptional is **true**, the app can provide a different experience in an enterprise setting, and let a user sign in with an enterprise ID instead of a Microsoft account.
     * @see https://learn.microsoft.com/uwp/api/windows.management.workplace.workplacesettings.ismicrosoftaccountoptional
     * @type {Boolean} 
     */
    static IsMicrosoftAccountOptional {
        get => WorkplaceSettings.get_IsMicrosoftAccountOptional()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Boolean} 
     */
    static get_IsMicrosoftAccountOptional() {
        if (!WorkplaceSettings.HasProp("__IWorkplaceSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Management.Workplace.WorkplaceSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWorkplaceSettingsStatics.IID)
            WorkplaceSettings.__IWorkplaceSettingsStatics := IWorkplaceSettingsStatics(factoryPtr)
        }

        return WorkplaceSettings.__IWorkplaceSettingsStatics.get_IsMicrosoftAccountOptional()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
