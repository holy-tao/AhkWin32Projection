#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DVD_DECODER_CAPS structure indicates the capabilities of a DVD decoder.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-dvd_decoder_caps
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct DVD_DECODER_CAPS {
    #StructPack 8

    /**
     * Size of this structure.
     */
    dwSize : UInt32

    /**
     * Bitwise <b>OR</b> of flags indicating which audio formats are supported. The following flags are defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DVD_AUDIO_CAPS_AC3"></a><a id="dvd_audio_caps_ac3"></a><dl>
     * <dt><b>DVD_AUDIO_CAPS_AC3</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Dolby Digital (AC3).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DVD_AUDIO_CAPS_MPEG2"></a><a id="dvd_audio_caps_mpeg2"></a><dl>
     * <dt><b>DVD_AUDIO_CAPS_MPEG2</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MPEG-2 audio.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DVD_AUDIO_CAPS_LPCM"></a><a id="dvd_audio_caps_lpcm"></a><dl>
     * <dt><b>DVD_AUDIO_CAPS_LPCM</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Linear pulse code modulation (LPCM).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DVD_AUDIO_CAPS_DTS"></a><a id="dvd_audio_caps_dts"></a><dl>
     * <dt><b>DVD_AUDIO_CAPS_DTS</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * DTS audio.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DVD_AUDIO_CAPS_SDDS"></a><a id="dvd_audio_caps_sdds"></a><dl>
     * <dt><b>DVD_AUDIO_CAPS_SDDS</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sony Dynamic Digital Sound (SDDS) audio.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwAudioCaps : UInt32

    /**
     * Maximum video data rate in forward direction.
     */
    dFwdMaxRateVideo : Float64

    /**
     * Maximum audio data rate in forward direction.
     */
    dFwdMaxRateAudio : Float64

    /**
     * Maximum subpicture data rate in forward direction.
     */
    dFwdMaxRateSP : Float64

    /**
     * Maximum video data rate in reverse direction. (0 if decoder does not support the smooth reverse mechanism.)
     */
    dBwdMaxRateVideo : Float64

    /**
     * Maximum audio data rate in reverse direction. (0 if decoder does not support the smooth reverse mechanism.)
     */
    dBwdMaxRateAudio : Float64

    /**
     * Maximum subpicture data rate in reverse direction. (0 if decoder does not support the smooth reverse mechanism.)
     */
    dBwdMaxRateSP : Float64

    /**
     * Reserved for future use.
     */
    dwRes1 : UInt32

    /**
     * Reserved for future use.
     */
    dwRes2 : UInt32

    /**
     * Reserved for future use.
     */
    dwRes3 : UInt32

    /**
     * Reserved for future use.
     */
    dwRes4 : UInt32

}
