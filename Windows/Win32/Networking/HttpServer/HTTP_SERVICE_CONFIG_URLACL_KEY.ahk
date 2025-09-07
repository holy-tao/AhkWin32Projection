#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Used to specify a particular reservation record in the URL namespace reservation store.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_service_config_urlacl_key
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_SERVICE_CONFIG_URLACL_KEY extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/Http/urlprefix-strings">UrlPrefix string</a> that defines the portion of the URL namespace to which this reservation pertains.
     * @type {PWSTR}
     */
    pUrlPrefix{
        get {
            if(!this.HasProp("__pUrlPrefix"))
                this.__pUrlPrefix := PWSTR(this.ptr + 0)
            return this.__pUrlPrefix
        }
    }
}
