#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DVD_DECODER_CAPS structure indicates the capabilities of a DVD decoder.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ns-strmif-dvd_decoder_caps
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVD_DECODER_CAPS extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Size of this structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

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
     * @type {Integer}
     */
    dwAudioCaps {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Maximum video data rate in forward direction.
     * @type {Float}
     */
    dFwdMaxRateVideo {
        get => NumGet(this, 8, "double")
        set => NumPut("double", value, this, 8)
    }

    /**
     * Maximum audio data rate in forward direction.
     * @type {Float}
     */
    dFwdMaxRateAudio {
        get => NumGet(this, 16, "double")
        set => NumPut("double", value, this, 16)
    }

    /**
     * Maximum subpicture data rate in forward direction.
     * @type {Float}
     */
    dFwdMaxRateSP {
        get => NumGet(this, 24, "double")
        set => NumPut("double", value, this, 24)
    }

    /**
     * Maximum video data rate in reverse direction. (0 if decoder does not support the smooth reverse mechanism.)
     * @type {Float}
     */
    dBwdMaxRateVideo {
        get => NumGet(this, 32, "double")
        set => NumPut("double", value, this, 32)
    }

    /**
     * Maximum audio data rate in reverse direction. (0 if decoder does not support the smooth reverse mechanism.)
     * @type {Float}
     */
    dBwdMaxRateAudio {
        get => NumGet(this, 40, "double")
        set => NumPut("double", value, this, 40)
    }

    /**
     * Maximum subpicture data rate in reverse direction. (0 if decoder does not support the smooth reverse mechanism.)
     * @type {Float}
     */
    dBwdMaxRateSP {
        get => NumGet(this, 48, "double")
        set => NumPut("double", value, this, 48)
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    dwRes1 {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    dwRes2 {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    dwRes3 {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    dwRes4 {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }
}
