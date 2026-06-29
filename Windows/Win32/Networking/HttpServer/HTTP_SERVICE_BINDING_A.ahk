#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_SERVICE_BINDING_BASE.ahk" { HTTP_SERVICE_BINDING_BASE }
#Import ".\HTTP_SERVICE_BINDING_TYPE.ahk" { HTTP_SERVICE_BINDING_TYPE }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * HTTP_SERVICE_BINDING_A.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_service_binding_a
 * @namespace Windows.Win32.Networking.HttpServer
 * @charset ANSI
 */
export default struct HTTP_SERVICE_BINDING_A {
    #StructPack 8

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_binding_base">HTTP_SERVICE_BINDING_BASE</a> value,  the <b>Type</b> member of which must be set to <b>HttpServiceBindingTypeA</b>.
     */
    Base : HTTP_SERVICE_BINDING_BASE

    /**
     * A pointer to a buffer that represents the SPN.
     */
    Buffer : PSTR

    /**
     * The length, in bytes, of the string in <b>Buffer</b>.
     */
    BufferSize : UInt32

}
