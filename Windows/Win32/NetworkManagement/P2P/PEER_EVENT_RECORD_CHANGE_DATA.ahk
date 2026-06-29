#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PEER_RECORD_CHANGE_TYPE.ahk" { PEER_RECORD_CHANGE_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Points to the PEER_EVENT_RECORD_CHANGE_DATA structure if one of the following peer events is triggered.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_event_record_change_data
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_EVENT_RECORD_CHANGE_DATA {
    #StructPack 4

    /**
     * Specifies the size of a structure.
     */
    dwSize : UInt32

    /**
     * Specifies the type of change to a record or record type.
     * @deprecated
     */
    changeType : PEER_RECORD_CHANGE_TYPE

    /**
     * Specifies the unique  ID of a changed record.
     */
    recordId : Guid

    /**
     * Specifies the unique  record type of a changed record.
     */
    recordType : Guid

}
