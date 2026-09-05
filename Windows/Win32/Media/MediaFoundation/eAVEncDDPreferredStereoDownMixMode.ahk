#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the preferred stereo downmix mode for a Dolby Digital audio stream. This enumeration is used with the AVEncDDPreferredStereoDownMixMode property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencddpreferredstereodownmixmode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVEncDDPreferredStereoDownMixMode extends Win32Enum {

    /**
     * Left total/right total (Lt/Rt) downmix.
     * Native name: eAVEncDDPreferredStereoDownMixMode_LtRt
     * @type {Integer (Int32)}
     */
    static LtRt => 0

    /**
     * Left only/right only (Lo/Ro) downmix.
     * Native name: eAVEncDDPreferredStereoDownMixMode_LoRo
     * @type {Integer (Int32)}
     */
    static LoRo => 1
}
