#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_SERVICE_LOOKUP_TYPE {
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
    static MF_SERVICE_LOOKUP_UPSTREAM => 0

    /**
     * @type {Integer (Int32)}
     */
    static MF_SERVICE_LOOKUP_UPSTREAM_DIRECT => 1

    /**
     * @type {Integer (Int32)}
     */
    static MF_SERVICE_LOOKUP_DOWNSTREAM => 2

    /**
     * @type {Integer (Int32)}
     */
    static MF_SERVICE_LOOKUP_DOWNSTREAM_DIRECT => 3

    /**
     * @type {Integer (Int32)}
     */
    static MF_SERVICE_LOOKUP_ALL => 4

    /**
     * @type {Integer (Int32)}
     */
    static MF_SERVICE_LOOKUP_GLOBAL => 5
}
