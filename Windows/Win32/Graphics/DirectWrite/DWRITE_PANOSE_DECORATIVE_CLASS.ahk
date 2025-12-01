#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DWRITE_PANOSE_DECORATIVE_CLASS enumeration contains values that specify the general look of the character face.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_panose_decorative_class
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_PANOSE_DECORATIVE_CLASS extends Win32Enum{

    /**
     * Any class of decorative typeface.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_DECORATIVE_CLASS_ANY => 0

    /**
     * No fit for decorative typeface.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_DECORATIVE_CLASS_NO_FIT => 1

    /**
     * Derivative decorative typeface.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_DECORATIVE_CLASS_DERIVATIVE => 2

    /**
     * Nonstandard topology decorative typeface.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_DECORATIVE_CLASS_NONSTANDARD_TOPOLOGY => 3

    /**
     * Nonstandard elements decorative typeface.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_DECORATIVE_CLASS_NONSTANDARD_ELEMENTS => 4

    /**
     * Nonstandard aspect decorative typeface.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_DECORATIVE_CLASS_NONSTANDARD_ASPECT => 5

    /**
     * Initials decorative typeface.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_DECORATIVE_CLASS_INITIALS => 6

    /**
     * Cartoon decorative typeface.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_DECORATIVE_CLASS_CARTOON => 7

    /**
     * Picture stems decorative typeface.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_DECORATIVE_CLASS_PICTURE_STEMS => 8

    /**
     * Ornamented decorative typeface.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_DECORATIVE_CLASS_ORNAMENTED => 9

    /**
     * Text and background decorative typeface.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_DECORATIVE_CLASS_TEXT_AND_BACKGROUND => 10

    /**
     * Collage decorative typeface.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_DECORATIVE_CLASS_COLLAGE => 11

    /**
     * Montage decorative typeface.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_DECORATIVE_CLASS_MONTAGE => 12
}
