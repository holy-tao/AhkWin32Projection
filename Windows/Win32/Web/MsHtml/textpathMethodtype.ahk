#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct textpathMethodtype {
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
    static TEXTPATH_METHODTYPE_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static TEXTPATH_METHODTYPE_ALIGN => 1

    /**
     * @type {Integer (Int32)}
     */
    static TEXTPATH_METHODTYPE_STRETCH => 2

    /**
     * @type {Integer (Int32)}
     */
    static textpathMethodtype_Max => 2147483647
}
