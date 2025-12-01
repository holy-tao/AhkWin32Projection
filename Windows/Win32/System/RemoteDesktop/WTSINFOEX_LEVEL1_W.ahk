#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains extended information about a Remote Desktop Services session. (Unicode)
 * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/ns-wtsapi32-wtsinfoex_level1_w
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 * @charset Unicode
 */
class WTSINFOEX_LEVEL1_W extends Win32Struct
{
    static sizeof => 224

    static packingSize => 8

    /**
     * The session identifier.
     * @type {Integer}
     */
    SessionId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ne-wtsapi32-wts_connectstate_class">WTS_CONNECTSTATE_CLASS</a> enumeration type that specifies the connection state of a Remote Desktop Services session.
     * @type {Integer}
     */
    SessionState {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * 
     * @type {Integer}
     */
    SessionFlags {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * A  null-terminated string that contains the name of the window station for the session.
     * @type {String}
     */
    WinStationName {
        get => StrGet(this.ptr + 12, 32, "UTF-16")
        set => StrPut(value, this.ptr + 12, 32, "UTF-16")
    }

    /**
     * A  null-terminated string that contains the name of the user who owns the session.
     * @type {String}
     */
    UserName {
        get => StrGet(this.ptr + 78, 20, "UTF-16")
        set => StrPut(value, this.ptr + 78, 20, "UTF-16")
    }

    /**
     * A  null-terminated string that contains the name of the domain that the user belongs to.
     * @type {String}
     */
    DomainName {
        get => StrGet(this.ptr + 120, 17, "UTF-16")
        set => StrPut(value, this.ptr + 120, 17, "UTF-16")
    }

    /**
     * The time that the user logged on to the session.  This value is stored as a large integer that represents the number of 100-nanosecond intervals since January 1, 1601 Coordinated Universal Time (Greenwich Mean Time).
     * @type {Integer}
     */
    LogonTime {
        get => NumGet(this, 160, "int64")
        set => NumPut("int64", value, this, 160)
    }

    /**
     * The time of the most recent client connection to the session. This value is stored as a large integer that represents the number of 100-nanosecond intervals since January 1, 1601 Coordinated Universal Time.
     * @type {Integer}
     */
    ConnectTime {
        get => NumGet(this, 168, "int64")
        set => NumPut("int64", value, this, 168)
    }

    /**
     * The time of the most recent client disconnection to the session. This value is stored as a large integer that represents the number of 100-nanosecond intervals since January 1, 1601 Coordinated Universal Time.
     * @type {Integer}
     */
    DisconnectTime {
        get => NumGet(this, 176, "int64")
        set => NumPut("int64", value, this, 176)
    }

    /**
     * The time of the last user input in the session.  This value is stored as a large integer that represents the number of 100-nanosecond intervals since January 1, 1601 Coordinated Universal Time.
     * @type {Integer}
     */
    LastInputTime {
        get => NumGet(this, 184, "int64")
        set => NumPut("int64", value, this, 184)
    }

    /**
     * The time that this structure was filled. This value is stored as a large integer that represents the number of 100-nanosecond intervals since January 1, 1601 Coordinated Universal Time.
     * @type {Integer}
     */
    CurrentTime {
        get => NumGet(this, 192, "int64")
        set => NumPut("int64", value, this, 192)
    }

    /**
     * The number of bytes of uncompressed Remote Desktop Protocol (RDP) data sent from the client to the server since the client connected.
     * @type {Integer}
     */
    IncomingBytes {
        get => NumGet(this, 200, "uint")
        set => NumPut("uint", value, this, 200)
    }

    /**
     * The number of bytes of uncompressed RDP data sent from the server to the client since the client connected.
     * @type {Integer}
     */
    OutgoingBytes {
        get => NumGet(this, 204, "uint")
        set => NumPut("uint", value, this, 204)
    }

    /**
     * The number of frames of RDP data sent from the client to the server since the client connected.
     * @type {Integer}
     */
    IncomingFrames {
        get => NumGet(this, 208, "uint")
        set => NumPut("uint", value, this, 208)
    }

    /**
     * The number of frames of RDP data sent from the server to the client since the client connected.
     * @type {Integer}
     */
    OutgoingFrames {
        get => NumGet(this, 212, "uint")
        set => NumPut("uint", value, this, 212)
    }

    /**
     * The number of bytes of compressed RDP data sent from the client to the server since the client connected.
     * @type {Integer}
     */
    IncomingCompressedBytes {
        get => NumGet(this, 216, "uint")
        set => NumPut("uint", value, this, 216)
    }

    /**
     * The number of bytes of compressed RDP data sent from the server to the client since the client connected.
     * @type {Integer}
     */
    OutgoingCompressedBytes {
        get => NumGet(this, 220, "uint")
        set => NumPut("uint", value, this, 220)
    }
}
