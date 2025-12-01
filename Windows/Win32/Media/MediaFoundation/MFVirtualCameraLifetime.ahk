#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the lifetime of a virtual camera.
 * @remarks
 * Values from this enumeration are passed into [MFCreateVirtualCamera](nf-mfvirtualcamera-mfcreatevirtualcamera.md).
 * @see https://learn.microsoft.com/windows/win32/api/mfvirtualcamera/ne-mfvirtualcamera-mfvirtualcameralifetime
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFVirtualCameraLifetime extends Win32Enum{

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
