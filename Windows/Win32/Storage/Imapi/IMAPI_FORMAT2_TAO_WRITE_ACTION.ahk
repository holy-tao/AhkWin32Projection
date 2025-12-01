#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values that indicate the current state of the write operation when using the IDiscFormat2TrackAtOnceEventArgs interface.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2/ne-imapi2-imapi_format2_tao_write_action
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IMAPI_FORMAT2_TAO_WRITE_ACTION extends Win32Enum{

    /**
     * Indicates an unknown state.
     * @type {Integer (Int32)}
     */
    static IMAPI_FORMAT2_TAO_WRITE_ACTION_UNKNOWN => 0

    /**
     * Preparing to write the track.
     * @type {Integer (Int32)}
     */
    static IMAPI_FORMAT2_TAO_WRITE_ACTION_PREPARING => 1

    /**
     * Writing the track.
     * @type {Integer (Int32)}
     */
    static IMAPI_FORMAT2_TAO_WRITE_ACTION_WRITING => 2

    /**
     * Closing the track or closing the session.
     * @type {Integer (Int32)}
     */
    static IMAPI_FORMAT2_TAO_WRITE_ACTION_FINISHING => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static IMAPI_FORMAT2_TAO_WRITE_ACTION_VERIFYING => 4
}
