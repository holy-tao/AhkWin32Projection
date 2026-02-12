#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the alignment of a [TimedTextLine](timedtextline.md) relative to the [TimedTextRegion](timedtextregion.md) in which it is displayed.
 * @remarks
 * The visual direction in which the text is aligned for each value depends on the [TimedTextFlowDirection](timedtextflowdirection.md) value of the text.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextlinealignment
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class TimedTextLineAlignment extends Win32Enum{

    /**
     * The text line is aligned in the direction of the start of the text.
     * @type {Integer (Int32)}
     */
    static Start => 0

    /**
     * The text line is aligned in the direction of the end of the text.
     * @type {Integer (Int32)}
     */
    static End => 1

    /**
     * The text line is aligned in the center of the region.
     * @type {Integer (Int32)}
     */
    static Center => 2
}
