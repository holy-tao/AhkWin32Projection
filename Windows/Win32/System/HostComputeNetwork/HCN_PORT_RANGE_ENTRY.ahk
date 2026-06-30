#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HCN_PORT_PROTOCOL.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * HCN_PORT_RANGE_ENTRY
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HCN_PORT_RANGE_ENTRY
 * @namespace Windows.Win32.System.HostComputeNetwork
 */
class HCN_PORT_RANGE_ENTRY extends Win32Struct {
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Guid}
     */
    OwningPartitionId {
        get {
            if(!this.HasProp("__OwningPartitionId"))
                this.__OwningPartitionId := Guid(0, this)
            return this.__OwningPartitionId
        }
    }

    /**
     * @type {Guid}
     */
    TargetPartitionId {
        get {
            if(!this.HasProp("__TargetPartitionId"))
                this.__TargetPartitionId := Guid(16, this)
            return this.__TargetPartitionId
        }
    }

    /**
     * @type {HCN_PORT_PROTOCOL}
     */
    Protocol {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    Priority {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    ReservationType {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    SharingFlags {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    DeliveryMode {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    StartingPort {
        get => NumGet(this, 60, "ushort")
        set => NumPut("ushort", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    EndingPort {
        get => NumGet(this, 62, "ushort")
        set => NumPut("ushort", value, this, 62)
    }
}
