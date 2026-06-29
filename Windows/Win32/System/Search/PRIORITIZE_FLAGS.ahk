#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct PRIORITIZE_FLAGS {
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
    static PRIORITIZE_FLAG_RETRYFAILEDITEMS => 1

    /**
     * @type {Integer (Int32)}
     */
    static PRIORITIZE_FLAG_IGNOREFAILURECOUNT => 2
}
