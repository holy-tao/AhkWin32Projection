#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the service metadata documents array. This can be a collection of WSDL/XSD documents represented as an array of WS_STRING.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_service_metadata
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SERVICE_METADATA extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The count of metadata documents being specified.
     * @type {Integer}
     */
    documentCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_service_metadata_document">WS_SERVICE_METADATA_DOCUMENT</a>* array where element represents a WS_SERVICE_METADATA_DOCUMENT for each individual XML Schema, WSDL or a Policy document. 
     *                 The service model expects this to be valid for the lifetime of the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-host">WS_SERVICE_HOST</a>.
     * @type {Pointer<Pointer<WS_SERVICE_METADATA_DOCUMENT>>}
     */
    documents {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Reference to WS_XML_STRING representing the name of the service in the WSDL document. Note that this field must be specified along with the serviceNs field. The service model expects this to be valid for the lifetime 
     *                     of the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-host">WS_SERVICE_HOST</a>.
     * @type {Pointer<WS_XML_STRING>}
     */
    serviceName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Reference to WS_XML_STRING representing the namespace of the service in the WSDL document. Note that this field must be specified along with the serviceName field.
     *                 The service model expects this to be valid for the lifetime of the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-host">WS_SERVICE_HOST</a>.
     * @type {Pointer<WS_XML_STRING>}
     */
    serviceNs {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
