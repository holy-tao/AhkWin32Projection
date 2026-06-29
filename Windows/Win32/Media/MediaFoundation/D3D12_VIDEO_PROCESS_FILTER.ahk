#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_PROCESS_FILTER {
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
    static D3D12_VIDEO_PROCESS_FILTER_BRIGHTNESS => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_FILTER_CONTRAST => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_FILTER_HUE => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_FILTER_SATURATION => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_FILTER_NOISE_REDUCTION => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_FILTER_EDGE_ENHANCEMENT => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_FILTER_ANAMORPHIC_SCALING => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_FILTER_STEREO_ADJUSTMENT => 7
}
