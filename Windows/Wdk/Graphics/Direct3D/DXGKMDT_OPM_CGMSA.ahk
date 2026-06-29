#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGKMDT_OPM_CGMSA {
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
    static DXGKMDT_OPM_CGMSA_OFF => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_CGMSA_COPY_FREELY => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_CGMSA_COPY_NO_MORE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_CGMSA_COPY_ONE_GENERATION => 3

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_CGMSA_COPY_NEVER => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_REDISTRIBUTION_CONTROL_REQUIRED => 8
}
