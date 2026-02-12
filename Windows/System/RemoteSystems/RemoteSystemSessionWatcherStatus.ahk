#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Contains values that describe the operational status of a remote session watcher object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionwatcherstatus
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemSessionWatcherStatus extends Win32Enum{

    /**
     * The watcher has been created but has not yet been started.
     * @type {Integer (Int32)}
     */
    static Created => 0

    /**
     * The watcher has started looking for remote sessions.
     * @type {Integer (Int32)}
     */
    static Started => 1

    /**
     * The initial enumeration of remote sessions has completed.
     * @type {Integer (Int32)}
     */
    static EnumerationCompleted => 2

    /**
     * The watcher is in the process of stopping.
     * @type {Integer (Int32)}
     */
    static Stopping => 3

    /**
     * The watcher has stopped looking for remote sessions.
     * @type {Integer (Int32)}
     */
    static Stopped => 4

    /**
     * The watching operation was aborted for an unknown reason.
     * @type {Integer (Int32)}
     */
    static Aborted => 5
}
