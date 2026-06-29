#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The PPP_NBFCP_INFO structure contains the result of a PPP NetBEUI Framer (NBF) projection operation.
 * @remarks
 * The 
 * <b>PPP_NBFCP_INFO</b> structure can be used only when administrating computers that are running an operating system prior to Windows Server 2003 as later operating systems do not support the NetBEUI protocol.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-ppp_nbfcp_info
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct PPP_NBFCP_INFO {
    #StructPack 4

    /**
     * Specifies the result of the PPP control protocol negotiation. A value of zero indicates success. A nonzero value indicates failure, and is the actual fatal error that occurred during the control protocol negotiation.
     */
    dwError : UInt32

    /**
     * Specifies a Unicode string that is the local workstation's computer name. This unique computer name is the closest NetBIOS equivalent to a client's NetBEUI address on a remote access connection.
     */
    wszWksta : WCHAR[17]

}
