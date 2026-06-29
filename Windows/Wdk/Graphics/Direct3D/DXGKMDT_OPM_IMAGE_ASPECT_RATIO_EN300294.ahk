#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGKMDT_OPM_IMAGE_ASPECT_RATIO_EN300294 {
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
    static DXGKMDT_OPM_ASPECT_RATIO_EN300294_FULL_FORMAT_4_BY_3 => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_ASPECT_RATIO_EN300294_BOX_14_BY_9_CENTER => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_ASPECT_RATIO_EN300294_BOX_14_BY_9_TOP => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_ASPECT_RATIO_EN300294_BOX_16_BY_9_CENTER => 3

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_ASPECT_RATIO_EN300294_BOX_16_BY_9_TOP => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_ASPECT_RATIO_EN300294_BOX_GT_16_BY_9_CENTER => 5

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_ASPECT_RATIO_EN300294_FULL_FORMAT_4_BY_3_PROTECTED_CENTER => 6

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_ASPECT_RATIO_EN300294_FULL_FORMAT_16_BY_9_ANAMORPHIC => 7
}
