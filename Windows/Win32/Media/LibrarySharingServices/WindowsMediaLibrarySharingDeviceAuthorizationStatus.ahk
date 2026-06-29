#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WindowsMediaLibrarySharingDeviceAuthorizationStatus enumeration defines constants that indicate whether a media device is authorized to have access to a media library.
 * @see https://learn.microsoft.com/windows/win32/api/wmlss/ne-wmlss-windowsmedialibrarysharingdeviceauthorizationstatus
 * @namespace Windows.Win32.Media.LibrarySharingServices
 */
export default struct WindowsMediaLibrarySharingDeviceAuthorizationStatus {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * It is not known whether the device is authorized to have access to the media library.
     * @type {Integer (Int32)}
     */
    static DEVICE_AUTHORIZATION_UNKNOWN => 0

    /**
     * The device is authorized to have access to the media library.
     * @type {Integer (Int32)}
     */
    static DEVICE_AUTHORIZATION_ALLOWED => 1

    /**
     * The device is not authorized to have access to the media library.
     * @type {Integer (Int32)}
     */
    static DEVICE_AUTHORIZATION_DENIED => 2
}
