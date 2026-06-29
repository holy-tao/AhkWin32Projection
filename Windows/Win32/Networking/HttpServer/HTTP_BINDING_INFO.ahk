#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\HTTP_PROPERTY_FLAGS.ahk" { HTTP_PROPERTY_FLAGS }

/**
 * Used to associate a URL Group with a request queue.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_binding_info
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_BINDING_INFO {
    #StructPack 8

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_property_flags">HTTP_PROPERTY_FLAGS</a> structure specifying whether the property is present.
     */
    Flags : HTTP_PROPERTY_FLAGS

    /**
     * The request queue that is associated with the URL group. The structure can be used to remove an existing binding by setting this parameter to <b>NULL</b>.
     */
    RequestQueueHandle : HANDLE

}
