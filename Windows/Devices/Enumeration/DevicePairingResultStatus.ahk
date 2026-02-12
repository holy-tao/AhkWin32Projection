#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The result of the pairing action with an Association Endpoint (AEP) device object. For more information about AEP objects, see [DeviceInformationKind](deviceinformationkind.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepairingresultstatus
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class DevicePairingResultStatus extends Win32Enum{

    /**
     * The device object is now paired.
     * @type {Integer (Int32)}
     */
    static Paired => 0

    /**
     * The device object is not in a state where it can be paired.
     * @type {Integer (Int32)}
     */
    static NotReadyToPair => 1

    /**
     * The device object is not currently paired.
     * @type {Integer (Int32)}
     */
    static NotPaired => 2

    /**
     * The device object has already been paired.
     * @type {Integer (Int32)}
     */
    static AlreadyPaired => 3

    /**
     * The device object rejected the connection.
     * @type {Integer (Int32)}
     */
    static ConnectionRejected => 4

    /**
     * The device object indicated it cannot accept any more incoming connections.
     * @type {Integer (Int32)}
     */
    static TooManyConnections => 5

    /**
     * The device object indicated there was a hardware failure.
     * @type {Integer (Int32)}
     */
    static HardwareFailure => 6

    /**
     * The authentication process timed out before it could complete.
     * @type {Integer (Int32)}
     */
    static AuthenticationTimeout => 7

    /**
     * The authentication protocol is not supported, so the device is not paired.
     * @type {Integer (Int32)}
     */
    static AuthenticationNotAllowed => 8

    /**
     * Authentication failed, so the device is not paired. Either the device object or the application rejected the authentication.
     * @type {Integer (Int32)}
     */
    static AuthenticationFailure => 9

    /**
     * There are no network profiles for this device object to use.
     * @type {Integer (Int32)}
     */
    static NoSupportedProfiles => 10

    /**
     * The minimum level of protection is not supported by the device object or the application.
     * @type {Integer (Int32)}
     */
    static ProtectionLevelCouldNotBeMet => 11

    /**
     * Your application does not have the appropriate permissions level to pair the device object.
     * @type {Integer (Int32)}
     */
    static AccessDenied => 12

    /**
     * The ceremony data was incorrect.
     * @type {Integer (Int32)}
     */
    static InvalidCeremonyData => 13

    /**
     * The pairing action was canceled before completion.
     * @type {Integer (Int32)}
     */
    static PairingCanceled => 14

    /**
     * The device object is already attempting to pair or unpair.
     * @type {Integer (Int32)}
     */
    static OperationAlreadyInProgress => 15

    /**
     * Either the event handler wasn't registered or a required [DevicePairingKinds](devicepairingkinds.md) was not supported.
     * @type {Integer (Int32)}
     */
    static RequiredHandlerNotRegistered => 16

    /**
     * The application handler rejected the pairing.
     * @type {Integer (Int32)}
     */
    static RejectedByHandler => 17

    /**
     * The remove device already has an association.
     * @type {Integer (Int32)}
     */
    static RemoteDeviceHasAssociation => 18

    /**
     * An unknown failure occurred.
     * @type {Integer (Int32)}
     */
    static Failed => 19
}
