#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MCAST_CLIENT_UID structure describes the unique client identifier for each multicast request.
 * @see https://docs.microsoft.com/windows/win32/api//madcapcl/ns-madcapcl-mcast_client_uid
 * @namespace Windows.Win32.NetworkManagement.Multicast
 * @version v4.0.30319
 */
class MCAST_CLIENT_UID extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Buffer containing the unique client identifier.
     * @type {Pointer<Integer>}
     */
    ClientUID {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Size of the <b>ClientUID</b> member, in bytes.
     * @type {Integer}
     */
    ClientUIDLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
