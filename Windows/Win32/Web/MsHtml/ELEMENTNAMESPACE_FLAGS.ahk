#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ELEMENTNAMESPACE_FLAGS {
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
    static ELEMENTNAMESPACEFLAGS_ALLOWANYTAG => 1

    /**
     * @type {Integer (Int32)}
     */
    static ELEMENTNAMESPACEFLAGS_QUERYFORUNKNOWNTAGS => 2

    /**
     * @type {Integer (Int32)}
     */
    static ELEMENTNAMESPACE_FLAGS_Max => 2147483647
}
