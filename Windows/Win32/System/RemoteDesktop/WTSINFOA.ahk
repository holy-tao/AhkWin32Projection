#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WTS_CONNECTSTATE_CLASS.ahk" { WTS_CONNECTSTATE_CLASS }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Contains information about a Remote Desktop Services session. (WTSINFOA)
 * @remarks
 * > [!NOTE]
 * > The wtsapi32.h header defines WTSINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/ns-wtsapi32-wtsinfoa
 * @namespace Windows.Win32.System.RemoteDesktop
 * @charset ANSI
 */
export default struct WTSINFOA {
    #StructPack 8

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ne-wtsapi32-wts_connectstate_class">WTS_CONNECTSTATE_CLASS</a> enumeration type that indicates the session's current connection state.
     */
    State : WTS_CONNECTSTATE_CLASS

    /**
     * The session identifier.
     */
    SessionId : UInt32

    /**
     * Uncompressed Remote Desktop Protocol (RDP) data from the client to the server.
     */
    IncomingBytes : UInt32

    /**
     * Uncompressed RDP data from the server to the client.
     */
    OutgoingBytes : UInt32

    /**
     * The number of frames of RDP data sent from the client to the server since the client connected.
     */
    IncomingFrames : UInt32

    /**
     * The number of frames of RDP data sent from the server to the client since the client connected.
     */
    OutgoingFrames : UInt32

    /**
     * Compressed RDP data from the client to the server.
     */
    IncomingCompressedBytes : UInt32

    OutgoingCompressedBy : UInt32

    /**
     * A null-terminated string that contains the name of the WinStation for the session.
     */
    WinStationName : CHAR[32]

    /**
     * A null-terminated string that contains the name of the domain that the user belongs to.
     */
    Domain : CHAR[17]

    /**
     * A null-terminated string that contains the name of the user who owns the session.
     */
    UserName : CHAR[21]

    /**
     * The most recent client connection time.
     */
    ConnectTime : Int64

    /**
     * The last client disconnection time.
     */
    DisconnectTime : Int64

    /**
     * The time of the last user input in the session.
     */
    LastInputTime : Int64

    /**
     * The time that the user logged on to the session.
     */
    LogonTime : Int64

    /**
     * The time that the <b>WTSINFO</b> data structure was called.
     */
    CurrentTime : Int64

}
