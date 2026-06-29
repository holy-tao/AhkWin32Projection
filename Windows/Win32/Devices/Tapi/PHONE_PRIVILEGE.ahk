#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The PHONE_PRIVILEGE enum indicates the application's privilege status with respect to the current phone device.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/ne-tapi3if-phone_privilege
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct PHONE_PRIVILEGE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
