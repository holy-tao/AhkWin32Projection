#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGK_MIRACAST_CHUNK_TYPE {
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
    static DXGK_MIRACAST_CHUNK_TYPE_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_MIRACAST_CHUNK_TYPE_COLOR_CONVERT_COMPLETE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_MIRACAST_CHUNK_TYPE_ENCODE_COMPLETE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_MIRACAST_CHUNK_TYPE_FRAME_START => 3

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_MIRACAST_CHUNK_TYPE_FRAME_DROPPED => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_MIRACAST_CHUNK_TYPE_ENCODE_DRIVER_DEFINED_1 => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_MIRACAST_CHUNK_TYPE_ENCODE_DRIVER_DEFINED_2 => -2147483647
}
