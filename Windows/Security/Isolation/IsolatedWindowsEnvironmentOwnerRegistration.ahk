#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IIsolatedWindowsEnvironmentOwnerRegistrationStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * **Deprecated.** Runtime class that registers a list of attributes of the owner of the Isolated Windows Environment. This includes the owner name, shareable folders from host to Isolated Windows Environment, processes that run as User or System, and cross-environment activation extentions.
 * @remarks
 * > [!WARNING]
 * > This is a deprecated API.
 * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentownerregistration
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IsolatedWindowsEnvironmentOwnerRegistration extends IInspectable {
;@region Static Methods
    /**
     * **Deprecated.** Registers the owner of the Isolated Windows Environment.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @param {HSTRING} ownerName Name of owner of Isolated Windows Environment.
     * @param {IsolatedWindowsEnvironmentOwnerRegistrationData} ownerRegistrationData [isolatedwindowsenvironmentownerregistrationdata](isolatedwindowsenvironmentownerregistrationdata.md)
     * @returns {IsolatedWindowsEnvironmentOwnerRegistrationResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentownerregistration.register
     */
    static Register(ownerName, ownerRegistrationData) {
        if (!IsolatedWindowsEnvironmentOwnerRegistration.HasProp("__IIsolatedWindowsEnvironmentOwnerRegistrationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Isolation.IsolatedWindowsEnvironmentOwnerRegistration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIsolatedWindowsEnvironmentOwnerRegistrationStatics.IID)
            IsolatedWindowsEnvironmentOwnerRegistration.__IIsolatedWindowsEnvironmentOwnerRegistrationStatics := IIsolatedWindowsEnvironmentOwnerRegistrationStatics(factoryPtr)
        }

        return IsolatedWindowsEnvironmentOwnerRegistration.__IIsolatedWindowsEnvironmentOwnerRegistrationStatics.Register(ownerName, ownerRegistrationData)
    }

    /**
     * **Deprecated.** Unregister owner of Isolated Windows Environment.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @param {HSTRING} ownerName String for name of owner of Isolated Windows Environment.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentownerregistration.unregister
     */
    static Unregister(ownerName) {
        if (!IsolatedWindowsEnvironmentOwnerRegistration.HasProp("__IIsolatedWindowsEnvironmentOwnerRegistrationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Isolation.IsolatedWindowsEnvironmentOwnerRegistration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIsolatedWindowsEnvironmentOwnerRegistrationStatics.IID)
            IsolatedWindowsEnvironmentOwnerRegistration.__IIsolatedWindowsEnvironmentOwnerRegistrationStatics := IIsolatedWindowsEnvironmentOwnerRegistrationStatics(factoryPtr)
        }

        return IsolatedWindowsEnvironmentOwnerRegistration.__IIsolatedWindowsEnvironmentOwnerRegistrationStatics.Unregister(ownerName)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
