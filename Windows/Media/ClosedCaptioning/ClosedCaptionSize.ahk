#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the size of closed caption text.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.closedcaptioning.closedcaptionsize
 * @namespace Windows.Media.ClosedCaptioning
 * @version WindowsRuntime 1.4
 */
class ClosedCaptionSize extends Win32Enum{

    /**
     * Default text size.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * 50% text size.
     * @type {Integer (Int32)}
     */
    static FiftyPercent => 1

    /**
     * 100% text size.
     * @type {Integer (Int32)}
     */
    static OneHundredPercent => 2

    /**
     * 150% text size.
     * @type {Integer (Int32)}
     */
    static OneHundredFiftyPercent => 3

    /**
     * 200% text size.
     * @type {Integer (Int32)}
     */
    static TwoHundredPercent => 4
}
