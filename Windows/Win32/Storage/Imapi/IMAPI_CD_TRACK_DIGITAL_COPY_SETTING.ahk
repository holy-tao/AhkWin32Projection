#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the digital copy setting values available for a given track.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2/ne-imapi2-imapi_cd_track_digital_copy_setting
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct IMAPI_CD_TRACK_DIGITAL_COPY_SETTING {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Digital copies of the given track are allowed.
     * @type {Integer (Int32)}
     */
    static IMAPI_CD_TRACK_DIGITAL_COPY_PERMITTED => 0

    /**
     * Digital copies of the given track are not allowed using consumer electronics CD recorders.  This condition typically has no effect on PC-based CD players.
     * @type {Integer (Int32)}
     */
    static IMAPI_CD_TRACK_DIGITAL_COPY_PROHIBITED => 1

    /**
     * The given track is a digital copy of a copy protected track.  No further copies using consumer electronics CD recorders will be allowed.  This condition typically has no effect on PC-based CD players.
     * @type {Integer (Int32)}
     */
    static IMAPI_CD_TRACK_DIGITAL_COPY_SCMS => 2
}
