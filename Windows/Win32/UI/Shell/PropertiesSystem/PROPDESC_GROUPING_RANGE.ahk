#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 */
export default struct PROPDESC_GROUPING_RANGE {
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
    static PDGR_DISCRETE => 0

    /**
     * @type {Integer (Int32)}
     */
    static PDGR_ALPHANUMERIC => 1

    /**
     * @type {Integer (Int32)}
     */
    static PDGR_SIZE => 2

    /**
     * @type {Integer (Int32)}
     */
    static PDGR_DYNAMIC => 3

    /**
     * @type {Integer (Int32)}
     */
    static PDGR_DATE => 4

    /**
     * @type {Integer (Int32)}
     */
    static PDGR_PERCENT => 5

    /**
     * @type {Integer (Int32)}
     */
    static PDGR_ENUMERATED => 6
}
