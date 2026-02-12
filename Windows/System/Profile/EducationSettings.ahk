#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEducationSettingsStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Indicates if an app is running in an education environment.
 * @remarks
 * Examples of changes you might make in an education environment:  
 * 
 * -	Simplify the user interface
 * -	Do not collect data or personally identifiable information (PII).
 * -	Change default content
 * @see https://learn.microsoft.com/uwp/api/windows.system.profile.educationsettings
 * @namespace Windows.System.Profile
 * @version WindowsRuntime 1.4
 */
class EducationSettings extends IInspectable {
;@region Static Properties
    /**
     * Gets a Boolean value indicating if the app is running in an education environment.
     * @remarks
     * Returns **true** when running an Education SKU (Pro Education or Education).  
     * 
     * Returns **true** when the [SetEduPolicies](/windows/client-management/mdm/sharedpc-csp) policy is set.   
     * 
     * Always returns **false** on the Home SKU.  
     * 
     * A **true** value means the PC is running in an education environment (set either by the SKU or by the IT admin) and sets policies and behaviors to make Windows education ready.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.educationsettings.iseducationenvironment
     * @type {Boolean} 
     */
    static IsEducationEnvironment {
        get => EducationSettings.get_IsEducationEnvironment()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Boolean} 
     */
    static get_IsEducationEnvironment() {
        if (!EducationSettings.HasProp("__IEducationSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.EducationSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEducationSettingsStatics.IID)
            EducationSettings.__IEducationSettingsStatics := IEducationSettingsStatics(factoryPtr)
        }

        return EducationSettings.__IEducationSettingsStatics.get_IsEducationEnvironment()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
