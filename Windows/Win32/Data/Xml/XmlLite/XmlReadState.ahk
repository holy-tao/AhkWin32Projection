#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Data.Xml.XmlLite
 */
export default struct XmlReadState {
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
    static XmlReadState_Initial => 0

    /**
     * @type {Integer (Int32)}
     */
    static XmlReadState_Interactive => 1

    /**
     * @type {Integer (Int32)}
     */
    static XmlReadState_Error => 2

    /**
     * @type {Integer (Int32)}
     */
    static XmlReadState_EndOfFile => 3

    /**
     * @type {Integer (Int32)}
     */
    static XmlReadState_Closed => 4
}
