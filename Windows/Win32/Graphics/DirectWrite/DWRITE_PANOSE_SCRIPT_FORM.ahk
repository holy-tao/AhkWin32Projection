#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DWRITE_PANOSE_SCRIPT_FORM enumeration contains values that specify the general look of the character face, with consideration of its slope and tails.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/ne-dwrite_1-dwrite_panose_script_form
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_PANOSE_SCRIPT_FORM{

    /**
     * Any script form.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SCRIPT_FORM_ANY => 0

    /**
     * No fit for script form.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SCRIPT_FORM_NO_FIT => 1

    /**
     * Script form is upright with no wrapping.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SCRIPT_FORM_UPRIGHT_NO_WRAPPING => 2

    /**
     * Script form is upright with some wrapping.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SCRIPT_FORM_UPRIGHT_SOME_WRAPPING => 3

    /**
     * Script form is upright with more wrapping.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SCRIPT_FORM_UPRIGHT_MORE_WRAPPING => 4

    /**
     * Script form is upright with extreme wrapping.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SCRIPT_FORM_UPRIGHT_EXTREME_WRAPPING => 5

    /**
     * Script form is oblique with no wrapping.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SCRIPT_FORM_OBLIQUE_NO_WRAPPING => 6

    /**
     * Script form is oblique with some wrapping.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SCRIPT_FORM_OBLIQUE_SOME_WRAPPING => 7

    /**
     * Script form is oblique with more wrapping.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SCRIPT_FORM_OBLIQUE_MORE_WRAPPING => 8

    /**
     * Script form is oblique with extreme wrapping.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SCRIPT_FORM_OBLIQUE_EXTREME_WRAPPING => 9

    /**
     * Script form is exaggerated with no wrapping.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SCRIPT_FORM_EXAGGERATED_NO_WRAPPING => 10

    /**
     * Script form is exaggerated with some wrapping.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SCRIPT_FORM_EXAGGERATED_SOME_WRAPPING => 11

    /**
     * Script form is exaggerated with more wrapping.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SCRIPT_FORM_EXAGGERATED_MORE_WRAPPING => 12

    /**
     * Script form is exaggerated with extreme wrapping.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SCRIPT_FORM_EXAGGERATED_EXTREME_WRAPPING => 13
}
