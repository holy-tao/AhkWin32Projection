#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Represents the desired security level.
  * 
  * Allows the desired Security option to be requested.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattprotectionlevel
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattProtectionLevel extends Win32Enum{

    /**
     * Uses the default protection level.
     * @type {Integer (Int32)}
     */
    static Plain => 0

    /**
     * Require the link to be authenticated.
     * @type {Integer (Int32)}
     */
    static AuthenticationRequired => 1

    /**
     * Require the link to be encrypted.
     * @type {Integer (Int32)}
     */
    static EncryptionRequired => 2

    /**
     * Require the link to be encrypted and authenticated.
     * @type {Integer (Int32)}
     */
    static EncryptionAndAuthenticationRequired => 3
}
