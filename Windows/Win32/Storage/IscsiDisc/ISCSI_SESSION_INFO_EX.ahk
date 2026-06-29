#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\ISCSI_UNIQUE_SESSION_ID.ahk" { ISCSI_UNIQUE_SESSION_ID }
#Import ".\ISCSI_CONNECTION_INFO_EX.ahk" { ISCSI_CONNECTION_INFO_EX }

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct ISCSI_SESSION_INFO_EX {
    #StructPack 8

    SessionId : ISCSI_UNIQUE_SESSION_ID

    InitialR2t : BOOLEAN

    ImmediateData : BOOLEAN

    Type : Int8

    DataSequenceInOrder : BOOLEAN

    DataPduInOrder : BOOLEAN

    ErrorRecoveryLevel : Int8

    MaxOutstandingR2t : UInt32

    FirstBurstLength : UInt32

    MaxBurstLength : UInt32

    MaximumConnections : UInt32

    ConnectionCount : UInt32

    Connections : ISCSI_CONNECTION_INFO_EX.Ptr

}
