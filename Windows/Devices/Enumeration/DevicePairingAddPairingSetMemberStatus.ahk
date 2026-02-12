#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify a status value describing the result of adding member(s) to a pairing set. For more info, and code examples, see [Pairing a set with the DeviceInformationPairing.Custom property](/windows/uwp/devices-sensors/pairing-a-set). See [DevicePairingSetMembersRequestedEventArgs.Status](./devicepairingsetmembersrequestedeventargs_status.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepairingaddpairingsetmemberstatus
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class DevicePairingAddPairingSetMemberStatus extends Win32Enum{

    /**
     * Specifies that set member(s) were added successfully to the set. This status applies to a call to [DeviceInformationCustomPairing.AddPairingSetMember](./deviceinformationcustompairing_addpairingsetmember_1277113744.md), and indicates that you can expect *the successfully added set member(s)* to be in the [DevicePairingSetMembersRequestedEventArgs.PairingSetMembers](./devicepairingsetmembersrequestedeventargs_pairingsetmembers.md) vector.
     * @type {Integer (Int32)}
     */
    static AddedToSet => 0

    /**
     * Specifies that set member(s) couldn't be added to the set. This status applies to a call to [DeviceInformationCustomPairing.AddPairingSetMember](./deviceinformationcustompairing_addpairingsetmember_1277113744.md), and indicates that you can expect *the set member(s) that couldn't be added* to be in the [DevicePairingSetMembersRequestedEventArgs.PairingSetMembers](./devicepairingsetmembersrequestedeventargs_pairingsetmembers.md) vector.
     * @type {Integer (Int32)}
     */
    static CouldNotBeAddedToSet => 1

    /**
     * Specifies that the protocol didn't attempt to discover set members. The protocol probably doesn't support it.
     * @type {Integer (Int32)}
     */
    static SetDiscoveryNotAttemptedByProtocol => 2

    /**
     * Specifies that the protocol successfully enumerated all set members. No further discovery will happen.
     * @type {Integer (Int32)}
     */
    static SetDiscoveryCompletedByProtocol => 3

    /**
     * Specifies that the protocol discovered some set members, but not all of them. No further discovery will happen.
     * @type {Integer (Int32)}
     */
    static SetDiscoveryPartiallyCompletedByProtocol => 4

    /**
     * Specifies that an unknown failure occurred, for which we have no mapping.
     * @type {Integer (Int32)}
     */
    static Failed => 5
}
