#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct SCHEMAUSE {
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
    static SCHEMAUSE_OPTIONAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMAUSE_PROHIBITED => 1

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMAUSE_REQUIRED => 2
}
