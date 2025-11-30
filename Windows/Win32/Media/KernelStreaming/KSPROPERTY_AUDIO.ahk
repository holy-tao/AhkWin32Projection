#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_AUDIO extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_LATENCY => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_COPY_PROTECTION => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_CHANNEL_CONFIG => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_VOLUMELEVEL => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_POSITION => 5

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_DYNAMIC_RANGE => 6

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_QUALITY => 7

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_SAMPLING_RATE => 8

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_DYNAMIC_SAMPLING_RATE => 9

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_MIX_LEVEL_TABLE => 10

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_MIX_LEVEL_CAPS => 11

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_MUX_SOURCE => 12

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_MUTE => 13

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_BASS => 14

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_MID => 15

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_TREBLE => 16

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_BASS_BOOST => 17

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_EQ_LEVEL => 18

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_NUM_EQ_BANDS => 19

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_EQ_BANDS => 20

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_AGC => 21

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_DELAY => 22

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_LOUDNESS => 23

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_WIDE_MODE => 24

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_WIDENESS => 25

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_REVERB_LEVEL => 26

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_CHORUS_LEVEL => 27

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_DEV_SPECIFIC => 28

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_DEMUX_DEST => 29

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_STEREO_ENHANCE => 30

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_MANUFACTURE_GUID => 31

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_PRODUCT_GUID => 32

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_CPU_RESOURCES => 33

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_STEREO_SPEAKER_GEOMETRY => 34

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_SURROUND_ENCODE => 35

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_3D_INTERFACE => 36

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_PEAKMETER => 37

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_ALGORITHM_INSTANCE => 38

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_FILTER_STATE => 39

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_PREFERRED_STATUS => 40

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_PEQ_MAX_BANDS => 41

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_PEQ_NUM_BANDS => 42

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_PEQ_BAND_CENTER_FREQ => 43

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_PEQ_BAND_Q_FACTOR => 44

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_PEQ_BAND_LEVEL => 45

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_CHORUS_MODULATION_RATE => 46

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_CHORUS_MODULATION_DEPTH => 47

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_REVERB_TIME => 48

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_REVERB_DELAY_FEEDBACK => 49

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_POSITIONEX => 50

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_MIC_ARRAY_GEOMETRY => 51

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_PRESENTATION_POSITION => 52

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_WAVERT_CURRENT_WRITE_POSITION => 53

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_LINEAR_BUFFER_POSITION => 54

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_PEAKMETER2 => 55

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_WAVERT_CURRENT_WRITE_LASTBUFFER_POSITION => 56

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_VOLUMELIMIT_ENGAGED => 57

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_MIC_SENSITIVITY => 58

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_MIC_SNR => 59

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIO_MIC_SENSITIVITY2 => 60
}
