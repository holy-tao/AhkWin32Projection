#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The SOCKADDR_STORAGE structure is a generic structure that specifies a transport address.S
 * @remarks
 * A WSK application typically does not directly access any of the members of the SOCKADDR_STORAGE
 *     structure except for the 
 *     <b>ss_family</b> member. Instead, a pointer to a SOCKADDR_STORAGE structure is normally cast to a pointer
 *     to the specific SOCKADDR structure type that corresponds to a particular address family.
 * @see https://learn.microsoft.com/windows/win32/api/ws2def/ns-ws2def-sockaddr_storage_xp
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct SOCKADDR_STORAGE_XP {
    #StructPack 8

    /**
     * The address family for the transport address. For more information about supported address
     *      families, see 
     *      <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/mt808757(v=vs.85)">WSK Address Families</a>.
     */
    ss_family : Int16

    /**
     * A padding of 6 bytes that puts the 
     *      <b>__ss_align</b> member on an eight-byte boundary within the structure.
     */
    __ss_pad1 : CHAR[6]

    /**
     * A 64-bit value that forces the structure to be 8-byte aligned.
     */
    __ss_align : Int64

    /**
     * A padding of an additional 112 bytes that brings the total size of the SOCKADDR_STORAGE structure
     *      to 128 bytes.
     */
    __ss_pad2 : CHAR[112]

}
