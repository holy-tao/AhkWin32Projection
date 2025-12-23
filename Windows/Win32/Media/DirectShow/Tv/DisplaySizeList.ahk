#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * This topic applies to Windows XP or later.
 * @see https://learn.microsoft.com/windows/win32/api/msvidctl/ne-msvidctl-displaysizelist
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class DisplaySizeList extends Win32Enum{

    /**
     * Display the video rectangle at the native size.
     * @type {Integer (Int32)}
     */
    static dslDefaultSize => 0

    /**
     * Same as <b>dslDefaultSize</b>.
     * @type {Integer (Int32)}
     */
    static dslSourceSize => 0

    /**
     * Display the video rectangle by shrinking the width and height by half.
     * @type {Integer (Int32)}
     */
    static dslHalfSourceSize => 1

    /**
     * Display the video rectangle by stretching the width and height to twice their native size.
     * @type {Integer (Int32)}
     */
    static dslDoubleSourceSize => 2

    /**
     * Display the video rectangle by stretching the width and height to fill the entire screen as much as possible while maintaining the original aspect ratio.
     * @type {Integer (Int32)}
     */
    static dslFullScreen => 3

    /**
     * Display the video rectangle by stretching the width and height as much as possible to fill half (50%) of the screen while maintaining the original aspect ratio.
     * @type {Integer (Int32)}
     */
    static dslHalfScreen => 4

    /**
     * Display the video rectangle by stretching the width and height as much as possible to fill one quarter (25%) of the screen while maintaining the original aspect ratio.
     * @type {Integer (Int32)}
     */
    static dslQuarterScreen => 5

    /**
     * Display the video rectangle by stretching the width and height as much as possible to fill one sixteenth (6.25%) of the screen while maintaining the original aspect ratio.
     * @type {Integer (Int32)}
     */
    static dslSixteenthScreen => 6
}
