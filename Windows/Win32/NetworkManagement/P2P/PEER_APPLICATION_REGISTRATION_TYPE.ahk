#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The PEER_APPLICATION_REGISTRATION_TYPE enumeration defines the set of peer application registration flags.
 * @remarks
 * 
 * "Peer application" defines the set of software applications or components available for use with the peer collaboration network. The peer collaboration network enables participants in the network to initiate usage of this application.
 * 
 * Applications with the same GUID and registered for the <b>current user</b>  take precedence over applications with that same GUID registered for <b>all users</b>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//p2p/ne-p2p-peer_application_registration_type
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_APPLICATION_REGISTRATION_TYPE extends Win32Enum{

    /**
     * The application is available only to the current user account logged into the machine.
     * @type {Integer (Int32)}
     */
    static PEER_APPLICATION_CURRENT_USER => 0

    /**
     * The application is available to all user accounts set on the machine.
     * @type {Integer (Int32)}
     */
    static PEER_APPLICATION_ALL_USERS => 1
}
