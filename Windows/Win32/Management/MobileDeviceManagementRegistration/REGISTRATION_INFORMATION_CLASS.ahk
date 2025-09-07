#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains information about the device registration.
 * @see https://learn.microsoft.com/windows/win32/api/mdmregistration/ne-mdmregistration-registration_information_class
 * @namespace Windows.Win32.Management.MobileDeviceManagementRegistration
 * @version v4.0.30319
 */
class REGISTRATION_INFORMATION_CLASS{

    /**
     * Information about the device registration.
     * @type {Integer (Int32)}
     */
    static DeviceRegistrationBasicInfo => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MaxDeviceInfoClass => 2
}
