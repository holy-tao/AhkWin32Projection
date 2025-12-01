#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The PEER_GROUP_PROPERTY_FLAGS flags are used to specify various peer group membership settings.
 * @remarks
 * These flags can only be set by the peer group creator.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ne-p2p-peer_group_property_flags
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_GROUP_PROPERTY_FLAGS extends Win32Enum{

    /**
     * A peer's member data (<a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_member">PEER_MEMBER</a>) is only published  when an action if performed, such as publishing a record  or issuing a GMC. If the peer has not performed one of these actions, the membership data will not be available.
     * @type {Integer (Int32)}
     */
    static PEER_MEMBER_DATA_OPTIONAL => 1

    /**
     * The peer presence system is prevented from automatically publishing presence information.
     * @type {Integer (Int32)}
     */
    static PEER_DISABLE_PRESENCE => 2

    /**
     * Group records are not expired until the peer  connects with a group.
     * @type {Integer (Int32)}
     */
    static PEER_DEFER_EXPIRATION => 4
}
