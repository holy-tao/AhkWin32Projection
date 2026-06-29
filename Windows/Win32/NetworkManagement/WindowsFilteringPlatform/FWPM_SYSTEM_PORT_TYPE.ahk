#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The FWPM_SYSTEM_PORT_TYPE enumerated type.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ne-fwpmtypes-fwpm_system_port_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_SYSTEM_PORT_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies a system port used by an RPC endpoint mapper.
     * @type {Integer (Int32)}
     */
    static FWPM_SYSTEM_PORT_RPC_EPMAP => 0

    /**
     * Specifies a system port used by the Teredo service.
     * @type {Integer (Int32)}
     */
    static FWPM_SYSTEM_PORT_TEREDO => 1

    /**
     * Specifies an inbound system port used by the IP in conjunction with HTTPS implementation.
     * @type {Integer (Int32)}
     */
    static FWPM_SYSTEM_PORT_IPHTTPS_IN => 2

    /**
     * Specifies an outbound system port used by the IP in conjunction with HTTPS implementation.
     * @type {Integer (Int32)}
     */
    static FWPM_SYSTEM_PORT_IPHTTPS_OUT => 3

    /**
     * Maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static FWPM_SYSTEM_PORT_TYPE_MAX => 4
}
