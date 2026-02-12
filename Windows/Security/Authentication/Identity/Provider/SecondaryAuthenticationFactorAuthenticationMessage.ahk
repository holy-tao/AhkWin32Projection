#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Represents standard error messages.
  * 
  * > [!NOTE]
  * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorauthenticationmessage
 * @namespace Windows.Security.Authentication.Identity.Provider
 * @version WindowsRuntime 1.4
 */
class SecondaryAuthenticationFactorAuthenticationMessage extends Win32Enum{

    /**
     * Invalid message.
     * @type {Integer (Int32)}
     */
    static Invalid => 0

    /**
     * Swipe up or press space bar to sign in with **device name**.
     * @type {Integer (Int32)}
     */
    static SwipeUpWelcome => 1

    /**
     * Tap **device name** to the NFC reader to sign in.
     * @type {Integer (Int32)}
     */
    static TapWelcome => 2

    /**
     * See **device name** for sign-in instructions.
     * @type {Integer (Int32)}
     */
    static DeviceNeedsAttention => 3

    /**
     * Looking for **device name**...
     * @type {Integer (Int32)}
     */
    static LookingForDevice => 4

    /**
     * Plug **device name** into a USB port to sign in.
     * @type {Integer (Int32)}
     */
    static LookingForDevicePluggedin => 5

    /**
     * Turn on Bluetooth to use **device name** to sign in.
     * @type {Integer (Int32)}
     */
    static BluetoothIsDisabled => 6

    /**
     * Turn on NFC to use **device name** to sign in.
     * @type {Integer (Int32)}
     */
    static NfcIsDisabled => 7

    /**
     * Connect to a Wi-Fi network to use **device name** to sign in.
     * @type {Integer (Int32)}
     */
    static WiFiIsDisabled => 8

    /**
     * Tap **device name** again.
     * @type {Integer (Int32)}
     */
    static ExtraTapIsRequired => 9

    /**
     * Your enterprise prevents sign in with **device name**. Use another sign-in option.
     * @type {Integer (Int32)}
     */
    static DisabledByPolicy => 10

    /**
     * Tap **device name** to sign in.
     * @type {Integer (Int32)}
     */
    static TapOnDeviceRequired => 11

    /**
     * Rest your finger on **device name** to sign in.
     * @type {Integer (Int32)}
     */
    static HoldFinger => 12

    /**
     * Swipe your finger on **device name** to sign in.
     * @type {Integer (Int32)}
     */
    static ScanFinger => 13

    /**
     * Couldn’t sign in with **device name**. Use another sign-in option.
     * @type {Integer (Int32)}
     */
    static UnauthorizedUser => 14

    /**
     * Something went wrong. Use another sign-in option, and then set up **device name** again.
     * @type {Integer (Int32)}
     */
    static ReregisterRequired => 15

    /**
     * Try again.
     * @type {Integer (Int32)}
     */
    static TryAgain => 16

    /**
     * Say your Spoken Passphrase into **device name**.
     * @type {Integer (Int32)}
     */
    static SayPassphrase => 17

    /**
     * Ready to sign in with **device name**.
     * @type {Integer (Int32)}
     */
    static ReadyToSignIn => 18

    /**
     * Use another sign-in option first, then you can use **device name** to sign in.
     * @type {Integer (Int32)}
     */
    static UseAnotherSignInOption => 19

    /**
     * Could not connect to companion device. Try again.
     * @type {Integer (Int32)}
     */
    static ConnectionRequired => 20

    /**
     * The authentication process exceeded the time limit. Try again.
     * @type {Integer (Int32)}
     */
    static TimeLimitExceeded => 21

    /**
     * The authentication process was cancelled. Try again.
     * @type {Integer (Int32)}
     */
    static CanceledByUser => 22

    /**
     * Instruct the user to center their hand over the companion device.
     * @type {Integer (Int32)}
     */
    static CenterHand => 23

    /**
     * Instruct the user to move their hand closer to the companion device.
     * @type {Integer (Int32)}
     */
    static MoveHandCloser => 24

    /**
     * Instruct the user to move their hand farther from the companion device.
     * @type {Integer (Int32)}
     */
    static MoveHandFarther => 25

    /**
     * Instruct the user to move their hand above the companion device.
     * @type {Integer (Int32)}
     */
    static PlaceHandAbove => 26

    /**
     * The companion device failed to recognize the user.
     * @type {Integer (Int32)}
     */
    static RecognitionFailed => 27

    /**
     * The companion device is unavailable. Use another sign-in option.
     * @type {Integer (Int32)}
     */
    static DeviceUnavailable => 28
}
