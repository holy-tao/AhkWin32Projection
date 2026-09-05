#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the access restrictions for a virtual camera.
 * @remarks
 * Values from this enumeration are passed into [MFCreateVirtualCamera](nf-mfvirtualcamera-mfcreatevirtualcamera.md). To create a virtual camera with **MFVirtualCameraAccess_AllUsers**, the caller of **MFCreateVirtualCamera** must have administrator permissions.
 * @see https://learn.microsoft.com/windows/win32/api/mfvirtualcamera/ne-mfvirtualcamera-mfvirtualcameraaccess
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MFVirtualCameraAccess extends Win32Enum {

    /**
     * The virtual camera can only be accessed by the current user.
     * Native name: MFVirtualCameraAccess_CurrentUser
     * @type {Integer (Int32)}
     */
    static CurrentUser => 0

    /**
     * The virtual camera can be accessed by all users.
     * Native name: MFVirtualCameraAccess_AllUsers
     * @type {Integer (Int32)}
     */
    static AllUsers => 1
}
