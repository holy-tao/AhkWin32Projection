#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the stereo downmix mode for a Dolby Digital audio decoder.
 * @remarks
 * This attribute applies when the input to the decoder is multichannel PCM audio, and the output is stereo audio.
 * @see https://learn.microsoft.com/windows/win32/medfound/codecapi-avdecddstereodownmixmode
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class CODECAPI_AVDecDDStereoDownMixMode extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
