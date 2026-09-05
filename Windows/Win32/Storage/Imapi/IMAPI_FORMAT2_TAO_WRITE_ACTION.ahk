#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values that indicate the current state of the write operation when using the IDiscFormat2TrackAtOnceEventArgs interface.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2/ne-imapi2-imapi_format2_tao_write_action
 * @namespace Windows.Win32.Storage.Imapi
 */
class IMAPI_FORMAT2_TAO_WRITE_ACTION extends Win32Enum {

    /**
     * Indicates an unknown state.
     * Native name: IMAPI_FORMAT2_TAO_WRITE_ACTION_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Preparing to write the track.
     * Native name: IMAPI_FORMAT2_TAO_WRITE_ACTION_PREPARING
     * @type {Integer (Int32)}
     */
    static PREPARING => 1

    /**
     * Writing the track.
     * Native name: IMAPI_FORMAT2_TAO_WRITE_ACTION_WRITING
     * @type {Integer (Int32)}
     */
    static WRITING => 2

    /**
     * Closing the track or closing the session.
     * Native name: IMAPI_FORMAT2_TAO_WRITE_ACTION_FINISHING
     * @type {Integer (Int32)}
     */
    static FINISHING => 3

    /**
     * Native name: IMAPI_FORMAT2_TAO_WRITE_ACTION_VERIFYING
     * @type {Integer (Int32)}
     */
    static VERIFYING => 4
}
