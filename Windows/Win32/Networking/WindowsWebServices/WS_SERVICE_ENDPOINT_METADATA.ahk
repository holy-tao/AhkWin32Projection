#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the port element for the endpoint. The port element is generated for the service element as specified by serviceName and serviceNs for WS_SERVICE_PROPERTY_METADATA property on the WS_SERVICE_HOST.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_service_endpoint_metadata
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SERVICE_ENDPOINT_METADATA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The name of the port. The service model expects this to be valid for the lifetime 
     *                     of the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-host">WS_SERVICE_HOST</a>.
     * @type {Pointer<WS_XML_STRING>}
     */
    portName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Name of the binding associated with the port. The service model expects this to be valid for the lifetime 
     *                     of the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-host">WS_SERVICE_HOST</a>.
     * @type {Pointer<WS_XML_STRING>}
     */
    bindingName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The namespace of the binding associated with the port. The service model expects this to be valid for the lifetime 
     *                     of the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-host">WS_SERVICE_HOST</a>.
     * @type {Pointer<WS_XML_STRING>}
     */
    bindingNs {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
