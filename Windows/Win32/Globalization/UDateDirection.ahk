#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UDateDirection {
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
    static UDAT_DIRECTION_LAST_2 => 0

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_DIRECTION_LAST => 1

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_DIRECTION_THIS => 2

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_DIRECTION_NEXT => 3

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_DIRECTION_NEXT_2 => 4

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_DIRECTION_PLAIN => 5

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_DIRECTION_COUNT => 6
}
