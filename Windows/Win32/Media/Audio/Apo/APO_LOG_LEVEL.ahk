#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the level of an APO event logged with IAudioProcessingObjectLoggingService::ApoLog.
 * @remarks
 * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
 * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/ne-audioengineextensionapo-apo_log_level
 * @namespace Windows.Win32.Media.Audio.Apo
 */
export default struct APO_LOG_LEVEL {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * All events.
     * @type {Integer (Int32)}
     */
    static APO_LOG_LEVEL_ALWAYS => 0

    /**
     * Abnormal exit or termination events.
     * @type {Integer (Int32)}
     */
    static APO_LOG_LEVEL_CRITICAL => 1

    /**
     * Severe error events.
     * @type {Integer (Int32)}
     */
    static APO_LOG_LEVEL_ERROR => 2

    /**
     * Warning events such as allocation failures.
     * @type {Integer (Int32)}
     */
    static APO_LOG_LEVEL_WARNING => 3

    /**
     * Non-error events such as entry or exit events.
     * @type {Integer (Int32)}
     */
    static APO_LOG_LEVEL_INFO => 4

    /**
     * Detailed trace events.
     * @type {Integer (Int32)}
     */
    static APO_LOG_LEVEL_VERBOSE => 5
}
