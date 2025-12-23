#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the level of an APO event logged with IAudioProcessingObjectLoggingService::ApoLog.
 * @remarks
 * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
 * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/ne-audioengineextensionapo-apo_log_level
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class APO_LOG_LEVEL extends Win32Enum{

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
