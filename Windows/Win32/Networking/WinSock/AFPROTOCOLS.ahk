#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The AFPROTOCOLS structure supplies a list of protocols to which application programmers can constrain queries. The AFPROTOCOLS structure is used for query purposes only.
 * @remarks
 * The members of the 
 * <b>AFPROTOCOLS</b> structure are a functional pair, and only have meaning when used together, as protocol values have meaning only within the context of an address family.
 * @see https://learn.microsoft.com/windows/win32/api/winsock2/ns-winsock2-afprotocols
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct AFPROTOCOLS {
    #StructPack 4

    /**
     * Address family to which the query is to be constrained.
     */
    iAddressFamily : Int32

    /**
     * Protocol to which the query is to be constrained.
     */
    iProtocol : Int32

}
