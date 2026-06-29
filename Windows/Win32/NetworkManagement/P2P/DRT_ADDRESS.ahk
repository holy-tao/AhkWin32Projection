#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Networking\WinSock\SOCKADDR_STORAGE.ahk" { SOCKADDR_STORAGE }
#Import "..\..\Networking\WinSock\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * DRT_ADDRESS structure contains endpoint information about a DRT node that participated in a search. This information is intended for use in debugging connectivity problems.
 * @see https://learn.microsoft.com/windows/win32/api/drt/ns-drt-drt_address
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct DRT_ADDRESS {
    #StructPack 8

    /**
     * Contains the endpoint on which the DRT protocol is listening on the remote node.
     */
    socketAddress : SOCKADDR_STORAGE

    /**
     * Holds information explaining how this node behaved in the key lookup.
     */
    flags : UInt32

    /**
     * Contains the number of bits that the key published by this node shares in common with the target key in the search.
     */
    nearness : Int32

    /**
     * Round trip time to this node.
     */
    latency : UInt32

}
