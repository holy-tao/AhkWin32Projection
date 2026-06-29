#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The MPR_IFTRANSPORT_0 structure contains information for a particular interface transport.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-mpr_iftransport_0
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct MPR_IFTRANSPORT_0 {
    #StructPack 8

    /**
     * Identifies the transport.
     */
    dwTransportId : UInt32

    /**
     * Handle to the interface transport.
     */
    hIfTransport : HANDLE

    /**
     * Specifies a Unicode string that contains the name of the interface transport.
     */
    wszIfTransportName : WCHAR[41]

}
