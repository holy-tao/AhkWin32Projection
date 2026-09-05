#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 */
class WBEM_LIMITATION_FLAG_TYPE extends Win32Enum {

    /**
     * Native name: WBEM_FLAG_EXCLUDE_OBJECT_QUALIFIERS
     * @type {Integer (Int32)}
     */
    static EXCLUDE_OBJECT_QUALIFIERS => 16

    /**
     * Native name: WBEM_FLAG_EXCLUDE_PROPERTY_QUALIFIERS
     * @type {Integer (Int32)}
     */
    static EXCLUDE_PROPERTY_QUALIFIERS => 32
}
