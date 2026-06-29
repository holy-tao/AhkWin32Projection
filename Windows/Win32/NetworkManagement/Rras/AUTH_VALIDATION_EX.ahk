#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\MPRAPI_OBJECT_HEADER.ahk" { MPRAPI_OBJECT_HEADER }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Used for enabling clients to bypass Point-to-Point (PPP) authentication during Secure Socket Tunneling Protocol (SSTP) connection establishment.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-auth_validation_ex
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct AUTH_VALIDATION_EX {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mprapi_object_header">MPRAPI_OBJECT_HEADER</a> structure that specifies the version of the <b>AUTH_VALIDATION_EX</b> structure. 
     * 
     * <div class="alert"><b>Note</b>  The <b>revision</b> member  of  <b>Header</b> must be <b>0x01</b> and <b>type</b> must be <b>MPRAPI_OBJECT_TYPE_AUTH_VALIDATION_OBJECT</b>.</div>
     * <div> </div>
     */
    Header : MPRAPI_OBJECT_HEADER

    /**
     * A handle to the RAS connection for which PPP authentication is being bypassed. This can be a handle returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasenumconnectionsa">RasEnumConnections</a> function.
     */
    hRasConnection : HANDLE

    /**
     * A null-terminated Unicode string that contains the name of the user logging on to the connection.
     */
    wszUserName : WCHAR[257]

    /**
     * A null-terminated Unicode string that contains the domain on which the connected user is authenticating.
     */
    wszLogonDomain : WCHAR[16]

    /**
     * The size, in bytes, of the user authentication information in <b>AuthInfo</b>.
     */
    AuthInfoSize : UInt32

    /**
     * A <b>BYTE</b> array that contains the user authentication information required to bypass PPP authentication during SSTP connection negotiation.
     */
    AuthInfo : Int8[1]

}
