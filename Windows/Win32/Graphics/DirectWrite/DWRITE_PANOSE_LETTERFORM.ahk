#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DWRITE_PANOSE_LETTERFORM enumeration contains values that specify the roundness of letterform for text.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_panose_letterform
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_PANOSE_LETTERFORM extends Win32Enum {

    /**
     * Any letterform.
     * Native name: DWRITE_PANOSE_LETTERFORM_ANY
     * @type {Integer (Int32)}
     */
    static ANY => 0

    /**
     * No fit letterform.
     * Native name: DWRITE_PANOSE_LETTERFORM_NO_FIT
     * @type {Integer (Int32)}
     */
    static NO_FIT => 1

    /**
     * Normal contact letterform.
     * Native name: DWRITE_PANOSE_LETTERFORM_NORMAL_CONTACT
     * @type {Integer (Int32)}
     */
    static NORMAL_CONTACT => 2

    /**
     * Normal weighted letterform.
     * Native name: DWRITE_PANOSE_LETTERFORM_NORMAL_WEIGHTED
     * @type {Integer (Int32)}
     */
    static NORMAL_WEIGHTED => 3

    /**
     * Normal boxed letterform.
     * Native name: DWRITE_PANOSE_LETTERFORM_NORMAL_BOXED
     * @type {Integer (Int32)}
     */
    static NORMAL_BOXED => 4

    /**
     * Normal flattened letterform.
     * Native name: DWRITE_PANOSE_LETTERFORM_NORMAL_FLATTENED
     * @type {Integer (Int32)}
     */
    static NORMAL_FLATTENED => 5

    /**
     * Normal rounded letterform.
     * Native name: DWRITE_PANOSE_LETTERFORM_NORMAL_ROUNDED
     * @type {Integer (Int32)}
     */
    static NORMAL_ROUNDED => 6

    /**
     * Normal off-center letterform.
     * Native name: DWRITE_PANOSE_LETTERFORM_NORMAL_OFF_CENTER
     * @type {Integer (Int32)}
     */
    static NORMAL_OFF_CENTER => 7

    /**
     * Normal square letterform.
     * Native name: DWRITE_PANOSE_LETTERFORM_NORMAL_SQUARE
     * @type {Integer (Int32)}
     */
    static NORMAL_SQUARE => 8

    /**
     * Oblique contact letterform.
     * Native name: DWRITE_PANOSE_LETTERFORM_OBLIQUE_CONTACT
     * @type {Integer (Int32)}
     */
    static OBLIQUE_CONTACT => 9

    /**
     * Oblique weighted letterform.
     * Native name: DWRITE_PANOSE_LETTERFORM_OBLIQUE_WEIGHTED
     * @type {Integer (Int32)}
     */
    static OBLIQUE_WEIGHTED => 10

    /**
     * Oblique boxed letterform.
     * Native name: DWRITE_PANOSE_LETTERFORM_OBLIQUE_BOXED
     * @type {Integer (Int32)}
     */
    static OBLIQUE_BOXED => 11

    /**
     * Oblique flattened letterform.
     * Native name: DWRITE_PANOSE_LETTERFORM_OBLIQUE_FLATTENED
     * @type {Integer (Int32)}
     */
    static OBLIQUE_FLATTENED => 12

    /**
     * Oblique rounded letterform.
     * Native name: DWRITE_PANOSE_LETTERFORM_OBLIQUE_ROUNDED
     * @type {Integer (Int32)}
     */
    static OBLIQUE_ROUNDED => 13

    /**
     * Oblique off-center letterform.
     * Native name: DWRITE_PANOSE_LETTERFORM_OBLIQUE_OFF_CENTER
     * @type {Integer (Int32)}
     */
    static OBLIQUE_OFF_CENTER => 14

    /**
     * Oblique square letterform.
     * Native name: DWRITE_PANOSE_LETTERFORM_OBLIQUE_SQUARE
     * @type {Integer (Int32)}
     */
    static OBLIQUE_SQUARE => 15
}
