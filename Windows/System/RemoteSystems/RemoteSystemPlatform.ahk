#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Contains values that describe the operating system platforms that a remote system could be running.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemplatform
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemPlatform extends Win32Enum{

    /**
     * The OS platform is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The device is running Windows.
     * @type {Integer (Int32)}
     */
    static Windows => 1

    /**
     * The device is running Android.
     * @type {Integer (Int32)}
     */
    static Android => 2

    /**
     * The device is running iOS.
     * @type {Integer (Int32)}
     */
    static Ios => 3

    /**
     * The device is running Linux.
     * @type {Integer (Int32)}
     */
    static Linux => 4
}
