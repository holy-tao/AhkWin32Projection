#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DRT_ADDRESS.ahk" { DRT_ADDRESS }
#Import "..\..\Networking\WinSock\SOCKADDR_STORAGE.ahk" { SOCKADDR_STORAGE }
#Import "..\..\Networking\WinSock\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * DRT_ADDRESS_LIST structure contains a set of DRT_ADDRESS structures that represent the nodes contacted during a search for a key.
 * @see https://learn.microsoft.com/windows/win32/api/drt/ns-drt-drt_address_list
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct DRT_ADDRESS_LIST {
    #StructPack 8

    /**
     * The count of entries in <b>AddressList</b>.
     */
    AddressCount : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/drt/ns-drt-drt_address">DRT_ADDRESS</a> structures that contain information about addresses that participated  in the search operation.
     */
    AddressList : DRT_ADDRESS[1]

}
