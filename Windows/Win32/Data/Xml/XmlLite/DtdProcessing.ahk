#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Data.Xml.XmlLite
 */
export default struct DtdProcessing {
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
    static DtdProcessing_Prohibit => 0

    /**
     * @type {Integer (Int32)}
     */
    static DtdProcessing_Parse => 1

    /**
     * @type {Integer (Int32)}
     */
    static _DtdProcessing_Last => 1
}
