#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a Resolve message.
 * @see https://docs.microsoft.com/windows/win32/api//wsdtypes/ns-wsdtypes-wsd_resolve
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSD_RESOLVE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_endpoint_reference">WSD_ENDPOINT_REFERENCE</a> structure that specifies the endpoint to match.
     * @type {Pointer<WSD_ENDPOINT_REFERENCE>}
     */
    EndpointReference {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that specifies extension content allowed by the XML <b>ANY</b> keyword.
     * @type {Pointer<WSDXML_ELEMENT>}
     */
    Any {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
