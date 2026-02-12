#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the style of closed caption text.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.closedcaptioning.closedcaptionstyle
 * @namespace Windows.Media.ClosedCaptioning
 * @version WindowsRuntime 1.4
 */
class ClosedCaptionStyle extends Win32Enum{

    /**
     * The default style.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Monospaced with serifs.
     * @type {Integer (Int32)}
     */
    static MonospacedWithSerifs => 1

    /**
     * Proportional with serifs.
     * @type {Integer (Int32)}
     */
    static ProportionalWithSerifs => 2

    /**
     * Monospaced without serifs
     * @type {Integer (Int32)}
     */
    static MonospacedWithoutSerifs => 3

    /**
     * Proportional without serifs.
     * @type {Integer (Int32)}
     */
    static ProportionalWithoutSerifs => 4

    /**
     * Casual.
     * @type {Integer (Int32)}
     */
    static Casual => 5

    /**
     * Cursive.
     * @type {Integer (Int32)}
     */
    static Cursive => 6

    /**
     * Small capitals.
     * @type {Integer (Int32)}
     */
    static SmallCapitals => 7
}
