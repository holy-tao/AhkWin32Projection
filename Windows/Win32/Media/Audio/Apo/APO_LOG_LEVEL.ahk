#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the level of an APO event logged with IAudioProcessingObjectLoggingService::ApoLog.
 * @remarks
 * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
 * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/ne-audioengineextensionapo-apo_log_level
 * @namespace Windows.Win32.Media.Audio.Apo
 */
class APO_LOG_LEVEL extends Win32Enum {

    /**
     * All events.
     * Native name: APO_LOG_LEVEL_ALWAYS
     * @type {Integer (Int32)}
     */
    static ALWAYS => 0

    /**
     * Abnormal exit or termination events.
     * Native name: APO_LOG_LEVEL_CRITICAL
     * @type {Integer (Int32)}
     */
    static CRITICAL => 1

    /**
     * Severe error events.
     * Native name: APO_LOG_LEVEL_ERROR
     * @type {Integer (Int32)}
     */
    static ERROR => 2

    /**
     * Warning events such as allocation failures.
     * Native name: APO_LOG_LEVEL_WARNING
     * @type {Integer (Int32)}
     */
    static WARNING => 3

    /**
     * Non-error events such as entry or exit events.
     * Native name: APO_LOG_LEVEL_INFO
     * @type {Integer (Int32)}
     */
    static INFO => 4

    /**
     * Detailed trace events.
     * Native name: APO_LOG_LEVEL_VERBOSE
     * @type {Integer (Int32)}
     */
    static VERBOSE => 5
}
