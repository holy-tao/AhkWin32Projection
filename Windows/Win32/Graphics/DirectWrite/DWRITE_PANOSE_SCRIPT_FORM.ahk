#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DWRITE_PANOSE_SCRIPT_FORM enumeration contains values that specify the general look of the character face, with consideration of its slope and tails.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_panose_script_form
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_PANOSE_SCRIPT_FORM extends Win32Enum {

    /**
     * Any script form.
     * Native name: DWRITE_PANOSE_SCRIPT_FORM_ANY
     * @type {Integer (Int32)}
     */
    static ANY => 0

    /**
     * No fit for script form.
     * Native name: DWRITE_PANOSE_SCRIPT_FORM_NO_FIT
     * @type {Integer (Int32)}
     */
    static NO_FIT => 1

    /**
     * Script form is upright with no wrapping.
     * Native name: DWRITE_PANOSE_SCRIPT_FORM_UPRIGHT_NO_WRAPPING
     * @type {Integer (Int32)}
     */
    static UPRIGHT_NO_WRAPPING => 2

    /**
     * Script form is upright with some wrapping.
     * Native name: DWRITE_PANOSE_SCRIPT_FORM_UPRIGHT_SOME_WRAPPING
     * @type {Integer (Int32)}
     */
    static UPRIGHT_SOME_WRAPPING => 3

    /**
     * Script form is upright with more wrapping.
     * Native name: DWRITE_PANOSE_SCRIPT_FORM_UPRIGHT_MORE_WRAPPING
     * @type {Integer (Int32)}
     */
    static UPRIGHT_MORE_WRAPPING => 4

    /**
     * Script form is upright with extreme wrapping.
     * Native name: DWRITE_PANOSE_SCRIPT_FORM_UPRIGHT_EXTREME_WRAPPING
     * @type {Integer (Int32)}
     */
    static UPRIGHT_EXTREME_WRAPPING => 5

    /**
     * Script form is oblique with no wrapping.
     * Native name: DWRITE_PANOSE_SCRIPT_FORM_OBLIQUE_NO_WRAPPING
     * @type {Integer (Int32)}
     */
    static OBLIQUE_NO_WRAPPING => 6

    /**
     * Script form is oblique with some wrapping.
     * Native name: DWRITE_PANOSE_SCRIPT_FORM_OBLIQUE_SOME_WRAPPING
     * @type {Integer (Int32)}
     */
    static OBLIQUE_SOME_WRAPPING => 7

    /**
     * Script form is oblique with more wrapping.
     * Native name: DWRITE_PANOSE_SCRIPT_FORM_OBLIQUE_MORE_WRAPPING
     * @type {Integer (Int32)}
     */
    static OBLIQUE_MORE_WRAPPING => 8

    /**
     * Script form is oblique with extreme wrapping.
     * Native name: DWRITE_PANOSE_SCRIPT_FORM_OBLIQUE_EXTREME_WRAPPING
     * @type {Integer (Int32)}
     */
    static OBLIQUE_EXTREME_WRAPPING => 9

    /**
     * Script form is exaggerated with no wrapping.
     * Native name: DWRITE_PANOSE_SCRIPT_FORM_EXAGGERATED_NO_WRAPPING
     * @type {Integer (Int32)}
     */
    static EXAGGERATED_NO_WRAPPING => 10

    /**
     * Script form is exaggerated with some wrapping.
     * Native name: DWRITE_PANOSE_SCRIPT_FORM_EXAGGERATED_SOME_WRAPPING
     * @type {Integer (Int32)}
     */
    static EXAGGERATED_SOME_WRAPPING => 11

    /**
     * Script form is exaggerated with more wrapping.
     * Native name: DWRITE_PANOSE_SCRIPT_FORM_EXAGGERATED_MORE_WRAPPING
     * @type {Integer (Int32)}
     */
    static EXAGGERATED_MORE_WRAPPING => 12

    /**
     * Script form is exaggerated with extreme wrapping.
     * Native name: DWRITE_PANOSE_SCRIPT_FORM_EXAGGERATED_EXTREME_WRAPPING
     * @type {Integer (Int32)}
     */
    static EXAGGERATED_EXTREME_WRAPPING => 13
}
