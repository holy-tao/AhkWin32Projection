#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DWRITE_PANOSE_SPACING enumeration contains values that specify character spacing (monospace versus proportional).
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_panose_spacing
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_PANOSE_SPACING extends Win32Enum {

    /**
     * Any spacing.
     * Native name: DWRITE_PANOSE_SPACING_ANY
     * @type {Integer (Int32)}
     */
    static ANY => 0

    /**
     * No fit for spacing.
     * Native name: DWRITE_PANOSE_SPACING_NO_FIT
     * @type {Integer (Int32)}
     */
    static NO_FIT => 1

    /**
     * Spacing is proportional.
     * Native name: DWRITE_PANOSE_SPACING_PROPORTIONAL_SPACED
     * @type {Integer (Int32)}
     */
    static PROPORTIONAL_SPACED => 2

    /**
     * Spacing is monospace.
     * Native name: DWRITE_PANOSE_SPACING_MONOSPACED
     * @type {Integer (Int32)}
     */
    static MONOSPACED => 3
}
