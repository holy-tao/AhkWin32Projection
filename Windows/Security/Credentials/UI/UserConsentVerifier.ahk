#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserConsentVerifierStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Checks for availability of a verification device (such as a Microsoft Passport PIN, Windows Hello biometric, or fingerprint reader), and performs a verification.
 * @remarks
 * You can use **UserConsentVerifier** to enhance the security of your app by including a request for verification whenever the user is required to consent to a particular action. For example, you can require fingerprint authentication before authorizing an in-app purchase or access to restricted resources. You can use **UserConsentVerifier** to determine whether fingerprint authentication is supported for the current computer by using the [CheckAvailabilityAsync](userconsentverifier_checkavailabilityasync_167910294.md) method, and then request user consent from a fingerprint scan by using the [RequestVerificationAsync](userconsentverifier_requestverificationasync_1054783001.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.ui.userconsentverifier
 * @namespace Windows.Security.Credentials.UI
 * @version WindowsRuntime 1.4
 */
class UserConsentVerifier extends IInspectable {
;@region Static Methods
    /**
     * Checks to see whether an authentication device, such as a Microsoft Passport PIN, Windows Hello, or fingerprint reader, is available.
     * @remarks
     * The following example shows a method that checks to see if an authentication device is supported for the current user and returns a message that describes the result.
     * 
     * ```csharp
     * public async Task<string> CheckDeviceAvailability()
     * {
     *     string returnMessage;
     * 
     *     // Check the availability of device authentication.
     *     var ucvAvailability = await Windows.Security.Credentials.UI.UserConsentVerifier.CheckAvailabilityAsync();
     * 
     *     switch (ucvAvailability)
     *     {
     *         case Windows.Security.Credentials.UI.UserConsentVerifierAvailability.Available:
     *             returnMessage = "Authentication device is available.";
     *             break;
     *         case Windows.Security.Credentials.UI.UserConsentVerifierAvailability.DeviceBusy:
     *             returnMessage = "Authentication device is busy.";
     *             break;
     *         case Windows.Security.Credentials.UI.UserConsentVerifierAvailability.DeviceNotPresent:
     *             returnMessage = "No authentication device found.";
     *             break;
     *         case Windows.Security.Credentials.UI.UserConsentVerifierAvailability.DisabledByPolicy:
     *             returnMessage = "Authentication device verification is disabled by policy.";
     *             break;
     *         case Windows.Security.Credentials.UI.UserConsentVerifierAvailability.NotConfiguredForUser:
     *             returnMessage = "Please go to Account Settings to set up a PIN or other advanced authentication.";
     *             break;
     *         default:
     *             returnMessage = "Authentication device is currently unavailable.";
     *             break;
     *     }
     * 
     *     return returnMessage;
     * }
     * ```
     * 
     * ```cppwinrt
     * winrt::Windows::Foundation::IAsyncOperation<winrt::hstring> CheckDeviceAvailability()
     * {
     *     winrt::hstring returnMessage;
     * 
     *     // Check the availability of device authentication.
     *     auto ucvAvailability = co_await Windows::Security::Credentials::UI::UserConsentVerifier::CheckAvailabilityAsync();
     * 
     *     switch (ucvAvailability)
     *     {
     *         case winrt::Windows::Security::Credentials::UI::UserConsentVerifierAvailability::Available:
     *             returnMessage = L"Authentication device is available.";
     *             break;
     *         case winrt::Windows::Security::Credentials::UI::UserConsentVerifierAvailability::DeviceBusy:
     *             returnMessage = L"Authentication device is busy.";
     *             break;
     *         case winrt::Windows::Security::Credentials::UI::UserConsentVerifierAvailability::DeviceNotPresent:
     *             returnMessage = L"No authentication device found.";
     *             break;
     *         case winrt::Windows::Security::Credentials::UI::UserConsentVerifierAvailability::DisabledByPolicy:
     *             returnMessage = L"Authentication device verification is disabled by policy.";
     *             break;
     *         case winrt::Windows::Security::Credentials::UI::UserConsentVerifierAvailability::NotConfiguredForUser:
     *             returnMessage = L"Please go to Account Settings to set up a PIN or other advanced authentication.";
     *             break;
     *         default:
     *             returnMessage = L"Authentication device is currently unavailable.";
     *             break;
     *     }
     * 
     *     co_return returnMessage;
     * }
     * ```
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.ui.userconsentverifier.checkavailabilityasync
     */
    static CheckAvailabilityAsync() {
        if (!UserConsentVerifier.HasProp("__IUserConsentVerifierStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Credentials.UI.UserConsentVerifier")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserConsentVerifierStatics.IID)
            UserConsentVerifier.__IUserConsentVerifierStatics := IUserConsentVerifierStatics(factoryPtr)
        }

        return UserConsentVerifier.__IUserConsentVerifierStatics.CheckAvailabilityAsync()
    }

    /**
     * Performs a verification using an authentication device such as Microsoft Passport PIN, Windows Hello, or a fingerprint reader. This API is for Universal Windows Platform (UWP) apps. The alternative API to use for a desktop app is described in **Examples** in [UserConsentVerifier class](/uwp/api/windows.security.credentials.ui.userconsentverifier).
     * @remarks
     * You can use the RequestVerificationAsync method to request user consent for a sensitive operation. For example, you can require device authentication before authorizing an in-app purchase, or access to restricted resources. You can use the [CheckAvailabilityAsync](userconsentverifier_checkavailabilityasync_167910294.md) method to determine if authentication is supported for the current user.
     * @param {HSTRING} message A message to display to the user for this verification request.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.ui.userconsentverifier.requestverificationasync
     */
    static RequestVerificationAsync(message) {
        if (!UserConsentVerifier.HasProp("__IUserConsentVerifierStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Credentials.UI.UserConsentVerifier")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserConsentVerifierStatics.IID)
            UserConsentVerifier.__IUserConsentVerifierStatics := IUserConsentVerifierStatics(factoryPtr)
        }

        return UserConsentVerifier.__IUserConsentVerifierStatics.RequestVerificationAsync(message)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
