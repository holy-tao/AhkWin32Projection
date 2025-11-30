#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The VIDEOENCODER_BITRATE_MODE enumeration type defines the three types of bitrates supported by the IEncoderAPI interface.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ne-strmif-videoencoder_bitrate_mode
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VIDEOENCODER_BITRATE_MODE extends Win32Enum{

    /**
     * The bit rate used for encoding is constant.
     * @type {Integer (Int32)}
     */
    static ConstantBitRate => 0

    /**
     * The bit rate used for encoding is variable with the specified bitrate used as a guaranteed average over a specified window. The default window size is considered to be five minutes.
     * @type {Integer (Int32)}
     */
    static VariableBitRateAverage => 1

    /**
     * The <b>ENCAPIPARAM_BITRATE</b> value is the expected (not guaranteed) average bit rate over a given time period and that the <b>ENCAPIPARAM_PEAK_BITRATE</b> value is the peak which the bit rate must not exceed. The default window size is considered to be 500ms (which is traditionally equal to one GOP).
     * @type {Integer (Int32)}
     */
    static VariableBitRatePeak => 2
}
