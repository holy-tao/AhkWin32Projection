#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
class SCHEMACONTENTTYPE extends Win32Enum {

    /**
     * Native name: SCHEMACONTENTTYPE_EMPTY
     * @type {Integer (Int32)}
     */
    static EMPTY => 0

    /**
     * Native name: SCHEMACONTENTTYPE_TEXTONLY
     * @type {Integer (Int32)}
     */
    static TEXTONLY => 1

    /**
     * Native name: SCHEMACONTENTTYPE_ELEMENTONLY
     * @type {Integer (Int32)}
     */
    static ELEMENTONLY => 2

    /**
     * Native name: SCHEMACONTENTTYPE_MIXED
     * @type {Integer (Int32)}
     */
    static MIXED => 3
}
