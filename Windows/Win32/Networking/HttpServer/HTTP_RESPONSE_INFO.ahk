#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Extends the HTTP_RESPONSE structure with additional information for the response.
 * @remarks
 * 
 * Starting with the HTTP Server API version 2.0, the HTTP_RESPONSE structure is extended to include an array of <b>HTTP_RESPONSE_INFO</b> structures in the <b>pRequestInfo</b> member. These structures contain additional information for the  response.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//http/ns-http-http_response_info
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_RESPONSE_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_response_info_type">HTTP_RESPONSE_INFO_TYPE</a> enumeration specifying the type of information contained in this structure.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The length, in bytes, of the <b>pInfo</b> member.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_multiple_known_headers">HTTP_MULTIPLE_KNOWN_HEADERS</a> structure when the <b>InfoType</b> member is <b>HttpResponseInfoTypeMultipleKnownHeaders</b>; otherwise <b>NULL</b>.
     * @type {Pointer<Void>}
     */
    pInfo {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
