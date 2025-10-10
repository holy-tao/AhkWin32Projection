#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_STRING.ahk
#Include .\WS_ENDPOINT_ADDRESS.ahk

/**
 * Information about a single endpoint that was read from metadata documents.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_metadata_endpoint
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_METADATA_ENDPOINT extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * The address of the endpoint.
     * @type {WS_ENDPOINT_ADDRESS}
     */
    endpointAddress{
        get {
            if(!this.HasProp("__endpointAddress"))
                this.__endpointAddress := WS_ENDPOINT_ADDRESS(this.ptr + 0)
            return this.__endpointAddress
        }
    }

    /**
     * An opaque handle representing the policy of the endpoint.  
     *                     This handle is good until the metadata object
     *                     is freed or reset.
     * @type {Pointer<IntPtr>}
     */
    endpointPolicy {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * The WSDL port name of the endpoint, if available.
     * @type {Pointer<WS_XML_STRING>}
     */
    portName {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * The WSDL service name of the endpoint, if available.
     * @type {Pointer<WS_XML_STRING>}
     */
    serviceName {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * The WSDL service namespace of the endpoint, if available.
     * @type {Pointer<WS_XML_STRING>}
     */
    serviceNs {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * The WSDL binding name of the endpoint, if available.
     * @type {Pointer<WS_XML_STRING>}
     */
    bindingName {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * The WSDL binding namespace of the endpoint, if available.
     * @type {Pointer<WS_XML_STRING>}
     */
    bindingNs {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * The WSDL portType name of the endpoint, if available.
     * @type {Pointer<WS_XML_STRING>}
     */
    portTypeName {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * The WSDL portType namespace of the endpoint, if available.
     * @type {Pointer<WS_XML_STRING>}
     */
    portTypeNs {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }
}
