#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes parameters for use with the volume meter APO.
 * @remarks
 * This structure is used with the <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2voice-geteffectparameters">XAudio2 IXAudio2Voice::GetEffectParameters</a> method.
 * 
 * 
 * 
 * <i>pPeakLevels</i> and <i>pRMSLevels</i> are not returned by <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2voice-geteffectparameters">IXAudio2Voice::GetEffectParameters</a>, the arrays are only filled out if they are present. If <i>pPeakLevels</i> and <i>pRMSLevels</i> are used they must be allocated by the application. The application is responsible for freeing the arrays when they are no longer needed.
 * 
 * 
 * 
 * <i>ChannelCount</i> must be set by the application to match the number of channels in the voice the effect is applied to.
 * 
 * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
 * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
 * @see https://learn.microsoft.com/windows/win32/api/xaudio2fx/ns-xaudio2fx-xaudio2fx_volumemeter_levels
 * @namespace Windows.Win32.Media.Audio.XAudio2
 */
export default struct XAUDIO2FX_VOLUMEMETER_LEVELS {
    #StructPack 8

    /**
     * Array that will be filled with the maximum absolute level for each channel during a processing pass. The array must be at least <i>ChannelCount</i> × sizeof(float) bytes. <i>pPeakLevels</i> may be NULL if <i>pRMSLevels</i> is not NULL.
     */
    pPeakLevels : IntPtr

    /**
     * Array that will be filled with root mean square level for each channel during a processing pass. The array must be at least <i>ChannelCount</i> × sizeof(float) bytes. <i>pRMSLevels</i> may be NULL if <i>pPeakLevels</i> is not NULL.
     */
    pRMSLevels : IntPtr

    /**
     * Number of channels being processed.
     */
    ChannelCount : UInt32

}
