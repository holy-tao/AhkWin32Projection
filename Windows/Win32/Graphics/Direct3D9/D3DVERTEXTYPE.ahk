#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DVERTEXTYPE {
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
    static D3DVT_VERTEX => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DVT_LVERTEX => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DVT_TLVERTEX => 3
}
