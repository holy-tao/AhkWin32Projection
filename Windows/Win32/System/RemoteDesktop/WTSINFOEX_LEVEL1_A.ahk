#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains extended information about a Remote Desktop Services session. (ANSI)
 * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/ns-wtsapi32-wtsinfoex_level1_a
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 * @charset ANSI
 */
class WTSINFOEX_LEVEL1_A extends Win32Struct
{
    static sizeof => 152

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
     * @type {Array<SByte>}
     */
    WinStationName{
        get {
            if(!this.HasProp("__WinStationNameProxyArray"))
                this.__WinStationNameProxyArray := Win32FixedArray(this.ptr + 12, 33, Primitive, "char")
            return this.__WinStationNameProxyArray
        }
    }

    /**
     * A  null-terminated string that contains the name of the user who owns the session.
     * @type {Array<SByte>}
     */
    UserName{
        get {
            if(!this.HasProp("__UserNameProxyArray"))
                this.__UserNameProxyArray := Win32FixedArray(this.ptr + 45, 21, Primitive, "char")
            return this.__UserNameProxyArray
        }
    }

    /**
     * A  null-terminated string that contains the name of the domain that the user belongs to.
     * @type {Array<SByte>}
     */
    DomainName{
        get {
            if(!this.HasProp("__DomainNameProxyArray"))
                this.__DomainNameProxyArray := Win32FixedArray(this.ptr + 66, 18, Primitive, "char")
            return this.__DomainNameProxyArray
        }
    }

    /**
     * The time that the user logged on to the session.  This value is stored as a large integer that represents the number of 100-nanosecond intervals since January 1, 1601 Coordinated Universal Time (Greenwich Mean Time).
     * @type {Integer}
     */
    LogonTime {
        get => NumGet(this, 88, "int64")
        set => NumPut("int64", value, this, 88)
    }

    /**
     * The time of the most recent client connection to the session. This value is stored as a large integer that represents the number of 100-nanosecond intervals since January 1, 1601 Coordinated Universal Time.
     * @type {Integer}
     */
    ConnectTime {
        get => NumGet(this, 96, "int64")
        set => NumPut("int64", value, this, 96)
    }

    /**
     * The time of the most recent client disconnection to the session. This value is stored as a large integer that represents the number of 100-nanosecond intervals since January 1, 1601 Coordinated Universal Time.
     * @type {Integer}
     */
    DisconnectTime {
        get => NumGet(this, 104, "int64")
        set => NumPut("int64", value, this, 104)
    }

    /**
     * The time of the last user input in the session.  This value is stored as a large integer that represents the number of 100-nanosecond intervals since January 1, 1601 Coordinated Universal Time.
     * @type {Integer}
     */
    LastInputTime {
        get => NumGet(this, 112, "int64")
        set => NumPut("int64", value, this, 112)
    }

    /**
     * The time that this structure was filled. This value is stored as a large integer that represents the number of 100-nanosecond intervals since January 1, 1601 Coordinated Universal Time.
     * @type {Integer}
     */
    CurrentTime {
        get => NumGet(this, 120, "int64")
        set => NumPut("int64", value, this, 120)
    }

    /**
     * The number of bytes of uncompressed Remote Desktop Protocol (RDP) data sent from the client to the server since the client connected.
     * @type {Integer}
     */
    IncomingBytes {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * The number of bytes of uncompressed RDP data sent from the server to the client since the client connected.
     * @type {Integer}
     */
    OutgoingBytes {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }

    /**
     * The number of frames of RDP data sent from the client to the server since the client connected.
     * @type {Integer}
     */
    IncomingFrames {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * The number of frames of RDP data sent from the server to the client since the client connected.
     * @type {Integer}
     */
    OutgoingFrames {
        get => NumGet(this, 140, "uint")
        set => NumPut("uint", value, this, 140)
    }

    /**
     * The number of bytes of compressed RDP data sent from the client to the server since the client connected.
     * @type {Integer}
     */
    IncomingCompressedBytes {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * The number of bytes of compressed RDP data sent from the server to the client since the client connected.
     * @type {Integer}
     */
    OutgoingCompressedBytes {
        get => NumGet(this, 148, "uint")
        set => NumPut("uint", value, this, 148)
    }
}
