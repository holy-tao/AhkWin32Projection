#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The RAS_HARDWARE_CONDITION enumeration type specifies hardware status information about a given RAS port.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ne-mprapi-ras_hardware_condition
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
class RAS_HARDWARE_CONDITION extends Win32Enum {

    /**
     * The port is operational.
     * Native name: RAS_HARDWARE_OPERATIONAL
     * @type {Integer (Int32)}
     */
    static OPERATIONAL => 0

    /**
     * The port is not operational, due to a hardware failure.
     * Native name: RAS_HARDWARE_FAILURE
     * @type {Integer (Int32)}
     */
    static FAILURE => 1
}
