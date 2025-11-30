#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/ne-audioengineextensionapo-apo_log_level
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class APO_LOG_LEVEL extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static APO_LOG_LEVEL_ALWAYS => 0

    /**
     * @type {Integer (Int32)}
     */
    static APO_LOG_LEVEL_CRITICAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static APO_LOG_LEVEL_ERROR => 2

    /**
     * @type {Integer (Int32)}
     */
    static APO_LOG_LEVEL_WARNING => 3

    /**
     * @type {Integer (Int32)}
     */
    static APO_LOG_LEVEL_INFO => 4

    /**
     * @type {Integer (Int32)}
     */
    static APO_LOG_LEVEL_VERBOSE => 5
}
