#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct TCG_PCClientPCREventStruct {
    #StructPack 4

    pcrIndex : UInt32

    eventType : UInt32

    digest : Int8[20]

    eventDataSize : UInt32

    event : Int8[1]

}
