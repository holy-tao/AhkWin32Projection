#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Data.Xml.XmlLite
 */
export default struct XmlReaderProperty {
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
    static XmlReaderProperty_MultiLanguage => 0

    /**
     * @type {Integer (Int32)}
     */
    static XmlReaderProperty_ConformanceLevel => 1

    /**
     * @type {Integer (Int32)}
     */
    static XmlReaderProperty_RandomAccess => 2

    /**
     * @type {Integer (Int32)}
     */
    static XmlReaderProperty_XmlResolver => 3

    /**
     * @type {Integer (Int32)}
     */
    static XmlReaderProperty_DtdProcessing => 4

    /**
     * @type {Integer (Int32)}
     */
    static XmlReaderProperty_ReadState => 5

    /**
     * @type {Integer (Int32)}
     */
    static XmlReaderProperty_MaxElementDepth => 6

    /**
     * @type {Integer (Int32)}
     */
    static XmlReaderProperty_MaxEntityExpansion => 7

    /**
     * @type {Integer (Int32)}
     */
    static _XmlReaderProperty_Last => 7
}
