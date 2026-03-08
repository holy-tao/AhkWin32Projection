#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRpcChannelBuffer2.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IRpcChannelBuffer3 extends IRpcChannelBuffer2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRpcChannelBuffer3
     * @type {Guid}
     */
    static IID => Guid("{25b15600-0115-11d0-bf0d-00aa00b8dfd2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Send", "Receive", "Cancel", "GetCallContext", "GetDestCtxEx", "GetState", "RegisterAsync"]

    /**
     * The SendARP function sends an Address Resolution Protocol (ARP) request to obtain the physical address that corresponds to the specified destination IPv4 address.
     * @remarks
     * The <b>SendARP</b> function is used to request the physical hardware address (sometimes referred to as the MAC address) that corresponds to a specified destination IPv4 address. If the information requested is not in the ARP table on the local computer, then the <b>SendARP</b> function will cause an ARP request to be sent to obtain the physical address. If the function is successful, the physical address that corresponds to the specified destination IPv4 address is returned in the array pointed to by the <i>pMacAddr</i> parameter. 
     * 
     * The physical address of an IPv4 address is only available if the destination IPv4 address is on the local subnet (the IPv4 address can be reached directly without going through any routers). The <b>SendARP</b> function will fail if the destination IPv4 address is not on the local subnet. 
     * 
     * If the <b>SendARP</b> function is successful on Windows Vista and later, the ARP table on the local computer is updated with the results.  If the <b>SendARP</b> function is successful on Windows Server 2003 and earlier, the ARP table on the local computer is not affected. 
     * 
     * The <b>SendARP</b> function on Windows Vista and later returns different error return values  than the  <b>SendARP</b> function on    Windows Server 2003 and earlier. 
     * 
     *  On Windows Vista and later, a <b>NULL</b> pointer passed as the <i>pMacAddr</i> or <i>PhyAddrLen</i> parameter to the <b>SendARP</b> function causes an access violation and the application is terminated. If an error occurs on Windows Vista and later and <b>ERROR_BAD_NET_NAME</b>,  <b>ERROR_BUFFER_OVERFLOW</b>, or <b>ERROR_NOT_FOUND</b> is returned, the <b>ULONG</b> value pointed to by the <i>PhyAddrLen</i> parameter is set to zero. If the <b>ULONG</b> value pointed to by the <i>PhyAddrLen</i> parameter is less than 6 on  Windows Vista and later, <b>SendARP</b> function returns  <b>ERROR_BUFFER_OVERFLOW</b> indicating the buffer to receive the physical address is too small. If the <i>SrcIp</i> parameter specifies an IPv4 address that is not an interface on the local computer, the <b>SendARP</b> function on    Windows Vista and later  returns <b>ERROR_NOT_FOUND</b>. 
     * 
     *  On Windows Server 2003 and earlier, a <b>NULL</b> pointer passed as the <i>pMacAddr</i> or <i>PhyAddrLen</i> parameter to the <b>SendARP</b> function returns <b>ERROR_INVALID_PARAMETER</b>. If an error occurs on Windows Server 2003 and earlier and <b>ERROR_GEN_FAILURE</b> or   <b>ERROR_INVALID_USER_BUFFER</b> is returned, the <b>ULONG</b> value pointed to by the <i>PhyAddrLen</i> parameter is set to zero. If the <b>ULONG</b> value pointed to by the <i>PhyAddrLen</i> parameter is less than 6 on  Windows Server 2003 and earlier, the <b>SendARP</b> function does not return an error but only returns part of the hardware address in the array pointed to by the <i>pMacAddr</i> parameter. So if the value pointed to by the <i>PhyAddrLen</i> parameter is 4, then only the first 4 bytes of the hardware address are returned in the array pointed to by the <i>pMacAddr</i> parameter. If the <i>SrcIp</i> parameter specifies an IPv4 address that is not an interface on the local computer, the <b>SendARP</b> function on    Windows Server 2003 and  earlier ignores the <i>SrcIp</i> parameter and uses an IPv4 address on the local computer for the source IPv4 address. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getipnettable">GetIpNetTable</a> function retrieves the ARP table on the local computer that maps IPv4 addresses to physical addresses.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-createipnetentry">CreateIpNetEntry</a> function creates an ARP entry in the ARP table on the local computer.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-deleteipnetentry">DeleteIpNetEntry</a> function deletes an ARP entry from the ARP table on the local computer.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-setipnetentry">SetIpNetEntry</a> function modifies an existing ARP entry in the ARP table on the local computer.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-flushipnettable">FlushIpNetTable</a> function deletes all ARP entries for the specified interface from the ARP table on the local computer. 
     * 
     * 
     * 
     * On Windows Vista and later, the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-resolveipnetentry2">ResolveIpNetEntry2</a> function can used to replace the <b>SendARP</b> function. An ARP request is sent if the <b>Address</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> structure passed to the <b>ResolveIpNetEntry2</b> function is an IPv4 address.  
     * 
     * On Windows Vista, a new group of functions can be used to access, modify, and delete the ARP table entries when the <b>Address</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> structure passed to these functions is an IPv4 address.  The new functions include the following: <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getipnettable2">GetIpNetTable2</a>, <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-createipnetentry2">CreateIpNetEntry2</a>, <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-deleteipnetentry2">DeleteIpNetEntry2</a>,  <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-flushipnettable2">FlushIpNetTable2</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-setipnetentry2">SetIpNetEntry2</a>.
     * 
     * For information about the <b>IPAddr</b> data type, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">Windows Data Types</a>. To convert an IP address between dotted decimal notation and <b>IPAddr</b> format, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wsipv6ok/nf-wsipv6ok-inet_addr">inet_addr</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wsipv6ok/nf-wsipv6ok-inet_ntoa">inet_ntoa</a> functions.
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-sendarp
     */
    Send(pMsg) {
        result := ComCall(9, this, "ptr", pMsg, "uint*", &pulStatus := 0, "HRESULT")
        return pulStatus
    }

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @param {Integer} ulSize 
     * @returns {Integer} 
     */
    Receive(pMsg, ulSize) {
        result := ComCall(10, this, "ptr", pMsg, "uint", ulSize, "uint*", &pulStatus := 0, "HRESULT")
        return pulStatus
    }

    /**
     * Use the Cancel-Session packet to terminate the upload session with the BITS server.
     * @remarks
     * This packet cancels an upload job if it is sent before the last fragment is sent. Cancel-Session has no effect on a file whose last fragment has already been sent. When the BITS server receives the last fragment, it writes the file to its final destination and, in the case of an upload-reply, posts the file to the server application. In the upload-reply case, the Cancel-Session packet cancels the reply portion of an upload-reply job.
     * 
     * The BITS server releases all resources and deletes all temporary files when it receives this packet.
     * 
     * The BITS client sends this packet when the user cancels the job.
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Bits/cancel-session
     */
    Cancel(pMsg) {
        result := ComCall(11, this, "ptr", pMsg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetCallContext(pMsg, riid) {
        result := ComCall(12, this, "ptr", pMsg, "ptr", riid, "ptr*", &pInterface := 0, "HRESULT")
        return pInterface
    }

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @param {Pointer<Integer>} pdwDestContext 
     * @param {Pointer<Pointer<Void>>} ppvDestContext 
     * @returns {HRESULT} 
     */
    GetDestCtxEx(pMsg, pdwDestContext, ppvDestContext) {
        pdwDestContextMarshal := pdwDestContext is VarRef ? "uint*" : "ptr"
        ppvDestContextMarshal := ppvDestContext is VarRef ? "ptr*" : "ptr"

        result := ComCall(13, this, "ptr", pMsg, pdwDestContextMarshal, pdwDestContext, ppvDestContextMarshal, ppvDestContext, "HRESULT")
        return result
    }

    /**
     * Gets current Interaction Context state and the time when the context will return to idle state.
     * @remarks
     * After interaction ends, the interaction context might still be busy reporting inertia, or expecting second tap in a double tap gesture (in general, if multi-stroke gesture is possible). This function allows the caller to find out when it is safe to treat the Interaction Context object as idle. The main purpose of this function is management of pools of interaction contexts.
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/nf-interactioncontext-getstateinteractioncontext
     */
    GetState(pMsg) {
        result := ComCall(14, this, "ptr", pMsg, "uint*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @param {IAsyncManager} pAsyncMgr 
     * @returns {HRESULT} 
     */
    RegisterAsync(pMsg, pAsyncMgr) {
        result := ComCall(15, this, "ptr", pMsg, "ptr", pAsyncMgr, "HRESULT")
        return result
    }
}
