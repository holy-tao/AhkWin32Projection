#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SCM_PD_LAST_FW_ACTIVATION_STATUS.ahk
#Include .\SCM_PD_FIRMWARE_ACTIVATION_STATE.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class SCM_PD_RUNTIME_FW_ACTIVATION_INFO extends Win32Struct {
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {SCM_PD_LAST_FW_ACTIVATION_STATUS}
     */
    LastFirmwareActivationStatus {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {SCM_PD_FIRMWARE_ACTIVATION_STATE}
     */
    FirmwareActivationState {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
