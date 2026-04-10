#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDIS_DEVICE_POWER_STATE.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
class NDIS_PM_WAKE_UP_CAPABILITIES extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {NDIS_DEVICE_POWER_STATE}
     */
    MinMagicPacketWakeUp {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {NDIS_DEVICE_POWER_STATE}
     */
    MinPatternWakeUp {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {NDIS_DEVICE_POWER_STATE}
     */
    MinLinkChangeWakeUp {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
