#Requires AutoHotkey v2.0.0 64-bit

/**
 * The WindowsMediaLibrarySharingDeviceAuthorizationStatus enumeration defines constants that indicate whether a media device is authorized to have access to a media library.
 * @see https://learn.microsoft.com/windows/win32/api/wmlss/ne-wmlss-windowsmedialibrarysharingdeviceauthorizationstatus
 * @namespace Windows.Win32.Media.LibrarySharingServices
 * @version v4.0.30319
 */
class WindowsMediaLibrarySharingDeviceAuthorizationStatus{

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
