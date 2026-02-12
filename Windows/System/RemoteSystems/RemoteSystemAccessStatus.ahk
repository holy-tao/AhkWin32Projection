#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Contains the values that describe an app's access to use the **Remote Systems** feature.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemaccessstatus
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemAccessStatus extends Win32Enum{

    /**
     * Access is denied for an unknown reason.
     * @type {Integer (Int32)}
     */
    static Unspecified => 0

    /**
     * Access is allowed
     * @type {Integer (Int32)}
     */
    static Allowed => 1

    /**
     * Access has been denied to this particular app by this particular user.
     * @type {Integer (Int32)}
     */
    static DeniedByUser => 2

    /**
     * Access is denied to this app by the System; the app hasn't requested the proper capability.
     * @type {Integer (Int32)}
     */
    static DeniedBySystem => 3
}
