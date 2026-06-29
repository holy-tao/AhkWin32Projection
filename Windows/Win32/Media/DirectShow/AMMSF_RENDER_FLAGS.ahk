#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AMMSF_RENDER_FLAGS {
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
    static AMMSF_RENDERTYPEMASK => 3

    /**
     * @type {Integer (Int32)}
     */
    static AMMSF_RENDERTOEXISTING => 0

    /**
     * @type {Integer (Int32)}
     */
    static AMMSF_RENDERALLSTREAMS => 1

    /**
     * @type {Integer (Int32)}
     */
    static AMMSF_NORENDER => 2

    /**
     * @type {Integer (Int32)}
     */
    static AMMSF_NOCLOCK => 4

    /**
     * @type {Integer (Int32)}
     */
    static AMMSF_RUN => 8
}
