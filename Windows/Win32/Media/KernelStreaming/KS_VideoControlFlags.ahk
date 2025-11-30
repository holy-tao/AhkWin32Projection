#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_VideoControlFlags extends Win32Enum{

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
