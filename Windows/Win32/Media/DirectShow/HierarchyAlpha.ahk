#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct HierarchyAlpha {
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
    static BDA_HALPHA_NOT_SET => -1

    /**
     * @type {Integer (Int32)}
     */
    static BDA_HALPHA_NOT_DEFINED => 0

    /**
     * @type {Integer (Int32)}
     */
    static BDA_HALPHA_1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static BDA_HALPHA_2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static BDA_HALPHA_4 => 3

    /**
     * @type {Integer (Int32)}
     */
    static BDA_HALPHA_MAX => 4
}
