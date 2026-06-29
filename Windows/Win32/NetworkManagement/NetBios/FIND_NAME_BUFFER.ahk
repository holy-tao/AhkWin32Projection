#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The FIND_NAME_BUFFER structure contains information about a local network session.
 * @see https://learn.microsoft.com/windows/win32/api/nb30/ns-nb30-find_name_buffer
 * @namespace Windows.Win32.NetworkManagement.NetBios
 */
export default struct FIND_NAME_BUFFER {
    #StructPack 1

    /**
     * Specifies the length, in bytes, of the <b>FIND_NAME_BUFFER</b> structure. Although this structure always occupies 33 bytes, not all of the structure is necessarily valid.
     */
    length : Int8

    /**
     * Specifies the access control for the LAN header.
     */
    access_control : Int8

    /**
     * Specifies the frame control for the LAN header.
     */
    frame_control : Int8

    /**
     * Specifies the destination address of the remote node where the name was found.
     */
    destination_addr : Int8[6]

    /**
     * Specifies the source address for the remote node where the name was found.
     */
    source_addr : Int8[6]

    /**
     * Specifies additional routing information.
     */
    routing_info : Int8[18]

}
