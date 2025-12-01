#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates what action a WDS client should take when it is disconnected from the session.
 * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/ne-wdstptmgmt-wdstransport_disconnect_type
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class WDSTRANSPORT_DISCONNECT_TYPE extends Win32Enum{

    /**
     * Default value that indicates that the disconnection type is not known.
     * @type {Integer (Int32)}
     */
    static WdsTptDisconnectUnknown => 0

    /**
     * Indicates that the client should leave the session and fallback to an alternate mechanism for retrieving data. For example, a client disconnected from a multicast session can try using unicast instead.
     * @type {Integer (Int32)}
     */
    static WdsTptDisconnectFallback => 1

    /**
     * Indicates that the client should leave the session and abort all attempts to retrieve the data from this server.
     * @type {Integer (Int32)}
     */
    static WdsTptDisconnectAbort => 2
}
