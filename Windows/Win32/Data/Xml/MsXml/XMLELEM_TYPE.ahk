#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class XMLELEM_TYPE extends Win32Enum{

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
