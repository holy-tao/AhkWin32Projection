#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
class SCHEMATYPEVARIETY extends Win32Enum {

    /**
     * Native name: SCHEMATYPEVARIETY_NONE
     * @type {Integer (Int32)}
     */
    static NONE => -1

    /**
     * Native name: SCHEMATYPEVARIETY_ATOMIC
     * @type {Integer (Int32)}
     */
    static ATOMIC => 0

    /**
     * Native name: SCHEMATYPEVARIETY_LIST
     * @type {Integer (Int32)}
     */
    static LIST => 1

    /**
     * Native name: SCHEMATYPEVARIETY_UNION
     * @type {Integer (Int32)}
     */
    static UNION => 2
}
