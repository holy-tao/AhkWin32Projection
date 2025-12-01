#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of automatic actions a WDS transport server, running on Windows Server 2008 R2, should use to handle a client computer that is slowing the multicast transmission.
 * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/ne-wdstptmgmt-wdstransport_slow_client_handling_type
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class WDSTRANSPORT_SLOW_CLIENT_HANDLING_TYPE extends Win32Enum{

    /**
     * Default value that indicates the automatic action used to handle slow client computers is not known.
     * @type {Integer (Int32)}
     */
    static WdsTptSlowClientHandlingUnknown => 0

    /**
     * Indicates that the server takes no action on any clients that are slowing the multicast transmission.
     * @type {Integer (Int32)}
     */
    static WdsTptSlowClientHandlingNone => 1

    /**
     * Indicates that the server detects clients that are slowing the multicast transmission below a configured threshold. Depending on a configurable setting, the server disconnects the slow clients from the multicast transmission or instructs the slow clients to fallback to an alternate mechanism for retrieving data. For example, a client disconnected from a multicast session can try using unicast instead.
     * @type {Integer (Int32)}
     */
    static WdsTptSlowClientHandlingAutoDisconnect => 2

    /**
     * Indicates that the server detects clients that are slowing the multicast transmission below a specified percentage of available bandwidth. The server moves the slow clients to lower-speed streams of the same multicast transmission. The server cannot move legacy clients that do not support the multistream handling option, and in this case, the server disconnects the client or instructs the client to fallback depending upon the <a href="https://docs.microsoft.com/windows/desktop/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportmulticastsessionpolicy-get_slowclientfallback">SlowClientFallback</a> property.
     * @type {Integer (Int32)}
     */
    static WdsTptSlowClientHandlingMultistream => 3
}
