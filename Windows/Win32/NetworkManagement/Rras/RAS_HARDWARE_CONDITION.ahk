#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The RAS_HARDWARE_CONDITION enumeration type specifies hardware status information about a given RAS port.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ne-mprapi-ras_hardware_condition
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RAS_HARDWARE_CONDITION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The port is operational.
     * @type {Integer (Int32)}
     */
    static RAS_HARDWARE_OPERATIONAL => 0

    /**
     * The port is not operational, due to a hardware failure.
     * @type {Integer (Int32)}
     */
    static RAS_HARDWARE_FAILURE => 1
}
