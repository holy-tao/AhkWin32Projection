#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HTTP_PROPERTY_FLAGS.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * Used to associate a URL Group with a request queue.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_binding_info
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_BINDING_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_property_flags">HTTP_PROPERTY_FLAGS</a> structure specifying whether the property is present.
     * @type {HTTP_PROPERTY_FLAGS}
     */
    Flags{
        get {
            if(!this.HasProp("__Flags"))
                this.__Flags := HTTP_PROPERTY_FLAGS(0, this)
            return this.__Flags
        }
    }

    /**
     * The request queue that is associated with the URL group. The structure can be used to remove an existing binding by setting this parameter to <b>NULL</b>.
     * @type {HANDLE}
     */
    RequestQueueHandle{
        get {
            if(!this.HasProp("__RequestQueueHandle"))
                this.__RequestQueueHandle := HANDLE(8, this)
            return this.__RequestQueueHandle
        }
    }
}
