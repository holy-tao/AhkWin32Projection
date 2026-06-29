#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVEncVideoQPMapElementDataType {
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
    static CODEC_API_QP_MAP_INT8 => 0

    /**
     * @type {Integer (Int32)}
     */
    static CODEC_API_QP_MAP_INT16 => 1

    /**
     * @type {Integer (Int32)}
     */
    static CODEC_API_QP_MAP_INT32 => 2

    /**
     * @type {Integer (Int32)}
     */
    static CODEC_API_QP_MAP_UINT8 => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static CODEC_API_QP_MAP_UINT16 => -2147483647

    /**
     * @type {Integer (Int32)}
     */
    static CODEC_API_QP_MAP_UINT32 => -2147483646
}
