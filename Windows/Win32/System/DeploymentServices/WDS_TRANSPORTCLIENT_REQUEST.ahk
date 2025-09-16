#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * This structure is used by the WdsTransportClientStartSession function.
 * @see https://learn.microsoft.com/windows/win32/api/wdstci/ns-wdstci-wds_transportclient_request
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class WDS_TRANSPORTCLIENT_REQUEST extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * The length of this structure in bytes.
     * @type {Integer}
     */
    ulLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

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
     * @type {Integer}
     */
    ulApiVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * 
     * @type {Integer}
     */
    ulAuthLevel {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Server name.
     * @type {Pointer<PWSTR>}
     */
    pwszServer {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Namespace of the object to retrieve.
     * @type {Pointer<PWSTR>}
     */
    pwszNamespace {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Specifies the name of the object to retrieve.  Object names are
     *      provider dependent.
     * @type {Pointer<PWSTR>}
     */
    pwszObjectName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Specifies how much data in bytes the consumer can store in its queue.  Once
     *      this threshold is reached, the client will not send any more writes to
     *     the consumer until some memory is released with 
     *     WdsTransportClientCompleteWrite.
     * @type {Integer}
     */
    ulCacheSize {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

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
     * @type {Integer}
     */
    ulProtocol {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Protocol data structure for the protocol. The structure is <b>NULL</b> for  <b>WDS_TRANSPORTCLIENT_PROTOCOL_MULTICAST</b> protocol.
     * @type {Pointer<Void>}
     */
    pvProtocolData {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * The length of the protocol data pointed to by <b>pvProtocolData</b>.
     * @type {Integer}
     */
    ulProtocolDataLength {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }
}
