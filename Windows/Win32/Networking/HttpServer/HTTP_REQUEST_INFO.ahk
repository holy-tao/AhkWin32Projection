#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_REQUEST_INFO_TYPE.ahk" { HTTP_REQUEST_INFO_TYPE }

/**
 * Extends the HTTP_REQUEST structure with additional information about the request.
 * @remarks
 * Starting with the HTTP Server API version 2.0, the HTTP_REQUEST structure is extended to include an array of <b>HTTP_REQUEST_INFO</b> structures in the <b>pRequestInfo</b> member. These structures contain additional information for the  request.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_request_info
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_REQUEST_INFO {
    #StructPack 8

    /**
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_request_info_type">HTTP_REQUEST_INFO_TYPE</a> enumeration specifying the type of information contained in this structure.
     */
    InfoType : HTTP_REQUEST_INFO_TYPE

    /**
     * The length, in bytes,  of the <b>pInfo</b> member.
     */
    InfoLength : UInt32

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_request_auth_info">HTTP_REQUEST_AUTH_INFO</a> structure when the <b>InfoType</b> member is <b>HttpRequestInfoTypeAuth</b>; otherwise <b>NULL</b>.
     */
    pInfo : IntPtr

}
