#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
class SCHEMADERIVATIONMETHOD extends Win32Enum {

    /**
     * Native name: SCHEMADERIVATIONMETHOD_EMPTY
     * @type {Integer (Int32)}
     */
    static EMPTY => 0

    /**
     * Native name: SCHEMADERIVATIONMETHOD_SUBSTITUTION
     * @type {Integer (Int32)}
     */
    static SUBSTITUTION => 1

    /**
     * Native name: SCHEMADERIVATIONMETHOD_EXTENSION
     * @type {Integer (Int32)}
     */
    static EXTENSION => 2

    /**
     * Native name: SCHEMADERIVATIONMETHOD_RESTRICTION
     * @type {Integer (Int32)}
     */
    static RESTRICTION => 4

    /**
     * Native name: SCHEMADERIVATIONMETHOD_LIST
     * @type {Integer (Int32)}
     */
    static LIST => 8

    /**
     * Native name: SCHEMADERIVATIONMETHOD_UNION
     * @type {Integer (Int32)}
     */
    static UNION => 16

    /**
     * Native name: SCHEMADERIVATIONMETHOD_ALL
     * @type {Integer (Int32)}
     */
    static ALL => 255

    /**
     * Native name: SCHEMADERIVATIONMETHOD_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 256
}
