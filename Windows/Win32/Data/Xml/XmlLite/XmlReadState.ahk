#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Data.Xml.XmlLite
 */
class XmlReadState extends Win32Enum {

    /**
     * Native name: XmlReadState_Initial
     * @type {Integer (Int32)}
     */
    static Initial => 0

    /**
     * Native name: XmlReadState_Interactive
     * @type {Integer (Int32)}
     */
    static Interactive => 1

    /**
     * Native name: XmlReadState_Error
     * @type {Integer (Int32)}
     */
    static Error => 2

    /**
     * Native name: XmlReadState_EndOfFile
     * @type {Integer (Int32)}
     */
    static EndOfFile => 3

    /**
     * Native name: XmlReadState_Closed
     * @type {Integer (Int32)}
     */
    static Closed => 4
}
