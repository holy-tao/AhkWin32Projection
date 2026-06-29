#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_PROCESS_VERIFIER_OPTION_TYPE {
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
    static D3DKMT_PROCESS_VERIFIER_OPTION_VIDMM_FLAGS => 1000

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_PROCESS_VERIFIER_OPTION_VIDMM_RESTRICT_BUDGET => 1001
}
