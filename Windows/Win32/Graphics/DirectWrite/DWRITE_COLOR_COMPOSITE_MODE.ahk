#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_COLOR_COMPOSITE_MODE extends Win32Enum {

    /**
     * Native name: DWRITE_COLOR_COMPOSITE_CLEAR
     * @type {Integer (Int32)}
     */
    static CLEAR => 0

    /**
     * Native name: DWRITE_COLOR_COMPOSITE_SRC
     * @type {Integer (Int32)}
     */
    static SRC => 1

    /**
     * Native name: DWRITE_COLOR_COMPOSITE_DEST
     * @type {Integer (Int32)}
     */
    static DEST => 2

    /**
     * Native name: DWRITE_COLOR_COMPOSITE_SRC_OVER
     * @type {Integer (Int32)}
     */
    static SRC_OVER => 3

    /**
     * Native name: DWRITE_COLOR_COMPOSITE_DEST_OVER
     * @type {Integer (Int32)}
     */
    static DEST_OVER => 4

    /**
     * Native name: DWRITE_COLOR_COMPOSITE_SRC_IN
     * @type {Integer (Int32)}
     */
    static SRC_IN => 5

    /**
     * Native name: DWRITE_COLOR_COMPOSITE_DEST_IN
     * @type {Integer (Int32)}
     */
    static DEST_IN => 6

    /**
     * Native name: DWRITE_COLOR_COMPOSITE_SRC_OUT
     * @type {Integer (Int32)}
     */
    static SRC_OUT => 7

    /**
     * Native name: DWRITE_COLOR_COMPOSITE_DEST_OUT
     * @type {Integer (Int32)}
     */
    static DEST_OUT => 8

    /**
     * Native name: DWRITE_COLOR_COMPOSITE_SRC_ATOP
     * @type {Integer (Int32)}
     */
    static SRC_ATOP => 9

    /**
     * Native name: DWRITE_COLOR_COMPOSITE_DEST_ATOP
     * @type {Integer (Int32)}
     */
    static DEST_ATOP => 10

    /**
     * Native name: DWRITE_COLOR_COMPOSITE_XOR
     * @type {Integer (Int32)}
     */
    static XOR => 11

    /**
     * Native name: DWRITE_COLOR_COMPOSITE_PLUS
     * @type {Integer (Int32)}
     */
    static PLUS => 12

    /**
     * Native name: DWRITE_COLOR_COMPOSITE_SCREEN
     * @type {Integer (Int32)}
     */
    static SCREEN => 13

    /**
     * Native name: DWRITE_COLOR_COMPOSITE_OVERLAY
     * @type {Integer (Int32)}
     */
    static OVERLAY => 14

    /**
     * Native name: DWRITE_COLOR_COMPOSITE_DARKEN
     * @type {Integer (Int32)}
     */
    static DARKEN => 15

    /**
     * Native name: DWRITE_COLOR_COMPOSITE_LIGHTEN
     * @type {Integer (Int32)}
     */
    static LIGHTEN => 16

    /**
     * Native name: DWRITE_COLOR_COMPOSITE_COLOR_DODGE
     * @type {Integer (Int32)}
     */
    static COLOR_DODGE => 17

    /**
     * Native name: DWRITE_COLOR_COMPOSITE_COLOR_BURN
     * @type {Integer (Int32)}
     */
    static COLOR_BURN => 18

    /**
     * Native name: DWRITE_COLOR_COMPOSITE_HARD_LIGHT
     * @type {Integer (Int32)}
     */
    static HARD_LIGHT => 19

    /**
     * Native name: DWRITE_COLOR_COMPOSITE_SOFT_LIGHT
     * @type {Integer (Int32)}
     */
    static SOFT_LIGHT => 20

    /**
     * Native name: DWRITE_COLOR_COMPOSITE_DIFFERENCE
     * @type {Integer (Int32)}
     */
    static DIFFERENCE => 21

    /**
     * Native name: DWRITE_COLOR_COMPOSITE_EXCLUSION
     * @type {Integer (Int32)}
     */
    static EXCLUSION => 22

    /**
     * Native name: DWRITE_COLOR_COMPOSITE_MULTIPLY
     * @type {Integer (Int32)}
     */
    static MULTIPLY => 23

    /**
     * Native name: DWRITE_COLOR_COMPOSITE_HSL_HUE
     * @type {Integer (Int32)}
     */
    static HSL_HUE => 24

    /**
     * Native name: DWRITE_COLOR_COMPOSITE_HSL_SATURATION
     * @type {Integer (Int32)}
     */
    static HSL_SATURATION => 25

    /**
     * Native name: DWRITE_COLOR_COMPOSITE_HSL_COLOR
     * @type {Integer (Int32)}
     */
    static HSL_COLOR => 26

    /**
     * Native name: DWRITE_COLOR_COMPOSITE_HSL_LUMINOSITY
     * @type {Integer (Int32)}
     */
    static HSL_LUMINOSITY => 27
}
