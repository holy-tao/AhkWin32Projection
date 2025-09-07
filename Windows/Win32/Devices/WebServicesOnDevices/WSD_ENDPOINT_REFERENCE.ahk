#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\WSD_REFERENCE_PROPERTIES.ahk
#Include .\WSD_REFERENCE_PARAMETERS.ahk

/**
 * Represents a WS-Addressing endpoint reference.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_endpoint_reference
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSD_ENDPOINT_REFERENCE extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The endpoint address.
     * @type {PWSTR}
     */
    Address{
        get {
            if(!this.HasProp("__Address"))
                this.__Address := PWSTR(this.ptr + 0)
            return this.__Address
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_reference_properties">WSD_REFERENCE_PROPERTIES</a> structure that specifies additional data used to uniquely identify the endpoint.
     * @type {WSD_REFERENCE_PROPERTIES}
     */
    ReferenceProperties{
        get {
            if(!this.HasProp("__ReferenceProperties"))
                this.__ReferenceProperties := WSD_REFERENCE_PROPERTIES(this.ptr + 8)
            return this.__ReferenceProperties
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_reference_parameters">WSD_REFERENCE_PARAMETERS</a> structure that specifies additional opaque data used by the endpoint.
     * @type {WSD_REFERENCE_PARAMETERS}
     */
    ReferenceParameters{
        get {
            if(!this.HasProp("__ReferenceParameters"))
                this.__ReferenceParameters := WSD_REFERENCE_PARAMETERS(this.ptr + 16)
            return this.__ReferenceParameters
        }
    }

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_name">WSDXML_NAME</a> structure that specifies the port type of the service at the referenced endpoint.
     * @type {Pointer<WSDXML_NAME>}
     */
    PortType {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_name">WSDXML_NAME</a> structure that specifies the service name of the service at the referenced endpoint.
     * @type {Pointer<WSDXML_NAME>}
     */
    ServiceName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that specifies extension content allowed by the XML <b>ANY</b> keyword.
     * @type {Pointer<WSDXML_ELEMENT>}
     */
    Any {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
