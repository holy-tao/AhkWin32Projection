#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WSDXML_ELEMENT.ahk" { WSDXML_ELEMENT }
#Import ".\WSD_ENDPOINT_REFERENCE.ahk" { WSD_ENDPOINT_REFERENCE }

/**
 * Represents a section of metadata in a generic form.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_metadata_section
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_METADATA_SECTION {
    #StructPack 8

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
     * <dt><b>`http://schemas.xmlsoap.org/ws/2006/02/devprof/Relationship`</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The metadata section contains metadata about the relationship between two or more services. If the <b>Data</b> member is specified, then its type is <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_relationship_metadata">WSD_RELATIONSHIP_METADATA</a>.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     */
    Dialect : PWSTR

    /**
     * The dialect-specific identifier for the scope/domain/namespace of the metadata section.
     */
    Identifier : PWSTR

    /**
     * Reference to a binary representation of the metadata. The type of metadata is specified by <b>Dialect</b>. This member is ignored if <b>Dialect</b> does not have a value of `http://schemas.xmlsoap.org/ws/2006/02/devprof/ThisModel`, `http://schemas.xmlsoap.org/ws/2006/02/devprof/ThisDevice`, or `http://schemas.xmlsoap.org/ws/2006/02/devprof/Relationship`.
     */
    Data : IntPtr

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_endpoint_reference">WSD_ENDPOINT_REFERENCE</a> structure used identify the endpoint from which metadata can be retrieved.
     */
    MetadataReference : WSD_ENDPOINT_REFERENCE.Ptr

    /**
     * A URI that specifies the location from which metadata can be retrieved.
     */
    Location : PWSTR

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that specifies extension content allowed by the XML <b>ANY</b> keyword.
     */
    Any : WSDXML_ELEMENT.Ptr

}
