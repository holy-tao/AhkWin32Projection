#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Specifies the result of activating an application for a file.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.launchfilestatus
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class LaunchFileStatus extends Win32Enum{

    /**
     * The application activated successfully.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The application cannot be activated which may be because it is being updated by the store, it was installed on a removable device that is not available, and so on.
     * @type {Integer (Int32)}
     */
    static AppUnavailable => 1

    /**
     * The application cannot be activated for this file because files may not cross user boundaries.
     * @type {Integer (Int32)}
     */
    static DeniedByPolicy => 2

    /**
     * The application you are trying to activate does not support this file type.
     * @type {Integer (Int32)}
     */
    static FileTypeNotSupported => 3

    /**
     * An unknown error was encountered while activating the application.
     * @type {Integer (Int32)}
     */
    static Unknown => 4
}
