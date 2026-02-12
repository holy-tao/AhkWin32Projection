#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the position of a bouten mark in the block progression dimension with respect to its associated ruby base.
 * @remarks
 * Use a value from this enumeration when setting the [TimedTextBouten.Position](timedtextbouten_position.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextboutenposition
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class TimedTextBoutenPosition extends Win32Enum{

    /**
     * The bouten mark is after the associated ruby base.
     * @type {Integer (Int32)}
     */
    static Before => 0

    /**
     * The bouten mark is after the associated ruby base.
     * @type {Integer (Int32)}
     */
    static After => 1

    /**
     * The bouten mark is outside the associated ruby base.
     * @type {Integer (Int32)}
     */
    static Outside => 2
}
