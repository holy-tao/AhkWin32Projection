#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct MSIMODIFY {
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
    static MSIMODIFY_SEEK => -1

    /**
     * @type {Integer (Int32)}
     */
    static MSIMODIFY_REFRESH => 0

    /**
     * @type {Integer (Int32)}
     */
    static MSIMODIFY_INSERT => 1

    /**
     * @type {Integer (Int32)}
     */
    static MSIMODIFY_UPDATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static MSIMODIFY_ASSIGN => 3

    /**
     * @type {Integer (Int32)}
     */
    static MSIMODIFY_REPLACE => 4

    /**
     * @type {Integer (Int32)}
     */
    static MSIMODIFY_MERGE => 5

    /**
     * @type {Integer (Int32)}
     */
    static MSIMODIFY_DELETE => 6

    /**
     * @type {Integer (Int32)}
     */
    static MSIMODIFY_INSERT_TEMPORARY => 7

    /**
     * @type {Integer (Int32)}
     */
    static MSIMODIFY_VALIDATE => 8

    /**
     * @type {Integer (Int32)}
     */
    static MSIMODIFY_VALIDATE_NEW => 9

    /**
     * @type {Integer (Int32)}
     */
    static MSIMODIFY_VALIDATE_FIELD => 10

    /**
     * @type {Integer (Int32)}
     */
    static MSIMODIFY_VALIDATE_DELETE => 11
}
