#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DVD_MUA_MixingInfo structure describes the surround sound mixing information for the channels in one audio stream in a specified title.
 * @remarks
 * Applications cannot use the information contained in this structure to change the mixing unless they have a way to communicate with a custom audio decoder that has been inserted manually into the filter graph. The default audio decoder handles Linear Pulse Code Modulated (LPCM) audio using the mixing information on the digital video disc (DVD), but applications have no way to instruct the decoder to modify the mixing values. This means that current DVD playback applications should have no need to access the multichannel-related data structures.
  * 
  * The [DVD_MultichannelAudioAttributes](/windows/desktop/api/strmif/ns-strmif-dvd_multichannelaudioattributes) structure contains information about one audio stream in a specified title. An array of up to eight <c>DVD_MUA_MixingInfo</c> structures will be populated in this structure, if the following conditions are true.
  * 
  * <ul>
  * <li>DVD_AudioAttributes.AppMode = DVD_AudioMode_Surround</li>
  * <li>DVD_AudioAttributes.AudioFormat = DVD_AudioFormat_LPCM</li>
  * <li>DVD_AudioAttributes.fHasMultichannelInfo = 1</li>
  * </ul>
  * Possible values for <b>dwSpeakerPosition</b> are defined in Ksmedia.h as follows:
  * 
  * <table>
  * <tr>
  * <th>Define
  *             </th>
  * <th>Value
  *             </th>
  * </tr>
  * <tr>
  * <td>KSAUDIO_SPEAKER_LEFT</td>
  * <td>0x1</td>
  * </tr>
  * <tr>
  * <td>KSAUDIO_SPEAKER_RIGHT</td>
  * <td>0x2</td>
  * </tr>
  * <tr>
  * <td>KSAUDIO_SPEAKER_CENTER</td>
  * <td>0x4</td>
  * </tr>
  * <tr>
  * <td>KSAUDIO_SPEAKER_SURROUND_LEFT</td>
  * <td>0x8</td>
  * </tr>
  * <tr>
  * <td>KSAUDIO_SPEAKER_SURROUND_RIGHT</td>
  * <td>0x10</td>
  * </tr>
  * <tr>
  * <td>KSAUDIO_SPEAKER_SUBWOOFER</td>
  * <td>0x20</td>
  * </tr>
  * <tr>
  * <td>KSAUDIO_SPEAKER_LEFT_OF_CENTER</td>
  * <td>0x40</td>
  * </tr>
  * <tr>
  * <td>KSAUDIO_SPEAKER_RIGHT_OF_CENTER</td>
  * <td>0x80</td>
  * </tr>
  * <tr>
  * <td>KSAUDIO_SPEAKER_SURROUND_MONO</td>
  * <td>0x100</td>
  * </tr>
  * <tr>
  * <td>KSAUDIO_SPEAKER_SIDE_LEFT</td>
  * <td>0x200</td>
  * </tr>
  * <tr>
  * <td>KSAUDIO_SPEAKER_SIDE_RIGHT</td>
  * <td>0x400</td>
  * </tr>
  * <tr>
  * <td>KSAUDIO_SPEAKER_TOP</td>
  * <td>0x800</td>
  * </tr>
  * </table>
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-dvd_mua_mixinginfo
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVD_MUA_MixingInfo extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * Variable of type BOOL; <b>TRUE</b> means the channel is mixed to channel 0.
     * @type {Integer}
     */
    fMixTo0 {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Variable of type BOOL; <b>TRUE</b> means the channel is mixed to channel 1.
     * @type {Integer}
     */
    fMixTo1 {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Variable of type BOOL; <b>TRUE</b> means the channel is mixed in phase to channel 0.
     * @type {Integer}
     */
    fMix0InPhase {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Variable of type BOOL; <b>TRUE</b> means the channel is mixed in phase to channel 1.
     * @type {Integer}
     */
    fMix1InPhase {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * The speaker for which this channel is intended. See Remarks.
     * @type {Integer}
     */
    dwSpeakerPosition {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
