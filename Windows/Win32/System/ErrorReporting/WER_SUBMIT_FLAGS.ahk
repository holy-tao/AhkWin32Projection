#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ErrorReporting
 */
class WER_SUBMIT_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: WER_SUBMIT_ADD_REGISTERED_DATA
     * @type {Integer (UInt32)}
     */
    static ADD_REGISTERED_DATA => 16

    /**
     * Native name: WER_SUBMIT_HONOR_RECOVERY
     * @type {Integer (UInt32)}
     */
    static HONOR_RECOVERY => 1

    /**
     * Native name: WER_SUBMIT_HONOR_RESTART
     * @type {Integer (UInt32)}
     */
    static HONOR_RESTART => 2

    /**
     * Native name: WER_SUBMIT_NO_ARCHIVE
     * @type {Integer (UInt32)}
     */
    static NO_ARCHIVE => 256

    /**
     * Native name: WER_SUBMIT_NO_CLOSE_UI
     * @type {Integer (UInt32)}
     */
    static NO_CLOSE_UI => 64

    /**
     * Native name: WER_SUBMIT_NO_QUEUE
     * @type {Integer (UInt32)}
     */
    static NO_QUEUE => 128

    /**
     * Native name: WER_SUBMIT_OUTOFPROCESS
     * @type {Integer (UInt32)}
     */
    static OUTOFPROCESS => 32

    /**
     * Native name: WER_SUBMIT_OUTOFPROCESS_ASYNC
     * @type {Integer (UInt32)}
     */
    static OUTOFPROCESS_ASYNC => 1024

    /**
     * Native name: WER_SUBMIT_QUEUE
     * @type {Integer (UInt32)}
     */
    static QUEUE => 4

    /**
     * Native name: WER_SUBMIT_SHOW_DEBUG
     * @type {Integer (UInt32)}
     */
    static SHOW_DEBUG => 8

    /**
     * Native name: WER_SUBMIT_START_MINIMIZED
     * @type {Integer (UInt32)}
     */
    static START_MINIMIZED => 512

    /**
     * Native name: WER_SUBMIT_BYPASS_DATA_THROTTLING
     * @type {Integer (UInt32)}
     */
    static BYPASS_DATA_THROTTLING => 2048

    /**
     * Native name: WER_SUBMIT_ARCHIVE_PARAMETERS_ONLY
     * @type {Integer (UInt32)}
     */
    static ARCHIVE_PARAMETERS_ONLY => 4096

    /**
     * Native name: WER_SUBMIT_REPORT_MACHINE_ID
     * @type {Integer (UInt32)}
     */
    static REPORT_MACHINE_ID => 8192
}
