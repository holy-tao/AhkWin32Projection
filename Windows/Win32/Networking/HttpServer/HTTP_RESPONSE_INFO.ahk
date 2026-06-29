#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_RESPONSE_INFO_TYPE.ahk" { HTTP_RESPONSE_INFO_TYPE }

/**
 * Extends the HTTP_RESPONSE structure with additional information for the response.
 * @remarks
 * Starting with the HTTP Server API version 2.0, the HTTP_RESPONSE structure is extended to include an array of <b>HTTP_RESPONSE_INFO</b> structures in the <b>pRequestInfo</b> member. These structures contain additional information for the  response.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_response_info
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_RESPONSE_INFO {
    #StructPack 8

    /**
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_response_info_type">HTTP_RESPONSE_INFO_TYPE</a> enumeration specifying the type of information contained in this structure.
     */
    Type : HTTP_RESPONSE_INFO_TYPE

    /**
     * The length, in bytes, of the <b>pInfo</b> member.
     */
    Length : UInt32

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_multiple_known_headers">HTTP_MULTIPLE_KNOWN_HEADERS</a> structure when the <b>InfoType</b> member is <b>HttpResponseInfoTypeMultipleKnownHeaders</b>; otherwise <b>NULL</b>.
     */
    pInfo : IntPtr

}
