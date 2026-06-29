#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PEER_DATA.ahk" { PEER_DATA }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Points to the PEER_EVENT_INCOMING_DATA structure if one of the following peer events is triggered.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_event_incoming_data
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_EVENT_INCOMING_DATA {
    #StructPack 8

    /**
     * Specifies the size of a structure.
     */
    dwSize : UInt32

    /**
     * Specifies the unique ID of a data connection.
     */
    ullConnectionId : Int64

    /**
     * Specifies the application-defined data type of  incoming data.
     */
    type : Guid

    /**
     * Specifies the actual data received.
     * @deprecated
     */
    data : PEER_DATA

}
