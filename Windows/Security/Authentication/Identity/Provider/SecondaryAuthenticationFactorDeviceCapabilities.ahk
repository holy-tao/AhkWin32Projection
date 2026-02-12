#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Represents the capabilities of the companion device.
  * 
  * > [!NOTE]
  * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactordevicecapabilities
 * @namespace Windows.Security.Authentication.Identity.Provider
 * @version WindowsRuntime 1.4
 */
class SecondaryAuthenticationFactorDeviceCapabilities extends Win32BitflagEnum{

    /**
     * No capabilities.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Set this flag if the companion device supports secure storage and can protect auth key and device key from unauthorized access. In order to make sure your key storage meets the security bar, contact cdfonboard@microsoft.com.
     * @type {Integer (UInt32)}
     */
    static SecureStorage => 1

    /**
     * Set this flag if the companion device stores the auth key and device keys.
     * @type {Integer (UInt32)}
     */
    static StoreKeys => 2

    /**
     * Set this flag if the companion device can confirm user intent to authenticate.
     * @type {Integer (UInt32)}
     */
    static ConfirmUserIntentToAuthenticate => 4

    /**
     * **Deprecated.** Set this flag if the companion device supports securely confirming the user's identity and presence. In order to make sure your user presence check meets the security bar, contact cdfonboard@microsoft.com.
     * @type {Integer (UInt32)}
     */
    static SupportSecureUserPresenceCheck => 8

    /**
     * Set this flag if the companion device transmits auth keys and devices key over an encrypted channel.
     * @type {Integer (UInt32)}
     */
    static TransmittedDataIsEncrypted => 16

    /**
     * The device supports HMacSha256.
     * @type {Integer (UInt32)}
     */
    static HMacSha256 => 32

    /**
     * The device supports close range data transmission.
     * @type {Integer (UInt32)}
     */
    static CloseRangeDataTransmission => 64
}
