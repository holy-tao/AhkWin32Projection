#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Represents the status of an authentication operation using a companion device.
  * 
  * > [!NOTE]
  * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorauthenticationstatus
 * @namespace Windows.Security.Authentication.Identity.Provider
 * @version WindowsRuntime 1.4
 */
class SecondaryAuthenticationFactorAuthenticationStatus extends Win32Enum{

    /**
     * Authentication failed.
     * @type {Integer (Int32)}
     */
    static Failed => 0

    /**
     * Authentication started.
     * @type {Integer (Int32)}
     */
    static Started => 1

    /**
     * Unknown companion device.
     * @type {Integer (Int32)}
     */
    static UnknownDevice => 2

    /**
     * Companion device framework disabled by policy.
     * @type {Integer (Int32)}
     */
    static DisabledByPolicy => 3

    /**
     * Not a valid authentication stage.
     * @type {Integer (Int32)}
     */
    static InvalidAuthenticationStage => 4
}
