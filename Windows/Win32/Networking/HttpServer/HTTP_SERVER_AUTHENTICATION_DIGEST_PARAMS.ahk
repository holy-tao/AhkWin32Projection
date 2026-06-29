#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains the information for digest authentication on a URL Group.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_server_authentication_digest_params
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_SERVER_AUTHENTICATION_DIGEST_PARAMS {
    #StructPack 8

    /**
     * The length, in bytes, of the <b>DomainName</b> member.
     */
    DomainNameLength : UInt16

    /**
     * The domain name used for Digest authentication.
     * 
     * If <b>NULL</b>, the client assumes the protection space consists of all the URIs under the responding server.
     */
    DomainName : PWSTR

    /**
     * The length, in bytes, of the <b>Realm</b> member.
     */
    RealmLength : UInt16

    /**
     * The realm used for Digest authentication.
     * 
     * The realm allows the  server to be partitioned into a set of protection spaces, each with its own set of authentication schemes from the authentication database.
     */
    Realm : PWSTR

}
