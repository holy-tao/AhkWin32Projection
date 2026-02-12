#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the method in which lines of text scroll through the region.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextscrollmode
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class TimedTextScrollMode extends Win32Enum{

    /**
     * Text lines pop on to the region discretely.
     * @type {Integer (Int32)}
     */
    static Popon => 0

    /**
     * Text lines roll up onto the region.
     * @type {Integer (Int32)}
     */
    static Rollup => 1
}
