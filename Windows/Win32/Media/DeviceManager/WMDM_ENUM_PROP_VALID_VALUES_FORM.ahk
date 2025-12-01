#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WMDM\_ENUM\_PROP\_VALID\_VALUES\_FORM enumeration type describes possible forms of valid values for a property.
 * @remarks
 * This enumeration is used in the [**WMDM\_PROP\_DESC**](wmdm-prop-desc.md) structure to specify the form of valid values for a property.
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
