#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SESSION_BUFFER structure contains information about a local network session. One or more SESSION_BUFFER structures follows a SESSION_HEADER structure when an application specifies the NCBSSTAT command in the ncb_command member of the NCB structure.
 * @see https://learn.microsoft.com/windows/win32/api/nb30/ns-nb30-session_buffer
 * @namespace Windows.Win32.NetworkManagement.NetBios
 * @version v4.0.30319
 */
class SESSION_BUFFER extends Win32Struct
{
    static sizeof => 36

    static packingSize => 1

    /**
     * Specifies the local session number.
     * @type {Integer}
     */
    lsn {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    state {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * Specifies the 16-byte NetBIOS name on the local computer used for this session.
     * @type {Array<Byte>}
     */
    local_name{
        get {
            if(!this.HasProp("__local_nameProxyArray"))
                this.__local_nameProxyArray := Win32FixedArray(this.ptr + 2, 16, Primitive, "char")
            return this.__local_nameProxyArray
        }
    }

    /**
     * Specifies the 16-byte NetBIOS name on the remote computer used for this session.
     * @type {Array<Byte>}
     */
    remote_name{
        get {
            if(!this.HasProp("__remote_nameProxyArray"))
                this.__remote_nameProxyArray := Win32FixedArray(this.ptr + 18, 16, Primitive, "char")
            return this.__remote_nameProxyArray
        }
    }

    /**
     * Specifies the number of pending <b>NCBRECV</b> commands.
     * @type {Integer}
     */
    rcvs_outstanding {
        get => NumGet(this, 34, "char")
        set => NumPut("char", value, this, 34)
    }

    /**
     * Specifies the number of pending <b>NCBSEND</b> and <b>NCBCHAINSEND</b> commands.
     * @type {Integer}
     */
    sends_outstanding {
        get => NumGet(this, 35, "char")
        set => NumPut("char", value, this, 35)
    }
}
