#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_BRIGHTNESS_INFO_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
