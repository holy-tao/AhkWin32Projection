#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The level of protection for pairing.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepairingprotectionlevel
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class DevicePairingProtectionLevel extends Win32Enum{

    /**
     * The default value. This should not be used.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Pair the device using no levels of protection.
     * @type {Integer (Int32)}
     */
    static None => 1

    /**
     * Pair the device using encryption.
     * @type {Integer (Int32)}
     */
    static Encryption => 2

    /**
     * Pair the device using encryption and authentication.
     * @type {Integer (Int32)}
     */
    static EncryptionAndAuthentication => 3
}
