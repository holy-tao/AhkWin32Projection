#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGK_ENGINE_TYPE {
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
    static DXGK_ENGINE_TYPE_OTHER => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_ENGINE_TYPE_3D => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_ENGINE_TYPE_VIDEO_DECODE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_ENGINE_TYPE_VIDEO_ENCODE => 3

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_ENGINE_TYPE_VIDEO_PROCESSING => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_ENGINE_TYPE_SCENE_ASSEMBLY => 5

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_ENGINE_TYPE_COPY => 6

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_ENGINE_TYPE_OVERLAY => 7

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_ENGINE_TYPE_CRYPTO => 8

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_ENGINE_TYPE_MAX => 9
}
