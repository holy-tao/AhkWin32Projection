#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WAVEFORMATEX.ahk

/**
 * The WAVEFORMATEXTENSIBLE structure defines the format of waveform-audio data for formats having more than two channels or higher sample resolutions than allowed by WAVEFORMATEX.
 * @remarks
 * 
 * 
 * 
 * <b>WAVEFORMATEXTENSIBLE</b> can describe any format that can be described by <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a>, but provides additional support for more than two channels, for greater precision in the number of bits per sample, and for new compression schemes.
 * 
 * <b>WAVEFORMATEXTENSIBLE</b> can safely be cast to <b>WAVEFORMATEX</b>, because it simply configures the extra bytes specified by <b>WAVEFORMATEX.cbSize</b>.
 * 
 * The <b>dwChannelMask</b> member specifies which channels are present in the multichannel stream. The least significant bit corresponds with the front left speaker, the next least significant bit corresponds to the front right speaker, and so on. The bits, in order of significance, are defined as follows.
 * 
 * <table>
 * <tr>
 * <th>Speaker position
 *             </th>
 * <th>Flag bit
 *             </th>
 * </tr>
 * <tr>
 * <td>SPEAKER_FRONT_LEFT</td>
 * <td>0x1</td>
 * </tr>
 * <tr>
 * <td>SPEAKER_FRONT_RIGHT</td>
 * <td>0x2</td>
 * </tr>
 * <tr>
 * <td>SPEAKER_FRONT_CENTER</td>
 * <td>0x4</td>
 * </tr>
 * <tr>
 * <td>SPEAKER_LOW_FREQUENCY</td>
 * <td>0x8</td>
 * </tr>
 * <tr>
 * <td>SPEAKER_BACK_LEFT</td>
 * <td>0x10</td>
 * </tr>
 * <tr>
 * <td>SPEAKER_BACK_RIGHT</td>
 * <td>0x20</td>
 * </tr>
 * <tr>
 * <td>SPEAKER_FRONT_LEFT_OF_CENTER</td>
 * <td>0x40</td>
 * </tr>
 * <tr>
 * <td>SPEAKER_FRONT_RIGHT_OF_CENTER</td>
 * <td>0x80</td>
 * </tr>
 * <tr>
 * <td>SPEAKER_BACK_CENTER</td>
 * <td>0x100</td>
 * </tr>
 * <tr>
 * <td>SPEAKER_SIDE_LEFT</td>
 * <td>0x200</td>
 * </tr>
 * <tr>
 * <td>SPEAKER_SIDE_RIGHT</td>
 * <td>0x400</td>
 * </tr>
 * <tr>
 * <td>SPEAKER_TOP_CENTER</td>
 * <td>0x800</td>
 * </tr>
 * <tr>
 * <td>SPEAKER_TOP_FRONT_LEFT</td>
 * <td>0x1000</td>
 * </tr>
 * <tr>
 * <td>SPEAKER_TOP_FRONT_CENTER</td>
 * <td>0x2000</td>
 * </tr>
 * <tr>
 * <td>SPEAKER_TOP_FRONT_RIGHT</td>
 * <td>0x4000</td>
 * </tr>
 * <tr>
 * <td>SPEAKER_TOP_BACK_LEFT</td>
 * <td>0x8000</td>
 * </tr>
 * <tr>
 * <td>SPEAKER_TOP_BACK_CENTER</td>
 * <td>0x10000</td>
 * </tr>
 * <tr>
 * <td>SPEAKER_TOP_BACK_RIGHT</td>
 * <td>0x20000</td>
 * </tr>
 * </table>
 *  
 * 
 * The channels specified in <b>dwChannelMask</b> must be present in the prescribed order (from least significant bit up). For example, if only SPEAKER_FRONT_LEFT and SPEAKER_FRONT_RIGHT are specified, then the samples for the front left speaker must come first in the interleaved stream. The number of bits set in <b>dwChannelMask</b> should be the same as the number of channels specified in <b>WAVEFORMATEX.nChannels</b>.
 * 
 * For backward compatibility, any wave format that can be specified by a stand-alone <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure can also be defined by a <b>WAVEFORMATEXTENSIBLE</b> structure. Thus, every wave-format tag in mmreg.h has a corresponding <b>SubFormat</b> GUID. The following table shows some typical wave-format tags and their corresponding <b>SubFormat</b> GUIDs. These GUIDs are defined in Ksmedia.h.
 * 
 * <table>
 * <tr>
 * <th>Wave-Format Tag
 *             </th>
 * <th>SubFormat GUID
 *             </th>
 * </tr>
 * <tr>
 * <td>WAVE_FORMAT_PCM</td>
 * <td>KSDATAFORMAT_SUBTYPE_PCM</td>
 * </tr>
 * <tr>
 * <td>WAVE_FORMAT_IEEE_FLOAT</td>
 * <td>KSDATAFORMAT_SUBTYPE_IEEE_FLOAT</td>
 * </tr>
 * <tr>
 * <td>WAVE_FORMAT_DRM</td>
 * <td>KSDATAFORMAT_SUBTYPE_DRM</td>
 * </tr>
 * <tr>
 * <td>WAVE_FORMAT_ALAW</td>
 * <td>KSDATAFORMAT_SUBTYPE_ALAW</td>
 * </tr>
 * <tr>
 * <td>WAVE_FORMAT_MULAW</td>
 * <td>KSDATAFORMAT_SUBTYPE_MULAW</td>
 * </tr>
 * <tr>
 * <td>WAVE_FORMAT_ADPCM</td>
 * <td>KSDATAFORMAT_SUBTYPE_ADPCM</td>
 * </tr>
 * </table>
 *  
 * 
 * Because <b>WAVEFORMATEXTENSIBLE</b> is an extended version of <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a>, it can describe additional formats that cannot be described by <b>WAVEFORMATEX</b> alone. Vendors are free to define their own <b>SubFormat</b> GUIDs to identify proprietary formats for which no wave-format tags exist.
 * 
 * The following structures, for particular extended formats, are defined as <b>WAVEFORMATEXTENSIBLE</b>.
 * 
 * <table>
 * <tr>
 * <th>Definition
 *             </th>
 * <th>Value of SubFormat
 *             </th>
 * </tr>
 * <tr>
 * <td><b>WAVEFORMATIEEEFLOATEX</b></td>
 * <td>KSDATAFORMAT_SUBTYPE_IEEE_FLOAT</td>
 * </tr>
 * <tr>
 * <td><b>WAVEFORMATPCMEX</b></td>
 * <td>KSDATAFORMAT_SUBTYPE_PCM</td>
 * </tr>
 * </table>
 *  
 * 
 * 
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mmreg/ns-mmreg-waveformatextensible
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class WAVEFORMATEXTENSIBLE extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure that specifies the basic format. The <b>wFormatTag</b> member must be WAVE_FORMAT_EXTENSIBLE. The <b>cbSize</b> member must be at least 22.
     * @type {WAVEFORMATEX}
     */
    Format{
        get {
            if(!this.HasProp("__Format"))
                this.__Format := WAVEFORMATEX(0, this)
            return this.__Format
        }
    }

    /**
     * @type {Integer}
     */
    wValidBitsPerSample {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    wSamplesPerBlock {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    wReserved {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * Bitmask specifying the assignment of channels in the stream to speaker positions.
     * @type {Integer}
     */
    dwChannelMask {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Subformat of the data, such as KSDATAFORMAT_SUBTYPE_PCM. The subformat information is similar to that provided by the tag in the <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure's <b>wFormatTag</b> member.
     * @type {Pointer<Guid>}
     */
    SubFormat {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
