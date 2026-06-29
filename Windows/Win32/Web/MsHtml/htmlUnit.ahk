#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct htmlUnit {
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
    static htmlUnitCharacter => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlUnitWord => 2

    /**
     * @type {Integer (Int32)}
     */
    static htmlUnitSentence => 3

    /**
     * @type {Integer (Int32)}
     */
    static htmlUnitTextEdit => 6

    /**
     * @type {Integer (Int32)}
     */
    static htmlUnit_Max => 2147483647
}
