#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_VAD_ESCAPE_COMMAND {
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
    static D3DKMT_VAD_ESCAPE_GETNUMVADS => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VAD_ESCAPE_GETVAD => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VAD_ESCAPE_GETVADRANGE => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VAD_ESCAPE_GET_PTE => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VAD_ESCAPE_GET_GPUMMU_CAPS => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VAD_ESCAPE_GET_SEGMENT_CAPS => 5
}
