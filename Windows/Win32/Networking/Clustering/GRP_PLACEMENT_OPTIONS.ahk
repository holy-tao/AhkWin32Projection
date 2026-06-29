#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct GRP_PLACEMENT_OPTIONS {
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
    static GRP_PLACEMENT_OPTIONS_MIN_VALUE => 0

    /**
     * @type {Integer (Int32)}
     */
    static GRP_PLACEMENT_OPTIONS_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static GRP_PLACEMENT_OPTIONS_DISABLE_AUTOBALANCING => 1

    /**
     * @type {Integer (Int32)}
     */
    static GRP_PLACEMENT_OPTIONS_ALL => 1
}
