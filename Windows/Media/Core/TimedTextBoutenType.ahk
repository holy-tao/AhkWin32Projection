#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the type of bouten mark to be rendered in timed text.
 * @remarks
 * Use a value from this enumeration when setting the [TimedTextBouten.Type](timedtextbouten_type.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextboutentype
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class TimedTextBoutenType extends Win32Enum{

    /**
     * No bouten mark.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The bouten mark type is determined automatically.
     * @type {Integer (Int32)}
     */
    static Auto => 1

    /**
     * The bouten mark is a filled circle.
     * @type {Integer (Int32)}
     */
    static FilledCircle => 2

    /**
     * The bouten mark is an open circle.
     * @type {Integer (Int32)}
     */
    static OpenCircle => 3

    /**
     * The bouten mark is a filled dot.
     * @type {Integer (Int32)}
     */
    static FilledDot => 4

    /**
     * The bouten mark is an open dot.
     * @type {Integer (Int32)}
     */
    static OpenDot => 5

    /**
     * The bouten mark is a filled sesame.
     * @type {Integer (Int32)}
     */
    static FilledSesame => 6

    /**
     * The bouten mark is an open sesame.
     * @type {Integer (Int32)}
     */
    static OpenSesame => 7
}
