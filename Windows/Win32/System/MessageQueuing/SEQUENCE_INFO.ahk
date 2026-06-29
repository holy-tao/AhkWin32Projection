#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct SEQUENCE_INFO {
    #StructPack 8

    SeqID : Int64

    SeqNo : UInt32

    PrevNo : UInt32

}
