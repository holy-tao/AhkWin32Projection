#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DWRITE_PANOSE_ARM_STYLE enumeration contains values that specify the style of termination of stems and rounded letterforms for text.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/ne-dwrite_1-dwrite_panose_arm_style
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_PANOSE_ARM_STYLE{

    /**
     * Any arm style.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_ARM_STYLE_ANY => 0

    /**
     * No fit arm style.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_ARM_STYLE_NO_FIT => 1

    /**
     * The arm style is straight horizontal.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_ARM_STYLE_STRAIGHT_ARMS_HORIZONTAL => 2

    /**
     * The arm style is straight wedge.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_ARM_STYLE_STRAIGHT_ARMS_WEDGE => 3

    /**
     * The arm style is straight vertical.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_ARM_STYLE_STRAIGHT_ARMS_VERTICAL => 4

    /**
     * The arm style is straight single serif.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_ARM_STYLE_STRAIGHT_ARMS_SINGLE_SERIF => 5

    /**
     * The arm style is straight double serif.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_ARM_STYLE_STRAIGHT_ARMS_DOUBLE_SERIF => 6

    /**
     * The arm style is non-straight horizontal.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_ARM_STYLE_NONSTRAIGHT_ARMS_HORIZONTAL => 7

    /**
     * The arm style is non-straight wedge.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_ARM_STYLE_NONSTRAIGHT_ARMS_WEDGE => 8

    /**
     * The arm style is non-straight vertical.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_ARM_STYLE_NONSTRAIGHT_ARMS_VERTICAL => 9

    /**
     * The arm style is non-straight single serif.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_ARM_STYLE_NONSTRAIGHT_ARMS_SINGLE_SERIF => 10

    /**
     * The arm style is non-straight double serif.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_ARM_STYLE_NONSTRAIGHT_ARMS_DOUBLE_SERIF => 11

    /**
     * The arm style is straight horizontal.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_ARM_STYLE_STRAIGHT_ARMS_HORZ => 2

    /**
     * The arm style is straight vertical.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_ARM_STYLE_STRAIGHT_ARMS_VERT => 4

    /**
     * The arm style is non-straight horizontal.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_ARM_STYLE_BENT_ARMS_HORZ => 7

    /**
     * The arm style is non-straight wedge.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_ARM_STYLE_BENT_ARMS_WEDGE => 8

    /**
     * The arm style is non-straight vertical.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_ARM_STYLE_BENT_ARMS_VERT => 9

    /**
     * The arm style is non-straight single serif.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_ARM_STYLE_BENT_ARMS_SINGLE_SERIF => 10

    /**
     * The arm style is non-straight double serif.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_ARM_STYLE_BENT_ARMS_DOUBLE_SERIF => 11
}
