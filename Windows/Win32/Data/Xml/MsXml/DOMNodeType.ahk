#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct DOMNodeType {
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
    static NODE_INVALID => 0

    /**
     * @type {Integer (Int32)}
     */
    static NODE_ELEMENT => 1

    /**
     * @type {Integer (Int32)}
     */
    static NODE_ATTRIBUTE => 2

    /**
     * @type {Integer (Int32)}
     */
    static NODE_TEXT => 3

    /**
     * @type {Integer (Int32)}
     */
    static NODE_CDATA_SECTION => 4

    /**
     * @type {Integer (Int32)}
     */
    static NODE_ENTITY_REFERENCE => 5

    /**
     * @type {Integer (Int32)}
     */
    static NODE_ENTITY => 6

    /**
     * @type {Integer (Int32)}
     */
    static NODE_PROCESSING_INSTRUCTION => 7

    /**
     * @type {Integer (Int32)}
     */
    static NODE_COMMENT => 8

    /**
     * @type {Integer (Int32)}
     */
    static NODE_DOCUMENT => 9

    /**
     * @type {Integer (Int32)}
     */
    static NODE_DOCUMENT_TYPE => 10

    /**
     * @type {Integer (Int32)}
     */
    static NODE_DOCUMENT_FRAGMENT => 11

    /**
     * @type {Integer (Int32)}
     */
    static NODE_NOTATION => 12
}
