#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ErrorReporting
 * @version v4.0.30319
 */
class WER_SUBMIT_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static WER_SUBMIT_ADD_REGISTERED_DATA => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WER_SUBMIT_HONOR_RECOVERY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WER_SUBMIT_HONOR_RESTART => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WER_SUBMIT_NO_ARCHIVE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WER_SUBMIT_NO_CLOSE_UI => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WER_SUBMIT_NO_QUEUE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WER_SUBMIT_OUTOFPROCESS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WER_SUBMIT_OUTOFPROCESS_ASYNC => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static WER_SUBMIT_QUEUE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WER_SUBMIT_SHOW_DEBUG => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WER_SUBMIT_START_MINIMIZED => 512

    /**
     * @type {Integer (UInt32)}
     */
    static WER_SUBMIT_BYPASS_DATA_THROTTLING => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static WER_SUBMIT_ARCHIVE_PARAMETERS_ONLY => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static WER_SUBMIT_REPORT_MACHINE_ID => 8192
}
