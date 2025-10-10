#Requires AutoHotkey v2.0.0 64-bit

/**
 * The RAS_HARDWARE_CONDITION enumeration type specifies hardware status information about a given RAS port.
 * @see https://docs.microsoft.com/windows/win32/api//mprapi/ne-mprapi-ras_hardware_condition
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RAS_HARDWARE_CONDITION{

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
