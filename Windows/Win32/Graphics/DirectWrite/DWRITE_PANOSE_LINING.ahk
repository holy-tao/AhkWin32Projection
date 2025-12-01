#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DWRITE_PANOSE_LINING enumeration contains values that specify the handling of the outline for the decorative typeface.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_panose_lining
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_PANOSE_LINING extends Win32Enum{

    /**
     * Any lining.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_LINING_ANY => 0

    /**
     * No fit for lining.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_LINING_NO_FIT => 1

    /**
     * No lining.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_LINING_NONE => 2

    /**
     * The lining is inline.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_LINING_INLINE => 3

    /**
     * The lining is outline.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_LINING_OUTLINE => 4

    /**
     * The lining is engraved.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_LINING_ENGRAVED => 5

    /**
     * The lining is shadowed.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_LINING_SHADOW => 6

    /**
     * The lining is relief.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_LINING_RELIEF => 7

    /**
     * The lining is backdrop.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_LINING_BACKDROP => 8
}
