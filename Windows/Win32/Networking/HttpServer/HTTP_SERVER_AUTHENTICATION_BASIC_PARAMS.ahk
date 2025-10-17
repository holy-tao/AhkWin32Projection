#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The HTTP_SERVER_AUTHENTICATION_BASIC_PARAMS structure contains the information for Basic authentication on a URL Group.This structure is contained in the HTTP_SERVER_AUTHENTICATION_INFO structure.
 * @see https://docs.microsoft.com/windows/win32/api//http/ns-http-http_server_authentication_basic_params
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_SERVER_AUTHENTICATION_BASIC_PARAMS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The length, in bytes, of the <b>Realm</b> member.
     * @type {Integer}
     */
    RealmLength {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The realm used for Basic authentication.
     * 
     * The realm allows the  server to be partitioned into a set of protection spaces, each with its own set of authentication schemes from the authentication database.
     * @type {PWSTR}
     */
    Realm {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
