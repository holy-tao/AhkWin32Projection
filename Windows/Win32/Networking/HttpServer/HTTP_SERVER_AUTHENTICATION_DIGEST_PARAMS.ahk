#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

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
     * @type {PWSTR}
     */
    DomainName{
        get {
            if(!this.HasProp("__DomainName"))
                this.__DomainName := PWSTR(this.ptr + 8)
            return this.__DomainName
        }
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
     * @type {PWSTR}
     */
    Realm{
        get {
            if(!this.HasProp("__Realm"))
                this.__Realm := PWSTR(this.ptr + 24)
            return this.__Realm
        }
    }
}
