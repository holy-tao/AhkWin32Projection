#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * The IPX_ADDRESS_DATA structure provides information about a specific adapter to which IPX is bound. Used in conjunction with getsockopt function calls that specify IPX_ADDRESS in the optname parameter.
 * @remarks
 * Adapter numbers are base zero, so if there are eight adapters on a given computer, they are numbered 0-7. To determine the number of adapters present on the computer, call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-getsockopt">getsockopt</a> function with IPX_MAX_ADAPTER_NUM.
 * @see https://learn.microsoft.com/windows/win32/api/wsnwlink/ns-wsnwlink-ipx_address_data
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct IPX_ADDRESS_DATA {
    #StructPack 4

    /**
     * 0-based adapter number.
     */
    adapternum : Int32

    /**
     * IPX network number for the associated adapter.
     */
    netnum : Int8[4]

    /**
     * IPX node address for the associated adapter.
     */
    nodenum : Int8[6]

    /**
     * Specifies whether the adapter is on a wide area network (WAN) link. When <b>TRUE</b>, the adapter is on a WAN link.
     */
    wan : BOOLEAN

    /**
     * Specifies whether the WAN link is up. <b>FALSE</b> indicates that the WAN link is up or the adapter is not on a WAN. Compare with the <b>wan</b> member to determine the meaning.
     */
    status : BOOLEAN

    /**
     * Maximum allowable packet size, excluding the IPX header.
     */
    maxpkt : Int32

    /**
     * Link speed, returned in 100 byte-per-second increments. For example, a 9600 byte-per-second link would return a value of 96.
     */
    linkspeed : UInt32

}
