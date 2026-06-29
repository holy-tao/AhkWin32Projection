#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The MPR_TRANSPORT_0 structure contains information for a particular transport.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-mpr_transport_0
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct MPR_TRANSPORT_0 {
    #StructPack 8

    /**
     * A <b>DWORD</b> value that identifies the transport protocol type. Supported transport protocol types are listed on <a href="https://docs.microsoft.com/windows/desktop/RRAS/transport-identifiers">Transport Identifiers</a>.
     */
    dwTransportId : UInt32

    /**
     * Handle to the transport.
     */
    hTransport : HANDLE

    /**
     * A Unicode string that contains the name of the transport.
     */
    wszTransportName : WCHAR[41]

}
