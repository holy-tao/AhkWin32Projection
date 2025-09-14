#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a Remote Desktop Services session. (WTSINFOA)
 * @remarks
 * > [!NOTE]
  * > The wtsapi32.h header defines WTSINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/ns-wtsapi32-wtsinfoa
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 * @charset ANSI
 */
class WTSINFOA extends Win32Struct
{
    static sizeof => 144

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
     * 
     * @type {Integer}
     */
    OutgoingCompressedBy {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * A null-terminated string that contains the name of the WinStation for the session.
     * @type {Array<SByte>}
     */
    WinStationName{
        get {
            if(!this.HasProp("__WinStationNameProxyArray"))
                this.__WinStationNameProxyArray := Win32FixedArray(this.ptr + 32, 32, Primitive, "char")
            return this.__WinStationNameProxyArray
        }
    }

    /**
     * A null-terminated string that contains the name of the domain that the user belongs to.
     * @type {Array<SByte>}
     */
    Domain{
        get {
            if(!this.HasProp("__DomainProxyArray"))
                this.__DomainProxyArray := Win32FixedArray(this.ptr + 64, 17, Primitive, "char")
            return this.__DomainProxyArray
        }
    }

    /**
     * A null-terminated string that contains the name of the user who owns the session.
     * @type {Array<SByte>}
     */
    UserName{
        get {
            if(!this.HasProp("__UserNameProxyArray"))
                this.__UserNameProxyArray := Win32FixedArray(this.ptr + 81, 21, Primitive, "char")
            return this.__UserNameProxyArray
        }
    }

    /**
     * The most recent client connection time.
     * @type {Integer}
     */
    ConnectTime {
        get => NumGet(this, 104, "int64")
        set => NumPut("int64", value, this, 104)
    }

    /**
     * The last client disconnection time.
     * @type {Integer}
     */
    DisconnectTime {
        get => NumGet(this, 112, "int64")
        set => NumPut("int64", value, this, 112)
    }

    /**
     * The time of the last user input in the session.
     * @type {Integer}
     */
    LastInputTime {
        get => NumGet(this, 120, "int64")
        set => NumPut("int64", value, this, 120)
    }

    /**
     * The time that the user logged on to the session.
     * @type {Integer}
     */
    LogonTime {
        get => NumGet(this, 128, "int64")
        set => NumPut("int64", value, this, 128)
    }

    /**
     * The time that the <b>WTSINFO</b> data structure was called.
     * @type {Integer}
     */
    CurrentTime {
        get => NumGet(this, 136, "int64")
        set => NumPut("int64", value, this, 136)
    }
}
