#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Defines the status values that are returned from a call to [AppDiagnosticInfoWatcher.Status](appdiagnosticinfowatcher_status.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.appdiagnosticinfowatcherstatus
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class AppDiagnosticInfoWatcherStatus extends Win32Enum{

    /**
     * The **AppDiagnosticInfoWatcher** has been created.
     * @type {Integer (Int32)}
     */
    static Created => 0

    /**
     * The **AppDiagnosticInfoWatcher** has started.
     * @type {Integer (Int32)}
     */
    static Started => 1

    /**
     * The **AppDiagnosticInfoWatcher** has finished enumerating running apps.
     * @type {Integer (Int32)}
     */
    static EnumerationCompleted => 2

    /**
     * The **AppDiagnosticInfoWatcher** is stopping.
     * @type {Integer (Int32)}
     */
    static Stopping => 3

    /**
     * The **AppDiagnosticInfoWatcher** has stopped.
     * @type {Integer (Int32)}
     */
    static Stopped => 4

    /**
     * The **AppDiagnosticInfoWatcher** was aborted.
     * @type {Integer (Int32)}
     */
    static Aborted => 5
}
