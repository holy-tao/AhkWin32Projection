#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Parameters for use with the FXMasteringLimiter XAPO.
 * @remarks
 * 
 * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
 * Windows 10 (XAudio2.9); 
 *             Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//xapofx/ns-xapofx-fxmasteringlimiter_parameters
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class FXMASTERINGLIMITER_PARAMETERS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Speed, in milliseconds, at which the limiter stops affecting audio after the audio drops below the limiter's threshold, which is specified by the <b>Loudness</b> member. This value must be between <a href="https://docs.microsoft.com/windows/desktop/xaudio2/fxmasteringlimit-constants">FXMASTERINGLIMITER_MIN_RELEASE (1)</a> and <a href="https://docs.microsoft.com/windows/desktop/xaudio2/fxmasteringlimit-constants">FXMASTERINGLIMITER_MAX_RELEASE (20)</a> and defaults to <a href="https://docs.microsoft.com/windows/desktop/xaudio2/fxmasteringlimit-constants">FXMASTERINGLIMITER_DEFAULT_RELEASE (6)</a>.
     * @type {Integer}
     */
    Release {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Loudness metric threshold of the limiter. This value must be between <a href="https://docs.microsoft.com/windows/desktop/xaudio2/fxmasteringlimit-constants">FXMASTERINGLIMITER_MIN_LOUDNESS (1)</a> and <a href="https://docs.microsoft.com/windows/desktop/xaudio2/fxmasteringlimit-constants">FXMASTERINGLIMITER_MAX_LOUDNESS (1800)</a> and defaults to <a href="https://docs.microsoft.com/windows/desktop/xaudio2/fxmasteringlimit-constants">FXMASTERINGLIMITER_DEFAULT_LOUDNESS (1000)</a>.
     * @type {Integer}
     */
    Loudness {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
