#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the reasons why an app could fail a request to restart.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.apprestartfailurereason
 * @namespace Windows.ApplicationModel.Core
 * @version WindowsRuntime 1.4
 */
class AppRestartFailureReason extends Win32Enum{

    /**
     * A restart is already in progress.
     * @type {Integer (Int32)}
     */
    static RestartPending => 0

    /**
     * An app must be visible and in the foreground when it calls the restart API.
     * @type {Integer (Int32)}
     */
    static NotInForeground => 1

    /**
     * Could not restart for the specified user.
     * @type {Integer (Int32)}
     */
    static InvalidUser => 2

    /**
     * Unspecified failure.
     * @type {Integer (Int32)}
     */
    static Other => 3
}
