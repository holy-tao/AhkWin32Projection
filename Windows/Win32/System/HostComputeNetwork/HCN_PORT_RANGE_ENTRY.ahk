#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HCN_PORT_PROTOCOL.ahk

/**
 * HCN_PORT_RANGE_ENTRY
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HCN_PORT_RANGE_ENTRY
 * @namespace Windows.Win32.System.HostComputeNetwork
 */
class HCN_PORT_RANGE_ENTRY extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    OwningPartitionId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    TargetPartitionId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {HCN_PORT_PROTOCOL}
     */
    Protocol {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Priority {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    ReservationType {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    SharingFlags {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    DeliveryMode {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    StartingPort {
        get => NumGet(this, 44, "ushort")
        set => NumPut("ushort", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    EndingPort {
        get => NumGet(this, 46, "ushort")
        set => NumPut("ushort", value, this, 46)
    }
}
