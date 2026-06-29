#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct SRB_IO_CONTROL {
    #StructPack 4

    HeaderLength : UInt32

    Signature : Int8[8]

    Timeout : UInt32

    ControlCode : UInt32

    ReturnCode : UInt32

    Length : UInt32

}
