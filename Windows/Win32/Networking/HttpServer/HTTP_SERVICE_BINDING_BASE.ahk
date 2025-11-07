#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * HTTP_SERVICE_BINDING_BASE.
 * @remarks
 * 
 * <div class="alert"><b>Note</b>  <p class="note">The first member of both the  <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_binding_a">HTTP_SERVICE_BINDING_A</a> structure and the <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_binding_w">HTTP_SERVICE_BINDING_W</a> structure is a <b>HTTP_SERVICE_BINDING_BASE</b> structure.  Therefore, an array of either of the first two structures can be indicated by a pointer to a <b>HTTP_SERVICE_BINDING_BASE</b> structure.
 * 
 * <p class="note">The <b>ServiceNames</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_channel_bind_info">HTTP_CHANNEL_BIND_INFO</a> structure is cast to a  pointer to a <b>HTTP_SERVICE_BINDING_BASE</b> structure for this purpose.
 * 
 * </div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//http/ns-http-http_service_binding_base
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_SERVICE_BINDING_BASE extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_service_binding_type">HTTP_SERVICE_BINDING_TYPE</a> value that indicates whether the data is in ASCII or Unicode.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
