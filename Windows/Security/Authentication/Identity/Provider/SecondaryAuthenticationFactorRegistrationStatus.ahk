#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Represents the status of a companion device registration.
  * 
  * > [!NOTE]
  * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorregistrationstatus
 * @namespace Windows.Security.Authentication.Identity.Provider
 * @version WindowsRuntime 1.4
 */
class SecondaryAuthenticationFactorRegistrationStatus extends Win32Enum{

    /**
     * Registration failed.
     * @type {Integer (Int32)}
     */
    static Failed => 0

    /**
     * Registration started.
     * @type {Integer (Int32)}
     */
    static Started => 1

    /**
     * Registration cancelled by the user.
     * @type {Integer (Int32)}
     */
    static CanceledByUser => 2

    /**
     * PIN setup is required before registration can occur.
     * @type {Integer (Int32)}
     */
    static PinSetupRequired => 3

    /**
     * Registration is disabled by policy.
     * @type {Integer (Int32)}
     */
    static DisabledByPolicy => 4
}
