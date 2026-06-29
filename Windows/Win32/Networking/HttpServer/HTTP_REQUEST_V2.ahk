#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_TRANSPORT_ADDRESS.ahk" { HTTP_TRANSPORT_ADDRESS }
#Import ".\HTTP_VERSION.ahk" { HTTP_VERSION }
#Import ".\HTTP_REQUEST_V1.ahk" { HTTP_REQUEST_V1 }
#Import ".\HTTP_SSL_INFO.ahk" { HTTP_SSL_INFO }
#Import ".\HTTP_REQUEST_HEADERS.ahk" { HTTP_REQUEST_HEADERS }
#Import ".\HTTP_REQUEST_INFO.ahk" { HTTP_REQUEST_INFO }
#Import ".\HTTP_UNKNOWN_HEADER.ahk" { HTTP_UNKNOWN_HEADER }
#Import ".\HTTP_KNOWN_HEADER.ahk" { HTTP_KNOWN_HEADER }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HTTP_COOKED_URL.ahk" { HTTP_COOKED_URL }
#Import "..\WinSock\SOCKADDR.ahk" { SOCKADDR }
#Import ".\HTTP_VERB.ahk" { HTTP_VERB }
#Import ".\HTTP_DATA_CHUNK.ahk" { HTTP_DATA_CHUNK }

/**
 * Extends the HTTP_REQUEST_V1 request structure with more information about the request.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_request_v2
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_REQUEST_V2 {
    #StructPack 8

    Base : HTTP_REQUEST_V1

    /**
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_request_info">HTTP_REQUEST_INFO</a> structures in the array pointed to by <b>pRequestInfo</b>.
     */
    RequestInfoCount : UInt16

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_request_info">HTTP_REQUEST_INFO</a> structures that contains additional information about the request.
     */
    pRequestInfo : HTTP_REQUEST_INFO.Ptr

}
