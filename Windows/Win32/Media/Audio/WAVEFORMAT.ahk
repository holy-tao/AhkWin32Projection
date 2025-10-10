#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WAVEFORMAT structure describes the format of waveform-audio data. Only format information common to all waveform-audio data formats is included in this structure. This structure has been superseded by the WAVEFORMATEX structure.
 * @remarks
 * 
  * For formats that require additional information, this structure is included as a member in another structure along with the additional information.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mmeapi/ns-mmeapi-waveformat
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class WAVEFORMAT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Format type. The following type is defined:
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WAVE_FORMAT_PCM"></a><a id="wave_format_pcm"></a><dl>
     * <dt><b>WAVE_FORMAT_PCM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Waveform-audio data is PCM.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    wFormatTag {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Number of channels in the waveform-audio data. Mono data uses one channel and stereo data uses two channels.
     * @type {Integer}
     */
    nChannels {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Sample rate, in samples per second.
     * @type {Integer}
     */
    nSamplesPerSec {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Required average data transfer rate, in bytes per second. For example, 16-bit stereo at 44.1 kHz has an average data rate of 176,400 bytes per second (2 channels — 2 bytes per sample per channel — 44,100 samples per second).
     * @type {Integer}
     */
    nAvgBytesPerSec {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Block alignment, in bytes. The block alignment is the minimum atomic unit of data. For PCM data, the block alignment is the number of bytes used by a single sample, including data for both channels if the data is stereo. For example, the block alignment for 16-bit stereo PCM is 4 bytes (2 channels — 2 bytes per sample).
     * @type {Integer}
     */
    nBlockAlign {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }
}
