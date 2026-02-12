#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Gets the stage of the companion device authentication.
  * 
  * > [!NOTE]
  * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorauthenticationstage
 * @namespace Windows.Security.Authentication.Identity.Provider
 * @version WindowsRuntime 1.4
 */
class SecondaryAuthenticationFactorAuthenticationStage extends Win32Enum{

    /**
     * Authentication not started.
     * @type {Integer (Int32)}
     */
    static NotStarted => 0

    /**
     * Waiting for user confirmation.
     * @type {Integer (Int32)}
     */
    static WaitingForUserConfirmation => 1

    /**
     * Collecting credential.
     * @type {Integer (Int32)}
     */
    static CollectingCredential => 2

    /**
     * Suspending authentication.
     * @type {Integer (Int32)}
     */
    static SuspendingAuthentication => 3

    /**
     * Credential collected
     * @type {Integer (Int32)}
     */
    static CredentialCollected => 4

    /**
     * Credential authenticated.
     * @type {Integer (Int32)}
     */
    static CredentialAuthenticated => 5

    /**
     * Stopping authentication.
     * @type {Integer (Int32)}
     */
    static StoppingAuthentication => 6

    /**
     * Ready for lock.
     * @type {Integer (Int32)}
     */
    static ReadyForLock => 7

    /**
     * **Deprecated.** Checking for device presence.
     * @type {Integer (Int32)}
     */
    static CheckingDevicePresence => 8
}
