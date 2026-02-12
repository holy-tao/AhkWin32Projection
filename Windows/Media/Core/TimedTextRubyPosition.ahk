#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the position of ruby text in the block progression dimension with respect to its associated ruby base.
 * @remarks
 * Use a value from this enumeration when setting the [TimedTextRuby.Position](timedtextruby_position.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextrubyposition
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class TimedTextRubyPosition extends Win32Enum{

    /**
     * The ruby text is before the associated ruby base.
     * @type {Integer (Int32)}
     */
    static Before => 0

    /**
     * The ruby text is after the associated ruby base.
     * @type {Integer (Int32)}
     */
    static After => 1

    /**
     * The ruby text is outside the associated ruby base.
     * @type {Integer (Int32)}
     */
    static Outside => 2
}
