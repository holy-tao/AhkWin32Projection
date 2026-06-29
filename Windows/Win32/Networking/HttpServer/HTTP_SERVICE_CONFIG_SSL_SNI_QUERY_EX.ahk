#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_SERVICE_CONFIG_QUERY_TYPE.ahk" { HTTP_SERVICE_CONFIG_QUERY_TYPE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HTTP_SERVICE_CONFIG_SSL_SNI_KEY.ahk" { HTTP_SERVICE_CONFIG_SSL_SNI_KEY }
#Import "..\WinSock\SOCKADDR_STORAGE.ahk" { SOCKADDR_STORAGE }
#Import ".\HTTP_SSL_SERVICE_CONFIG_EX_PARAM_TYPE.ahk" { HTTP_SSL_SERVICE_CONFIG_EX_PARAM_TYPE }
#Import "..\WinSock\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_SERVICE_CONFIG_SSL_SNI_QUERY_EX {
    #StructPack 8

    QueryDesc : HTTP_SERVICE_CONFIG_QUERY_TYPE

    KeyDesc : HTTP_SERVICE_CONFIG_SSL_SNI_KEY

    dwToken : UInt32

    ParamType : HTTP_SSL_SERVICE_CONFIG_EX_PARAM_TYPE

}
