#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Enumeration that describes the current state of system updates.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdatemanagerstate
 * @namespace Windows.System.Update
 * @version WindowsRuntime 1.4
 */
class SystemUpdateManagerState extends Win32Enum{

    /**
     * The SystemUpdateManager is idle.
     * @type {Integer (Int32)}
     */
    static Idle => 0

    /**
     * Update manager is checking for available updates.
     * @type {Integer (Int32)}
     */
    static Detecting => 1

    /**
     * System updates are ready to download.
     * @type {Integer (Int32)}
     */
    static ReadyToDownload => 2

    /**
     * System updates are downloading.
     * @type {Integer (Int32)}
     */
    static Downloading => 3

    /**
     * System updates are ready to install.
     * @type {Integer (Int32)}
     */
    static ReadyToInstall => 4

    /**
     * System updates are installing.
     * @type {Integer (Int32)}
     */
    static Installing => 5

    /**
     * A reboot is required to complete the install.
     * @type {Integer (Int32)}
     */
    static RebootRequired => 6

    /**
     * System updates are ready to finalize.
     * @type {Integer (Int32)}
     */
    static ReadyToFinalize => 7

    /**
     * System updates are finalizing.
     * @type {Integer (Int32)}
     */
    static Finalizing => 8

    /**
     * Update process has been completed.
     * @type {Integer (Int32)}
     */
    static Completed => 9

    /**
     * Update process cannot continue without user input.
     * @type {Integer (Int32)}
     */
    static AttentionRequired => 10

    /**
     * An error has occurred. Check [ExtendedError](systemupdatemanager_extendederror.md).
     * @type {Integer (Int32)}
     */
    static Error => 11
}
