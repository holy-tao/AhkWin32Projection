#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies a type of capture device.
 * @see https://docs.microsoft.com/windows/win32/api//mfcaptureengine/ne-mfcaptureengine-mf_capture_engine_device_type
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_CAPTURE_ENGINE_DEVICE_TYPE{

    /**
     * An audio capture device, such as a microphone.
     * @type {Integer (Int32)}
     */
    static MF_CAPTURE_ENGINE_DEVICE_TYPE_AUDIO => 0

    /**
     * A video capture device, such as a webcam.
     * @type {Integer (Int32)}
     */
    static MF_CAPTURE_ENGINE_DEVICE_TYPE_VIDEO => 1
}
