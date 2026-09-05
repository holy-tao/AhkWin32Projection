#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DWRITE_PANOSE_LINING enumeration contains values that specify the handling of the outline for the decorative typeface.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_panose_lining
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_PANOSE_LINING extends Win32Enum {

    /**
     * Any lining.
     * Native name: DWRITE_PANOSE_LINING_ANY
     * @type {Integer (Int32)}
     */
    static ANY => 0

    /**
     * No fit for lining.
     * Native name: DWRITE_PANOSE_LINING_NO_FIT
     * @type {Integer (Int32)}
     */
    static NO_FIT => 1

    /**
     * No lining.
     * Native name: DWRITE_PANOSE_LINING_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 2

    /**
     * The lining is inline.
     * Native name: DWRITE_PANOSE_LINING_INLINE
     * @type {Integer (Int32)}
     */
    static INLINE => 3

    /**
     * The lining is outline.
     * Native name: DWRITE_PANOSE_LINING_OUTLINE
     * @type {Integer (Int32)}
     */
    static OUTLINE => 4

    /**
     * The lining is engraved.
     * Native name: DWRITE_PANOSE_LINING_ENGRAVED
     * @type {Integer (Int32)}
     */
    static ENGRAVED => 5

    /**
     * The lining is shadowed.
     * Native name: DWRITE_PANOSE_LINING_SHADOW
     * @type {Integer (Int32)}
     */
    static SHADOW => 6

    /**
     * The lining is relief.
     * Native name: DWRITE_PANOSE_LINING_RELIEF
     * @type {Integer (Int32)}
     */
    static RELIEF => 7

    /**
     * The lining is backdrop.
     * Native name: DWRITE_PANOSE_LINING_BACKDROP
     * @type {Integer (Int32)}
     */
    static BACKDROP => 8
}
