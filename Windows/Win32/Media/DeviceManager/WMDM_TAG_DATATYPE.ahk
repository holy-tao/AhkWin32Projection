#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WMDM\_TAG\_DATATYPE enumeration type defines a data type.
 * @see https://learn.microsoft.com/windows/win32/WMDM/wmdm-tag-datatype
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class WMDM_TAG_DATATYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_TYPE_DWORD => 0

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_TYPE_STRING => 1

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_TYPE_BINARY => 2

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_TYPE_BOOL => 3

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_TYPE_QWORD => 4

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_TYPE_WORD => 5

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_TYPE_GUID => 6

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_TYPE_DATE => 7
}
