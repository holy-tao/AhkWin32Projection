#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The PEER_DATA structure contains binary data.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_data
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_DATA {
    #StructPack 8

    /**
     * Size of  <b>pbData</b>, in bytes. It is possible for this value to be set to zero if <b>pbData</b> contains no data.
     */
    cbData : UInt32

    /**
     * Pointer to a buffer.
     */
    pbData : IntPtr

}
