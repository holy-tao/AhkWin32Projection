#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_DEFRAG_ESCAPE_OPERATION {
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
    static D3DKMT_DEFRAG_ESCAPE_GET_FRAGMENTATION_STATS => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DEFRAG_ESCAPE_DEFRAG_UPWARD => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DEFRAG_ESCAPE_DEFRAG_DOWNWARD => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DEFRAG_ESCAPE_DEFRAG_PASS => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DEFRAG_ESCAPE_VERIFY_TRANSFER => 4
}
