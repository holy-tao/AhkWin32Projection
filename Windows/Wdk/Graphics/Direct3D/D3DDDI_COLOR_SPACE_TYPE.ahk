#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DDDI_COLOR_SPACE_TYPE extends Win32Enum {

    /**
     * Native name: D3DDDI_COLOR_SPACE_RGB_FULL_G22_NONE_P709
     * @type {Integer (Int32)}
     */
    static RGB_FULL_G22_NONE_P709 => 0

    /**
     * Native name: D3DDDI_COLOR_SPACE_RGB_FULL_G10_NONE_P709
     * @type {Integer (Int32)}
     */
    static RGB_FULL_G10_NONE_P709 => 1

    /**
     * Native name: D3DDDI_COLOR_SPACE_RGB_STUDIO_G22_NONE_P709
     * @type {Integer (Int32)}
     */
    static RGB_STUDIO_G22_NONE_P709 => 2

    /**
     * Native name: D3DDDI_COLOR_SPACE_RGB_STUDIO_G22_NONE_P2020
     * @type {Integer (Int32)}
     */
    static RGB_STUDIO_G22_NONE_P2020 => 3

    /**
     * Native name: D3DDDI_COLOR_SPACE_RESERVED
     * @type {Integer (Int32)}
     */
    static RESERVED => 4

    /**
     * Native name: D3DDDI_COLOR_SPACE_YCBCR_FULL_G22_NONE_P709_X601
     * @type {Integer (Int32)}
     */
    static YCBCR_FULL_G22_NONE_P709_X601 => 5

    /**
     * Native name: D3DDDI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P601
     * @type {Integer (Int32)}
     */
    static YCBCR_STUDIO_G22_LEFT_P601 => 6

    /**
     * Native name: D3DDDI_COLOR_SPACE_YCBCR_FULL_G22_LEFT_P601
     * @type {Integer (Int32)}
     */
    static YCBCR_FULL_G22_LEFT_P601 => 7

    /**
     * Native name: D3DDDI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P709
     * @type {Integer (Int32)}
     */
    static YCBCR_STUDIO_G22_LEFT_P709 => 8

    /**
     * Native name: D3DDDI_COLOR_SPACE_YCBCR_FULL_G22_LEFT_P709
     * @type {Integer (Int32)}
     */
    static YCBCR_FULL_G22_LEFT_P709 => 9

    /**
     * Native name: D3DDDI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P2020
     * @type {Integer (Int32)}
     */
    static YCBCR_STUDIO_G22_LEFT_P2020 => 10

    /**
     * Native name: D3DDDI_COLOR_SPACE_YCBCR_FULL_G22_LEFT_P2020
     * @type {Integer (Int32)}
     */
    static YCBCR_FULL_G22_LEFT_P2020 => 11

    /**
     * Native name: D3DDDI_COLOR_SPACE_RGB_FULL_G2084_NONE_P2020
     * @type {Integer (Int32)}
     */
    static RGB_FULL_G2084_NONE_P2020 => 12

    /**
     * Native name: D3DDDI_COLOR_SPACE_YCBCR_STUDIO_G2084_LEFT_P2020
     * @type {Integer (Int32)}
     */
    static YCBCR_STUDIO_G2084_LEFT_P2020 => 13

    /**
     * Native name: D3DDDI_COLOR_SPACE_RGB_STUDIO_G2084_NONE_P2020
     * @type {Integer (Int32)}
     */
    static RGB_STUDIO_G2084_NONE_P2020 => 14

    /**
     * Native name: D3DDDI_COLOR_SPACE_YCBCR_STUDIO_G22_TOPLEFT_P2020
     * @type {Integer (Int32)}
     */
    static YCBCR_STUDIO_G22_TOPLEFT_P2020 => 15

    /**
     * Native name: D3DDDI_COLOR_SPACE_YCBCR_STUDIO_G2084_TOPLEFT_P2020
     * @type {Integer (Int32)}
     */
    static YCBCR_STUDIO_G2084_TOPLEFT_P2020 => 16

    /**
     * Native name: D3DDDI_COLOR_SPACE_RGB_FULL_G22_NONE_P2020
     * @type {Integer (Int32)}
     */
    static RGB_FULL_G22_NONE_P2020 => 17

    /**
     * Native name: D3DDDI_COLOR_SPACE_YCBCR_STUDIO_GHLG_TOPLEFT_P2020
     * @type {Integer (Int32)}
     */
    static YCBCR_STUDIO_GHLG_TOPLEFT_P2020 => 18

    /**
     * Native name: D3DDDI_COLOR_SPACE_YCBCR_FULL_GHLG_TOPLEFT_P2020
     * @type {Integer (Int32)}
     */
    static YCBCR_FULL_GHLG_TOPLEFT_P2020 => 19

    /**
     * Native name: D3DDDI_COLOR_SPACE_RGB_STUDIO_G24_NONE_P709
     * @type {Integer (Int32)}
     */
    static RGB_STUDIO_G24_NONE_P709 => 20

    /**
     * Native name: D3DDDI_COLOR_SPACE_RGB_STUDIO_G24_NONE_P2020
     * @type {Integer (Int32)}
     */
    static RGB_STUDIO_G24_NONE_P2020 => 21

    /**
     * Native name: D3DDDI_COLOR_SPACE_YCBCR_STUDIO_G24_LEFT_P709
     * @type {Integer (Int32)}
     */
    static YCBCR_STUDIO_G24_LEFT_P709 => 22

    /**
     * Native name: D3DDDI_COLOR_SPACE_YCBCR_STUDIO_G24_LEFT_P2020
     * @type {Integer (Int32)}
     */
    static YCBCR_STUDIO_G24_LEFT_P2020 => 23

    /**
     * Native name: D3DDDI_COLOR_SPACE_YCBCR_STUDIO_G24_TOPLEFT_P2020
     * @type {Integer (Int32)}
     */
    static YCBCR_STUDIO_G24_TOPLEFT_P2020 => 24

    /**
     * Native name: D3DDDI_COLOR_SPACE_CUSTOM
     * @type {Integer (Int32)}
     */
    static CUSTOM => -1
}
