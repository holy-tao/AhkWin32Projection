#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the information for digest authentication on a URL Group.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_server_authentication_digest_params
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_SERVER_AUTHENTICATION_DIGEST_PARAMS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The length, in bytes, of the <b>DomainName</b> member.
     * @type {Integer}
     */
    DomainNameLength {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The domain name used for Digest authentication.
     * 
     * If <b>NULL</b>, the client assumes the protection space consists of all the URIs under the responding server.
     * @type {Pointer<PWSTR>}
     */
    DomainName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The length, in bytes, of the <b>Realm</b> member.
     * @type {Integer}
     */
    RealmLength {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * The realm used for Digest authentication.
     * 
     * The realm allows the  server to be partitioned into a set of protection spaces, each with its own set of authentication schemes from the authentication database.
     * @type {Pointer<PWSTR>}
     */
    Realm {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
