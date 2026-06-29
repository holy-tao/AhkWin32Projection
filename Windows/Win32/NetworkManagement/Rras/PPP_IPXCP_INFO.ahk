#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The PPP_IPXCP_INFO structure contains the result of a PPP Internetwork Packet Exchange (IPX) projection operation.
 * @remarks
 * The 
 * <b>PPP_IPXCP_INFO</b> structure can be used only when administrating computers that are running 32-bit Windows Server 2003 or an earlier operating system. Windows 2000 64-bit Edition does not support the IPX protocol.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-ppp_ipxcp_info
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct PPP_IPXCP_INFO {
    #StructPack 4

    /**
     * Specifies the result of the PPP control protocol negotiation. A value of zero indicates success. A nonzero value indicates failure, and is the actual fatal error that occurred during the control protocol negotiation.
     */
    dwError : UInt32

    /**
     * Specifies a Unicode string that holds the client's IPX address on the RAS connection. This address string has the form <i>net</i><b>.</b><i>node</i>, for example, "1234ABCD.12AB34CD56EF".
     */
    wszAddress : WCHAR[23]

}
