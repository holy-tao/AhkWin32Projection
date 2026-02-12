#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the current sign-in state for a broadcast app.
  * 
  * > [!NOTE]
  * > This API requires the **appBroadcast** and **appBroadcastSettings** capability which is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime.
 * @remarks
 * Get the current sign-in state by handling the [AppBroadcastBackgroundServiceSignInInfo.SignInStateChanged](appbroadcastbackgroundservicesignininfo_signinstatechanged.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastsigninstate
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppBroadcastSignInState extends Win32Enum{

    /**
     * The user is not signed in.
     * @type {Integer (Int32)}
     */
    static NotSignedIn => 0

    /**
     * A sign-in operation with the Microsoft service is in progress.
     * @type {Integer (Int32)}
     */
    static MicrosoftSignInInProgress => 1

    /**
     * A sign-in operation with the Microsoft service is complete.
     * @type {Integer (Int32)}
     */
    static MicrosoftSignInComplete => 2

    /**
     * A sign-in operation with the broadcast provider service is in progress.
     * @type {Integer (Int32)}
     */
    static OAuthSignInInProgress => 3

    /**
     * A sign-in operation with the broadcast provider service is complete.
     * @type {Integer (Int32)}
     */
    static OAuthSignInComplete => 4
}
