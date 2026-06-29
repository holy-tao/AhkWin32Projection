#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGKMDT_OPM_ACP_PROTECTION_LEVEL {
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
    static DXGKMDT_OPM_ACP_OFF => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_ACP_LEVEL_ONE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_ACP_LEVEL_TWO => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_ACP_LEVEL_THREE => 3
}
