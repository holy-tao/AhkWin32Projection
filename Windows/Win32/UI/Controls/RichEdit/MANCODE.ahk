#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents mathematical alphanumeric codes.
 * @see https://learn.microsoft.com/windows/win32/api/tom/ne-tom-mancode
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct MANCODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Bold
     * @type {Integer (Int32)}
     */
    static MBOLD => 16

    /**
     * Italics
     * @type {Integer (Int32)}
     */
    static MITAL => 32

    /**
     * Greek
     * @type {Integer (Int32)}
     */
    static MGREEK => 64

    /**
     * Roman
     * @type {Integer (Int32)}
     */
    static MROMN => 0

    /**
     * Script
     * @type {Integer (Int32)}
     */
    static MSCRP => 1

    /**
     * Fraktur
     * @type {Integer (Int32)}
     */
    static MFRAK => 2

    /**
     * Double struck
     * @type {Integer (Int32)}
     */
    static MOPEN => 3

    /**
     * Sans-serif
     * @type {Integer (Int32)}
     */
    static MSANS => 4

    /**
     * Monospaced
     * @type {Integer (Int32)}
     */
    static MMONO => 5

    /**
     * Math
     * @type {Integer (Int32)}
     */
    static MMATH => 6

    /**
     * Isolated
     * @type {Integer (Int32)}
     */
    static MISOL => 7

    /**
     * Initial
     * @type {Integer (Int32)}
     */
    static MINIT => 8

    /**
     * Tailed
     * @type {Integer (Int32)}
     */
    static MTAIL => 9

    /**
     * Stretched
     * @type {Integer (Int32)}
     */
    static MSTRCH => 10

    /**
     * Looped
     * @type {Integer (Int32)}
     */
    static MLOOP => 11

    /**
     * Arabic double-struck
     * @type {Integer (Int32)}
     */
    static MOPENA => 12
}
