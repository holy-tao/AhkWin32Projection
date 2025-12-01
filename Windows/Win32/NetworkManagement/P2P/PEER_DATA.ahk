#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PEER_DATA structure contains binary data.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_data
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_DATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Size of  <b>pbData</b>, in bytes. It is possible for this value to be set to zero if <b>pbData</b> contains no data.
     * @type {Integer}
     */
    cbData {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a buffer.
     * @type {Pointer<Integer>}
     */
    pbData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
