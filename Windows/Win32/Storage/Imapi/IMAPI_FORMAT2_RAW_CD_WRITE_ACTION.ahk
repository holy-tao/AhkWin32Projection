#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values that indicate the current state of the write operation when using the IDiscFormat2RawCDEventArgs interface.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2/ne-imapi2-imapi_format2_raw_cd_write_action
 * @namespace Windows.Win32.Storage.Imapi
 */
class IMAPI_FORMAT2_RAW_CD_WRITE_ACTION extends Win32Enum {

    /**
     * Indicates an unknown state.
     * Native name: IMAPI_FORMAT2_RAW_CD_WRITE_ACTION_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Preparing to write the session.
     * Native name: IMAPI_FORMAT2_RAW_CD_WRITE_ACTION_PREPARING
     * @type {Integer (Int32)}
     */
    static PREPARING => 1

    /**
     * Writing session data.
     * Native name: IMAPI_FORMAT2_RAW_CD_WRITE_ACTION_WRITING
     * @type {Integer (Int32)}
     */
    static WRITING => 2

    /**
     * Synchronizing the drive's cache with the end of the data written to disc.
     * Native name: IMAPI_FORMAT2_RAW_CD_WRITE_ACTION_FINISHING
     * @type {Integer (Int32)}
     */
    static FINISHING => 3
}
