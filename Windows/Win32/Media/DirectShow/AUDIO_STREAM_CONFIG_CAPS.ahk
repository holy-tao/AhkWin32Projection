#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The AUDIO_STREAM_CONFIG_CAPS structure describes a range of audio formats. Audio compression and capture filters use this structure to describe the formats they can produce.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-audio_stream_config_caps
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AUDIO_STREAM_CONFIG_CAPS {
    #StructPack 4

    /**
     * Will be set to MEDIATYPE_Audio to indicate an audio sample.
     */
    guid : Guid

    /**
     * Minimum number of channels.
     */
    MinimumChannels : UInt32

    /**
     * Maximum number of channels.
     */
    MaximumChannels : UInt32

    /**
     * Granularity of the channels. For example, the filter might specify channels 2 through 4, in steps of 2.
     */
    ChannelsGranularity : UInt32

    /**
     * Minimum bits per sample.
     */
    MinimumBitsPerSample : UInt32

    /**
     * Maximum bits per sample.
     */
    MaximumBitsPerSample : UInt32

    /**
     * Granularity of the bits per sample. For example, the filter might specify 8 bits per sample through 32 bits per sample, in steps of 8.
     */
    BitsPerSampleGranularity : UInt32

    /**
     * Minimum sample frequency.
     */
    MinimumSampleFrequency : UInt32

    /**
     * Maximum sample frequency.
     */
    MaximumSampleFrequency : UInt32

    /**
     * Granularity of the frequency. For example, the filter might specify 11025 Hz to 44100 Hz, in steps of 11025 Hz.
     */
    SampleFrequencyGranularity : UInt32

}
