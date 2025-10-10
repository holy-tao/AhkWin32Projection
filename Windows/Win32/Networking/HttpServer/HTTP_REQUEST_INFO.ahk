#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Extends the HTTP_REQUEST structure with additional information about the request.
 * @remarks
 * 
  * Starting with the HTTP Server API version 2.0, the HTTP_REQUEST structure is extended to include an array of <b>HTTP_REQUEST_INFO</b> structures in the <b>pRequestInfo</b> member. These structures contain additional information for the  request.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//http/ns-http-http_request_info
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_REQUEST_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_request_info_type">HTTP_REQUEST_INFO_TYPE</a> enumeration specifying the type of information contained in this structure.
     * @type {Integer}
     */
    InfoType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The length, in bytes,  of the <b>pInfo</b> member.
     * @type {Integer}
     */
    InfoLength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_request_auth_info">HTTP_REQUEST_AUTH_INFO</a> structure when the <b>InfoType</b> member is <b>HttpRequestInfoTypeAuth</b>; otherwise <b>NULL</b>.
     * @type {Pointer<Void>}
     */
    pInfo {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
