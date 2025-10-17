#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\WinSock\SOCKADDR_STORAGE.ahk

/**
 * Serves as the key by which a given Secure Sockets Layer (SSL) Server Name Indication (SNI) certificate record is identified in the SSL SNI store.
 * @see https://docs.microsoft.com/windows/win32/api//http/ns-http-http_service_config_ssl_sni_key
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_SERVICE_CONFIG_SSL_SNI_KEY extends Win32Struct
{
    static sizeof => 256

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms740504(v=vs.85)">SOCKADDR_STORAGE</a> structure that contains the Internet Protocol version 4 (IPv4) address with which this SSL SNI certificate is associated. It must be set to the IPv4 wildcard address of type <b>SOCKADDR_IN</b> with <b>ss_family</b> set to <b>AF_INET</b> and <b>sin_addr</b> filled with zeros. <b>Port</b> can be any valid port.
     * @type {SOCKADDR_STORAGE}
     */
    IpPort{
        get {
            if(!this.HasProp("__IpPort"))
                this.__IpPort := SOCKADDR_STORAGE(0, this)
            return this.__IpPort
        }
    }

    /**
     * A pointer to a null-terminated Unicode UTF-16 string that represents the hostname.
     * @type {PWSTR}
     */
    Host {
        get => NumGet(this, 248, "ptr")
        set => NumPut("ptr", value, this, 248)
    }
}
