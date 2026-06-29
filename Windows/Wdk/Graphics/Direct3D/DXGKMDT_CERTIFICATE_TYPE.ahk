#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGKMDT_CERTIFICATE_TYPE {
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
    static DXGKMDT_OPM_CERTIFICATE => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_COPP_CERTIFICATE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_UAB_CERTIFICATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_INDIRECT_DISPLAY_CERTIFICATE => 3
}
