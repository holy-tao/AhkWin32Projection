#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DWRITE_PANOSE_DECORATIVE_CLASS enumeration contains values that specify the general look of the character face.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_panose_decorative_class
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_PANOSE_DECORATIVE_CLASS extends Win32Enum {

    /**
     * Any class of decorative typeface.
     * Native name: DWRITE_PANOSE_DECORATIVE_CLASS_ANY
     * @type {Integer (Int32)}
     */
    static ANY => 0

    /**
     * No fit for decorative typeface.
     * Native name: DWRITE_PANOSE_DECORATIVE_CLASS_NO_FIT
     * @type {Integer (Int32)}
     */
    static NO_FIT => 1

    /**
     * Derivative decorative typeface.
     * Native name: DWRITE_PANOSE_DECORATIVE_CLASS_DERIVATIVE
     * @type {Integer (Int32)}
     */
    static DERIVATIVE => 2

    /**
     * Nonstandard topology decorative typeface.
     * Native name: DWRITE_PANOSE_DECORATIVE_CLASS_NONSTANDARD_TOPOLOGY
     * @type {Integer (Int32)}
     */
    static NONSTANDARD_TOPOLOGY => 3

    /**
     * Nonstandard elements decorative typeface.
     * Native name: DWRITE_PANOSE_DECORATIVE_CLASS_NONSTANDARD_ELEMENTS
     * @type {Integer (Int32)}
     */
    static NONSTANDARD_ELEMENTS => 4

    /**
     * Nonstandard aspect decorative typeface.
     * Native name: DWRITE_PANOSE_DECORATIVE_CLASS_NONSTANDARD_ASPECT
     * @type {Integer (Int32)}
     */
    static NONSTANDARD_ASPECT => 5

    /**
     * Initials decorative typeface.
     * Native name: DWRITE_PANOSE_DECORATIVE_CLASS_INITIALS
     * @type {Integer (Int32)}
     */
    static INITIALS => 6

    /**
     * Cartoon decorative typeface.
     * Native name: DWRITE_PANOSE_DECORATIVE_CLASS_CARTOON
     * @type {Integer (Int32)}
     */
    static CARTOON => 7

    /**
     * Picture stems decorative typeface.
     * Native name: DWRITE_PANOSE_DECORATIVE_CLASS_PICTURE_STEMS
     * @type {Integer (Int32)}
     */
    static PICTURE_STEMS => 8

    /**
     * Ornamented decorative typeface.
     * Native name: DWRITE_PANOSE_DECORATIVE_CLASS_ORNAMENTED
     * @type {Integer (Int32)}
     */
    static ORNAMENTED => 9

    /**
     * Text and background decorative typeface.
     * Native name: DWRITE_PANOSE_DECORATIVE_CLASS_TEXT_AND_BACKGROUND
     * @type {Integer (Int32)}
     */
    static TEXT_AND_BACKGROUND => 10

    /**
     * Collage decorative typeface.
     * Native name: DWRITE_PANOSE_DECORATIVE_CLASS_COLLAGE
     * @type {Integer (Int32)}
     */
    static COLLAGE => 11

    /**
     * Montage decorative typeface.
     * Native name: DWRITE_PANOSE_DECORATIVE_CLASS_MONTAGE
     * @type {Integer (Int32)}
     */
    static MONTAGE => 12
}
