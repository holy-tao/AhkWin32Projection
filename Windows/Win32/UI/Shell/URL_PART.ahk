#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct URL_PART {
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
    static URL_PART_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static URL_PART_SCHEME => 1

    /**
     * @type {Integer (Int32)}
     */
    static URL_PART_HOSTNAME => 2

    /**
     * @type {Integer (Int32)}
     */
    static URL_PART_USERNAME => 3

    /**
     * @type {Integer (Int32)}
     */
    static URL_PART_PASSWORD => 4

    /**
     * @type {Integer (Int32)}
     */
    static URL_PART_PORT => 5

    /**
     * @type {Integer (Int32)}
     */
    static URL_PART_QUERY => 6
}
