#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct GPMEntryType {
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
    static typeUser => 0

    /**
     * @type {Integer (Int32)}
     */
    static typeComputer => 1

    /**
     * @type {Integer (Int32)}
     */
    static typeLocalGroup => 2

    /**
     * @type {Integer (Int32)}
     */
    static typeGlobalGroup => 3

    /**
     * @type {Integer (Int32)}
     */
    static typeUniversalGroup => 4

    /**
     * @type {Integer (Int32)}
     */
    static typeUNCPath => 5

    /**
     * @type {Integer (Int32)}
     */
    static typeUnknown => 6
}
