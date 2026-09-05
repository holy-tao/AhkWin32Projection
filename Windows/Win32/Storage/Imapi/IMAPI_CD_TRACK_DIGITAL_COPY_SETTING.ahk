#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the digital copy setting values available for a given track.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2/ne-imapi2-imapi_cd_track_digital_copy_setting
 * @namespace Windows.Win32.Storage.Imapi
 */
class IMAPI_CD_TRACK_DIGITAL_COPY_SETTING extends Win32Enum {

    /**
     * Digital copies of the given track are allowed.
     * Native name: IMAPI_CD_TRACK_DIGITAL_COPY_PERMITTED
     * @type {Integer (Int32)}
     */
    static PERMITTED => 0

    /**
     * Digital copies of the given track are not allowed using consumer electronics CD recorders.  This condition typically has no effect on PC-based CD players.
     * Native name: IMAPI_CD_TRACK_DIGITAL_COPY_PROHIBITED
     * @type {Integer (Int32)}
     */
    static PROHIBITED => 1

    /**
     * The given track is a digital copy of a copy protected track.  No further copies using consumer electronics CD recorders will be allowed.  This condition typically has no effect on PC-based CD players.
     * Native name: IMAPI_CD_TRACK_DIGITAL_COPY_SCMS
     * @type {Integer (Int32)}
     */
    static SCMS => 2
}
