#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_BRIGHTNESS_INFO_TYPE extends Win32Enum {

    /**
     * Native name: D3DKMT_BRIGHTNESS_INFO_GET_POSSIBLE_LEVELS
     * @type {Integer (Int32)}
     */
    static GET_POSSIBLE_LEVELS => 1

    /**
     * Native name: D3DKMT_BRIGHTNESS_INFO_GET
     * @type {Integer (Int32)}
     */
    static GET => 2

    /**
     * Native name: D3DKMT_BRIGHTNESS_INFO_SET
     * @type {Integer (Int32)}
     */
    static SET => 3

    /**
     * Native name: D3DKMT_BRIGHTNESS_INFO_GET_CAPS
     * @type {Integer (Int32)}
     */
    static GET_CAPS => 4

    /**
     * Native name: D3DKMT_BRIGHTNESS_INFO_SET_STATE
     * @type {Integer (Int32)}
     */
    static SET_STATE => 5

    /**
     * Native name: D3DKMT_BRIGHTNESS_INFO_SET_OPTIMIZATION
     * @type {Integer (Int32)}
     */
    static SET_OPTIMIZATION => 6

    /**
     * Native name: D3DKMT_BRIGHTNESS_INFO_GET_REDUCTION
     * @type {Integer (Int32)}
     */
    static GET_REDUCTION => 7

    /**
     * Native name: D3DKMT_BRIGHTNESS_INFO_BEGIN_MANUAL_MODE
     * @type {Integer (Int32)}
     */
    static BEGIN_MANUAL_MODE => 8

    /**
     * Native name: D3DKMT_BRIGHTNESS_INFO_END_MANUAL_MODE
     * @type {Integer (Int32)}
     */
    static END_MANUAL_MODE => 9

    /**
     * Native name: D3DKMT_BRIGHTNESS_INFO_TOGGLE_LOGGING
     * @type {Integer (Int32)}
     */
    static TOGGLE_LOGGING => 10

    /**
     * Native name: D3DKMT_BRIGHTNESS_INFO_GET_NIT_RANGES
     * @type {Integer (Int32)}
     */
    static GET_NIT_RANGES => 11
}
