#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
class SCHEMAPROCESSCONTENTS extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMAPROCESSCONTENTS_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMAPROCESSCONTENTS_SKIP => 1

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMAPROCESSCONTENTS_LAX => 2

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMAPROCESSCONTENTS_STRICT => 3
}
