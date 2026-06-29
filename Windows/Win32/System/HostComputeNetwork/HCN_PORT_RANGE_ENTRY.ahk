#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HCN_PORT_PROTOCOL.ahk" { HCN_PORT_PROTOCOL }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * HCN_PORT_RANGE_ENTRY
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HCN_PORT_RANGE_ENTRY
 * @namespace Windows.Win32.System.HostComputeNetwork
 */
export default struct HCN_PORT_RANGE_ENTRY {
    #StructPack 8

    OwningPartitionId : Guid

    TargetPartitionId : Guid

    Protocol : HCN_PORT_PROTOCOL

    Priority : Int64

    ReservationType : UInt32

    SharingFlags : UInt32

    DeliveryMode : UInt32

    StartingPort : UInt16

    EndingPort : UInt16

}
