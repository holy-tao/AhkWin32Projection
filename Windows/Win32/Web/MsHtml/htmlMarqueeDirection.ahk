#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct htmlMarqueeDirection {
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
    static htmlMarqueeDirectionleft => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlMarqueeDirectionright => 3

    /**
     * @type {Integer (Int32)}
     */
    static htmlMarqueeDirectionup => 5

    /**
     * @type {Integer (Int32)}
     */
    static htmlMarqueeDirectiondown => 7

    /**
     * @type {Integer (Int32)}
     */
    static htmlMarqueeDirection_Max => 2147483647
}
