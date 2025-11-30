#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/WMDM/wmdm-enum-prop-valid-values-form
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class WMDM_ENUM_PROP_VALID_VALUES_FORM extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_ENUM_PROP_VALID_VALUES_ANY => 0

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_ENUM_PROP_VALID_VALUES_RANGE => 1

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_ENUM_PROP_VALID_VALUES_ENUM => 2
}
