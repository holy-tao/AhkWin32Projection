#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes a Virtual Control Panel (VCP) code type.
 * @see https://learn.microsoft.com/windows/win32/api/lowlevelmonitorconfigurationapi/ne-lowlevelmonitorconfigurationapi-mc_vcp_code_type
 * @namespace Windows.Win32.Devices.Display
 */
export default struct MC_VCP_CODE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
