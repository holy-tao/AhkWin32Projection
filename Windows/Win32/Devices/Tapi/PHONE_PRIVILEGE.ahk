#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The PHONE_PRIVILEGE enum indicates the application's privilege status with respect to the current phone device.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/ne-tapi3if-phone_privilege
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class PHONE_PRIVILEGE extends Win32Enum{

    /**
     * The application has owner privileges for the current phone session.
     * @type {Integer (Int32)}
     */
    static PP_OWNER => 0

    /**
     * The application has monitor privileges for the current phone session.
     * @type {Integer (Int32)}
     */
    static PP_MONITOR => 1
}
