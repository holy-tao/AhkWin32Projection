#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WMDM\_ENUM\_PROP\_VALID\_VALUES\_FORM enumeration type describes possible forms of valid values for a property.
 * @remarks
 * This enumeration is used in the [**WMDM\_PROP\_DESC**](wmdm-prop-desc.md) structure to specify the form of valid values for a property.
 * @see https://learn.microsoft.com/windows/win32/WMDM/wmdm-enum-prop-valid-values-form
 * @namespace Windows.Win32.Media.DeviceManager
 */
class WMDM_ENUM_PROP_VALID_VALUES_FORM extends Win32Enum {

    /**
     * Native name: WMDM_ENUM_PROP_VALID_VALUES_ANY
     * @type {Integer (Int32)}
     */
    static ANY => 0

    /**
     * Native name: WMDM_ENUM_PROP_VALID_VALUES_RANGE
     * @type {Integer (Int32)}
     */
    static RANGE => 1

    /**
     * Native name: WMDM_ENUM_PROP_VALID_VALUES_ENUM
     * @type {Integer (Int32)}
     */
    static ENUM => 2
}
