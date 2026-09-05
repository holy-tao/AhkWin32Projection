#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
class SCHEMAUSE extends Win32Enum {

    /**
     * Native name: SCHEMAUSE_OPTIONAL
     * @type {Integer (Int32)}
     */
    static OPTIONAL => 0

    /**
     * Native name: SCHEMAUSE_PROHIBITED
     * @type {Integer (Int32)}
     */
    static PROHIBITED => 1

    /**
     * Native name: SCHEMAUSE_REQUIRED
     * @type {Integer (Int32)}
     */
    static REQUIRED => 2
}
