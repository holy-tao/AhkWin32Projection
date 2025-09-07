#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes a Virtual Control Panel (VCP) code type.
 * @see https://learn.microsoft.com/windows/win32/api/lowlevelmonitorconfigurationapi/ne-lowlevelmonitorconfigurationapi-mc_vcp_code_type
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class MC_VCP_CODE_TYPE{

    /**
     * Momentary VCP code. Sending a command of this type causes the monitor to initiate a self-timed operation and then revert to its original state. Examples include display tests and degaussing.
     * @type {Integer (Int32)}
     */
    static MC_MOMENTARY => 0

    /**
     * Set Parameter VCP code. Sending a command of this type changes some aspect of the monitor's operation.
     * @type {Integer (Int32)}
     */
    static MC_SET_PARAMETER => 1
}
