#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINHTTP_ASYNC_RESULT.ahk" { WINHTTP_ASYNC_RESULT }
#Import ".\WINHTTP_PROTOCOL_OPERATION.ahk" { WINHTTP_PROTOCOL_OPERATION }

/**
 * @namespace Windows.Win32.Networking.WinHttp
 */
export default struct WINHTTP_PROTOCOL_ASYNC_RESULT {
    #StructPack 8

    AsyncResult : WINHTTP_ASYNC_RESULT

    Operation : WINHTTP_PROTOCOL_OPERATION

}
