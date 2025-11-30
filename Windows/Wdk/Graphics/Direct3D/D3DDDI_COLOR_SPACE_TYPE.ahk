#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DDDI_COLOR_SPACE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_COLOR_SPACE_RGB_FULL_G22_NONE_P709 => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_COLOR_SPACE_RGB_FULL_G10_NONE_P709 => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_COLOR_SPACE_RGB_STUDIO_G22_NONE_P709 => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_COLOR_SPACE_RGB_STUDIO_G22_NONE_P2020 => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_COLOR_SPACE_RESERVED => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_COLOR_SPACE_YCBCR_FULL_G22_NONE_P709_X601 => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P601 => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_COLOR_SPACE_YCBCR_FULL_G22_LEFT_P601 => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P709 => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_COLOR_SPACE_YCBCR_FULL_G22_LEFT_P709 => 9

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P2020 => 10

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_COLOR_SPACE_YCBCR_FULL_G22_LEFT_P2020 => 11

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_COLOR_SPACE_RGB_FULL_G2084_NONE_P2020 => 12

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_COLOR_SPACE_YCBCR_STUDIO_G2084_LEFT_P2020 => 13

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_COLOR_SPACE_RGB_STUDIO_G2084_NONE_P2020 => 14

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_COLOR_SPACE_YCBCR_STUDIO_G22_TOPLEFT_P2020 => 15

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_COLOR_SPACE_YCBCR_STUDIO_G2084_TOPLEFT_P2020 => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_COLOR_SPACE_RGB_FULL_G22_NONE_P2020 => 17

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_COLOR_SPACE_YCBCR_STUDIO_GHLG_TOPLEFT_P2020 => 18

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_COLOR_SPACE_YCBCR_FULL_GHLG_TOPLEFT_P2020 => 19

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_COLOR_SPACE_RGB_STUDIO_G24_NONE_P709 => 20

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_COLOR_SPACE_RGB_STUDIO_G24_NONE_P2020 => 21

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_COLOR_SPACE_YCBCR_STUDIO_G24_LEFT_P709 => 22

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_COLOR_SPACE_YCBCR_STUDIO_G24_LEFT_P2020 => 23

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_COLOR_SPACE_YCBCR_STUDIO_G24_TOPLEFT_P2020 => 24

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_COLOR_SPACE_CUSTOM => -1
}
