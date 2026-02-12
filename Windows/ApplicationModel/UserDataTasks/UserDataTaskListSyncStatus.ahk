#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the [UserDataTaskList](userdatatasklist.md) sync status.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatasklistsyncstatus
 * @namespace Windows.ApplicationModel.UserDataTasks
 * @version WindowsRuntime 1.4
 */
class UserDataTaskListSyncStatus extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Idle => 0

    /**
     * @type {Integer (Int32)}
     */
    static Syncing => 1

    /**
     * @type {Integer (Int32)}
     */
    static UpToDate => 2

    /**
     * @type {Integer (Int32)}
     */
    static AuthenticationError => 3

    /**
     * @type {Integer (Int32)}
     */
    static PolicyError => 4

    /**
     * @type {Integer (Int32)}
     */
    static UnknownError => 5
}
