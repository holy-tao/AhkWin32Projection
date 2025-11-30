#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DWRITE_PANOSE_LETTERFORM enumeration contains values that specify the roundness of letterform for text.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/ne-dwrite_1-dwrite_panose_letterform
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_PANOSE_LETTERFORM extends Win32Enum{

    /**
     * Any letterform.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_LETTERFORM_ANY => 0

    /**
     * No fit letterform.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_LETTERFORM_NO_FIT => 1

    /**
     * Normal contact letterform.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_LETTERFORM_NORMAL_CONTACT => 2

    /**
     * Normal weighted letterform.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_LETTERFORM_NORMAL_WEIGHTED => 3

    /**
     * Normal boxed letterform.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_LETTERFORM_NORMAL_BOXED => 4

    /**
     * Normal flattened letterform.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_LETTERFORM_NORMAL_FLATTENED => 5

    /**
     * Normal rounded letterform.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_LETTERFORM_NORMAL_ROUNDED => 6

    /**
     * Normal off-center letterform.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_LETTERFORM_NORMAL_OFF_CENTER => 7

    /**
     * Normal square letterform.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_LETTERFORM_NORMAL_SQUARE => 8

    /**
     * Oblique contact letterform.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_LETTERFORM_OBLIQUE_CONTACT => 9

    /**
     * Oblique weighted letterform.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_LETTERFORM_OBLIQUE_WEIGHTED => 10

    /**
     * Oblique boxed letterform.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_LETTERFORM_OBLIQUE_BOXED => 11

    /**
     * Oblique flattened letterform.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_LETTERFORM_OBLIQUE_FLATTENED => 12

    /**
     * Oblique rounded letterform.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_LETTERFORM_OBLIQUE_ROUNDED => 13

    /**
     * Oblique off-center letterform.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_LETTERFORM_OBLIQUE_OFF_CENTER => 14

    /**
     * Oblique square letterform.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_LETTERFORM_OBLIQUE_SQUARE => 15
}
