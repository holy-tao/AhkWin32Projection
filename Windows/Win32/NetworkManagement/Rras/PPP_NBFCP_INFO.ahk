#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PPP_NBFCP_INFO structure contains the result of a PPP NetBEUI Framer (NBF) projection operation.
 * @remarks
 * 
 * The 
 * <b>PPP_NBFCP_INFO</b> structure can be used only when administrating computers that are running an operating system prior to Windows Server 2003 as later operating systems do not support the NetBEUI protocol.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mprapi/ns-mprapi-ppp_nbfcp_info
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class PPP_NBFCP_INFO extends Win32Struct
{
    static sizeof => 40

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
     * Specifies a Unicode string that is the local workstation's computer name. This unique computer name is the closest NetBIOS equivalent to a client's NetBEUI address on a remote access connection.
     * @type {String}
     */
    wszWksta {
        get => StrGet(this.ptr + 4, 16, "UTF-16")
        set => StrPut(value, this.ptr + 4, 16, "UTF-16")
    }
}
