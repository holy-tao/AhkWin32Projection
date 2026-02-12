#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the direction timed text is flowed.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextflowdirection
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class TimedTextFlowDirection extends Win32Enum{

    /**
     * Text is flowed left to right.
     * @type {Integer (Int32)}
     */
    static LeftToRight => 0

    /**
     * Text is flowed right to left.
     * @type {Integer (Int32)}
     */
    static RightToLeft => 1
}
