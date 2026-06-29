#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_WEB_SOCKET_BUFFER_TYPE.ahk" { HTTP_WEB_SOCKET_BUFFER_TYPE }
#Import ".\INTERNET_ASYNC_RESULT.ahk" { INTERNET_ASYNC_RESULT }
#Import ".\HTTP_WEB_SOCKET_OPERATION.ahk" { HTTP_WEB_SOCKET_OPERATION }

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct HTTP_WEB_SOCKET_ASYNC_RESULT {
    #StructPack 8

    AsyncResult : INTERNET_ASYNC_RESULT

    Operation : HTTP_WEB_SOCKET_OPERATION

    BufferType : HTTP_WEB_SOCKET_BUFFER_TYPE

    dwBytesTransferred : UInt32

}
