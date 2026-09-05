#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WMDM\_TAG\_DATATYPE enumeration type defines a data type.
 * @see https://learn.microsoft.com/windows/win32/WMDM/wmdm-tag-datatype
 * @namespace Windows.Win32.Media.DeviceManager
 */
class WMDM_TAG_DATATYPE extends Win32Enum {

    /**
     * Native name: WMDM_TYPE_DWORD
     * @type {Integer (Int32)}
     */
    static TYPE_DWORD => 0

    /**
     * Native name: WMDM_TYPE_STRING
     * @type {Integer (Int32)}
     */
    static TYPE_STRING => 1

    /**
     * Native name: WMDM_TYPE_BINARY
     * @type {Integer (Int32)}
     */
    static TYPE_BINARY => 2

    /**
     * Native name: WMDM_TYPE_BOOL
     * @type {Integer (Int32)}
     */
    static TYPE_BOOL => 3

    /**
     * Native name: WMDM_TYPE_QWORD
     * @type {Integer (Int32)}
     */
    static TYPE_QWORD => 4

    /**
     * Native name: WMDM_TYPE_WORD
     * @type {Integer (Int32)}
     */
    static TYPE_WORD => 5

    /**
     * Native name: WMDM_TYPE_GUID
     * @type {Integer (Int32)}
     */
    static TYPE_GUID => 6

    /**
     * Native name: WMDM_TYPE_DATE
     * @type {Integer (Int32)}
     */
    static TYPE_DATE => 7
}
