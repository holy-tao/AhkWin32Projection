#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * **Deprecated.** Specifies the progress of a sign-in operation.
 * @remarks
 * > [!WARNING]
 * > This is a deprecated API.
 * 
 * The progress state values are expected to arrive in order (`Connecting` -> `Connected` -> `Authenticating` -> `SettingUpAccount` -> `Finalizing` -> `Completed`), but may skip states if [TryWaitForSignInWithProgressAsync](isolatedwindowsenvironmentuserinfo_trywaitforsigninwithprogressasync_50246521.md) is called while sign-in is already underway.
 * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentsigninprogress
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IsolatedWindowsEnvironmentSignInProgress extends Win32Enum{

    /**
     * Connecting to the Isolated Windows Environment.
     * @type {Integer (Int32)}
     */
    static Connecting => 0

    /**
     * Established connection to the Isolated Windows Environment.
     * @type {Integer (Int32)}
     */
    static Connected => 1

    /**
     * Signing in to the Isolated Windows Environment.
     * @type {Integer (Int32)}
     */
    static Authenticating => 2

    /**
     * Setting up user session in the Isolated Windows Environment.
     * @type {Integer (Int32)}
     */
    static SettingUpAccount => 3

    /**
     * Configuring user session settings in the Isolated Windows Environment.
     * @type {Integer (Int32)}
     */
    static Finalizing => 4

    /**
     * Sign-in to the Isolated Windows Environment is complete.
     * @type {Integer (Int32)}
     */
    static Completed => 5
}
