#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D
 */
export default struct D3D_FORMAT_TYPE_LEVEL {
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
    static D3DFTL_NO_TYPE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DFTL_PARTIAL_TYPE => -2

    /**
     * @type {Integer (Int32)}
     */
    static D3DFTL_FULL_TYPE => -1
}
