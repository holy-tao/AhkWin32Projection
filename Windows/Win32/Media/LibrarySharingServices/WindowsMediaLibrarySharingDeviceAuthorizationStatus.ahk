#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WindowsMediaLibrarySharingDeviceAuthorizationStatus enumeration defines constants that indicate whether a media device is authorized to have access to a media library.
 * @see https://learn.microsoft.com/windows/win32/api/wmlss/ne-wmlss-windowsmedialibrarysharingdeviceauthorizationstatus
 * @namespace Windows.Win32.Media.LibrarySharingServices
 */
class WindowsMediaLibrarySharingDeviceAuthorizationStatus extends Win32Enum {

    /**
     * It is not known whether the device is authorized to have access to the media library.
     * Native name: DEVICE_AUTHORIZATION_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * The device is authorized to have access to the media library.
     * Native name: DEVICE_AUTHORIZATION_ALLOWED
     * @type {Integer (Int32)}
     */
    static ALLOWED => 1

    /**
     * The device is not authorized to have access to the media library.
     * Native name: DEVICE_AUTHORIZATION_DENIED
     * @type {Integer (Int32)}
     */
    static DENIED => 2
}
