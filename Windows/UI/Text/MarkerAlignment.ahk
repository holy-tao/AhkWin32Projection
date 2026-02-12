#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines bullet and numbering alignment.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.markeralignment
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class MarkerAlignment extends Win32Enum{

    /**
     * The value is undefined.
     * @type {Integer (Int32)}
     */
    static Undefined => 0

    /**
     * Text is left aligned.
     * @type {Integer (Int32)}
     */
    static Left => 1

    /**
     * Text is centered in the line.
     * @type {Integer (Int32)}
     */
    static Center => 2

    /**
     * Text is right aligned.
     * @type {Integer (Int32)}
     */
    static Right => 3
}
