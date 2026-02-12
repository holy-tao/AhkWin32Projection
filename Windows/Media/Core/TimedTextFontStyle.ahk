#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the font styles that can be used for the display timed text.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextfontstyle
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class TimedTextFontStyle extends Win32Enum{

    /**
     * The timed text uses normal font style.
     * @type {Integer (Int32)}
     */
    static Normal => 0

    /**
     * The timed text uses oblique font style.
     * @type {Integer (Int32)}
     */
    static Oblique => 1

    /**
     * The timed text uses italic font style.
     * @type {Integer (Int32)}
     */
    static Italic => 2
}
