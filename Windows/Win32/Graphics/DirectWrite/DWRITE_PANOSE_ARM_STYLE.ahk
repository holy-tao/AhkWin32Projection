#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DWRITE_PANOSE_ARM_STYLE enumeration contains values that specify the style of termination of stems and rounded letterforms for text.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_panose_arm_style
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_PANOSE_ARM_STYLE extends Win32Enum {

    /**
     * Any arm style.
     * Native name: DWRITE_PANOSE_ARM_STYLE_ANY
     * @type {Integer (Int32)}
     */
    static ANY => 0

    /**
     * No fit arm style.
     * Native name: DWRITE_PANOSE_ARM_STYLE_NO_FIT
     * @type {Integer (Int32)}
     */
    static NO_FIT => 1

    /**
     * The arm style is straight horizontal.
     * Native name: DWRITE_PANOSE_ARM_STYLE_STRAIGHT_ARMS_HORIZONTAL
     * @type {Integer (Int32)}
     */
    static STRAIGHT_ARMS_HORIZONTAL => 2

    /**
     * The arm style is straight wedge.
     * Native name: DWRITE_PANOSE_ARM_STYLE_STRAIGHT_ARMS_WEDGE
     * @type {Integer (Int32)}
     */
    static STRAIGHT_ARMS_WEDGE => 3

    /**
     * The arm style is straight vertical.
     * Native name: DWRITE_PANOSE_ARM_STYLE_STRAIGHT_ARMS_VERTICAL
     * @type {Integer (Int32)}
     */
    static STRAIGHT_ARMS_VERTICAL => 4

    /**
     * The arm style is straight single serif.
     * Native name: DWRITE_PANOSE_ARM_STYLE_STRAIGHT_ARMS_SINGLE_SERIF
     * @type {Integer (Int32)}
     */
    static STRAIGHT_ARMS_SINGLE_SERIF => 5

    /**
     * The arm style is straight double serif.
     * Native name: DWRITE_PANOSE_ARM_STYLE_STRAIGHT_ARMS_DOUBLE_SERIF
     * @type {Integer (Int32)}
     */
    static STRAIGHT_ARMS_DOUBLE_SERIF => 6

    /**
     * The arm style is non-straight horizontal.
     * Native name: DWRITE_PANOSE_ARM_STYLE_NONSTRAIGHT_ARMS_HORIZONTAL
     * @type {Integer (Int32)}
     */
    static NONSTRAIGHT_ARMS_HORIZONTAL => 7

    /**
     * The arm style is non-straight wedge.
     * Native name: DWRITE_PANOSE_ARM_STYLE_NONSTRAIGHT_ARMS_WEDGE
     * @type {Integer (Int32)}
     */
    static NONSTRAIGHT_ARMS_WEDGE => 8

    /**
     * The arm style is non-straight vertical.
     * Native name: DWRITE_PANOSE_ARM_STYLE_NONSTRAIGHT_ARMS_VERTICAL
     * @type {Integer (Int32)}
     */
    static NONSTRAIGHT_ARMS_VERTICAL => 9

    /**
     * The arm style is non-straight single serif.
     * Native name: DWRITE_PANOSE_ARM_STYLE_NONSTRAIGHT_ARMS_SINGLE_SERIF
     * @type {Integer (Int32)}
     */
    static NONSTRAIGHT_ARMS_SINGLE_SERIF => 10

    /**
     * The arm style is non-straight double serif.
     * Native name: DWRITE_PANOSE_ARM_STYLE_NONSTRAIGHT_ARMS_DOUBLE_SERIF
     * @type {Integer (Int32)}
     */
    static NONSTRAIGHT_ARMS_DOUBLE_SERIF => 11

    /**
     * The arm style is straight horizontal.
     * Native name: DWRITE_PANOSE_ARM_STYLE_STRAIGHT_ARMS_HORZ
     * @type {Integer (Int32)}
     */
    static STRAIGHT_ARMS_HORZ => 2

    /**
     * The arm style is straight vertical.
     * Native name: DWRITE_PANOSE_ARM_STYLE_STRAIGHT_ARMS_VERT
     * @type {Integer (Int32)}
     */
    static STRAIGHT_ARMS_VERT => 4

    /**
     * The arm style is non-straight horizontal.
     * Native name: DWRITE_PANOSE_ARM_STYLE_BENT_ARMS_HORZ
     * @type {Integer (Int32)}
     */
    static BENT_ARMS_HORZ => 7

    /**
     * The arm style is non-straight wedge.
     * Native name: DWRITE_PANOSE_ARM_STYLE_BENT_ARMS_WEDGE
     * @type {Integer (Int32)}
     */
    static BENT_ARMS_WEDGE => 8

    /**
     * The arm style is non-straight vertical.
     * Native name: DWRITE_PANOSE_ARM_STYLE_BENT_ARMS_VERT
     * @type {Integer (Int32)}
     */
    static BENT_ARMS_VERT => 9

    /**
     * The arm style is non-straight single serif.
     * Native name: DWRITE_PANOSE_ARM_STYLE_BENT_ARMS_SINGLE_SERIF
     * @type {Integer (Int32)}
     */
    static BENT_ARMS_SINGLE_SERIF => 10

    /**
     * The arm style is non-straight double serif.
     * Native name: DWRITE_PANOSE_ARM_STYLE_BENT_ARMS_DOUBLE_SERIF
     * @type {Integer (Int32)}
     */
    static BENT_ARMS_DOUBLE_SERIF => 11
}
