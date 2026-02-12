#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the alignment of a [TimedTextRegion](timedtextregion.md) relative to the video frame.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextdisplayalignment
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class TimedTextDisplayAlignment extends Win32Enum{

    /**
     * The text region is aligned in the direction of the start of the text.
     * @type {Integer (Int32)}
     */
    static Before => 0

    /**
     * The text region is aligned in the direction of the end of the text.
     * @type {Integer (Int32)}
     */
    static After => 1

    /**
     * The text region is aligned in the center.
     * @type {Integer (Int32)}
     */
    static Center => 2
}
