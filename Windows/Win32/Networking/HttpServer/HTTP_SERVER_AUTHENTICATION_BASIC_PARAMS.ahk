#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The HTTP_SERVER_AUTHENTICATION_BASIC_PARAMS structure contains the information for Basic authentication on a URL Group.This structure is contained in the HTTP_SERVER_AUTHENTICATION_INFO structure.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_server_authentication_basic_params
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_SERVER_AUTHENTICATION_BASIC_PARAMS {
    #StructPack 8

    /**
     * The length, in bytes, of the <b>Realm</b> member.
     */
    RealmLength : UInt16

    /**
     * The realm used for Basic authentication.
     * 
     * The realm allows the  server to be partitioned into a set of protection spaces, each with its own set of authentication schemes from the authentication database.
     */
    Realm : PWSTR

}
