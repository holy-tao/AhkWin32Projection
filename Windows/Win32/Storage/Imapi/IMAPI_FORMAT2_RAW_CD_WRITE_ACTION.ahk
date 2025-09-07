#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines values that indicate the current state of the write operation when using the IDiscFormat2RawCDEventArgs interface.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2/ne-imapi2-imapi_format2_raw_cd_write_action
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IMAPI_FORMAT2_RAW_CD_WRITE_ACTION{

    /**
     * Indicates an unknown state.
     * @type {Integer (Int32)}
     */
    static IMAPI_FORMAT2_RAW_CD_WRITE_ACTION_UNKNOWN => 0

    /**
     * Preparing to write the session.
     * @type {Integer (Int32)}
     */
    static IMAPI_FORMAT2_RAW_CD_WRITE_ACTION_PREPARING => 1

    /**
     * Writing session data.
     * @type {Integer (Int32)}
     */
    static IMAPI_FORMAT2_RAW_CD_WRITE_ACTION_WRITING => 2

    /**
     * Synchronizing the drive's cache with the end of the data written to disc.
     * @type {Integer (Int32)}
     */
    static IMAPI_FORMAT2_RAW_CD_WRITE_ACTION_FINISHING => 3
}
