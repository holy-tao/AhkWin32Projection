#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_RESPONSE_INFO.ahk" { HTTP_RESPONSE_INFO }
#Import ".\HTTP_DATA_CHUNK.ahk" { HTTP_DATA_CHUNK }
#Import ".\HTTP_KNOWN_HEADER.ahk" { HTTP_KNOWN_HEADER }
#Import ".\HTTP_VERSION.ahk" { HTTP_VERSION }
#Import ".\HTTP_RESPONSE_V1.ahk" { HTTP_RESPONSE_V1 }
#Import ".\HTTP_UNKNOWN_HEADER.ahk" { HTTP_UNKNOWN_HEADER }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\HTTP_RESPONSE_HEADERS.ahk" { HTTP_RESPONSE_HEADERS }

/**
 * Extends the HTTP version 1.0 response structure with more information for the response.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_response_v2
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_RESPONSE_V2 {
    #StructPack 8

    Base : HTTP_RESPONSE_V1

    /**
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_response_info">HTTP_RESPONSE_INFO</a> structures in the array pointed to by <b>pResponseInfo</b>.
     * 
     * The count of the HTTP_RESPONSE_INFO elements in the array pointed to by <b>pResponseInfo</b>.
     */
    ResponseInfoCount : UInt16

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_response_info">HTTP_RESPONSE_INFO</a> structures containing more information about the request.
     */
    pResponseInfo : HTTP_RESPONSE_INFO.Ptr

}
