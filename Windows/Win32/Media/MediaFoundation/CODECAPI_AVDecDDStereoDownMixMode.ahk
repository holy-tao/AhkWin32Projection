#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the stereo downmix mode for a Dolby Digital audio decoder.
 * @remarks
 * This attribute applies when the input to the decoder is multichannel PCM audio, and the output is stereo audio.
 * @see https://learn.microsoft.com/windows/win32/medfound/codecapi-avdecddstereodownmixmode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct CODECAPI_AVDecDDStereoDownMixMode {
    #StructPack 1

}
