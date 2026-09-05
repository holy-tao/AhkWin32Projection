#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies a type of capture device.
 * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/ne-mfcaptureengine-mf_capture_engine_device_type
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_CAPTURE_ENGINE_DEVICE_TYPE extends Win32Enum {

    /**
     * An audio capture device, such as a microphone.
     * Native name: MF_CAPTURE_ENGINE_DEVICE_TYPE_AUDIO
     * @type {Integer (Int32)}
     */
    static AUDIO => 0

    /**
     * A video capture device, such as a webcam.
     * Native name: MF_CAPTURE_ENGINE_DEVICE_TYPE_VIDEO
     * @type {Integer (Int32)}
     */
    static VIDEO => 1
}
