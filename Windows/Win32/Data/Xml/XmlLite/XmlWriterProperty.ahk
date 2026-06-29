#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Data.Xml.XmlLite
 */
export default struct XmlWriterProperty {
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
    static XmlWriterProperty_MultiLanguage => 0

    /**
     * @type {Integer (Int32)}
     */
    static XmlWriterProperty_Indent => 1

    /**
     * @type {Integer (Int32)}
     */
    static XmlWriterProperty_ByteOrderMark => 2

    /**
     * @type {Integer (Int32)}
     */
    static XmlWriterProperty_OmitXmlDeclaration => 3

    /**
     * @type {Integer (Int32)}
     */
    static XmlWriterProperty_ConformanceLevel => 4

    /**
     * @type {Integer (Int32)}
     */
    static XmlWriterProperty_CompactEmptyElement => 5

    /**
     * @type {Integer (Int32)}
     */
    static _XmlWriterProperty_Last => 5
}
