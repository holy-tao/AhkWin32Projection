#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_GPU_PREFERENCE_QUERY_STATE {
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
    static D3DKMT_GPU_PREFERENCE_STATE_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_GPU_PREFERENCE_STATE_HIGH_PERFORMANCE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_GPU_PREFERENCE_STATE_MINIMUM_POWER => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_GPU_PREFERENCE_STATE_UNSPECIFIED => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_GPU_PREFERENCE_STATE_NOT_FOUND => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_GPU_PREFERENCE_STATE_USER_SPECIFIED_GPU => 5
}
