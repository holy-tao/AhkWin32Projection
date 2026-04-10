#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
class SCHEMATYPEVARIETY extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMATYPEVARIETY_NONE => -1

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMATYPEVARIETY_ATOMIC => 0

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMATYPEVARIETY_LIST => 1

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMATYPEVARIETY_UNION => 2
}
