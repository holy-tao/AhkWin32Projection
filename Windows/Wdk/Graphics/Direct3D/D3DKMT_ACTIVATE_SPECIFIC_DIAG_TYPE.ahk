#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_ACTIVATE_SPECIFIC_DIAG_TYPE {
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
    static D3DKMT_ACTIVATE_SPECIFIC_DIAG_TYPE_EXTRA_CCD_DATABASE_INFO => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ACTIVATE_SPECIFIC_DIAG_TYPE_MODES_PRUNED => 15
}
