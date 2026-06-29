#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ISCSI_CONNECTION_INFOA.ahk" { ISCSI_CONNECTION_INFOA }
#Import ".\ISCSI_UNIQUE_SESSION_ID.ahk" { ISCSI_UNIQUE_SESSION_ID }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * ISCSI_SESSION_INFO. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The iscsidsc.h header defines ISCSI_SESSION_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/ns-iscsidsc-iscsi_session_infoa
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @charset ANSI
 */
export default struct ISCSI_SESSION_INFOA {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_unique_session_id">ISCSI_UNIQUE_SESSION_ID</a> structure containing a unique identifier that represents the session.
     */
    SessionId : ISCSI_UNIQUE_SESSION_ID

    /**
     * A string that represents the initiator name.
     */
    InitiatorName : PSTR

    /**
     * A string that represents the target node name.
     */
    TargetNodeName : PSTR

    /**
     * A string that represents the target name.
     */
    TargetName : PSTR

    /**
     * The initiator-side identifier (ISID) used in the iSCSI protocol.
     */
    ISID : Int8[6]

    /**
     * The target-side identifier (TSID) used in the iSCSI protocol.
     */
    TSID : Int8[2]

    /**
     * The number of connections associated with the session.
     */
    ConnectionCount : UInt32

    /**
     * A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_connection_infoa">ISCSI_CONNECTION_INFO</a> structure.
     */
    Connections : ISCSI_CONNECTION_INFOA.Ptr

}
