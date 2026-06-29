#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about the device registration.
 * @see https://learn.microsoft.com/windows/win32/api/mdmregistration/ne-mdmregistration-registration_information_class
 * @namespace Windows.Win32.Management.MobileDeviceManagementRegistration
 */
export default struct REGISTRATION_INFORMATION_CLASS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Information about the device registration.
     * @type {Integer (Int32)}
     */
    static DeviceRegistrationBasicInfo => 1

    /**
     * @type {Integer (Int32)}
     */
    static MaxDeviceInfoClass => 2
}
