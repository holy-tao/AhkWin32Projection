#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SOCKADDR_STORAGE structure is a generic structure that specifies a transport address.S
 * @remarks
 * A WSK application typically does not directly access any of the members of the SOCKADDR_STORAGE
  *     structure except for the 
  *     <b>ss_family</b> member. Instead, a pointer to a SOCKADDR_STORAGE structure is normally cast to a pointer
  *     to the specific SOCKADDR structure type that corresponds to a particular address family.
 * @see https://learn.microsoft.com/windows/win32/api/ws2def/ns-ws2def-sockaddr_storage_xp
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class SOCKADDR_STORAGE_XP extends Win32Struct
{
    static sizeof => 128

    static packingSize => 8

    /**
     * The address family for the transport address. For more information about supported address
     *      families, see 
     *      <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/mt808757(v=vs.85)">WSK Address Families</a>.
     * @type {Integer}
     */
    ss_family {
        get => NumGet(this, 0, "short")
        set => NumPut("short", value, this, 0)
    }

    /**
     * A padding of 6 bytes that puts the 
     *      <b>__ss_align</b> member on an eight-byte boundary within the structure.
     * @type {Array<SByte>}
     */
    __ss_pad1{
        get {
            if(!this.HasProp("____ss_pad1ProxyArray"))
                this.____ss_pad1ProxyArray := Win32FixedArray(this.ptr + 2, 6, Primitive, "char")
            return this.____ss_pad1ProxyArray
        }
    }

    /**
     * A 64-bit value that forces the structure to be 8-byte aligned.
     * @type {Integer}
     */
    __ss_align {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * A padding of an additional 112 bytes that brings the total size of the SOCKADDR_STORAGE structure
     *      to 128 bytes.
     * @type {Array<SByte>}
     */
    __ss_pad2{
        get {
            if(!this.HasProp("____ss_pad2ProxyArray"))
                this.____ss_pad2ProxyArray := Win32FixedArray(this.ptr + 16, 112, Primitive, "char")
            return this.____ss_pad2ProxyArray
        }
    }
}
