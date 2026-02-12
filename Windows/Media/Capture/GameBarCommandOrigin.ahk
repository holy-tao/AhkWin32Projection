#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the origin of a Game Bar command.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.gamebarcommandorigin
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class GameBarCommandOrigin extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ShortcutKey => 0

    /**
     * @type {Integer (Int32)}
     */
    static Cortana => 1

    /**
     * @type {Integer (Int32)}
     */
    static AppCommand => 2
}
