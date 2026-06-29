#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA2_FilterType {
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
    static DXVA2_NoiseFilterLumaLevel => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_NoiseFilterLumaThreshold => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_NoiseFilterLumaRadius => 3

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_NoiseFilterChromaLevel => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_NoiseFilterChromaThreshold => 5

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_NoiseFilterChromaRadius => 6

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DetailFilterLumaLevel => 7

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DetailFilterLumaThreshold => 8

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DetailFilterLumaRadius => 9

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DetailFilterChromaLevel => 10

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DetailFilterChromaThreshold => 11

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DetailFilterChromaRadius => 12
}
