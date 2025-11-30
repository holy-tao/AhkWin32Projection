#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DWRITE_PANOSE_SPACING enumeration contains values that specify character spacing (monospace versus proportional).
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/ne-dwrite_1-dwrite_panose_spacing
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_PANOSE_SPACING extends Win32Enum{

    /**
     * Any spacing.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SPACING_ANY => 0

    /**
     * No fit for spacing.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SPACING_NO_FIT => 1

    /**
     * Spacing is proportional.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SPACING_PROPORTIONAL_SPACED => 2

    /**
     * Spacing is monospace.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SPACING_MONOSPACED => 3
}
