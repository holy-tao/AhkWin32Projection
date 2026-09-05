#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class IMPORT_OBJECT_TYPE extends Win32Enum {

    /**
     * Native name: IMPORT_OBJECT_CODE
     * @type {Integer (Int32)}
     */
    static CODE => 0

    /**
     * Native name: IMPORT_OBJECT_DATA
     * @type {Integer (Int32)}
     */
    static DATA => 1

    /**
     * Native name: IMPORT_OBJECT_CONST
     * @type {Integer (Int32)}
     */
    static CONST => 2
}
