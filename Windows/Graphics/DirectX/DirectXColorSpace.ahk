#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * This is a Windows Runtime equivalent of the Desktop [DXGI_COLOR_SPACE_TYPE](/windows/desktop/api/dxgicommon/ne-dxgicommon-dxgi_color_space_type) enumeration.
 * @remarks
 * Each value corresponds to a value in the [DXGI_COLOR_SPACE_TYPE](/windows/desktop/api/dxgicommon/ne-dxgicommon-dxgi_color_space_type) enumeration. For example, **DirectXColorSpace.RgbFullG22NoneP709** corresponds to **DXGI_COLOR_SPACE_RGB_FULL_G22_NONE_P709**. See that documentation for more information on each value.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.directx.directxcolorspace
 * @namespace Windows.Graphics.DirectX
 * @version WindowsRuntime 1.4
 */
class DirectXColorSpace extends Win32Enum{

    /**
     * Corresponds to **DXGI_COLOR_SPACE_RGB_FULL_G22_NONE_P709**.
     * @type {Integer (Int32)}
     */
    static RgbFullG22NoneP709 => 0

    /**
     * Corresponds to **DXGI_COLOR_SPACE_RGB_FULL_G10_NONE_P709**.
     * @type {Integer (Int32)}
     */
    static RgbFullG10NoneP709 => 1

    /**
     * Corresponds to **DXGI_COLOR_SPACE_RGB_STUDIO_G22_NONE_P709**.
     * @type {Integer (Int32)}
     */
    static RgbStudioG22NoneP709 => 2

    /**
     * Corresponds to **DXGI_COLOR_SPACE_RGB_STUDIO_G22_NONE_P2020**.
     * @type {Integer (Int32)}
     */
    static RgbStudioG22NoneP2020 => 3

    /**
     * Corresponds to **DXGI_COLOR_SPACE_RESERVED**.
     * @type {Integer (Int32)}
     */
    static Reserved => 4

    /**
     * Corresponds to **DXGI_COLOR_SPACE_YCBCR_FULL_G22_NONE_P709_X601**.
     * @type {Integer (Int32)}
     */
    static YccFullG22NoneP709X601 => 5

    /**
     * Corresponds to **DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P601**.
     * @type {Integer (Int32)}
     */
    static YccStudioG22LeftP601 => 6

    /**
     * Corresponds to **DXGI_COLOR_SPACE_YCBCR_FULL_G22_LEFT_P601**.
     * @type {Integer (Int32)}
     */
    static YccFullG22LeftP601 => 7

    /**
     * Corresponds to **DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P709**.
     * @type {Integer (Int32)}
     */
    static YccStudioG22LeftP709 => 8

    /**
     * Corresponds to **DXGI_COLOR_SPACE_YCBCR_FULL_G22_LEFT_P709**.
     * @type {Integer (Int32)}
     */
    static YccFullG22LeftP709 => 9

    /**
     * Corresponds to **DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P2020**.
     * @type {Integer (Int32)}
     */
    static YccStudioG22LeftP2020 => 10

    /**
     * Corresponds to **DXGI_COLOR_SPACE_YCBCR_FULL_G22_LEFT_P2020**.
     * @type {Integer (Int32)}
     */
    static YccFullG22LeftP2020 => 11

    /**
     * Corresponds to **DXGI_COLOR_SPACE_RGB_FULL_G2084_NONE_P2020**.
     * @type {Integer (Int32)}
     */
    static RgbFullG2084NoneP2020 => 12

    /**
     * Corresponds to **DXGI_COLOR_SPACE_YCBCR_STUDIO_G2084_LEFT_P2020**.
     * @type {Integer (Int32)}
     */
    static YccStudioG2084LeftP2020 => 13

    /**
     * Corresponds to **DXGI_COLOR_SPACE_RGB_STUDIO_G2084_NONE_P2020**.
     * @type {Integer (Int32)}
     */
    static RgbStudioG2084NoneP2020 => 14

    /**
     * Corresponds to **DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_TOPLEFT_P2020**.
     * @type {Integer (Int32)}
     */
    static YccStudioG22TopLeftP2020 => 15

    /**
     * Corresponds to **DXGI_COLOR_SPACE_YCBCR_STUDIO_G2084_TOPLEFT_P2020**.
     * @type {Integer (Int32)}
     */
    static YccStudioG2084TopLeftP2020 => 16

    /**
     * Corresponds to **DXGI_COLOR_SPACE_RGB_FULL_G22_NONE_P2020**.
     * @type {Integer (Int32)}
     */
    static RgbFullG22NoneP2020 => 17

    /**
     * Corresponds to **DXGI_COLOR_SPACE_YCBCR_STUDIO_GHLG_TOPLEFT_P2020**.
     * @type {Integer (Int32)}
     */
    static YccStudioGHlgTopLeftP2020 => 18

    /**
     * Corresponds to **DXGI_COLOR_SPACE_YCBCR_FULL_GHLG_TOPLEFT_P2020**.
     * @type {Integer (Int32)}
     */
    static YccFullGHlgTopLeftP2020 => 19

    /**
     * Corresponds to **DXGI_COLOR_SPACE_RGB_STUDIO_G24_NONE_P709**.
     * @type {Integer (Int32)}
     */
    static RgbStudioG24NoneP709 => 20

    /**
     * Corresponds to **DXGI_COLOR_SPACE_RGB_STUDIO_G24_NONE_P2020**.
     * @type {Integer (Int32)}
     */
    static RgbStudioG24NoneP2020 => 21

    /**
     * Corresponds to **DXGI_COLOR_SPACE_YCBCR_STUDIO_G24_LEFT_P709**.
     * @type {Integer (Int32)}
     */
    static YccStudioG24LeftP709 => 22

    /**
     * Corresponds to **DXGI_COLOR_SPACE_YCBCR_STUDIO_G24_LEFT_P2020**.
     * @type {Integer (Int32)}
     */
    static YccStudioG24LeftP2020 => 23

    /**
     * Corresponds to **DXGI_COLOR_SPACE_YCBCR_STUDIO_G24_TOPLEFT_P2020**.
     * @type {Integer (Int32)}
     */
    static YccStudioG24TopLeftP2020 => 24
}
