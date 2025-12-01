#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The AUDIO_STREAM_CONFIG_CAPS structure describes a range of audio formats. Audio compression and capture filters use this structure to describe the formats they can produce.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-audio_stream_config_caps
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AUDIO_STREAM_CONFIG_CAPS extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Will be set to MEDIATYPE_Audio to indicate an audio sample.
     * @type {Pointer<Guid>}
     */
    guid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Minimum number of channels.
     * @type {Integer}
     */
    MinimumChannels {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Maximum number of channels.
     * @type {Integer}
     */
    MaximumChannels {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Granularity of the channels. For example, the filter might specify channels 2 through 4, in steps of 2.
     * @type {Integer}
     */
    ChannelsGranularity {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Minimum bits per sample.
     * @type {Integer}
     */
    MinimumBitsPerSample {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Maximum bits per sample.
     * @type {Integer}
     */
    MaximumBitsPerSample {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Granularity of the bits per sample. For example, the filter might specify 8 bits per sample through 32 bits per sample, in steps of 8.
     * @type {Integer}
     */
    BitsPerSampleGranularity {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Minimum sample frequency.
     * @type {Integer}
     */
    MinimumSampleFrequency {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Maximum sample frequency.
     * @type {Integer}
     */
    MaximumSampleFrequency {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Granularity of the frequency. For example, the filter might specify 11025 Hz to 44100 Hz, in steps of 11025 Hz.
     * @type {Integer}
     */
    SampleFrequencyGranularity {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
