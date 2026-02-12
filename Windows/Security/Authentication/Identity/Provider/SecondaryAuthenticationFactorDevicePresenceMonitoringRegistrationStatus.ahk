#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * **Deprecated.** Contains values that describe the status of the registration of a companion device for presence monitoring.
  * 
  * > [!NOTE]
  * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactordevicepresencemonitoringregistrationstatus
 * @namespace Windows.Security.Authentication.Identity.Provider
 * @version WindowsRuntime 1.4
 */
class SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus extends Win32Enum{

    /**
     * Presence monitoring is not supported on this device.
     * @type {Integer (Int32)}
     */
    static Unsupported => 0

    /**
     * The device was registered for presence monitoring successfully.
     * @type {Integer (Int32)}
     */
    static Succeeded => 1

    /**
     * Presence monitoring registration was prevented by a policy setting on the device.
     * @type {Integer (Int32)}
     */
    static DisabledByPolicy => 2
}
