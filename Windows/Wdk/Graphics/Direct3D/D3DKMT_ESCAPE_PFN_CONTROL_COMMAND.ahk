#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_ESCAPE_PFN_CONTROL_COMMAND {
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
    static D3DKMT_ESCAPE_PFN_CONTROL_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_PFN_CONTROL_FORCE_CPU => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_PFN_CONTROL_FORCE_GPU => 2
}
