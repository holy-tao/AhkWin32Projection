#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The PPP_ATCP_INFO structure contains the result of a PPP AppleTalk projection operation.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-ppp_atcp_info
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct PPP_ATCP_INFO {
    #StructPack 4

    /**
     * Specifies the result of the PPP control protocol negotiation. A value of zero indicates success. A nonzero value indicates failure, and is the actual fatal error that occurred during the control protocol negotiation.
     */
    dwError : UInt32

    /**
     * Specifies a Unicode string that holds the client's AppleTalk address on the RAS connection.
     */
    wszAddress : WCHAR[33]

}
