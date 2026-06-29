#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct EntitlementType {
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
    static Entitled => 0

    /**
     * @type {Integer (Int32)}
     */
    static NotEntitled => 1

    /**
     * @type {Integer (Int32)}
     */
    static TechnicalFailure => 2
}
