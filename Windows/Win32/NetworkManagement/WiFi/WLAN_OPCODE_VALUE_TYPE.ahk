#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WLAN_OPCODE_VALUE_TYPE enumeration specifies the origin of automatic configuration (auto config) settings.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_opcode_value_type~r1
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_OPCODE_VALUE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The auto config settings were queried, but the origin of the settings was not determined.
     * @type {Integer (Int32)}
     */
    static wlan_opcode_value_type_query_only => 0

    /**
     * The auto config settings were set by group policy.
     * @type {Integer (Int32)}
     */
    static wlan_opcode_value_type_set_by_group_policy => 1

    /**
     * The auto config settings were set by the user.
     * @type {Integer (Int32)}
     */
    static wlan_opcode_value_type_set_by_user => 2

    /**
     * The auto config settings are invalid.
     * @type {Integer (Int32)}
     */
    static wlan_opcode_value_type_invalid => 3
}
