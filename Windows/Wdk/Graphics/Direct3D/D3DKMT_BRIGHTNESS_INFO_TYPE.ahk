#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_BRIGHTNESS_INFO_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_BRIGHTNESS_INFO_GET_POSSIBLE_LEVELS => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_BRIGHTNESS_INFO_GET => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_BRIGHTNESS_INFO_SET => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_BRIGHTNESS_INFO_GET_CAPS => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_BRIGHTNESS_INFO_SET_STATE => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_BRIGHTNESS_INFO_SET_OPTIMIZATION => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_BRIGHTNESS_INFO_GET_REDUCTION => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_BRIGHTNESS_INFO_BEGIN_MANUAL_MODE => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_BRIGHTNESS_INFO_END_MANUAL_MODE => 9

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_BRIGHTNESS_INFO_TOGGLE_LOGGING => 10

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_BRIGHTNESS_INFO_GET_NIT_RANGES => 11
}
