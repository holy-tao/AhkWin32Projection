#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct OLECMDID_VIEWPORT_MODE_FLAG {
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
    static OLECMDIDF_VIEWPORTMODE_FIXED_LAYOUT_WIDTH => 1

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_VIEWPORTMODE_EXCLUDE_VISUAL_BOTTOM => 2

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_VIEWPORTMODE_FIXED_LAYOUT_WIDTH_VALID => 65536

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_VIEWPORTMODE_EXCLUDE_VISUAL_BOTTOM_VALID => 131072
}
