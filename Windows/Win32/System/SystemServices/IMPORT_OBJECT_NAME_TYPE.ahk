#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class IMPORT_OBJECT_NAME_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static IMPORT_OBJECT_ORDINAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static IMPORT_OBJECT_NAME => 1

    /**
     * @type {Integer (Int32)}
     */
    static IMPORT_OBJECT_NAME_NO_PREFIX => 2

    /**
     * @type {Integer (Int32)}
     */
    static IMPORT_OBJECT_NAME_UNDECORATE => 3

    /**
     * @type {Integer (Int32)}
     */
    static IMPORT_OBJECT_NAME_EXPORTAS => 4
}
