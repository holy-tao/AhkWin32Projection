#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the lifetime of a virtual camera.
 * @remarks
 * Values from this enumeration are passed into [MFCreateVirtualCamera](nf-mfvirtualcamera-mfcreatevirtualcamera.md).
 * @see https://learn.microsoft.com/windows/win32/api/mfvirtualcamera/ne-mfvirtualcamera-mfvirtualcameralifetime
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFVirtualCameraLifetime {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The camera persists until the  [IMFVirtualCamera](nn-mfvirtualcamera-imfvirtualcamera.md) object is disposed or [IMFVirtualCamera::Shutdown](nf-mfvirtualcamera-imfvirtualcamera-shutdown.md) is called. Afterwards, the virtual camera will no longer be enumerable or activatable on the device.
     * @type {Integer (Int32)}
     */
    static MFVirtualCameraLifetime_Session => 0

    /**
     * The virtual camera persists across sessions and reboots.
     * @type {Integer (Int32)}
     */
    static MFVirtualCameraLifetime_System => 1
}
