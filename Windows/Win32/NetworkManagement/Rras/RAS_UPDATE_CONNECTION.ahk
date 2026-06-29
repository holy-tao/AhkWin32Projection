#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MPRAPI_OBJECT_HEADER.ahk" { MPRAPI_OBJECT_HEADER }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Used to update an active RAS connection.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-ras_update_connection
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RAS_UPDATE_CONNECTION {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mprapi_object_header">MPRAPI_OBJECT_HEADER</a> structure that specifies the version of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd408110(v=vs.85)">RAS_UPDATE_CONNECTION</a> structure. 
     * 
     * <div class="alert"><b>Note</b>  The <b>revision</b> member  of  <b>Header</b> must be <b>0x01</b> and <b>type</b> must be <b>MPRAPI_OBJECT_TYPE_UPDATE_CONNECTION_OBJECT</b>.</div>
     * <div> </div>
     */
    Header : MPRAPI_OBJECT_HEADER

    /**
     * A value that specifies the new interface index of the Virtual Private Network (VPN) endpoint.
     */
    dwIfIndex : UInt32

    /**
     * A null-terminated Unicode string that contains the new IP address of the local computer in the connection. This string is of the form "a.b.c.d".
     */
    wszLocalEndpointAddress : WCHAR[65]

    /**
     * A null-terminated Unicode string that contains the new IP address of the remote computer in the connection. This string is of the form "a.b.d.c".
     */
    wszRemoteEndpointAddress : WCHAR[65]

}
