#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PPP_IPXCP_INFO structure contains the result of a PPP Internetwork Packet Exchange (IPX) projection operation.
 * @remarks
 * 
 * The 
 * <b>PPP_IPXCP_INFO</b> structure can be used only when administrating computers that are running 32-bit Windows Server 2003 or an earlier operating system. Windows 2000 64-bit Edition does not support the IPX protocol.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mprapi/ns-mprapi-ppp_ipxcp_info
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class PPP_IPXCP_INFO extends Win32Struct
{
    static sizeof => 52

    static packingSize => 4

    /**
     * Specifies the result of the PPP control protocol negotiation. A value of zero indicates success. A nonzero value indicates failure, and is the actual fatal error that occurred during the control protocol negotiation.
     * @type {Integer}
     */
    dwError {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies a Unicode string that holds the client's IPX address on the RAS connection. This address string has the form <i>net</i><b>.</b><i>node</i>, for example, "1234ABCD.12AB34CD56EF".
     * @type {String}
     */
    wszAddress {
        get => StrGet(this.ptr + 4, 22, "UTF-16")
        set => StrPut(value, this.ptr + 4, 22, "UTF-16")
    }
}
