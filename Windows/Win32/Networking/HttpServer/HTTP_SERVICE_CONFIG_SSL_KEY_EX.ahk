#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\WinSock\SOCKADDR_STORAGE.ahk

/**
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_SERVICE_CONFIG_SSL_KEY_EX extends Win32Struct
{
    static sizeof => 248

    static packingSize => 8

    /**
     * @type {SOCKADDR_STORAGE}
     */
    IpPort{
        get {
            if(!this.HasProp("__IpPort"))
                this.__IpPort := SOCKADDR_STORAGE(this.ptr + 0)
            return this.__IpPort
        }
    }
}
