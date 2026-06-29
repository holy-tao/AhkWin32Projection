#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WMDM\_ENUM\_PROP\_VALID\_VALUES\_FORM enumeration type describes possible forms of valid values for a property.
 * @remarks
 * This enumeration is used in the [**WMDM\_PROP\_DESC**](wmdm-prop-desc.md) structure to specify the form of valid values for a property.
 * @see https://learn.microsoft.com/windows/win32/WMDM/wmdm-enum-prop-valid-values-form
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct WMDM_ENUM_PROP_VALID_VALUES_FORM {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
