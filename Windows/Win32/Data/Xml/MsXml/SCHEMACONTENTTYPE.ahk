#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class SCHEMACONTENTTYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMACONTENTTYPE_EMPTY => 0

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMACONTENTTYPE_TEXTONLY => 1

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMACONTENTTYPE_ELEMENTONLY => 2

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMACONTENTTYPE_MIXED => 3
}
