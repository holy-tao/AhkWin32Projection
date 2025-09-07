#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a 64 bit entry specifying information about idle time and power state transition for each of the allowable 32 power states.
 * @remarks
 * This structure is used in the Autonomous Power State Transition Enable (**APSTE**) parameter of the [NVME_CDW11_FEATURE_AUTO_POWER_STATE_TRANSITION](ns-nvme-nvme_cdw11_feature_auto_power_state_transition.md) structure.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_auto_power_state_transition_entry
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_AUTO_POWER_STATE_TRANSITION_ENTRY extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Bits 32-63 are reserved.
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
