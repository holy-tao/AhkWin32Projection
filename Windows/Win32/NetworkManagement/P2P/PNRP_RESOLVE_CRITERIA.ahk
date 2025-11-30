#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The PNRP_RESOLVE_CRITERIA enumeration specifies the criteria that PNRP uses to resolve searches.
 * @see https://docs.microsoft.com/windows/win32/api//pnrpdef/ne-pnrpdef-pnrp_resolve_criteria
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PNRP_RESOLVE_CRITERIA extends Win32Enum{

    /**
     * Use the PNRP_RESOLVE_CRITERIA_NON_CURRENT_PROCESS_PEER_NAME criteria. This is also the default behavior if <a href="https://docs.microsoft.com/windows/desktop/api/pnrpns/ns-pnrpns-pnrpinfo_v1">PNRPINFO</a> is not specified.
     * @type {Integer (Int32)}
     */
    static PNRP_RESOLVE_CRITERIA_DEFAULT => 0

    /**
     * Match a peer name. The resolve request excludes any  peer name registered locally on this computer.
     * @type {Integer (Int32)}
     */
    static PNRP_RESOLVE_CRITERIA_REMOTE_PEER_NAME => 1

    /**
     * Match a peer name by   finding the name with a service location closest to the supplied hint, or if no hint is supplied, closest to the local IP address.  The resolve request excludes any  peer name registered locally on this computer.
     * @type {Integer (Int32)}
     */
    static PNRP_RESOLVE_CRITERIA_NEAREST_REMOTE_PEER_NAME => 2

    /**
     * Match a peer name. The matching peer name can be registered locally or remotely,  but the resolve request excludes  any peer name registered by the process making the resolve request.
     * @type {Integer (Int32)}
     */
    static PNRP_RESOLVE_CRITERIA_NON_CURRENT_PROCESS_PEER_NAME => 3

    /**
     * Match a peer name by   finding the name with a service location closest to the supplied hint, or if no hint is supplied, closest to the local IP address. The matching peer name can be registered locally or remotely, but the resolve request excludes  any peer name registered by the process making the resolve request.
     * @type {Integer (Int32)}
     */
    static PNRP_RESOLVE_CRITERIA_NEAREST_NON_CURRENT_PROCESS_PEER_NAME => 4

    /**
     * Match a peer name. The matching peer name can be registered locally or remotely.
     * @type {Integer (Int32)}
     */
    static PNRP_RESOLVE_CRITERIA_ANY_PEER_NAME => 5

    /**
     * Match a peer name by   finding the name with a service location closest to the supplied hint, or if no hint is supplied, closest to the local IP address.  The matching peer name can be registered locally or remotely.
     * @type {Integer (Int32)}
     */
    static PNRP_RESOLVE_CRITERIA_NEAREST_PEER_NAME => 6
}
