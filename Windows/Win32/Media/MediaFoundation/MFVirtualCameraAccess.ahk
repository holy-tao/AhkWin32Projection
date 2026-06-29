#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the access restrictions for a virtual camera.
 * @remarks
 * Values from this enumeration are passed into [MFCreateVirtualCamera](nf-mfvirtualcamera-mfcreatevirtualcamera.md). To create a virtual camera with **MFVirtualCameraAccess_AllUsers**, the caller of **MFCreateVirtualCamera** must have administrator permissions.
 * @see https://learn.microsoft.com/windows/win32/api/mfvirtualcamera/ne-mfvirtualcamera-mfvirtualcameraaccess
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFVirtualCameraAccess {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The virtual camera can only be accessed by the current user.
     * @type {Integer (Int32)}
     */
    static MFVirtualCameraAccess_CurrentUser => 0

    /**
     * The virtual camera can be accessed by all users.
     * @type {Integer (Int32)}
     */
    static MFVirtualCameraAccess_AllUsers => 1
}
