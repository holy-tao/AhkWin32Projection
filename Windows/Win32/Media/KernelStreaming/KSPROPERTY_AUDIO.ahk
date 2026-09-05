#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_AUDIO extends Win32Enum {

    /**
     * Native name: KSPROPERTY_AUDIO_LATENCY
     * @type {Integer (Int32)}
     */
    static LATENCY => 1

    /**
     * Native name: KSPROPERTY_AUDIO_COPY_PROTECTION
     * @type {Integer (Int32)}
     */
    static COPY_PROTECTION => 2

    /**
     * Native name: KSPROPERTY_AUDIO_CHANNEL_CONFIG
     * @type {Integer (Int32)}
     */
    static CHANNEL_CONFIG => 3

    /**
     * Native name: KSPROPERTY_AUDIO_VOLUMELEVEL
     * @type {Integer (Int32)}
     */
    static VOLUMELEVEL => 4

    /**
     * Native name: KSPROPERTY_AUDIO_POSITION
     * @type {Integer (Int32)}
     */
    static POSITION => 5

    /**
     * Native name: KSPROPERTY_AUDIO_DYNAMIC_RANGE
     * @type {Integer (Int32)}
     */
    static DYNAMIC_RANGE => 6

    /**
     * Native name: KSPROPERTY_AUDIO_QUALITY
     * @type {Integer (Int32)}
     */
    static QUALITY => 7

    /**
     * Native name: KSPROPERTY_AUDIO_SAMPLING_RATE
     * @type {Integer (Int32)}
     */
    static SAMPLING_RATE => 8

    /**
     * Native name: KSPROPERTY_AUDIO_DYNAMIC_SAMPLING_RATE
     * @type {Integer (Int32)}
     */
    static DYNAMIC_SAMPLING_RATE => 9

    /**
     * Native name: KSPROPERTY_AUDIO_MIX_LEVEL_TABLE
     * @type {Integer (Int32)}
     */
    static MIX_LEVEL_TABLE => 10

    /**
     * Native name: KSPROPERTY_AUDIO_MIX_LEVEL_CAPS
     * @type {Integer (Int32)}
     */
    static MIX_LEVEL_CAPS => 11

    /**
     * Native name: KSPROPERTY_AUDIO_MUX_SOURCE
     * @type {Integer (Int32)}
     */
    static MUX_SOURCE => 12

    /**
     * Native name: KSPROPERTY_AUDIO_MUTE
     * @type {Integer (Int32)}
     */
    static MUTE => 13

    /**
     * Native name: KSPROPERTY_AUDIO_BASS
     * @type {Integer (Int32)}
     */
    static BASS => 14

    /**
     * Native name: KSPROPERTY_AUDIO_MID
     * @type {Integer (Int32)}
     */
    static MID => 15

    /**
     * Native name: KSPROPERTY_AUDIO_TREBLE
     * @type {Integer (Int32)}
     */
    static TREBLE => 16

    /**
     * Native name: KSPROPERTY_AUDIO_BASS_BOOST
     * @type {Integer (Int32)}
     */
    static BASS_BOOST => 17

    /**
     * Native name: KSPROPERTY_AUDIO_EQ_LEVEL
     * @type {Integer (Int32)}
     */
    static EQ_LEVEL => 18

    /**
     * Native name: KSPROPERTY_AUDIO_NUM_EQ_BANDS
     * @type {Integer (Int32)}
     */
    static NUM_EQ_BANDS => 19

    /**
     * Native name: KSPROPERTY_AUDIO_EQ_BANDS
     * @type {Integer (Int32)}
     */
    static EQ_BANDS => 20

    /**
     * Native name: KSPROPERTY_AUDIO_AGC
     * @type {Integer (Int32)}
     */
    static AGC => 21

    /**
     * Native name: KSPROPERTY_AUDIO_DELAY
     * @type {Integer (Int32)}
     */
    static DELAY => 22

    /**
     * Native name: KSPROPERTY_AUDIO_LOUDNESS
     * @type {Integer (Int32)}
     */
    static LOUDNESS => 23

    /**
     * Native name: KSPROPERTY_AUDIO_WIDE_MODE
     * @type {Integer (Int32)}
     */
    static WIDE_MODE => 24

    /**
     * Native name: KSPROPERTY_AUDIO_WIDENESS
     * @type {Integer (Int32)}
     */
    static WIDENESS => 25

    /**
     * Native name: KSPROPERTY_AUDIO_REVERB_LEVEL
     * @type {Integer (Int32)}
     */
    static REVERB_LEVEL => 26

    /**
     * Native name: KSPROPERTY_AUDIO_CHORUS_LEVEL
     * @type {Integer (Int32)}
     */
    static CHORUS_LEVEL => 27

    /**
     * Native name: KSPROPERTY_AUDIO_DEV_SPECIFIC
     * @type {Integer (Int32)}
     */
    static DEV_SPECIFIC => 28

    /**
     * Native name: KSPROPERTY_AUDIO_DEMUX_DEST
     * @type {Integer (Int32)}
     */
    static DEMUX_DEST => 29

    /**
     * Native name: KSPROPERTY_AUDIO_STEREO_ENHANCE
     * @type {Integer (Int32)}
     */
    static STEREO_ENHANCE => 30

    /**
     * Native name: KSPROPERTY_AUDIO_MANUFACTURE_GUID
     * @type {Integer (Int32)}
     */
    static MANUFACTURE_GUID => 31

    /**
     * Native name: KSPROPERTY_AUDIO_PRODUCT_GUID
     * @type {Integer (Int32)}
     */
    static PRODUCT_GUID => 32

    /**
     * Native name: KSPROPERTY_AUDIO_CPU_RESOURCES
     * @type {Integer (Int32)}
     */
    static CPU_RESOURCES => 33

    /**
     * Native name: KSPROPERTY_AUDIO_STEREO_SPEAKER_GEOMETRY
     * @type {Integer (Int32)}
     */
    static STEREO_SPEAKER_GEOMETRY => 34

    /**
     * Native name: KSPROPERTY_AUDIO_SURROUND_ENCODE
     * @type {Integer (Int32)}
     */
    static SURROUND_ENCODE => 35

    /**
     * Native name: KSPROPERTY_AUDIO_3D_INTERFACE
     * @type {Integer (Int32)}
     */
    static 3D_INTERFACE => 36

    /**
     * Native name: KSPROPERTY_AUDIO_PEAKMETER
     * @type {Integer (Int32)}
     */
    static PEAKMETER => 37

    /**
     * Native name: KSPROPERTY_AUDIO_ALGORITHM_INSTANCE
     * @type {Integer (Int32)}
     */
    static ALGORITHM_INSTANCE => 38

    /**
     * Native name: KSPROPERTY_AUDIO_FILTER_STATE
     * @type {Integer (Int32)}
     */
    static FILTER_STATE => 39

    /**
     * Native name: KSPROPERTY_AUDIO_PREFERRED_STATUS
     * @type {Integer (Int32)}
     */
    static PREFERRED_STATUS => 40

    /**
     * Native name: KSPROPERTY_AUDIO_PEQ_MAX_BANDS
     * @type {Integer (Int32)}
     */
    static PEQ_MAX_BANDS => 41

    /**
     * Native name: KSPROPERTY_AUDIO_PEQ_NUM_BANDS
     * @type {Integer (Int32)}
     */
    static PEQ_NUM_BANDS => 42

    /**
     * Native name: KSPROPERTY_AUDIO_PEQ_BAND_CENTER_FREQ
     * @type {Integer (Int32)}
     */
    static PEQ_BAND_CENTER_FREQ => 43

    /**
     * Native name: KSPROPERTY_AUDIO_PEQ_BAND_Q_FACTOR
     * @type {Integer (Int32)}
     */
    static PEQ_BAND_Q_FACTOR => 44

    /**
     * Native name: KSPROPERTY_AUDIO_PEQ_BAND_LEVEL
     * @type {Integer (Int32)}
     */
    static PEQ_BAND_LEVEL => 45

    /**
     * Native name: KSPROPERTY_AUDIO_CHORUS_MODULATION_RATE
     * @type {Integer (Int32)}
     */
    static CHORUS_MODULATION_RATE => 46

    /**
     * Native name: KSPROPERTY_AUDIO_CHORUS_MODULATION_DEPTH
     * @type {Integer (Int32)}
     */
    static CHORUS_MODULATION_DEPTH => 47

    /**
     * Native name: KSPROPERTY_AUDIO_REVERB_TIME
     * @type {Integer (Int32)}
     */
    static REVERB_TIME => 48

    /**
     * Native name: KSPROPERTY_AUDIO_REVERB_DELAY_FEEDBACK
     * @type {Integer (Int32)}
     */
    static REVERB_DELAY_FEEDBACK => 49

    /**
     * Native name: KSPROPERTY_AUDIO_POSITIONEX
     * @type {Integer (Int32)}
     */
    static POSITIONEX => 50

    /**
     * Native name: KSPROPERTY_AUDIO_MIC_ARRAY_GEOMETRY
     * @type {Integer (Int32)}
     */
    static MIC_ARRAY_GEOMETRY => 51

    /**
     * Native name: KSPROPERTY_AUDIO_PRESENTATION_POSITION
     * @type {Integer (Int32)}
     */
    static PRESENTATION_POSITION => 52

    /**
     * Native name: KSPROPERTY_AUDIO_WAVERT_CURRENT_WRITE_POSITION
     * @type {Integer (Int32)}
     */
    static WAVERT_CURRENT_WRITE_POSITION => 53

    /**
     * Native name: KSPROPERTY_AUDIO_LINEAR_BUFFER_POSITION
     * @type {Integer (Int32)}
     */
    static LINEAR_BUFFER_POSITION => 54

    /**
     * Native name: KSPROPERTY_AUDIO_PEAKMETER2
     * @type {Integer (Int32)}
     */
    static PEAKMETER2 => 55

    /**
     * Native name: KSPROPERTY_AUDIO_WAVERT_CURRENT_WRITE_LASTBUFFER_POSITION
     * @type {Integer (Int32)}
     */
    static WAVERT_CURRENT_WRITE_LASTBUFFER_POSITION => 56

    /**
     * Native name: KSPROPERTY_AUDIO_VOLUMELIMIT_ENGAGED
     * @type {Integer (Int32)}
     */
    static VOLUMELIMIT_ENGAGED => 57

    /**
     * Native name: KSPROPERTY_AUDIO_MIC_SENSITIVITY
     * @type {Integer (Int32)}
     */
    static MIC_SENSITIVITY => 58

    /**
     * Native name: KSPROPERTY_AUDIO_MIC_SNR
     * @type {Integer (Int32)}
     */
    static MIC_SNR => 59

    /**
     * Native name: KSPROPERTY_AUDIO_MIC_SENSITIVITY2
     * @type {Integer (Int32)}
     */
    static MIC_SENSITIVITY2 => 60
}
