#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Initialization parameters for use with the FXECHO XAPOFX.
 * @remarks
 * Use of this structure is optional. The default <b>MaxDelay</b> is <b>FXECHO_DEFAULT_DELAY</b>.
 * 
 * <div class="alert"><b>Note</b>  The DirectX SDK versions of XAUDIO2 don't support this functionality.</div>
 * <div> </div>
 * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
 * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
 * @see https://learn.microsoft.com/windows/win32/api/xapofx/ns-xapofx-fxecho_initdata
 * @namespace Windows.Win32.Media.Audio.XAudio2
 */
export default struct FXECHO_INITDATA {
    #StructPack 4

    /**
     * Maximum delay (all channels) in milliseconds. This must be within <b>FXECHO_MIN_DELAY</b> and <b>FXECHO_MAX_DELAY</b>.
     */
    MaxDelay : Float32

}
