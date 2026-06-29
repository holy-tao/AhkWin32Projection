#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of a virtual camera.
 * @remarks
 * Values from this enumeration are passed into [MFCreateVirtualCamera](nf-mfvirtualcamera-mfcreatevirtualcamera.md).
 * @see https://learn.microsoft.com/windows/win32/api/mfvirtualcamera/ne-mfvirtualcamera-mfvirtualcameratype
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFVirtualCameraType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The virtual camera is a software camera source.
     * @type {Integer (Int32)}
     */
    static MFVirtualCameraType_SoftwareCameraSource => 0
}
