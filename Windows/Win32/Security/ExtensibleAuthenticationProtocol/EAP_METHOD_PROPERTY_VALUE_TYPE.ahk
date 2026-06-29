#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the set of possible data types for an EAP method property value.
 * @see https://learn.microsoft.com/windows/win32/api/eaptypes/ne-eaptypes-eap_method_property_value_type
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct EAP_METHOD_PROPERTY_VALUE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The method property value is of type <b>BOOL</b>.
     * @type {Integer (Int32)}
     */
    static empvtBool => 0

    /**
     * The method property value is of type <b>DWORD</b>.
     * @type {Integer (Int32)}
     */
    static empvtDword => 1

    /**
     * The method property value is a pointer to a value of type  <b>BYTE</b>.
     * @type {Integer (Int32)}
     */
    static empvtString => 2
}
