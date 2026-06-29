#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct TCG_HISTORY_ENTRY {
    #StructPack 8

    VersionNumber : Int8

    EntryLength : Int8

    PowerCycleCount : UInt16

    TcgCommandCount : UInt32

    TcgCommandCompletionTS : Int64

    InvokingId : Int64

    MethodId : Int64

    ComId : UInt16

    ProtocolId : Int8

    TcgStatus : Int8

    ProcessTime : UInt16

    CommandSpecific : Int8[10]

}
