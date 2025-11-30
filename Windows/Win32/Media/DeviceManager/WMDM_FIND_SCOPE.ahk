#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/WMDM/wmdm-find-scope
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class WMDM_FIND_SCOPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FIND_SCOPE_GLOBAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FIND_SCOPE_IMMEDIATE_CHILDREN => 1
}
