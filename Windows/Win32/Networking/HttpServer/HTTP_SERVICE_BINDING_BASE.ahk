#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_SERVICE_BINDING_TYPE.ahk" { HTTP_SERVICE_BINDING_TYPE }

/**
 * HTTP_SERVICE_BINDING_BASE.
 * @remarks
 * <div class="alert"><b>Note</b>  <p class="note">The first member of both the  <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_binding_a">HTTP_SERVICE_BINDING_A</a> structure and the <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_binding_w">HTTP_SERVICE_BINDING_W</a> structure is a <b>HTTP_SERVICE_BINDING_BASE</b> structure.  Therefore, an array of either of the first two structures can be indicated by a pointer to a <b>HTTP_SERVICE_BINDING_BASE</b> structure.
 * 
 * <p class="note">The <b>ServiceNames</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_channel_bind_info">HTTP_CHANNEL_BIND_INFO</a> structure is cast to a  pointer to a <b>HTTP_SERVICE_BINDING_BASE</b> structure for this purpose.
 * 
 * </div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_service_binding_base
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_SERVICE_BINDING_BASE {
    #StructPack 4

    /**
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_service_binding_type">HTTP_SERVICE_BINDING_TYPE</a> value that indicates whether the data is in ASCII or Unicode.
     */
    Type : HTTP_SERVICE_BINDING_TYPE

}
