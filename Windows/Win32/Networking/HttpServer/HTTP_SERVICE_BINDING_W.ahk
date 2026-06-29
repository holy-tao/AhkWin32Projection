#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_SERVICE_BINDING_BASE.ahk" { HTTP_SERVICE_BINDING_BASE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HTTP_SERVICE_BINDING_TYPE.ahk" { HTTP_SERVICE_BINDING_TYPE }

/**
 * HTTP_SERVICE_BINDING_W.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_service_binding_w
 * @namespace Windows.Win32.Networking.HttpServer
 * @charset Unicode
 */
export default struct HTTP_SERVICE_BINDING_W {
    #StructPack 8

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_binding_base">HTTP_SERVICE_BINDING_BASE</a> value,  the <b>Type</b> member of which must be set to <b>HttpServiceBindingTypeW</b>.
     */
    Base : HTTP_SERVICE_BINDING_BASE

    /**
     * A pointer to a buffer that represents the SPN.
     */
    Buffer : PWSTR

    /**
     * The length, in bytes, of the string in <b>Buffer</b>.
     */
    BufferSize : UInt32

}
