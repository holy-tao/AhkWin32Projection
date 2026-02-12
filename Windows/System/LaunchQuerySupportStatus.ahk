#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Specifies whether an app is available that supports activation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.launchquerysupportstatus
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class LaunchQuerySupportStatus extends Win32Enum{

    /**
     * An app that handles the activation is available and may be activated.
     * @type {Integer (Int32)}
     */
    static Available => 0

    /**
     * No app is installed to handle the activation.
     * @type {Integer (Int32)}
     */
    static AppNotInstalled => 1

    /**
     * An app that handles the activation is installed but not available because it is being updated by the store or it was installed on a removable device that is not available.
     * @type {Integer (Int32)}
     */
    static AppUnavailable => 2

    /**
     * The app does not handle the activation.
     * @type {Integer (Int32)}
     */
    static NotSupported => 3

    /**
     * An unknown error was encountered while determining whether an app supports the activation.
     * @type {Integer (Int32)}
     */
    static Unknown => 4
}
