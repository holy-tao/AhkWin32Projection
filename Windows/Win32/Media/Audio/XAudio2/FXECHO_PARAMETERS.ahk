#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Parameters for use with the FXECHO XAPOFX.
 * @remarks
 * Echo only supports FLOAT32 audio formats.
 * 
 * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
 * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
 * @see https://learn.microsoft.com/windows/win32/api/xapofx/ns-xapofx-fxecho_parameters
 * @namespace Windows.Win32.Media.Audio.XAudio2
 */
export default struct FXECHO_PARAMETERS {
    #StructPack 4

    /**
     * Ratio of wet (processed) signal to dry (original) signal.
     */
    WetDryMix : Float32

    /**
     * Amount of output to feed back into input.
     */
    Feedback : Float32

    /**
     * Delay to all channels in milliseconds. This value must be between <b>FXECHO_MIN_DELAY</b> and <a href="https://docs.microsoft.com/windows/desktop/api/xapofx/ns-xapofx-fxecho_initdata">FXECHO_INITDATA</a>.<b>MaxDelay</b>.
     */
    Delay : Float32

}
