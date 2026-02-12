#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the constants that indicates the level of support for magnetic stripe reader authentication protocol: NotSupported, Optional, or Required.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderauthenticationlevel
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class MagneticStripeReaderAuthenticationLevel extends Win32Enum{

    /**
     * Does not support authentication.
     * @type {Integer (Int32)}
     */
    static NotSupported => 0

    /**
     * Supports authentication, but does not require it.
     * @type {Integer (Int32)}
     */
    static Optional => 1

    /**
     * Requires authentication.
     * @type {Integer (Int32)}
     */
    static Required => 2
}
