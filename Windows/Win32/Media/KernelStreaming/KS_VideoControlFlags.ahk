#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_VideoControlFlags {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static KS_VideoControlFlag_FlipHorizontal => 1

    /**
     * @type {Integer (Int32)}
     */
    static KS_VideoControlFlag_FlipVertical => 2

    /**
     * @type {Integer (Int32)}
     */
    static KS_Obsolete_VideoControlFlag_ExternalTriggerEnable => 16

    /**
     * @type {Integer (Int32)}
     */
    static KS_Obsolete_VideoControlFlag_Trigger => 32

    /**
     * @type {Integer (Int32)}
     */
    static KS_VideoControlFlag_ExternalTriggerEnable => 4

    /**
     * @type {Integer (Int32)}
     */
    static KS_VideoControlFlag_Trigger => 8

    /**
     * @type {Integer (Int32)}
     */
    static KS_VideoControlFlag_IndependentImagePin => 64

    /**
     * @type {Integer (Int32)}
     */
    static KS_VideoControlFlag_StillCapturePreviewFrame => 128

    /**
     * @type {Integer (Int32)}
     */
    static KS_VideoControlFlag_StartPhotoSequenceCapture => 256

    /**
     * @type {Integer (Int32)}
     */
    static KS_VideoControlFlag_StopPhotoSequenceCapture => 512
}
