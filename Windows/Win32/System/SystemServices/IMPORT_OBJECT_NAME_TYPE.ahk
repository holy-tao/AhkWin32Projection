#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class IMPORT_OBJECT_NAME_TYPE extends Win32Enum {

    /**
     * Native name: IMPORT_OBJECT_ORDINAL
     * @type {Integer (Int32)}
     */
    static ORDINAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static IMPORT_OBJECT_NAME => 1

    /**
     * Native name: IMPORT_OBJECT_NAME_NO_PREFIX
     * @type {Integer (Int32)}
     */
    static NO_PREFIX => 2

    /**
     * Native name: IMPORT_OBJECT_NAME_UNDECORATE
     * @type {Integer (Int32)}
     */
    static UNDECORATE => 3

    /**
     * Native name: IMPORT_OBJECT_NAME_EXPORTAS
     * @type {Integer (Int32)}
     */
    static EXPORTAS => 4
}
