#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ISCSI_UNIQUE_SESSION_ID.ahk" { ISCSI_UNIQUE_SESSION_ID }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * ISCSI_CONNECTION_INFO structure contains information about a connection. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The iscsidsc.h header defines ISCSI_CONNECTION_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/ns-iscsidsc-iscsi_connection_infoa
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @charset ANSI
 */
export default struct ISCSI_CONNECTION_INFOA {
    #StructPack 8

    /**
     * A ISCSI_UNIQUE_CONNECTION_ID structure that contains the unique identifier for a connection. The LoginIScsiTarget and AddIScsiConnection functions return this value via the UniqueConnectionId parameter.
     */
    ConnectionId : ISCSI_UNIQUE_SESSION_ID

    /**
     * A string that represents the IP address of the initiator.
     */
    InitiatorAddress : PSTR

    /**
     * A string that represents the IP address of the target.
     */
    TargetAddress : PSTR

    /**
     * The socket number on the initiator that establishes the connection.
     */
    InitiatorSocket : UInt16

    /**
     * The socket number on the target that establishes the connection.
     */
    TargetSocket : UInt16

    /**
     * The connection identifier for the connection.
     */
    CID : Int8[2]

}
