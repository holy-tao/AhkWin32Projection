#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_URL.ahk
#Include .\WS_STRING.ahk

/**
 * The URL subtype for specifying an soap.udp URL.
 * @remarks
 * 
  * If used with the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsdecodeurl">WsDecodeUrl</a> field, portAsString is a zero-length string if no port is specified in url.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_soapudp_url
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SOAPUDP_URL extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * The base type from which this URL subtype and all other URL subtypes derive. The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_url_scheme_type">WS_URL_SCHEME_TYPE</a> is <b>WS_URL_SOAPUDP_SCHEME_TYPE</b>.
     * @type {WS_URL}
     */
    url{
        get {
            if(!this.HasProp("__url"))
                this.__url := WS_URL(0, this)
            return this.__url
        }
    }

    /**
     * The host name.
     * @type {WS_STRING}
     */
    host{
        get {
            if(!this.HasProp("__host"))
                this.__host := WS_STRING(8, this)
            return this.__host
        }
    }

    /**
     * The port number.
     * @type {Integer}
     */
    port {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }

    /**
     * The port number as string.
     * @type {WS_STRING}
     */
    portAsString{
        get {
            if(!this.HasProp("__portAsString"))
                this.__portAsString := WS_STRING(32, this)
            return this.__portAsString
        }
    }

    /**
     * The path.
     * @type {WS_STRING}
     */
    path{
        get {
            if(!this.HasProp("__path"))
                this.__path := WS_STRING(48, this)
            return this.__path
        }
    }

    /**
     * The query.
     * @type {WS_STRING}
     */
    query{
        get {
            if(!this.HasProp("__query"))
                this.__query := WS_STRING(64, this)
            return this.__query
        }
    }

    /**
     * The fragment.
     * @type {WS_STRING}
     */
    fragment{
        get {
            if(!this.HasProp("__fragment"))
                this.__fragment := WS_STRING(80, this)
            return this.__fragment
        }
    }
}
