#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a Remote Desktop Services session.
 * @remarks
 * 
  * > [!NOTE]
  * > The wtsapi32.h header defines WTSINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wtsapi32/ns-wtsapi32-wtsinfow
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 * @charset Unicode
 */
class WTSINFOW extends Win32Struct
{
    static sizeof => 216

    static packingSize => 8

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ne-wtsapi32-wts_connectstate_class">WTS_CONNECTSTATE_CLASS</a> enumeration type that indicates the session's current connection state.
     * @type {Integer}
     */
    State {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The session identifier.
     * @type {Integer}
     */
    SessionId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Uncompressed Remote Desktop Protocol (RDP) data from the client to the server.
     * @type {Integer}
     */
    IncomingBytes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Uncompressed RDP data from the server to the client.
     * @type {Integer}
     */
    OutgoingBytes {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The number of frames of RDP data sent from the client to the server since the client connected.
     * @type {Integer}
     */
    IncomingFrames {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The number of frames of RDP data sent from the server to the client since the client connected.
     * @type {Integer}
     */
    OutgoingFrames {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Compressed RDP data from the client to the server.
     * @type {Integer}
     */
    IncomingCompressedBytes {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Compressed RDP data from the server to the client.
     * @type {Integer}
     */
    OutgoingCompressedBytes {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * A null-terminated string that contains the name of the WinStation for the session.
     * @type {String}
     */
    WinStationName {
        get => StrGet(this.ptr + 32, 31, "UTF-16")
        set => StrPut(value, this.ptr + 32, 31, "UTF-16")
    }

    /**
     * A null-terminated string that contains the name of the domain that the user belongs to.
     * @type {String}
     */
    Domain {
        get => StrGet(this.ptr + 96, 16, "UTF-16")
        set => StrPut(value, this.ptr + 96, 16, "UTF-16")
    }

    /**
     * A null-terminated string that contains the name of the user who owns the session.
     * @type {String}
     */
    UserName {
        get => StrGet(this.ptr + 130, 20, "UTF-16")
        set => StrPut(value, this.ptr + 130, 20, "UTF-16")
    }

    /**
     * The most recent client connection time.
     * @type {Integer}
     */
    ConnectTime {
        get => NumGet(this, 176, "int64")
        set => NumPut("int64", value, this, 176)
    }

    /**
     * The last client disconnection time.
     * @type {Integer}
     */
    DisconnectTime {
        get => NumGet(this, 184, "int64")
        set => NumPut("int64", value, this, 184)
    }

    /**
     * The time of the last user input in the session.
     * @type {Integer}
     */
    LastInputTime {
        get => NumGet(this, 192, "int64")
        set => NumPut("int64", value, this, 192)
    }

    /**
     * The time that the user logged on to the session.
     * @type {Integer}
     */
    LogonTime {
        get => NumGet(this, 200, "int64")
        set => NumPut("int64", value, this, 200)
    }

    /**
     * The time that the <b>WTSINFO</b> data structure was called.
     * @type {Integer}
     */
    CurrentTime {
        get => NumGet(this, 208, "int64")
        set => NumPut("int64", value, this, 208)
    }
}
