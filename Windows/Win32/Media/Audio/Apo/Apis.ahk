#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class Apo {

;@region Constants

    /**
     * @type {Integer (Int32)}
     */
    static APOERR_ALREADY_INITIALIZED => -2005073919

    /**
     * @type {Integer (Int32)}
     */
    static APOERR_NOT_INITIALIZED => -2005073918

    /**
     * @type {Integer (Int32)}
     */
    static APOERR_FORMAT_NOT_SUPPORTED => -2005073917

    /**
     * @type {Integer (Int32)}
     */
    static APOERR_INVALID_APO_CLSID => -2005073916

    /**
     * @type {Integer (Int32)}
     */
    static APOERR_BUFFERS_OVERLAP => -2005073915

    /**
     * @type {Integer (Int32)}
     */
    static APOERR_ALREADY_UNLOCKED => -2005073914

    /**
     * @type {Integer (Int32)}
     */
    static APOERR_NUM_CONNECTIONS_INVALID => -2005073913

    /**
     * @type {Integer (Int32)}
     */
    static APOERR_INVALID_OUTPUT_MAXFRAMECOUNT => -2005073912

    /**
     * @type {Integer (Int32)}
     */
    static APOERR_INVALID_CONNECTION_FORMAT => -2005073911

    /**
     * @type {Integer (Int32)}
     */
    static APOERR_APO_LOCKED => -2005073910

    /**
     * @type {Integer (Int32)}
     */
    static APOERR_INVALID_COEFFCOUNT => -2005073909

    /**
     * @type {Integer (Int32)}
     */
    static APOERR_INVALID_COEFFICIENT => -2005073908

    /**
     * @type {Integer (Int32)}
     */
    static APOERR_INVALID_CURVE_PARAM => -2005073907

    /**
     * @type {Integer (Int32)}
     */
    static APOERR_INVALID_INPUTID => -2005073906

    /**
     * @type {Integer (Double)}
     */
    static AUDIO_MIN_FRAMERATE => 10

    /**
     * @type {Integer (Double)}
     */
    static AUDIO_MAX_FRAMERATE => 384000

    /**
     * @type {Integer (UInt32)}
     */
    static AUDIO_MIN_CHANNELS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AUDIO_MAX_CHANNELS => 4096

    /**
     * @type {String}
     */
    static PKEY_FX_EffectPack_Schema_V1 => "{7abf23d9-727e-4d0b-86a3-dd501d260001}"

    /**
     * @type {String}
     */
    static SID_AudioProcessingObjectRTQueue => "{458c1a1f-6899-4c12-99ac-e2e6ac253104}"

    /**
     * @type {String}
     */
    static SID_AudioProcessingObjectLoggingService => "{8b8008af-09f9-456e-a173-bdb58499bce7}"

    /**
     * @type {Integer (UInt32)}
     */
    static AUDIOMEDIATYPE_EQUAL_FORMAT_TYPES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AUDIOMEDIATYPE_EQUAL_FORMAT_DATA => 4

    /**
     * @type {Integer (UInt32)}
     */
    static AUDIOMEDIATYPE_EQUAL_FORMAT_USER_DATA => 8
;@endregion Constants

;@region Methods
;@endregion Methods
}
