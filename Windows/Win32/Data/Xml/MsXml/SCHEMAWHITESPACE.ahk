#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
class SCHEMAWHITESPACE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMAWHITESPACE_NONE => -1

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMAWHITESPACE_PRESERVE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMAWHITESPACE_REPLACE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMAWHITESPACE_COLLAPSE => 2
}
