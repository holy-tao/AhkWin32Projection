#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DDDIMULTISAMPLE_TYPE {
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
    static D3DDDIMULTISAMPLE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDIMULTISAMPLE_NONMASKABLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDIMULTISAMPLE_2_SAMPLES => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDIMULTISAMPLE_3_SAMPLES => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDIMULTISAMPLE_4_SAMPLES => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDIMULTISAMPLE_5_SAMPLES => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDIMULTISAMPLE_6_SAMPLES => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDIMULTISAMPLE_7_SAMPLES => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDIMULTISAMPLE_8_SAMPLES => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDIMULTISAMPLE_9_SAMPLES => 9

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDIMULTISAMPLE_10_SAMPLES => 10

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDIMULTISAMPLE_11_SAMPLES => 11

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDIMULTISAMPLE_12_SAMPLES => 12

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDIMULTISAMPLE_13_SAMPLES => 13

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDIMULTISAMPLE_14_SAMPLES => 14

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDIMULTISAMPLE_15_SAMPLES => 15

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDIMULTISAMPLE_16_SAMPLES => 16
}
