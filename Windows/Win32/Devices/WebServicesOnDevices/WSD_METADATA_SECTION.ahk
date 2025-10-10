#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a section of metadata in a generic form.
 * @see https://docs.microsoft.com/windows/win32/api//wsdtypes/ns-wsdtypes-wsd_metadata_section
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSD_METADATA_SECTION extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The format and version of the metadata section.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="http___schemas.xmlsoap.org_ws_2006_02_devprof_ThisModel"></a><a id="http___schemas.xmlsoap.org_ws_2006_02_devprof_thismodel"></a><a id="HTTP___SCHEMAS.XMLSOAP.ORG_WS_2006_02_DEVPROF_THISMODEL"></a><dl>
     * <dt><b>http://schemas.xmlsoap.org/ws/2006/02/devprof/ThisModel</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The metadata section contains model-specific information relating to the device. If the <b>Data</b> member is specified, then its type is <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_this_model_metadata">WSD_THIS_MODEL_METADATA</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="http___schemas.xmlsoap.org_ws_2006_02_devprof_ThisDevice"></a><a id="http___schemas.xmlsoap.org_ws_2006_02_devprof_thisdevice"></a><a id="HTTP___SCHEMAS.XMLSOAP.ORG_WS_2006_02_DEVPROF_THISDEVICE"></a><dl>
     * <dt><b>http://schemas.xmlsoap.org/ws/2006/02/devprof/ThisDevice</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The metadata section contains metadata that is unique to a specific device. If the <b>Data</b> member is specified, then its type is <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_this_device_metadata">WSD_THIS_DEVICE_METADATA</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="http___schemas.xmlsoap.org_ws_2006_02_devprof_Relationship"></a><a id="http___schemas.xmlsoap.org_ws_2006_02_devprof_relationship"></a><a id="HTTP___SCHEMAS.XMLSOAP.ORG_WS_2006_02_DEVPROF_RELATIONSHIP"></a><dl>
     * <dt><b>http://schemas.xmlsoap.org/ws/2006/02/devprof/Relationship</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The metadata section contains metadata about the relationship between two or more services. If the <b>Data</b> member is specified, then its type is <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_relationship_metadata">WSD_RELATIONSHIP_METADATA</a>.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Pointer<Char>}
     */
    Dialect {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The dialect-specific identifier for the scope/domain/namespace of the metadata section.
     * @type {Pointer<Char>}
     */
    Identifier {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Reference to a binary representation of the metadata. The type of metadata is specified by <b>Dialect</b>. This member is ignored if <b>Dialect</b> does not have a value of http://schemas.xmlsoap.org/ws/2006/02/devprof/ThisModel, http://schemas.xmlsoap.org/ws/2006/02/devprof/ThisDevice, or http://schemas.xmlsoap.org/ws/2006/02/devprof/Relationship.
     * @type {Pointer<Void>}
     */
    Data {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_endpoint_reference">WSD_ENDPOINT_REFERENCE</a> structure used identify the endpoint from which metadata can be retrieved.
     * @type {Pointer<WSD_ENDPOINT_REFERENCE>}
     */
    MetadataReference {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A URI that specifies the location from which metadata can be retrieved.
     * @type {Pointer<Char>}
     */
    Location {
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
