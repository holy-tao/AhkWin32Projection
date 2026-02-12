#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Represents the state (enabled, disabled, or disabled by user) of a startup task.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.startuptaskstate
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class StartupTaskState extends Win32Enum{

    /**
     * The task is disabled.
     * @type {Integer (Int32)}
     */
    static Disabled => 0

    /**
     * The task was disabled by the user. It can only be re-enabled by the user.
     * @type {Integer (Int32)}
     */
    static DisabledByUser => 1

    /**
     * The task is enabled.
     * @type {Integer (Int32)}
     */
    static Enabled => 2

    /**
     * The task is disabled by the administrator or group policy. Platforms that don't support startup tasks also report **DisabledByPolicy**.
     * @type {Integer (Int32)}
     */
    static DisabledByPolicy => 3

    /**
     * The task is enabled by the administrator or group policy.
     * @type {Integer (Int32)}
     */
    static EnabledByPolicy => 4
}
