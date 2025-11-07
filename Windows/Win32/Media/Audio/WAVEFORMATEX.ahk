#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WAVEFORMATEX structure defines the format of waveform-audio data.
 * @remarks
 * 
 * An example of a format that uses extra information is the Microsoft Adaptive Delta Pulse Code Modulation (MS-ADPCM) format. The <b>wFormatTag</b> for MS-ADPCM is WAVE_FORMAT_ADPCM. The <b>cbSize</b> member will typically be set to 32. The extra information stored for WAVE_FORMAT_ADPCM is coefficient pairs required for encoding and decoding the waveform-audio data.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mmeapi/ns-mmeapi-waveformatex
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class WAVEFORMATEX extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * Waveform-audio format type. Format tags are registered with Microsoft Corporation for many compression algorithms. A complete list of format tags can be found in the Mmreg.h header file. For one- or two-channel PCM data, this value should be WAVE_FORMAT_PCM. When this structure is included in a <a href="https://docs.microsoft.com/windows/desktop/api/mmreg/ns-mmreg-waveformatextensible">WAVEFORMATEXTENSIBLE</a> structure, this value must be WAVE_FORMAT_EXTENSIBLE.
     * @type {Integer}
     */
    wFormatTag {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Number of channels in the waveform-audio data. Monaural data uses one channel and stereo data uses two channels.
     * @type {Integer}
     */
    nChannels {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Sample rate, in samples per second (hertz). If <b>wFormatTag</b> is WAVE_FORMAT_PCM, then common values for <b>nSamplesPerSec</b> are 8.0 kHz, 11.025 kHz, 22.05 kHz, and 44.1 kHz. For non-PCM formats, this member must be computed according to the manufacturer's specification of the format tag.
     * @type {Integer}
     */
    nSamplesPerSec {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Required average data-transfer rate, in bytes per second, for the format tag. If <b>wFormatTag</b> is WAVE_FORMAT_PCM, <b>nAvgBytesPerSec</b> should be equal to the product of <b>nSamplesPerSec</b> and <b>nBlockAlign</b>. For non-PCM formats, this member must be computed according to the manufacturer's specification of the format tag.
     * @type {Integer}
     */
    nAvgBytesPerSec {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Block alignment, in bytes. The block alignment is the minimum atomic unit of data for the <b>wFormatTag</b> format type. If <b>wFormatTag</b> is WAVE_FORMAT_PCM or WAVE_FORMAT_EXTENSIBLE, <b>nBlockAlign</b> must be equal to the product of <b>nChannels</b> and <b>wBitsPerSample</b> divided by 8 (bits per byte). For non-PCM formats, this member must be computed according to the manufacturer's specification of the format tag.
     * 
     * Software must process a multiple of <b>nBlockAlign</b> bytes of data at a time. Data written to and read from a device must always start at the beginning of a block. For example, it is illegal to start playback of PCM data in the middle of a sample (that is, on a non-block-aligned boundary).
     * @type {Integer}
     */
    nBlockAlign {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * Bits per sample for the <b>wFormatTag</b> format type. If <b>wFormatTag</b> is WAVE_FORMAT_PCM, then <b>wBitsPerSample</b> should be equal to 8 or 16. For non-PCM formats, this member must be set according to the manufacturer's specification of the format tag. If <b>wFormatTag</b> is WAVE_FORMAT_EXTENSIBLE, this value can be any integer multiple of 8 and represents the container size, not necessarily the sample size; for example, a 20-bit sample size is in a 24-bit container. Some compression schemes cannot define a value for <b>wBitsPerSample</b>, so this member can be 0.
     * @type {Integer}
     */
    wBitsPerSample {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }

    /**
     * Size, in bytes, of extra format information appended to the end of the <b>WAVEFORMATEX</b> structure. This information can be used by non-PCM formats to store extra attributes for the <b>wFormatTag</b>. If no extra information is required by the <b>wFormatTag</b>, this member must be set to 0. For WAVE_FORMAT_PCM formats (and only WAVE_FORMAT_PCM formats), this member is ignored. When this structure is included in a <a href="https://docs.microsoft.com/windows/desktop/api/mmreg/ns-mmreg-waveformatextensible">WAVEFORMATEXTENSIBLE</a> structure, this value must be at least 22.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 20
    }
}
