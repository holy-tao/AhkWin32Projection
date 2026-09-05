#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KS_VideoControlFlags extends Win32Enum {

    /**
     * Native name: KS_VideoControlFlag_FlipHorizontal
     * @type {Integer (Int32)}
     */
    static Flag_FlipHorizontal => 1

    /**
     * Native name: KS_VideoControlFlag_FlipVertical
     * @type {Integer (Int32)}
     */
    static Flag_FlipVertical => 2

    /**
     * Native name: KS_Obsolete_VideoControlFlag_ExternalTriggerEnable
     * @type {Integer (Int32)}
     */
    static Obsolete_VideoControlFlag_ExternalTriggerEnable => 16

    /**
     * Native name: KS_Obsolete_VideoControlFlag_Trigger
     * @type {Integer (Int32)}
     */
    static Obsolete_VideoControlFlag_Trigger => 32

    /**
     * Native name: KS_VideoControlFlag_ExternalTriggerEnable
     * @type {Integer (Int32)}
     */
    static Flag_ExternalTriggerEnable => 4

    /**
     * Native name: KS_VideoControlFlag_Trigger
     * @type {Integer (Int32)}
     */
    static Flag_Trigger => 8

    /**
     * Native name: KS_VideoControlFlag_IndependentImagePin
     * @type {Integer (Int32)}
     */
    static Flag_IndependentImagePin => 64

    /**
     * Native name: KS_VideoControlFlag_StillCapturePreviewFrame
     * @type {Integer (Int32)}
     */
    static Flag_StillCapturePreviewFrame => 128

    /**
     * Native name: KS_VideoControlFlag_StartPhotoSequenceCapture
     * @type {Integer (Int32)}
     */
    static Flag_StartPhotoSequenceCapture => 256

    /**
     * Native name: KS_VideoControlFlag_StopPhotoSequenceCapture
     * @type {Integer (Int32)}
     */
    static Flag_StopPhotoSequenceCapture => 512
}
