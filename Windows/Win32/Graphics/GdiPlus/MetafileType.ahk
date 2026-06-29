#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct MetafileType {
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
    static MetafileTypeInvalid => 0

    /**
     * @type {Integer (Int32)}
     */
    static MetafileTypeWmf => 1

    /**
     * @type {Integer (Int32)}
     */
    static MetafileTypeWmfPlaceable => 2

    /**
     * @type {Integer (Int32)}
     */
    static MetafileTypeEmf => 3

    /**
     * @type {Integer (Int32)}
     */
    static MetafileTypeEmfPlusOnly => 4

    /**
     * @type {Integer (Int32)}
     */
    static MetafileTypeEmfPlusDual => 5
}
