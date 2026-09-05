#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The optical margin alignment mode.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/ne-dwrite_2-dwrite_optical_alignment
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_OPTICAL_ALIGNMENT extends Win32Enum {

    /**
     * Align to the default origin and side-bearings of the glyph.
     * Native name: DWRITE_OPTICAL_ALIGNMENT_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Align to the ink of the glyphs, such that the black box abuts the margins.
     * Native name: DWRITE_OPTICAL_ALIGNMENT_NO_SIDE_BEARINGS
     * @type {Integer (Int32)}
     */
    static NO_SIDE_BEARINGS => 1
}
