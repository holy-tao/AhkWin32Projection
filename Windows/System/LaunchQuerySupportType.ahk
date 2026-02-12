#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Specifies the type of activation to query for.
 * @remarks
 * The default launch type is **Uri**.
 * @see https://learn.microsoft.com/uwp/api/windows.system.launchquerysupporttype
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class LaunchQuerySupportType extends Win32Enum{

    /**
     * Activate by URI but do not return a result to the calling app. This is the default.
     * @type {Integer (Int32)}
     */
    static Uri => 0

    /**
     * Activate by URI and return a result to the calling app.
     * @type {Integer (Int32)}
     */
    static UriForResults => 1
}
