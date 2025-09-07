#Requires AutoHotkey v2.0.0 64-bit

/**
 * This enumeration is received by the WdsTransportClientRegisterCallback function.
 * @see https://learn.microsoft.com/windows/win32/api/wdstci/ne-wdstci-transportclient_callback_id
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class TRANSPORTCLIENT_CALLBACK_ID{

    /**
     * Identifies the <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/nc-wdstci-pfn_wdstransportclientsessionstart">PFN_WdsTransportClientSessionStart</a> callback.
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTCLIENT_SESSION_START => 0

    /**
     * Identifies the <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/nc-wdstci-pfn_wdstransportclientreceivecontents">PFN_WdsTransportClientReceiveContents</a> callback.
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTCLIENT_RECEIVE_CONTENTS => 1

    /**
     * Identifies the <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/nc-wdstci-pfn_wdstransportclientsessioncomplete">PFN_WdsTransportClientSessionComplete</a> callback.
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTCLIENT_SESSION_COMPLETE => 2

    /**
     * Identifies the <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/nc-wdstci-pfn_wdstransportclientreceivemetadata">PFN_WdsTransportClientReceiveMetadata</a> callback.
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTCLIENT_RECEIVE_METADATA => 3

    /**
     * Identifies the <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/nc-wdstci-pfn_wdstransportclientsessionstartex">PFN_WdsTransportClientSessionStartEx</a> callback.
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTCLIENT_SESSION_STARTEX => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTCLIENT_SESSION_NEGOTIATE => 5

    /**
     * Used for validation checking.
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTCLIENT_MAX_CALLBACKS => 6
}
