#Requires AutoHotkey v2.0.0 64-bit

/**
 * Each metadata property is of type WS_METADATA_PROPERTY, is identified by an ID, and has an associated value. If a property is not specified when the metadata is created, then its default value is used.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_metadata_property_id
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_METADATA_PROPERTY_ID{

    /**
     * This property is used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetmetadataproperty">WsGetMetadataProperty</a>.
 *                 
 * 
 * The accompanying <b>value</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_metadata_property">WS_METADATA_PROPERTY</a> structure contains  the current <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_metadata_state">WS_METADATA_STATE</a> of the metadata object.
     * @type {Integer (Int32)}
     */
    static WS_METADATA_PROPERTY_STATE => 1

    /**
     * This property is used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatemetadata">WsCreateMetadata</a> to specify
 *                     properties of the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-heap">WS_HEAP</a> object used by the metadata
 *                     object to store information about the metadata that was read.
 *                 
 * 
 * The accompanying <b>value</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_metadata_property">WS_METADATA_PROPERTY</a> structure contains   a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_heap_properties">WS_HEAP_PROPERTIES</a> structure.
 *                 
 * 
 * The following heap properties may be specified:
 *                 
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_heap_property_id">WS_HEAP_PROPERTY_MAX_SIZE</a>.  If not specified, the
 *                     default value used is 256k bytes.
 *                     </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_heap_property_id">WS_HEAP_PROPERTY_TRIM_SIZE</a>.  If not specified, the
 *                     default value used is 32k bytes.
 *                 </li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static WS_METADATA_PROPERTY_HEAP_PROPERTIES => 2

    /**
     * This property is used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatemetadata">WsCreateMetadata</a> to specify
 *                     properties of the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-policy">WS_POLICY</a> objects that are associated
 *                     with the metadata object.
 *                 
 * 
 * The accompanying <b>value</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_metadata_property">WS_METADATA_PROPERTY</a> structure contains   a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_policy_properties">WS_POLICY_PROPERTIES</a>  structure that specifies the
 *                     set of policy properties.
 * 
 * See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_policy_property_id">WS_POLICY_PROPERTY_ID</a> for more information on the
 *                     set of properties that may be specified here.
     * @type {Integer (Int32)}
     */
    static WS_METADATA_PROPERTY_POLICY_PROPERTIES => 3

    /**
     * This property is used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetmetadataproperty">WsGetMetadataProperty</a>.
 *                 
 * 
 * The accompanying <b>value</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_metadata_property">WS_METADATA_PROPERTY</a> is a <b>SIZE_T</b> specifying the number of bytes allocated from the heap associated with the
 *                     metadata object.
     * @type {Integer (Int32)}
     */
    static WS_METADATA_PROPERTY_HEAP_REQUESTED_SIZE => 4

    /**
     * This property is used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatemetadata">WsCreateMetadata</a>.
 *                 
 * 
 * The accompanying <b>value</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_metadata_property">WS_METADATA_PROPERTY</a> is a <b>ULONG</b> specifying  the maximum number of documents that may be added to
 *                     the metadata object using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadmetadata">WsReadMetadata</a>.  
 *                 
 * 
 * The default value is 32.
     * @type {Integer (Int32)}
     */
    static WS_METADATA_PROPERTY_MAX_DOCUMENTS => 5

    /**
     * This property is used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatemetadata">WsCreateMetadata</a>.
 *                 
 * 
 * The accompanying <b>value</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_metadata_property">WS_METADATA_PROPERTY</a> is a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_host_names">WS_HOST_NAMES</a> structure.
 *                 
 * 
 * This property may only be specified if <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_metadata_property_id">WS_METADATA_PROPERTY_VERIFY_HOST_NAMES</a> is <b>TRUE</b>.
 *                 
 * 
 * See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetmissingmetadatadocumentaddress">WsGetMissingMetadataDocumentAddress</a> for more information
 *                     on verifying host names.
 *                 
 * 
 * If the property is not specified, then the list of host names is empty.
     * @type {Integer (Int32)}
     */
    static WS_METADATA_PROPERTY_HOST_NAMES => 6

    /**
     * This property is used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatemetadata">WsCreateMetadata</a>.
 *                 
 * 
 * The accompanying <b>value</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_metadata_property">WS_METADATA_PROPERTY</a> is a <b>BOOL</b> that specifies whether or not host names should be verified.
 *                 
 * 
 * See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetmissingmetadatadocumentaddress">WsGetMissingMetadataDocumentAddress</a> for more information
 *                     on verifying host names.
 *                 
 * 
 * The default value is <b>TRUE</b>.
 *                 
 * 
 * Setting this value to <b>FALSE</b> may cause an application to use
 *                     an address returned from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetmissingmetadatadocumentaddress">WsGetMissingMetadataDocumentAddress</a>that is from a host that it is not willing to accept metadata from.
     * @type {Integer (Int32)}
     */
    static WS_METADATA_PROPERTY_VERIFY_HOST_NAMES => 7
}
