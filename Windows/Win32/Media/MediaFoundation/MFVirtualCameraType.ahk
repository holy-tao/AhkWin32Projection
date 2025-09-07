#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of a virtual camera.
 * @remarks
 * Values from this enumeration are passed into [MFCreateVirtualCamera](nf-mfvirtualcamera-mfcreatevirtualcamera.md).
 * @see https://learn.microsoft.com/windows/win32/api/mfvirtualcamera/ne-mfvirtualcamera-mfvirtualcameratype
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFVirtualCameraType{

    /**
     * The virtual camera is a software camera source.
     * @type {Integer (Int32)}
     */
    static MFVirtualCameraType_SoftwareCameraSource => 0
}
