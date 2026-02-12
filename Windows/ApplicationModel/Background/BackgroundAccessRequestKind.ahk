#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the level of background activity that an app can request.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundaccessrequestkind
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class BackgroundAccessRequestKind extends Win32Enum{

    /**
     * Allow the app run background activities, including during Battery Saver.
     * @type {Integer (Int32)}
     */
    static AlwaysAllowed => 0

    /**
     * Allow the app to run in the background, unless background activity has been limited by the user or by the system to improve battery life.
     * @type {Integer (Int32)}
     */
    static AllowedSubjectToSystemPolicy => 1
}
