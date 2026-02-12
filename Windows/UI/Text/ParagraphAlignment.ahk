#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies values for aligning paragraphs.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.paragraphalignment
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class ParagraphAlignment extends Win32Enum{

    /**
     * No paragraph alignment is defined.
     * @type {Integer (Int32)}
     */
    static Undefined => 0

    /**
     * Text aligns with the left margin.
     * @type {Integer (Int32)}
     */
    static Left => 1

    /**
     * Text is centered between the margins.
     * @type {Integer (Int32)}
     */
    static Center => 2

    /**
     * Text aligns with the right margin.
     * @type {Integer (Int32)}
     */
    static Right => 3

    /**
     * Text is equally distributed between the margins so that each line of the paragraph, other than the last, is identical in length.
     * @type {Integer (Int32)}
     */
    static Justify => 4
}
