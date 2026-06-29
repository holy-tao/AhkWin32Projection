#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct KCRM_PROTOCOL_BLOB {
    #StructPack 4

    ProtocolId : Guid

    StaticInfoLength : UInt32

    TransactionIdInfoLength : UInt32

    Unused1 : UInt32

    Unused2 : UInt32

}
