#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Contains values that describe a watcher error, which may stop discovery.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemwatchererror
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemWatcherError extends Win32Enum{

    /**
     * Discovery stopped for an unknown reason.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Discovery of cloud remote systems failed because Internet connection was lost or is unavailable.
     * @type {Integer (Int32)}
     */
    static InternetNotAvailable => 1

    /**
     * Discovery of cloud remote systems for a web account failed because authentication of that web account failed.
     * @type {Integer (Int32)}
     */
    static AuthenticationError => 2
}
