#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
class SCHEMAWHITESPACE extends Win32Enum {

    /**
     * Native name: SCHEMAWHITESPACE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => -1

    /**
     * Native name: SCHEMAWHITESPACE_PRESERVE
     * @type {Integer (Int32)}
     */
    static PRESERVE => 0

    /**
     * Native name: SCHEMAWHITESPACE_REPLACE
     * @type {Integer (Int32)}
     */
    static REPLACE => 1

    /**
     * Native name: SCHEMAWHITESPACE_COLLAPSE
     * @type {Integer (Int32)}
     */
    static COLLAPSE => 2
}
