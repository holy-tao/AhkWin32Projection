#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The values of the PROTOCOLPROPERTIES enumeration type enumerate properties of an authentication protocol.
 * @see https://learn.microsoft.com/windows/win32/api/sdoias/ne-sdoias-protocolproperties
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 */
export default struct PROTOCOLPROPERTIES {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The value is reserved for system use.
     * @type {Integer (Int32)}
     */
    static PROPERTY_PROTOCOL_REQUEST_HANDLER => 1026

    /**
     * This value is the default.
     * @type {Integer (Int32)}
     */
    static PROPERTY_PROTOCOL_START => 1027
}
