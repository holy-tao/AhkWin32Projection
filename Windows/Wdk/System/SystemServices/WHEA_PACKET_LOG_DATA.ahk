#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_PACKET_LOG_DATA {
    #StructPack 8

    LogData : Int8[36]

    ExtraBytes : Int8[36]

    BcParam3 : IntPtr

    BcParam4 : IntPtr

    LogDataLength : UInt32

    LogTag : UInt16

    Reserved : UInt16

    Flags : IntPtr

}
