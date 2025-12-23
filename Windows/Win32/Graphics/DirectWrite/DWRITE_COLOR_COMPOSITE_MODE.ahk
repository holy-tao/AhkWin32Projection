#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_COLOR_COMPOSITE_MODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_COLOR_COMPOSITE_CLEAR => 0

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_COLOR_COMPOSITE_SRC => 1

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_COLOR_COMPOSITE_DEST => 2

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_COLOR_COMPOSITE_SRC_OVER => 3

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_COLOR_COMPOSITE_DEST_OVER => 4

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_COLOR_COMPOSITE_SRC_IN => 5

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_COLOR_COMPOSITE_DEST_IN => 6

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_COLOR_COMPOSITE_SRC_OUT => 7

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_COLOR_COMPOSITE_DEST_OUT => 8

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_COLOR_COMPOSITE_SRC_ATOP => 9

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_COLOR_COMPOSITE_DEST_ATOP => 10

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_COLOR_COMPOSITE_XOR => 11

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_COLOR_COMPOSITE_PLUS => 12

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_COLOR_COMPOSITE_SCREEN => 13

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_COLOR_COMPOSITE_OVERLAY => 14

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_COLOR_COMPOSITE_DARKEN => 15

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_COLOR_COMPOSITE_LIGHTEN => 16

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_COLOR_COMPOSITE_COLOR_DODGE => 17

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_COLOR_COMPOSITE_COLOR_BURN => 18

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_COLOR_COMPOSITE_HARD_LIGHT => 19

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_COLOR_COMPOSITE_SOFT_LIGHT => 20

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_COLOR_COMPOSITE_DIFFERENCE => 21

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_COLOR_COMPOSITE_EXCLUSION => 22

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_COLOR_COMPOSITE_MULTIPLY => 23

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_COLOR_COMPOSITE_HSL_HUE => 24

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_COLOR_COMPOSITE_HSL_SATURATION => 25

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_COLOR_COMPOSITE_HSL_COLOR => 26

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_COLOR_COMPOSITE_HSL_LUMINOSITY => 27
}
