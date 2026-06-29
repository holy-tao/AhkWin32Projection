#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct OLECMDID_OPTICAL_ZOOMFLAG {
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
    static OLECMDIDF_OPTICAL_ZOOM_NOPERSIST => 1

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_OPTICAL_ZOOM_NOLAYOUT => 16

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_OPTICAL_ZOOM_NOTRANSIENT => 32

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_OPTICAL_ZOOM_RELOADFORNEWTAB => 64
}
