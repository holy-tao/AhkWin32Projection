#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ISCSI_AUTH_TYPES.ahk" { ISCSI_AUTH_TYPES }
#Import ".\ISCSI_UNIQUE_SESSION_ID.ahk" { ISCSI_UNIQUE_SESSION_ID }

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct ISCSI_CONNECTION_INFO_EX {
    #StructPack 8

    ConnectionId : ISCSI_UNIQUE_SESSION_ID

    State : Int8

    Protocol : Int8

    HeaderDigest : Int8

    DataDigest : Int8

    MaxRecvDataSegmentLength : UInt32

    AuthType : ISCSI_AUTH_TYPES

    EstimatedThroughput : Int64

    MaxDatagramSize : UInt32

}
