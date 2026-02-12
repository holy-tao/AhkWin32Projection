#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Provides the context in which the [GameListEntry](gamelistentry.md) launch parameters were specified.
 * @remarks
 * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.gamelistentrylaunchablestate
 * @namespace Windows.Gaming.Preview.GamesEnumeration
 * @version WindowsRuntime 1.4
 */
class GameListEntryLaunchableState extends Win32Enum{

    /**
     * [GameListEntry](gamelistentry.md) is not launchable. [GameListEntry](gamelistentry.md) doesn’t have a full path to the binary.
     * @type {Integer (Int32)}
     */
    static NotLaunchable => 0

    /**
     * The system has determined the running path based on the path of the last time the game was run. The caller may want to confirm running location with the user.
     * @type {Integer (Int32)}
     */
    static ByLastRunningFullPath => 1

    /**
     * A user has provided the launch path. The caller may want to allow an edit button incase it was entered incorrectly.
     * @type {Integer (Int32)}
     */
    static ByUserProvidedPath => 2

    /**
     * The user is not allowed to override the launch path. This will cause the SetLauncherExectuableFileAsync to return an error.
     * @type {Integer (Int32)}
     */
    static ByTile => 3
}
