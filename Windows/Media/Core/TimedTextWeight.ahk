#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the weight of timed text.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextweight
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class TimedTextWeight extends Win32Enum{

    /**
     * The text is normal weight.
     * @type {Integer (Int32)}
     */
    static Normal => 400

    /**
     * The text is bold.
     * @type {Integer (Int32)}
     */
    static Bold => 700
}
