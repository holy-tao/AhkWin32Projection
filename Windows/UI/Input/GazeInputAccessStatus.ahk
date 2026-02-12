#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the permission state for tracking the user's gaze.
 * @remarks
 * Due to the potentially sensitive personal data collected by eye tracking devices, you are required to declare the 'gazeInput' capability in the app manifest of your UWP application. When declared, Windows automatically prompts users with a consent dialog (when the app is first run), where the user must grant permission for the app to communicate with the eye-tracking device and access this data.
 * 
 * In addition, if your app collects, stores, or transfers eye tracking data, you must describe this in your app's privacy statement and follow all other requirements for **Personal Information** in the [App Developer Agreement](/legal/windows/agreements/app-developer-agreement) and the [Microsoft Store Policies](/windows/apps/publish/store-policies).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.gazeinputaccessstatus
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class GazeInputAccessStatus extends Win32Enum{

    /**
     * The user has not specified whether the app can track their gaze.
     * @type {Integer (Int32)}
     */
    static Unspecified => 0

    /**
     * The user has given permission for the app to to track their gaze.
     * @type {Integer (Int32)}
     */
    static Allowed => 1

    /**
     * The user has denied permission for the app to track their gaze.
     * @type {Integer (Int32)}
     */
    static DeniedByUser => 2

    /**
     * The system has denied permission for the app to track the user's gaze.
     * @type {Integer (Int32)}
     */
    static DeniedBySystem => 3
}
