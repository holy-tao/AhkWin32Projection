#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the values returned with a [NetworkOperatorTetheringOperationResult](networkoperatortetheringoperationresult.md) object to indicate the status of a tethering operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.tetheringoperationstatus
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class TetheringOperationStatus extends Win32Enum{

    /**
     * The operation completed successfully.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The status of the operation is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 1

    /**
     * The operation could not begin because the mobile broadband device is turned off.
     * @type {Integer (Int32)}
     */
    static MobileBroadbandDeviceOff => 2

    /**
     * The operation could not begin because the Wifi device is turned off.
     * @type {Integer (Int32)}
     */
    static WiFiDeviceOff => 3

    /**
     * The operation did not complete because the mobile operator could not be contacted to confirm tethering capabilities are provided for this account.
     * @type {Integer (Int32)}
     */
    static EntitlementCheckTimeout => 4

    /**
     * The operation did not complete because the account does not currently support tethering operations.
     * @type {Integer (Int32)}
     */
    static EntitlementCheckFailure => 5

    /**
     * The operation is still in progress.
     * @type {Integer (Int32)}
     */
    static OperationInProgress => 6

    /**
     * The operation could not begin because Bluetooth or a required Bluetooth device is turned off.
     * @type {Integer (Int32)}
     */
    static BluetoothDeviceOff => 7

    /**
     * The operation did not complete because of limited network connectivity.
     * @type {Integer (Int32)}
     */
    static NetworkLimitedConnectivity => 8

    /**
     * The hotspot is already on (already running). This status is returned only when calling [StartTetheringAsync](./networkoperatortetheringmanager_starttetheringasync_1060696031.md) with a specified per-session configuration.
     * @type {Integer (Int32)}
     */
    static AlreadyOn => 9

    /**
     * Can't start a mobile hotspot on the requested frequency band due to radio restrictions (for example, the 6 GHz band requires 2x2 antennae / dual radio).
     * @type {Integer (Int32)}
     */
    static RadioRestriction => 10

    /**
     * Can't start a mobile hotspot on the requested frequency band due to the main connection frequency band interfering (for example, the 6 GHz band can't be configured for the mobile hotspot access point if the main station connection is over the 5 GHz band).
     * @type {Integer (Int32)}
     */
    static BandInterference => 11
}
