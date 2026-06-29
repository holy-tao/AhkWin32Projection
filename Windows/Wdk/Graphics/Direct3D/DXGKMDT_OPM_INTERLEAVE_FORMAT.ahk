#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGKMDT_OPM_INTERLEAVE_FORMAT {
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
    static DXGKMDT_OPM_INTERLEAVE_FORMAT_OTHER => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_INTERLEAVE_FORMAT_PROGRESSIVE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_INTERLEAVE_FORMAT_INTERLEAVED_EVEN_FIRST => 3

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_INTERLEAVE_FORMAT_INTERLEAVED_ODD_FIRST => 4
}
