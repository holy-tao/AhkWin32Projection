#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct CM_PCCARD_DEVICE_DATA {
    #StructPack 4

    Flags : Int8

    ErrorCode : Int8

    Reserved : UInt16

    BusData : UInt32

    DeviceId : UInt32

    LegacyBaseAddress : UInt32

    IRQMap : Int8[16]

}
