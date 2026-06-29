#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Data.Xml.XmlLite
 */
export default struct XmlStandalone {
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
    static XmlStandalone_Omit => 0

    /**
     * @type {Integer (Int32)}
     */
    static XmlStandalone_Yes => 1

    /**
     * @type {Integer (Int32)}
     */
    static XmlStandalone_No => 2

    /**
     * @type {Integer (Int32)}
     */
    static _XmlStandalone_Last => 2
}
