#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WDS_TRANSPORTCLIENT_REQUEST_AUTH_LEVEL.ahk" { WDS_TRANSPORTCLIENT_REQUEST_AUTH_LEVEL }

/**
 * This structure is used by the WdsTransportClientStartSession function.
 * @see https://learn.microsoft.com/windows/win32/api/wdstci/ns-wdstci-wds_transportclient_request
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct WDS_TRANSPORTCLIENT_REQUEST {
    #StructPack 8

    /**
     * The length of this structure in bytes.
     */
    ulLength : UInt32

    /**
     * The version of the API that the caller is built against.  The multicast client may reject the request based on this value.
     * 
     * 
     * This member must contain the following value.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WDS_TRANSPORT_CLIENT_CURRENT_API_VERSION"></a><a id="wds_transport_client_current_api_version"></a><dl>
     * <dt><b>WDS_TRANSPORT_CLIENT_CURRENT_API_VERSION</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current version.
     * 
     * </td>
     * </tr>
     * </table>
     */
    ulApiVersion : UInt32

    ulAuthLevel : WDS_TRANSPORTCLIENT_REQUEST_AUTH_LEVEL

    /**
     * Server name.
     */
    pwszServer : PWSTR

    /**
     * Namespace of the object to retrieve.
     */
    pwszNamespace : PWSTR

    /**
     * Specifies the name of the object to retrieve.  Object names are
     *      provider dependent.
     */
    pwszObjectName : PWSTR

    /**
     * Specifies how much data in bytes the consumer can store in its queue.  Once
     *      this threshold is reached, the client will not send any more writes to
     *     the consumer until some memory is released with 
     *     WdsTransportClientCompleteWrite.
     */
    ulCacheSize : UInt32

    /**
     * Specifies the protocol to be used for this transfer.
     * 
     * 
     * This member can contain the following value.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WDS_TRANSPORTCLIENT_PROTOCOL_MULTICAST"></a><a id="wds_transportclient_protocol_multicast"></a><dl>
     * <dt><b>WDS_TRANSPORTCLIENT_PROTOCOL_MULTICAST</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file will be transferred using an efficient multicast protocol.
     * 
     * </td>
     * </tr>
     * </table>
     */
    ulProtocol : UInt32

    /**
     * Protocol data structure for the protocol. The structure is <b>NULL</b> for  <b>WDS_TRANSPORTCLIENT_PROTOCOL_MULTICAST</b> protocol.
     */
    pvProtocolData : IntPtr

    /**
     * The length of the protocol data pointed to by <b>pvProtocolData</b>.
     */
    ulProtocolDataLength : UInt32

}
