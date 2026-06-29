#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_MODE {
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
    static D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_MODE_DISABLED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_MODE_ALT_Q => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_MODE_ALT_LF_Y_V => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_MODE_ALT_LF_Y_H => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_MODE_ALT_LF_U => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_MODE_ALT_LF_V => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_MODE_ALT_REF_FRAME => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_MODE_ALT_SKIP => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_MODE_ALT_GLOBALMV => 8
}
