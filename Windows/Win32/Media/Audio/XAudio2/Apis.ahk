#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include .\IXAudio2.ahk
#Include .\IXAPO.ahk

/**
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class XAudio2 {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static FXEQ_MIN_FRAMERATE => 22000

    /**
     * @type {Integer (UInt32)}
     */
    static FXEQ_MAX_FRAMERATE => 48000

    /**
     * @type {Float}
     */
    static FXEQ_MIN_FREQUENCY_CENTER => 20

    /**
     * @type {Float}
     */
    static FXEQ_MAX_FREQUENCY_CENTER => 20000

    /**
     * @type {Float}
     */
    static FXEQ_DEFAULT_FREQUENCY_CENTER_0 => 100

    /**
     * @type {Float}
     */
    static FXEQ_DEFAULT_FREQUENCY_CENTER_1 => 800

    /**
     * @type {Float}
     */
    static FXEQ_DEFAULT_FREQUENCY_CENTER_2 => 2000

    /**
     * @type {Float}
     */
    static FXEQ_DEFAULT_FREQUENCY_CENTER_3 => 10000

    /**
     * @type {Float}
     */
    static FXEQ_MIN_GAIN => 0.126

    /**
     * @type {Float}
     */
    static FXEQ_MAX_GAIN => 7.94

    /**
     * @type {Float}
     */
    static FXEQ_DEFAULT_GAIN => 1

    /**
     * @type {Float}
     */
    static FXEQ_MIN_BANDWIDTH => 0.1

    /**
     * @type {Float}
     */
    static FXEQ_MAX_BANDWIDTH => 2

    /**
     * @type {Float}
     */
    static FXEQ_DEFAULT_BANDWIDTH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FXMASTERINGLIMITER_MIN_RELEASE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FXMASTERINGLIMITER_MAX_RELEASE => 20

    /**
     * @type {Integer (UInt32)}
     */
    static FXMASTERINGLIMITER_DEFAULT_RELEASE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static FXMASTERINGLIMITER_MIN_LOUDNESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FXMASTERINGLIMITER_MAX_LOUDNESS => 1800

    /**
     * @type {Integer (UInt32)}
     */
    static FXMASTERINGLIMITER_DEFAULT_LOUDNESS => 1000

    /**
     * @type {Float}
     */
    static FXREVERB_MIN_DIFFUSION => 0

    /**
     * @type {Float}
     */
    static FXREVERB_MAX_DIFFUSION => 1

    /**
     * @type {Float}
     */
    static FXREVERB_DEFAULT_DIFFUSION => 0.9

    /**
     * @type {Float}
     */
    static FXREVERB_MIN_ROOMSIZE => 0.0001

    /**
     * @type {Float}
     */
    static FXREVERB_MAX_ROOMSIZE => 1

    /**
     * @type {Float}
     */
    static FXREVERB_DEFAULT_ROOMSIZE => 0.6

    /**
     * @type {Integer (UInt32)}
     */
    static FXLOUDNESS_DEFAULT_MOMENTARY_MS => 400

    /**
     * @type {Integer (UInt32)}
     */
    static FXLOUDNESS_DEFAULT_SHORTTERM_MS => 3000

    /**
     * @type {Float}
     */
    static FXECHO_MIN_WETDRYMIX => 0

    /**
     * @type {Float}
     */
    static FXECHO_MAX_WETDRYMIX => 1

    /**
     * @type {Float}
     */
    static FXECHO_DEFAULT_WETDRYMIX => 0.5

    /**
     * @type {Float}
     */
    static FXECHO_MIN_FEEDBACK => 0

    /**
     * @type {Float}
     */
    static FXECHO_MAX_FEEDBACK => 1

    /**
     * @type {Float}
     */
    static FXECHO_DEFAULT_FEEDBACK => 0.5

    /**
     * @type {Float}
     */
    static FXECHO_MIN_DELAY => 1

    /**
     * @type {Float}
     */
    static FXECHO_MAX_DELAY => 2000

    /**
     * @type {Float}
     */
    static FXECHO_DEFAULT_DELAY => 500

    /**
     * @type {String}
     */
    static XAUDIO2_DLL_A => "xaudio2_9.dll"

    /**
     * @type {String}
     */
    static XAUDIO2_DLL_W => "xaudio2_9.dll"

    /**
     * @type {String}
     */
    static XAUDIO2D_DLL_A => "xaudio2_9d.dll"

    /**
     * @type {String}
     */
    static XAUDIO2D_DLL_W => "xaudio2_9d.dll"

    /**
     * @type {String}
     */
    static XAUDIO2_DLL => "xaudio2_9.dll"

    /**
     * @type {String}
     */
    static XAUDIO2D_DLL => "xaudio2_9d.dll"

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_MAX_BUFFER_BYTES => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_MAX_QUEUED_BUFFERS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_MAX_BUFFERS_SYSTEM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_MAX_AUDIO_CHANNELS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_MIN_SAMPLE_RATE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_MAX_SAMPLE_RATE => 200000

    /**
     * @type {Float}
     */
    static XAUDIO2_MAX_VOLUME_LEVEL => 16777216

    /**
     * @type {Float}
     */
    static XAUDIO2_MAX_FREQ_RATIO => 1024

    /**
     * @type {Float}
     */
    static XAUDIO2_DEFAULT_FREQ_RATIO => 2

    /**
     * @type {Float}
     */
    static XAUDIO2_MAX_FILTER_ONEOVERQ => 1.5

    /**
     * @type {Float}
     */
    static XAUDIO2_MAX_FILTER_FREQUENCY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_MAX_LOOP_COUNT => 254

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_MAX_INSTANCES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_MAX_RATIO_TIMES_RATE_XMA_MONO => 600000

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_MAX_RATIO_TIMES_RATE_XMA_MULTICHANNEL => 300000

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_COMMIT_NOW => 0

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_COMMIT_ALL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_NO_LOOP_REGION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_LOOP_INFINITE => 255

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_DEFAULT_CHANNELS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_DEFAULT_SAMPLERATE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_DEBUG_ENGINE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_VOICE_NOPITCH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_VOICE_NOSRC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_VOICE_USEFILTER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_PLAY_TAILS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_END_OF_STREAM => 64

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_SEND_USEFILTER => 128

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_VOICE_NOSAMPLESPLAYED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_STOP_ENGINE_WHEN_IDLE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_1024_QUANTUM => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_NO_VIRTUAL_AUDIO_CLIENT => 65536

    /**
     * @type {Float}
     */
    static XAUDIO2_DEFAULT_FILTER_FREQUENCY => 1

    /**
     * @type {Float}
     */
    static XAUDIO2_DEFAULT_FILTER_ONEOVERQ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_QUANTUM_NUMERATOR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_QUANTUM_DENOMINATOR => 100

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_XAUDIO2 => 2198

    /**
     * @type {Integer (Int32)}
     */
    static XAUDIO2_E_INVALID_CALL => -2003435519

    /**
     * @type {Integer (Int32)}
     */
    static XAUDIO2_E_XMA_DECODER_ERROR => -2003435518

    /**
     * @type {Integer (Int32)}
     */
    static XAUDIO2_E_XAPO_CREATION_FAILED => -2003435517

    /**
     * @type {Integer (Int32)}
     */
    static XAUDIO2_E_DEVICE_INVALIDATED => -2003435516

    /**
     * @type {Integer (UInt32)}
     */
    static Processor1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static Processor2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static Processor3 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static Processor4 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static Processor5 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static Processor6 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static Processor7 => 64

    /**
     * @type {Integer (UInt32)}
     */
    static Processor8 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static Processor9 => 256

    /**
     * @type {Integer (UInt32)}
     */
    static Processor10 => 512

    /**
     * @type {Integer (UInt32)}
     */
    static Processor11 => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static Processor12 => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static Processor13 => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static Processor14 => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static Processor15 => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static Processor16 => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static Processor17 => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static Processor18 => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static Processor19 => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static Processor20 => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static Processor21 => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static Processor22 => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static Processor23 => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static Processor24 => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static Processor25 => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static Processor26 => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static Processor27 => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static Processor28 => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static Processor29 => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static Processor30 => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static Processor31 => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static Processor32 => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_ANY_PROCESSOR => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_USE_DEFAULT_PROCESSOR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_DEFAULT_PROCESSOR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_LOG_ERRORS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_LOG_WARNINGS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_LOG_INFO => 4

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_LOG_DETAIL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_LOG_API_CALLS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_LOG_FUNC_CALLS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_LOG_TIMING => 64

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_LOG_LOCKS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_LOG_MEMORY => 256

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2_LOG_STREAMING => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2FX_REVERB_MIN_FRAMERATE => 20000

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2FX_REVERB_MAX_FRAMERATE => 48000

    /**
     * @type {Float}
     */
    static XAUDIO2FX_REVERB_MIN_WET_DRY_MIX => 0

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2FX_REVERB_MIN_REFLECTIONS_DELAY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2FX_REVERB_MIN_REVERB_DELAY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2FX_REVERB_MIN_REAR_DELAY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2FX_REVERB_MIN_7POINT1_SIDE_DELAY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2FX_REVERB_MIN_7POINT1_REAR_DELAY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2FX_REVERB_MIN_POSITION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2FX_REVERB_MIN_DIFFUSION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2FX_REVERB_MIN_LOW_EQ_GAIN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2FX_REVERB_MIN_LOW_EQ_CUTOFF => 0

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2FX_REVERB_MIN_HIGH_EQ_GAIN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2FX_REVERB_MIN_HIGH_EQ_CUTOFF => 0

    /**
     * @type {Float}
     */
    static XAUDIO2FX_REVERB_MIN_ROOM_FILTER_FREQ => 20

    /**
     * @type {Float}
     */
    static XAUDIO2FX_REVERB_MIN_ROOM_FILTER_MAIN => -100

    /**
     * @type {Float}
     */
    static XAUDIO2FX_REVERB_MIN_ROOM_FILTER_HF => -100

    /**
     * @type {Float}
     */
    static XAUDIO2FX_REVERB_MIN_REFLECTIONS_GAIN => -100

    /**
     * @type {Float}
     */
    static XAUDIO2FX_REVERB_MIN_REVERB_GAIN => -100

    /**
     * @type {Float}
     */
    static XAUDIO2FX_REVERB_MIN_DECAY_TIME => 0.1

    /**
     * @type {Float}
     */
    static XAUDIO2FX_REVERB_MIN_DENSITY => 0

    /**
     * @type {Float}
     */
    static XAUDIO2FX_REVERB_MIN_ROOM_SIZE => 0

    /**
     * @type {Float}
     */
    static XAUDIO2FX_REVERB_MAX_WET_DRY_MIX => 100

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2FX_REVERB_MAX_REFLECTIONS_DELAY => 300

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2FX_REVERB_MAX_REVERB_DELAY => 85

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2FX_REVERB_MAX_REAR_DELAY => 5

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2FX_REVERB_MAX_7POINT1_SIDE_DELAY => 5

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2FX_REVERB_MAX_7POINT1_REAR_DELAY => 20

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2FX_REVERB_MAX_POSITION => 30

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2FX_REVERB_MAX_DIFFUSION => 15

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2FX_REVERB_MAX_LOW_EQ_GAIN => 12

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2FX_REVERB_MAX_LOW_EQ_CUTOFF => 9

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2FX_REVERB_MAX_HIGH_EQ_GAIN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2FX_REVERB_MAX_HIGH_EQ_CUTOFF => 14

    /**
     * @type {Float}
     */
    static XAUDIO2FX_REVERB_MAX_ROOM_FILTER_FREQ => 20000

    /**
     * @type {Float}
     */
    static XAUDIO2FX_REVERB_MAX_ROOM_FILTER_MAIN => 0

    /**
     * @type {Float}
     */
    static XAUDIO2FX_REVERB_MAX_ROOM_FILTER_HF => 0

    /**
     * @type {Float}
     */
    static XAUDIO2FX_REVERB_MAX_REFLECTIONS_GAIN => 20

    /**
     * @type {Float}
     */
    static XAUDIO2FX_REVERB_MAX_REVERB_GAIN => 20

    /**
     * @type {Float}
     */
    static XAUDIO2FX_REVERB_MAX_DENSITY => 100

    /**
     * @type {Float}
     */
    static XAUDIO2FX_REVERB_MAX_ROOM_SIZE => 100

    /**
     * @type {Float}
     */
    static XAUDIO2FX_REVERB_DEFAULT_WET_DRY_MIX => 100

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2FX_REVERB_DEFAULT_REFLECTIONS_DELAY => 5

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2FX_REVERB_DEFAULT_REVERB_DELAY => 5

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2FX_REVERB_DEFAULT_REAR_DELAY => 5

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2FX_REVERB_DEFAULT_7POINT1_SIDE_DELAY => 5

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2FX_REVERB_DEFAULT_7POINT1_REAR_DELAY => 20

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2FX_REVERB_DEFAULT_POSITION => 6

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2FX_REVERB_DEFAULT_POSITION_MATRIX => 27

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2FX_REVERB_DEFAULT_EARLY_DIFFUSION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2FX_REVERB_DEFAULT_LATE_DIFFUSION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2FX_REVERB_DEFAULT_LOW_EQ_GAIN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2FX_REVERB_DEFAULT_LOW_EQ_CUTOFF => 4

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2FX_REVERB_DEFAULT_HIGH_EQ_GAIN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2FX_REVERB_DEFAULT_HIGH_EQ_CUTOFF => 4

    /**
     * @type {Float}
     */
    static XAUDIO2FX_REVERB_DEFAULT_ROOM_FILTER_FREQ => 5000

    /**
     * @type {Float}
     */
    static XAUDIO2FX_REVERB_DEFAULT_ROOM_FILTER_MAIN => 0

    /**
     * @type {Float}
     */
    static XAUDIO2FX_REVERB_DEFAULT_ROOM_FILTER_HF => 0

    /**
     * @type {Float}
     */
    static XAUDIO2FX_REVERB_DEFAULT_REFLECTIONS_GAIN => 0

    /**
     * @type {Float}
     */
    static XAUDIO2FX_REVERB_DEFAULT_REVERB_GAIN => 0

    /**
     * @type {Float}
     */
    static XAUDIO2FX_REVERB_DEFAULT_DECAY_TIME => 1

    /**
     * @type {Float}
     */
    static XAUDIO2FX_REVERB_DEFAULT_DENSITY => 100

    /**
     * @type {Float}
     */
    static XAUDIO2FX_REVERB_DEFAULT_ROOM_SIZE => 100

    /**
     * @type {Integer (UInt32)}
     */
    static XAUDIO2FX_REVERB_DEFAULT_DISABLE_LATE_FIELD => 0

    /**
     * @type {Float}
     */
    static HRTF_MAX_GAIN_LIMIT => 12

    /**
     * @type {Float}
     */
    static HRTF_MIN_GAIN_LIMIT => -96

    /**
     * @type {Float}
     */
    static HRTF_MIN_UNITY_GAIN_DISTANCE => 0.05

    /**
     * @type {Float}
     */
    static HRTF_DEFAULT_UNITY_GAIN_DISTANCE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_XAPO => 2199

    /**
     * @type {Integer (Int32)}
     */
    static XAPO_E_FORMAT_UNSUPPORTED => -2003369983

    /**
     * @type {Integer (UInt32)}
     */
    static XAPO_MIN_CHANNELS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static XAPO_MAX_CHANNELS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static XAPO_MIN_FRAMERATE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static XAPO_MAX_FRAMERATE => 200000

    /**
     * @type {Integer (UInt32)}
     */
    static XAPO_REGISTRATION_STRING_LENGTH => 256

    /**
     * @type {Integer (UInt32)}
     */
    static XAPO_FLAG_CHANNELS_MUST_MATCH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static XAPO_FLAG_FRAMERATE_MUST_MATCH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static XAPO_FLAG_BITSPERSAMPLE_MUST_MATCH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static XAPO_FLAG_BUFFERCOUNT_MUST_MATCH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static XAPO_FLAG_INPLACE_REQUIRED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static XAPO_FLAG_INPLACE_SUPPORTED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SPEAKER_MONO => 4

    /**
     * @type {Integer (UInt32)}
     */
    static X3DAUDIO_HANDLE_BYTESIZE => 20

    /**
     * @type {Float}
     */
    static X3DAUDIO_PI => 3.1415927

    /**
     * @type {Float}
     */
    static X3DAUDIO_2PI => 6.2831855

    /**
     * @type {Float}
     */
    static X3DAUDIO_SPEED_OF_SOUND => 343.5

    /**
     * @type {Integer (UInt32)}
     */
    static X3DAUDIO_CALCULATE_MATRIX => 1

    /**
     * @type {Integer (UInt32)}
     */
    static X3DAUDIO_CALCULATE_DELAY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static X3DAUDIO_CALCULATE_LPF_DIRECT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static X3DAUDIO_CALCULATE_LPF_REVERB => 8

    /**
     * @type {Integer (UInt32)}
     */
    static X3DAUDIO_CALCULATE_REVERB => 16

    /**
     * @type {Integer (UInt32)}
     */
    static X3DAUDIO_CALCULATE_DOPPLER => 32

    /**
     * @type {Integer (UInt32)}
     */
    static X3DAUDIO_CALCULATE_EMITTER_ANGLE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static X3DAUDIO_CALCULATE_ZEROCENTER => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static X3DAUDIO_CALCULATE_REDIRECT_TO_LFE => 131072
;@endregion Constants

;@region Methods
    /**
     * Creates an instance of the requested XAPOFX effect.
     * @param {Pointer<Guid>} clsid ID of the effect to create. Use the <b>__uuidof</b> on the effect class name to get the CLSID for an effect. For example, <b>__uuidof</b>(FXReverb) would provide the CLSID for the FXReverb effect. For a list of effects provided by XAPOFX, see <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xapofx-overview">XAPOFX Overview</a>. For an example of retrieving the CLSID for an effect, see <a href="https://docs.microsoft.com/windows/desktop/xaudio2/how-to--use-xapofx-in-xaudio2">How to: Use XAPOFX in XAudio2</a>.
     * @param {Pointer} pInitDat 
     * @param {Integer} InitDataByteSize Size of <i>pInitData</i> in bytes. This is zero if <i>pInitData</i> is <b>NULL</b>.
     * @returns {IUnknown} Receives a pointer to the created XAPO instance. If <b>CreateFX</b> fails, <i>pEffect </i> is untouched.
     * @see https://docs.microsoft.com/windows/win32/api//xapofx/nf-xapofx-createfx
     */
    static CreateFX(clsid, pInitDat, InitDataByteSize) {
        result := DllCall("XAudio2_8.dll\CreateFX", "ptr", clsid, "ptr*", &pEffect := 0, "ptr", pInitDat, "uint", InitDataByteSize, "CDecl int")
        if(result != 0)
            throw OSError(result)

        return IUnknown(pEffect)
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Integer} XAudio2Processor 
     * @param {Integer} ntddiVersion 
     * @returns {IXAudio2} 
     */
    static XAudio2CreateWithVersionInfo(Flags, XAudio2Processor, ntddiVersion) {
        result := DllCall("XAudio2_8.dll\XAudio2CreateWithVersionInfo", "ptr*", &ppXAudio2 := 0, "uint", Flags, "uint", XAudio2Processor, "uint", ntddiVersion, "int")
        if(result != 0)
            throw OSError(result)

        return IXAudio2(ppXAudio2)
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    static CreateAudioVolumeMeter() {
        result := DllCall("XAudio2_8.dll\CreateAudioVolumeMeter", "ptr*", &ppApo := 0, "int")
        if(result != 0)
            throw OSError(result)

        return IUnknown(ppApo)
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    static CreateAudioReverb() {
        result := DllCall("XAudio2_8.dll\CreateAudioReverb", "ptr*", &ppApo := 0, "int")
        if(result != 0)
            throw OSError(result)

        return IUnknown(ppApo)
    }

    /**
     * Creates an instance of the IXAPO interface for head-related transfer function (HRTF) processing.
     * @param {Pointer<HrtfApoInit>} init Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/hrtfapoapi/ns-hrtfapoapi-hrtfapoinit">HrtfApoInit</a> struct. Specifies parameters for XAPO interface initialization.
     * @returns {IXAPO} The new instance of the <a href="https://docs.microsoft.com/windows/desktop/api/xapo/nn-xapo-ixapo">IXAPO</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//hrtfapoapi/nf-hrtfapoapi-createhrtfapo
     */
    static CreateHrtfApo(init) {
        result := DllCall("HrtfApo.dll\CreateHrtfApo", "ptr", init, "ptr*", &xApo := 0, "int")
        if(result != 0)
            throw OSError(result)

        return IXAPO(xApo)
    }

;@endregion Methods
}
