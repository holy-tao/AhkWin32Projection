#Requires AutoHotkey v2.0.0 64-bit

/**
 * The PHONE_PRIVILEGE enum indicates the application's privilege status with respect to the current phone device.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/ne-tapi3if-phone_privilege
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class PHONE_PRIVILEGE{

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
