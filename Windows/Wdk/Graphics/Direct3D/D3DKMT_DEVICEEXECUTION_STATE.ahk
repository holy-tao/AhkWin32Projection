#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_DEVICEEXECUTION_STATE {
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
    static D3DKMT_DEVICEEXECUTION_ACTIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DEVICEEXECUTION_RESET => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DEVICEEXECUTION_HUNG => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DEVICEEXECUTION_STOPPED => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DEVICEEXECUTION_ERROR_OUTOFMEMORY => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DEVICEEXECUTION_ERROR_DMAFAULT => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DEVICEEXECUTION_ERROR_DMAPAGEFAULT => 7
}
