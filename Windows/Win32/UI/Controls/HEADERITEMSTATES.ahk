#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct HEADERITEMSTATES {
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
    static HIS_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static HIS_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static HIS_PRESSED => 3

    /**
     * @type {Integer (Int32)}
     */
    static HIS_SORTEDNORMAL => 4

    /**
     * @type {Integer (Int32)}
     */
    static HIS_SORTEDHOT => 5

    /**
     * @type {Integer (Int32)}
     */
    static HIS_SORTEDPRESSED => 6

    /**
     * @type {Integer (Int32)}
     */
    static HIS_ICONNORMAL => 7

    /**
     * @type {Integer (Int32)}
     */
    static HIS_ICONHOT => 8

    /**
     * @type {Integer (Int32)}
     */
    static HIS_ICONPRESSED => 9

    /**
     * @type {Integer (Int32)}
     */
    static HIS_ICONSORTEDNORMAL => 10

    /**
     * @type {Integer (Int32)}
     */
    static HIS_ICONSORTEDHOT => 11

    /**
     * @type {Integer (Int32)}
     */
    static HIS_ICONSORTEDPRESSED => 12
}
