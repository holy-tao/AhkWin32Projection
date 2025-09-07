#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Provides metadata regarding a service hosted by a device.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_service_metadata
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSD_SERVICE_METADATA extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_endpoint_reference_list">WSD_ENDPOINT_REFERENCE_LIST</a> structure that specifies the endpoints at which the service is available.
     * @type {Pointer<WSD_ENDPOINT_REFERENCE_LIST>}
     */
    EndpointReference {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_name_list">WSD_NAME_LIST</a> structure that contains a list of WS-Discovery Types.
     * @type {Pointer<WSD_NAME_LIST>}
     */
    Types {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The URI of the service. This URI must be valid when a <b>WSD_SERVICE_METADATA</b> structure is passed to <a href="https://docs.microsoft.com/windows/desktop/api/wsdhost/nf-wsdhost-iwsddevicehost-setmetadata">IWSDDeviceHost::SetMetadata</a>. Applications are responsible for URI validation.
     * @type {PWSTR}
     */
    ServiceId{
        get {
            if(!this.HasProp("__ServiceId"))
                this.__ServiceId := PWSTR(this.ptr + 16)
            return this.__ServiceId
        }
    }

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that specifies extension content allowed by the XML <b>ANY</b> keyword.
     * @type {Pointer<WSDXML_ELEMENT>}
     */
    Any {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
