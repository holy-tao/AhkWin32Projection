#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains information about the device registration.
 * @see https://docs.microsoft.com/windows/win32/api//mdmregistration/ne-mdmregistration-registration_information_class
 * @namespace Windows.Win32.Management.MobileDeviceManagementRegistration
 * @version v4.0.30319
 */
class REGISTRATION_INFORMATION_CLASS extends Win32Enum{

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
