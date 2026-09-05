#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes a Virtual Control Panel (VCP) code type.
 * @see https://learn.microsoft.com/windows/win32/api/lowlevelmonitorconfigurationapi/ne-lowlevelmonitorconfigurationapi-mc_vcp_code_type
 * @namespace Windows.Win32.Devices.Display
 */
class MC_VCP_CODE_TYPE extends Win32Enum {

    /**
     * Momentary VCP code. Sending a command of this type causes the monitor to initiate a self-timed operation and then revert to its original state. Examples include display tests and degaussing.
     * Native name: MC_MOMENTARY
     * @type {Integer (Int32)}
     */
    static MOMENTARY => 0

    /**
     * Set Parameter VCP code. Sending a command of this type changes some aspect of the monitor's operation.
     * Native name: MC_SET_PARAMETER
     * @type {Integer (Int32)}
     */
    static SET_PARAMETER => 1
}
