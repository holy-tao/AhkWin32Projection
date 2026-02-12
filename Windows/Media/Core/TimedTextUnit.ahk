#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the units in which timed a timed text style value is expressed.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextunit
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class TimedTextUnit extends Win32Enum{

    /**
     * The style value is expressed in pixels.
     * @type {Integer (Int32)}
     */
    static Pixels => 0

    /**
     * The style value is expressed as a percentage.
     * @type {Integer (Int32)}
     */
    static Percentage => 1
}
