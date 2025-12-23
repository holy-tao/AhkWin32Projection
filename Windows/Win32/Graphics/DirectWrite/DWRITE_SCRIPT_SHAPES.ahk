#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates additional shaping requirements for text.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_script_shapes
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_SCRIPT_SHAPES extends Win32BitflagEnum{

    /**
     * Indicates that there is no additional shaping requirements for text. Text is shaped with the writing system default behavior.
     * @type {Integer (Int32)}
     */
    static DWRITE_SCRIPT_SHAPES_DEFAULT => 0

    /**
     * Indicates that text should leave no visible control or format control characters.
     * @type {Integer (Int32)}
     */
    static DWRITE_SCRIPT_SHAPES_NO_VISUAL => 1
}
