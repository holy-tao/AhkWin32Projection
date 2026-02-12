#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the constants that indicates the authentication protocol supported by the device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderauthenticationprotocol
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class MagneticStripeReaderAuthenticationProtocol extends Win32Enum{

    /**
     * The device does not support device authentication.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The device supports challenge response protocol.
     * @type {Integer (Int32)}
     */
    static ChallengeResponse => 1
}
