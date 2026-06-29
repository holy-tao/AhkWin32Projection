#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The state of the metadata object.
 * @remarks
 * The following diagram illustrates the functions that 
 *                 cause state transitions in the metadata object.
 *             
 * :::image type="content" source="./images/MetadataStates.png" border="false" alt-text="Diagram of the state transitions for a Metadata object showing the functions that cause transitions between the Created, Faulted, and Resolved states.":::
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_metadata_state
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_METADATA_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The initial state of the metadata object.
     * @type {Integer (Int32)}
     */
    static WS_METADATA_STATE_CREATED => 1

    /**
     * All references between metadata documents have been
     *                     resolved and no more metadata documents may be added
     *                     to the metadata object.  See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetmetadataendpoints">WsGetMetadataEndpoints</a> for
     *                     more information.
     * @type {Integer (Int32)}
     */
    static WS_METADATA_STATE_RESOLVED => 2

    /**
     * The metadata object not usable due to a previous error.  See
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetmetadataendpoints">WsGetMetadataEndpoints</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadmetadata">WsReadMetadata</a> for more information.
     * @type {Integer (Int32)}
     */
    static WS_METADATA_STATE_FAULTED => 3
}
