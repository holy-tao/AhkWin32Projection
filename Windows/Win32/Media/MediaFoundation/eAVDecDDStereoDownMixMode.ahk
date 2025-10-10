#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the stereo downmix mode for a Dolby Digital audio decoder.
 * @see https://docs.microsoft.com/windows/win32/api//codecapi/ne-codecapi-eavdecddstereodownmixmode
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVDecDDStereoDownMixMode{

    /**
     * The decoder selects the mode automatically.
     * @type {Integer (Int32)}
     */
    static eAVDecDDStereoDownMixMode_Auto => 0

    /**
     * Left total/right total (Lt/Rt) downmix. (Surround compatible.)
     * @type {Integer (Int32)}
     */
    static eAVDecDDStereoDownMixMode_LtRt => 1

    /**
     * Left only/right only (Lo/Ro) downmix. (Stereo.)
     * @type {Integer (Int32)}
     */
    static eAVDecDDStereoDownMixMode_LoRo => 2
}
