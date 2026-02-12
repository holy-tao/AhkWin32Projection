#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The character that is used to fill the space taken by a tab character.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.tableader
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class TabLeader extends Win32Enum{

    /**
     * Spaces are used. This is the default.
     * @type {Integer (Int32)}
     */
    static Spaces => 0

    /**
     * Dots are used.
     * @type {Integer (Int32)}
     */
    static Dots => 1

    /**
     * A dashed line is used.
     * @type {Integer (Int32)}
     */
    static Dashes => 2

    /**
     * A solid line is used.
     * @type {Integer (Int32)}
     */
    static Lines => 3

    /**
     * A thick line is used.
     * @type {Integer (Int32)}
     */
    static ThickLines => 4

    /**
     * An equal sign is used.
     * @type {Integer (Int32)}
     */
    static Equals => 5
}
