#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the result of a sign-in operation.
  * 
  * > [!NOTE]
  * > This API requires the **appBroadcast** and **appBroadcastSettings** capability which is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime.
 * @remarks
 * Get the result of a sign-in operation by handling the [AppBroadcastBackgroundServiceSignInInfo.SignInStateChanged](appbroadcastbackgroundservicesignininfo_signinstatechanged.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastsigninresult
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppBroadcastSignInResult extends Win32Enum{

    /**
     * The sign-in was successful.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The sign-in authentication failed.
     * @type {Integer (Int32)}
     */
    static AuthenticationFailed => 1

    /**
     * The authenticated user does not have permission to access to the requested resource.
     * @type {Integer (Int32)}
     */
    static Unauthorized => 2

    /**
     * The sign-in service is unavailable.
     * @type {Integer (Int32)}
     */
    static ServiceUnavailable => 3

    /**
     * The sign-in result is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 4
}
