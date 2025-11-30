#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class SCHEMADERIVATIONMETHOD extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMADERIVATIONMETHOD_EMPTY => 0

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMADERIVATIONMETHOD_SUBSTITUTION => 1

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMADERIVATIONMETHOD_EXTENSION => 2

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMADERIVATIONMETHOD_RESTRICTION => 4

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMADERIVATIONMETHOD_LIST => 8

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMADERIVATIONMETHOD_UNION => 16

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMADERIVATIONMETHOD_ALL => 255

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMADERIVATIONMETHOD_NONE => 256
}
