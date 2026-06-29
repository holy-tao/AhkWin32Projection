#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct TCG_PCClientTaggedEventStruct {
    #StructPack 4

    EventID : UInt32

    EventDataSize : UInt32

    EventData : Int8[1]

}
