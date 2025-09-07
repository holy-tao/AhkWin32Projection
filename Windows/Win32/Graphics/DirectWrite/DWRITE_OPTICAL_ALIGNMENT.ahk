#Requires AutoHotkey v2.0.0 64-bit

/**
 * The optical margin alignment mode.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/ne-dwrite_2-dwrite_optical_alignment
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_OPTICAL_ALIGNMENT{

    /**
     * Align to the default origin and side-bearings of the glyph.
     * @type {Integer (Int32)}
     */
    static DWRITE_OPTICAL_ALIGNMENT_NONE => 0

    /**
     * Align to the ink of the glyphs, such that the black box abuts the margins.
     * @type {Integer (Int32)}
     */
    static DWRITE_OPTICAL_ALIGNMENT_NO_SIDE_BEARINGS => 1
}
