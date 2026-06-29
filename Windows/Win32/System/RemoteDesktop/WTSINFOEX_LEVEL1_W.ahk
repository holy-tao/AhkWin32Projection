#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WTS_CONNECTSTATE_CLASS.ahk" { WTS_CONNECTSTATE_CLASS }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains extended information about a Remote Desktop Services session. (Unicode)
 * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/ns-wtsapi32-wtsinfoex_level1_w
 * @namespace Windows.Win32.System.RemoteDesktop
 * @charset Unicode
 */
export default struct WTSINFOEX_LEVEL1_W {
    #StructPack 8

    /**
     * The session identifier.
     */
    SessionId : UInt32

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ne-wtsapi32-wts_connectstate_class">WTS_CONNECTSTATE_CLASS</a> enumeration type that specifies the connection state of a Remote Desktop Services session.
     */
    SessionState : WTS_CONNECTSTATE_CLASS

    SessionFlags : Int32

    /**
     * A  null-terminated string that contains the name of the window station for the session.
     */
    WinStationName : WCHAR[33]

    /**
     * A  null-terminated string that contains the name of the user who owns the session.
     */
    UserName : WCHAR[21]

    /**
     * A  null-terminated string that contains the name of the domain that the user belongs to.
     */
    DomainName : WCHAR[18]

    /**
     * The time that the user logged on to the session.  This value is stored as a large integer that represents the number of 100-nanosecond intervals since January 1, 1601 Coordinated Universal Time (Greenwich Mean Time).
     */
    LogonTime : Int64

    /**
     * The time of the most recent client connection to the session. This value is stored as a large integer that represents the number of 100-nanosecond intervals since January 1, 1601 Coordinated Universal Time.
     */
    ConnectTime : Int64

    /**
     * The time of the most recent client disconnection to the session. This value is stored as a large integer that represents the number of 100-nanosecond intervals since January 1, 1601 Coordinated Universal Time.
     */
    DisconnectTime : Int64

    /**
     * The time of the last user input in the session.  This value is stored as a large integer that represents the number of 100-nanosecond intervals since January 1, 1601 Coordinated Universal Time.
     */
    LastInputTime : Int64

    /**
     * The time that this structure was filled. This value is stored as a large integer that represents the number of 100-nanosecond intervals since January 1, 1601 Coordinated Universal Time.
     */
    CurrentTime : Int64

    /**
     * The number of bytes of uncompressed Remote Desktop Protocol (RDP) data sent from the client to the server since the client connected.
     */
    IncomingBytes : UInt32

    /**
     * The number of bytes of uncompressed RDP data sent from the server to the client since the client connected.
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
     * The number of bytes of compressed RDP data sent from the client to the server since the client connected.
     */
    IncomingCompressedBytes : UInt32

    /**
     * The number of bytes of compressed RDP data sent from the server to the client since the client connected.
     */
    OutgoingCompressedBytes : UInt32

}
