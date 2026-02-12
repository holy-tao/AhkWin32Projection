#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the possible PIN lock states of a mobile broadband PIN.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandpinlockstate
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandPinLockState extends Win32Enum{

    /**
     * The PIN lock state is unknown.
     * 
     * An example is no SIM card present.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The PIN lock state is unlocked.
     * 
     * Examples are if the user has provided a PIN already or no PIN is required.
     * @type {Integer (Int32)}
     */
    static Unlocked => 1

    /**
     * A PIN input is required. The [MobileBroadbandPinType](mobilebroadbandpintype.md) will contain more information on which PIN is needed.
     * @type {Integer (Int32)}
     */
    static PinRequired => 2

    /**
     * An invalid PIN has been entered too often and a PIN Unblock Key (PUK) is needed to proceed.
     * @type {Integer (Int32)}
     */
    static PinUnblockKeyRequired => 3
}
