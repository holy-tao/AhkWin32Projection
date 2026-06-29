#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Used to specify a particular reservation record in the URL namespace reservation store.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_service_config_urlacl_key
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_SERVICE_CONFIG_URLACL_KEY {
    #StructPack 8

    /**
     * A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/Http/urlprefix-strings">UrlPrefix string</a> that defines the portion of the URL namespace to which this reservation pertains.
     */
    pUrlPrefix : PWSTR

}
