#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_NI_USER_RESPONSE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_Ni_UserResponseAccept => 1

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_Ni_UserResponseDeny => 2

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_Ni_UserResponseTimeout => 3
}
