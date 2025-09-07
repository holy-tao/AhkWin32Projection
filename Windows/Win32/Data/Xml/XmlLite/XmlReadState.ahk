#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Data.Xml.XmlLite
 * @version v4.0.30319
 */
class XmlReadState{

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
