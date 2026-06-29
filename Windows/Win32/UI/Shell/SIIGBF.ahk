#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SIIGBF {
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
    static SIIGBF_RESIZETOFIT => 0

    /**
     * @type {Integer (Int32)}
     */
    static SIIGBF_BIGGERSIZEOK => 1

    /**
     * @type {Integer (Int32)}
     */
    static SIIGBF_MEMORYONLY => 2

    /**
     * @type {Integer (Int32)}
     */
    static SIIGBF_ICONONLY => 4

    /**
     * @type {Integer (Int32)}
     */
    static SIIGBF_THUMBNAILONLY => 8

    /**
     * @type {Integer (Int32)}
     */
    static SIIGBF_INCACHEONLY => 16

    /**
     * @type {Integer (Int32)}
     */
    static SIIGBF_CROPTOSQUARE => 32

    /**
     * @type {Integer (Int32)}
     */
    static SIIGBF_WIDETHUMBNAILS => 64

    /**
     * @type {Integer (Int32)}
     */
    static SIIGBF_ICONBACKGROUND => 128

    /**
     * @type {Integer (Int32)}
     */
    static SIIGBF_SCALEUP => 256
}
