#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the opacity of closed caption text.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.closedcaptioning.closedcaptionopacity
 * @namespace Windows.Media.ClosedCaptioning
 * @version WindowsRuntime 1.4
 */
class ClosedCaptionOpacity extends Win32Enum{

    /**
     * Default opacity.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * 100% opaque.
     * @type {Integer (Int32)}
     */
    static OneHundredPercent => 1

    /**
     * 75% opaque.
     * @type {Integer (Int32)}
     */
    static SeventyFivePercent => 2

    /**
     * 25% opaque.
     * @type {Integer (Int32)}
     */
    static TwentyFivePercent => 3

    /**
     * Completely transparent.
     * @type {Integer (Int32)}
     */
    static ZeroPercent => 4
}
