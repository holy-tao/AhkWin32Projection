#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Describes what kinds of changes were made to a user profile.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.userwatcherupdatekind
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class UserWatcherUpdateKind extends Win32Enum{

    /**
     * The user's properties have been changed.
     * @type {Integer (Int32)}
     */
    static Properties => 0

    /**
     * The user's picture has been changed.
     * @type {Integer (Int32)}
     */
    static Picture => 1
}
