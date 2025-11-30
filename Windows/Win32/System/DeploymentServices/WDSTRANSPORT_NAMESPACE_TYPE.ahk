#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Determines the type of multicast sessions used for transmitting objects covered by this namespace.
 * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/ne-wdstptmgmt-wdstransport_namespace_type
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class WDSTRANSPORT_NAMESPACE_TYPE extends Win32Enum{

    /**
     * Default value that indicates that the namespace type is not yet known. This could also be the case if a new namespace type was introduced in later server versions and this version of WdsTptMgmt has not been updated to fully recognize and classify it.
     * @type {Integer (Int32)}
     */
    static WdsTptNamespaceTypeUnknown => 0

    /**
     * Indicates that multicast sessions are to be created automatically by the server based on incoming requests from clients. The server independently decides when to start or end these sessions to optimize performance and reduce network congestion.
     * @type {Integer (Int32)}
     */
    static WdsTptNamespaceTypeAutoCast => 1

    /**
     * Indicates that multicast sessions for this namespace are to be scheduled such that they start only when the administrator manually launches them.
     * @type {Integer (Int32)}
     */
    static WdsTptNamespaceTypeScheduledCastManualStart => 2

    /**
     * Indicates that multicast sessions for this namespace are to be automatically started by the system based on criteria the administrator sets, such as a scheduled start time or minimum number of clients.
     * @type {Integer (Int32)}
     */
    static WdsTptNamespaceTypeScheduledCastAutoStart => 3
}
