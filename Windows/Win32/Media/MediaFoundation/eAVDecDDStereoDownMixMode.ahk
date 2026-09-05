#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the stereo downmix mode for a Dolby Digital audio decoder.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavdecddstereodownmixmode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVDecDDStereoDownMixMode extends Win32Enum {

    /**
     * The decoder selects the mode automatically.
     * Native name: eAVDecDDStereoDownMixMode_Auto
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * Left total/right total (Lt/Rt) downmix. (Surround compatible.)
     * Native name: eAVDecDDStereoDownMixMode_LtRt
     * @type {Integer (Int32)}
     */
    static LtRt => 1

    /**
     * Left only/right only (Lo/Ro) downmix. (Stereo.)
     * Native name: eAVDecDDStereoDownMixMode_LoRo
     * @type {Integer (Int32)}
     */
    static LoRo => 2
}
