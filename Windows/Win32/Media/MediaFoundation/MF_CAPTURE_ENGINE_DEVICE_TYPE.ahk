#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies a type of capture device.
 * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/ne-mfcaptureengine-mf_capture_engine_device_type
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_CAPTURE_ENGINE_DEVICE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
