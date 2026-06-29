#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that specify the origin of the dynamic keyword address object in an [**FW_DYNAMIC_KEYWORD_ADDRESS_DATA0**](/windows/win32/api/netfw/ns-netfw-fw_dynamic_keyword_address_data0).
 * @see https://learn.microsoft.com/windows/win32/api/netfw/ne-netfw-fw_dynamic_keyword_origin_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct FW_DYNAMIC_KEYWORD_ORIGIN_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies an invalid object.
     * @type {Integer (Int32)}
     */
    static FW_DYNAMIC_KEYWORD_ORIGIN_INVALID => 0

    /**
     * Specifies a locally created object.
     * @type {Integer (Int32)}
     */
    static FW_DYNAMIC_KEYWORD_ORIGIN_LOCAL => 1

    /**
     * Specifies an MDM managed object.
     * @type {Integer (Int32)}
     */
    static FW_DYNAMIC_KEYWORD_ORIGIN_MDM => 2
}
