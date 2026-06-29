#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct VIEW_OBJECT_COMPOSITION_MODE {
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
    static VIEW_OBJECT_COMPOSITION_MODE_LEGACY => 0

    /**
     * @type {Integer (Int32)}
     */
    static VIEW_OBJECT_COMPOSITION_MODE_SURFACEPRESENTER => 1

    /**
     * @type {Integer (Int32)}
     */
    static VIEW_OBJECT_COMPOSITION_MODE_Max => 2147483647
}
