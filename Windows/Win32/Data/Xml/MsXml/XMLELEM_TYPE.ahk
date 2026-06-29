#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct XMLELEM_TYPE {
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
    static XMLELEMTYPE_ELEMENT => 0

    /**
     * @type {Integer (Int32)}
     */
    static XMLELEMTYPE_TEXT => 1

    /**
     * @type {Integer (Int32)}
     */
    static XMLELEMTYPE_COMMENT => 2

    /**
     * @type {Integer (Int32)}
     */
    static XMLELEMTYPE_DOCUMENT => 3

    /**
     * @type {Integer (Int32)}
     */
    static XMLELEMTYPE_DTD => 4

    /**
     * @type {Integer (Int32)}
     */
    static XMLELEMTYPE_PI => 5

    /**
     * @type {Integer (Int32)}
     */
    static XMLELEMTYPE_OTHER => 6
}
