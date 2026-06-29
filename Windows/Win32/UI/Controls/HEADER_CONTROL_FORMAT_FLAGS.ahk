#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct HEADER_CONTROL_FORMAT_FLAGS {
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
    static HDF_LEFT => 0

    /**
     * @type {Integer (Int32)}
     */
    static HDF_RIGHT => 1

    /**
     * @type {Integer (Int32)}
     */
    static HDF_CENTER => 2

    /**
     * @type {Integer (Int32)}
     */
    static HDF_JUSTIFYMASK => 3

    /**
     * @type {Integer (Int32)}
     */
    static HDF_RTLREADING => 4

    /**
     * @type {Integer (Int32)}
     */
    static HDF_BITMAP => 8192

    /**
     * @type {Integer (Int32)}
     */
    static HDF_STRING => 16384

    /**
     * @type {Integer (Int32)}
     */
    static HDF_OWNERDRAW => 32768

    /**
     * @type {Integer (Int32)}
     */
    static HDF_IMAGE => 2048

    /**
     * @type {Integer (Int32)}
     */
    static HDF_BITMAP_ON_RIGHT => 4096

    /**
     * @type {Integer (Int32)}
     */
    static HDF_SORTUP => 1024

    /**
     * @type {Integer (Int32)}
     */
    static HDF_SORTDOWN => 512

    /**
     * @type {Integer (Int32)}
     */
    static HDF_CHECKBOX => 64

    /**
     * @type {Integer (Int32)}
     */
    static HDF_CHECKED => 128

    /**
     * @type {Integer (Int32)}
     */
    static HDF_FIXEDWIDTH => 256

    /**
     * @type {Integer (Int32)}
     */
    static HDF_SPLITBUTTON => 16777216
}
