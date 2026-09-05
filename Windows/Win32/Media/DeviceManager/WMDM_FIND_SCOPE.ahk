#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WMDM\_FIND\_SCOPE enumeration type defines the scope of the storage object.
 * @see https://learn.microsoft.com/windows/win32/WMDM/wmdm-find-scope
 * @namespace Windows.Win32.Media.DeviceManager
 */
class WMDM_FIND_SCOPE extends Win32Enum {

    /**
     * Native name: WMDM_FIND_SCOPE_GLOBAL
     * @type {Integer (Int32)}
     */
    static GLOBAL => 0

    /**
     * Native name: WMDM_FIND_SCOPE_IMMEDIATE_CHILDREN
     * @type {Integer (Int32)}
     */
    static IMMEDIATE_CHILDREN => 1
}
