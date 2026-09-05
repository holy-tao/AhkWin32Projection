#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
class SCHEMAPROCESSCONTENTS extends Win32Enum {

    /**
     * Native name: SCHEMAPROCESSCONTENTS_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: SCHEMAPROCESSCONTENTS_SKIP
     * @type {Integer (Int32)}
     */
    static SKIP => 1

    /**
     * Native name: SCHEMAPROCESSCONTENTS_LAX
     * @type {Integer (Int32)}
     */
    static LAX => 2

    /**
     * Native name: SCHEMAPROCESSCONTENTS_STRICT
     * @type {Integer (Int32)}
     */
    static STRICT => 3
}
