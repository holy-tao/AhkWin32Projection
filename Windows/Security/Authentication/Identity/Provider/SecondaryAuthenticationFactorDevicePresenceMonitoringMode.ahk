#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * **Deprecated.** Contains values that describe the type of connection that the system uses to monitor the presence of a companion device (such as a wearable device). 
  * 
  * > [!NOTE]
  * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
 * @remarks
 * A companion device must specify this value when registering for presence monitoring. If the companion device has only registered for secondary authentication and not presence monitoring, its corresponding [SecondaryAuthenticationFactorInfo](SecondaryAuthenticationFactorInfo.md) will show a default value of *unsupported*.
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactordevicepresencemonitoringmode
 * @namespace Windows.Security.Authentication.Identity.Provider
 * @version WindowsRuntime 1.4
 */
class SecondaryAuthenticationFactorDevicePresenceMonitoringMode extends Win32Enum{

    /**
     * Device presence monitoring is not supported.
     * @type {Integer (Int32)}
     */
    static Unsupported => 0

    /**
     * The system uses an app that corresponds to the companion device to monitor its presence.
     * @type {Integer (Int32)}
     */
    static AppManaged => 1

    /**
     * The system uses classing Bluetooth protocol to monitor the presence of the companion device.
     * @type {Integer (Int32)}
     */
    static SystemManaged => 2
}
