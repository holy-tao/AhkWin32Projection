#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the direction timed text is written.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextwritingmode
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class TimedTextWritingMode extends Win32Enum{

    /**
     * Text is written from left to right within a line. Lines are written top to bottom.
     * @type {Integer (Int32)}
     */
    static LeftRightTopBottom => 0

    /**
     * Text is written from right to left within a line. Lines are written top to bottom.
     * @type {Integer (Int32)}
     */
    static RightLeftTopBottom => 1

    /**
     * Text is written from top to bottom within a line. Lines are written right to left.
     * @type {Integer (Int32)}
     */
    static TopBottomRightLeft => 2

    /**
     * Text is written from top to bottom within a line. Lines are written left to right.
     * @type {Integer (Int32)}
     */
    static TopBottomLeftRight => 3

    /**
     * Text is written from left to right within a line. Lines are written top to bottom.
     * @type {Integer (Int32)}
     */
    static LeftRight => 4

    /**
     * Text is written from right to left within a line. Lines are written top to bottom.
     * @type {Integer (Int32)}
     */
    static RightLeft => 5

    /**
     * Text is written from top to bottom within a line. Lines are written left to right.
     * @type {Integer (Int32)}
     */
    static TopBottom => 6
}
