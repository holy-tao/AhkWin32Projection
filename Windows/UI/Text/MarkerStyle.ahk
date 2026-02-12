#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the style used to mark the item paragraphs in a list.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.markerstyle
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class MarkerStyle extends Win32Enum{

    /**
     * The marker style is not defined.
     * @type {Integer (Int32)}
     */
    static Undefined => 0

    /**
     * The item marker is followed by a parenthesis, as in 1).
     * @type {Integer (Int32)}
     */
    static Parenthesis => 1

    /**
     * The item marker is enclosed in parentheses, as in (1).
     * @type {Integer (Int32)}
     */
    static Parentheses => 2

    /**
     * The item marker is followed by a period.
     * @type {Integer (Int32)}
     */
    static Period => 3

    /**
     * The item marker appears by itself.
     * @type {Integer (Int32)}
     */
    static Plain => 4

    /**
     * The item marker is followed by a hyphen (-).
     * @type {Integer (Int32)}
     */
    static Minus => 5

    /**
     * The items have no markers.
     * @type {Integer (Int32)}
     */
    static NoNumber => 6
}
