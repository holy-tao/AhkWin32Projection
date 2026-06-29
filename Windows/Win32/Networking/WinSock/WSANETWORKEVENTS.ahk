#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WSANETWORKEVENTS structure is used to store a socket's internal information about network events.
 * @see https://learn.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsanetworkevents
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct WSANETWORKEVENTS {
    #StructPack 4

    /**
     * Indicates which of the FD_XXX network events have occurred.
     */
    lNetworkEvents : Int32

    /**
     * Array that contains any associated error codes, with an array index that corresponds to the position of event bits in <b>lNetworkEvents</b>. The identifiers FD_READ_BIT, FD_WRITE_BIT and others can be used to index the <b>iErrorCode</b> array.
     */
    iErrorCode : Int32[10]

}
