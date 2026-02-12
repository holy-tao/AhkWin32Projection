#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Provides context on if a [GameListEntry](gamelistentry.md) has been confirmed to be a game by either the user or the system.
 * @remarks
 * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.gamelistcategory
 * @namespace Windows.Gaming.Preview.GamesEnumeration
 * @version WindowsRuntime 1.4
 */
class GameListCategory extends Win32Enum{

    /**
     * The Candidate constant.
     * @type {Integer (Int32)}
     */
    static Candidate => 0

    /**
     * The ConfirmedBySystem constant.
     * @type {Integer (Int32)}
     */
    static ConfirmedBySystem => 1

    /**
     * The ConfirmedByUser constant.
     * @type {Integer (Int32)}
     */
    static ConfirmedByUser => 2
}
