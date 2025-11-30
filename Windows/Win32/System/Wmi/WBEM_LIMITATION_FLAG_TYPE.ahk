#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WBEM_LIMITATION_FLAG_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_EXCLUDE_OBJECT_QUALIFIERS => 16

    /**
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_EXCLUDE_PROPERTY_QUALIFIERS => 32
}
