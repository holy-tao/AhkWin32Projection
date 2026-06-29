#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_PROPERTY_TYPE {
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
    static DhcpPropTypeByte => 0

    /**
     * @type {Integer (Int32)}
     */
    static DhcpPropTypeWord => 1

    /**
     * @type {Integer (Int32)}
     */
    static DhcpPropTypeDword => 2

    /**
     * @type {Integer (Int32)}
     */
    static DhcpPropTypeString => 3

    /**
     * @type {Integer (Int32)}
     */
    static DhcpPropTypeBinary => 4
}
