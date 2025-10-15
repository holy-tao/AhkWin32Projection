#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
/**
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class Audio {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERCONTROL_CONTROLTYPE_CUSTOM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERCONTROL_CONTROLTYPE_BOOLEANMETER => 268500992

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERCONTROL_CONTROLTYPE_SIGNEDMETER => 268566528

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERCONTROL_CONTROLTYPE_PEAKMETER => 268566529

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERCONTROL_CONTROLTYPE_UNSIGNEDMETER => 268632064

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERCONTROL_CONTROLTYPE_BOOLEAN => 536936448

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERCONTROL_CONTROLTYPE_ONOFF => 536936449

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERCONTROL_CONTROLTYPE_MUTE => 536936450

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERCONTROL_CONTROLTYPE_MONO => 536936451

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERCONTROL_CONTROLTYPE_LOUDNESS => 536936452

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERCONTROL_CONTROLTYPE_STEREOENH => 536936453

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERCONTROL_CONTROLTYPE_BASS_BOOST => 536945271

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERCONTROL_CONTROLTYPE_BUTTON => 553713664

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERCONTROL_CONTROLTYPE_DECIBELS => 805568512

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERCONTROL_CONTROLTYPE_SIGNED => 805437440

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERCONTROL_CONTROLTYPE_UNSIGNED => 805502976

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERCONTROL_CONTROLTYPE_PERCENT => 805634048

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERCONTROL_CONTROLTYPE_SLIDER => 1073872896

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERCONTROL_CONTROLTYPE_PAN => 1073872897

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERCONTROL_CONTROLTYPE_QSOUNDPAN => 1073872898

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERCONTROL_CONTROLTYPE_FADER => 1342373888

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERCONTROL_CONTROLTYPE_VOLUME => 1342373889

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERCONTROL_CONTROLTYPE_BASS => 1342373890

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERCONTROL_CONTROLTYPE_TREBLE => 1342373891

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERCONTROL_CONTROLTYPE_EQUALIZER => 1342373892

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERCONTROL_CONTROLTYPE_SINGLESELECT => 1879113728

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERCONTROL_CONTROLTYPE_MUX => 1879113729

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERCONTROL_CONTROLTYPE_MULTIPLESELECT => 1895890944

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERCONTROL_CONTROLTYPE_MIXER => 1895890945

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERCONTROL_CONTROLTYPE_MICROTIME => 1610809344

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERCONTROL_CONTROLTYPE_MILLITIME => 1627586560

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_MAPPER => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static ENDPOINT_FORMAT_RESET_MIX_ONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ENDPOINT_HARDWARE_SUPPORT_VOLUME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ENDPOINT_HARDWARE_SUPPORT_MUTE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ENDPOINT_HARDWARE_SUPPORT_METER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static AUDIOCLOCK_CHARACTERISTIC_FIXED_FREQ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AMBISONICS_PARAM_VERSION_1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_E_NOT_INITIALIZED => -2004287487

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_E_ALREADY_INITIALIZED => -2004287486

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_E_WRONG_ENDPOINT_TYPE => -2004287485

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_E_DEVICE_INVALIDATED => -2004287484

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_E_NOT_STOPPED => -2004287483

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_E_BUFFER_TOO_LARGE => -2004287482

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_E_OUT_OF_ORDER => -2004287481

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_E_UNSUPPORTED_FORMAT => -2004287480

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_E_INVALID_SIZE => -2004287479

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_E_DEVICE_IN_USE => -2004287478

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_E_BUFFER_OPERATION_PENDING => -2004287477

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_E_THREAD_NOT_REGISTERED => -2004287476

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_E_EXCLUSIVE_MODE_NOT_ALLOWED => -2004287474

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_E_ENDPOINT_CREATE_FAILED => -2004287473

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_E_SERVICE_NOT_RUNNING => -2004287472

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_E_EVENTHANDLE_NOT_EXPECTED => -2004287471

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_E_EXCLUSIVE_MODE_ONLY => -2004287470

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_E_BUFDURATION_PERIOD_NOT_EQUAL => -2004287469

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_E_EVENTHANDLE_NOT_SET => -2004287468

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_E_INCORRECT_BUFFER_SIZE => -2004287467

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_E_BUFFER_SIZE_ERROR => -2004287466

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_E_CPUUSAGE_EXCEEDED => -2004287465

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_E_BUFFER_ERROR => -2004287464

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_E_BUFFER_SIZE_NOT_ALIGNED => -2004287463

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_E_INVALID_DEVICE_PERIOD => -2004287456

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_E_INVALID_STREAM_FLAG => -2004287455

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_E_ENDPOINT_OFFLOAD_NOT_CAPABLE => -2004287454

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_E_OUT_OF_OFFLOAD_RESOURCES => -2004287453

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_E_OFFLOAD_MODE_ONLY => -2004287452

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_E_NONOFFLOAD_MODE_ONLY => -2004287451

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_E_RESOURCES_INVALIDATED => -2004287450

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_E_RAW_MODE_UNSUPPORTED => -2004287449

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_E_ENGINE_PERIODICITY_LOCKED => -2004287448

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_E_ENGINE_FORMAT_LOCKED => -2004287447

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_E_HEADTRACKING_ENABLED => -2004287440

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_E_HEADTRACKING_UNSUPPORTED => -2004287424

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_E_EFFECT_NOT_AVAILABLE => -2004287423

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_E_EFFECT_STATE_READ_ONLY => -2004287422

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_E_POST_VOLUME_LOOPBACK_UNSUPPORTED => -2004287421

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_S_BUFFER_EMPTY => 143196161

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_S_THREAD_ALREADY_REGISTERED => 143196162

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_S_POSITION_STALLED => 143196163

    /**
     * @type {Integer (UInt32)}
     */
    static AUDCLNT_STREAMFLAGS_CROSSPROCESS => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static AUDCLNT_STREAMFLAGS_LOOPBACK => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static AUDCLNT_STREAMFLAGS_EVENTCALLBACK => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static AUDCLNT_STREAMFLAGS_NOPERSIST => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static AUDCLNT_STREAMFLAGS_RATEADJUST => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static AUDCLNT_STREAMFLAGS_SRC_DEFAULT_QUALITY => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static AUDCLNT_STREAMFLAGS_AUTOCONVERTPCM => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static AUDCLNT_SESSIONFLAGS_EXPIREWHENUNOWNED => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static AUDCLNT_SESSIONFLAGS_DISPLAY_HIDE => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static AUDCLNT_SESSIONFLAGS_DISPLAY_HIDEWHENEXPIRED => 1073741824

    /**
     * @type {Integer (Int32)}
     */
    static SPTLAUDCLNT_E_DESTROYED => -2004287232

    /**
     * @type {Integer (Int32)}
     */
    static SPTLAUDCLNT_E_OUT_OF_ORDER => -2004287231

    /**
     * @type {Integer (Int32)}
     */
    static SPTLAUDCLNT_E_RESOURCES_INVALIDATED => -2004287230

    /**
     * @type {Integer (Int32)}
     */
    static SPTLAUDCLNT_E_NO_MORE_OBJECTS => -2004287229

    /**
     * @type {Integer (Int32)}
     */
    static SPTLAUDCLNT_E_PROPERTY_NOT_SUPPORTED => -2004287228

    /**
     * @type {Integer (Int32)}
     */
    static SPTLAUDCLNT_E_ERRORS_IN_OBJECT_CALLS => -2004287227

    /**
     * @type {Integer (Int32)}
     */
    static SPTLAUDCLNT_E_METADATA_FORMAT_NOT_SUPPORTED => -2004287226

    /**
     * @type {Integer (Int32)}
     */
    static SPTLAUDCLNT_E_STREAM_NOT_AVAILABLE => -2004287225

    /**
     * @type {Integer (Int32)}
     */
    static SPTLAUDCLNT_E_INVALID_LICENSE => -2004287224

    /**
     * @type {Integer (Int32)}
     */
    static SPTLAUDCLNT_E_STREAM_NOT_STOPPED => -2004287222

    /**
     * @type {Integer (Int32)}
     */
    static SPTLAUDCLNT_E_STATIC_OBJECT_NOT_AVAILABLE => -2004287221

    /**
     * @type {Integer (Int32)}
     */
    static SPTLAUDCLNT_E_OBJECT_ALREADY_ACTIVE => -2004287220

    /**
     * @type {Integer (Int32)}
     */
    static SPTLAUDCLNT_E_INTERNAL => -2004287219

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_STATEMASK_ALL => 15

    /**
     * @type {Integer (UInt32)}
     */
    static ENDPOINT_SYSFX_ENABLED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ENDPOINT_SYSFX_DISABLED => 1

    /**
     * @type {String}
     */
    static DEVINTERFACE_AUDIO_RENDER => "{e6327cad-dcec-4949-ae8a-991e976a79d2}"

    /**
     * @type {String}
     */
    static DEVINTERFACE_AUDIO_CAPTURE => "{2eef81be-33fa-4800-9670-1cd474972c3f}"

    /**
     * @type {String}
     */
    static DEVINTERFACE_MIDI_OUTPUT => "{6dc23320-ab33-4ce4-80d4-bbb3ebbf2814}"

    /**
     * @type {String}
     */
    static DEVINTERFACE_MIDI_INPUT => "{504be32c-ccf6-4d2c-b73f-6f8b3747e22b}"

    /**
     * @type {String}
     */
    static EVENTCONTEXT_VOLUMESLIDER => "{e2c2e9de-09b1-4b04-84e5-07931225ee04}"

    /**
     * @type {Integer (UInt32)}
     */
    static SPATIAL_AUDIO_STANDARD_COMMANDS_START => 200

    /**
     * @type {Integer (UInt32)}
     */
    static SPATIAL_AUDIO_POSITION => 200

    /**
     * @type {Integer (Int32)}
     */
    static SPTLAUD_MD_CLNT_E_COMMAND_NOT_FOUND => -2004286976

    /**
     * @type {Integer (Int32)}
     */
    static SPTLAUD_MD_CLNT_E_OBJECT_NOT_INITIALIZED => -2004286975

    /**
     * @type {Integer (Int32)}
     */
    static SPTLAUD_MD_CLNT_E_INVALID_ARGS => -2004286974

    /**
     * @type {Integer (Int32)}
     */
    static SPTLAUD_MD_CLNT_E_METADATA_FORMAT_NOT_FOUND => -2004286973

    /**
     * @type {Integer (Int32)}
     */
    static SPTLAUD_MD_CLNT_E_VALUE_BUFFER_INCORRECT_SIZE => -2004286972

    /**
     * @type {Integer (Int32)}
     */
    static SPTLAUD_MD_CLNT_E_MEMORY_BOUNDS => -2004286971

    /**
     * @type {Integer (Int32)}
     */
    static SPTLAUD_MD_CLNT_E_NO_MORE_COMMANDS => -2004286970

    /**
     * @type {Integer (Int32)}
     */
    static SPTLAUD_MD_CLNT_E_BUFFER_ALREADY_ATTACHED => -2004286969

    /**
     * @type {Integer (Int32)}
     */
    static SPTLAUD_MD_CLNT_E_BUFFER_NOT_ATTACHED => -2004286968

    /**
     * @type {Integer (Int32)}
     */
    static SPTLAUD_MD_CLNT_E_FRAMECOUNT_OUT_OF_RANGE => -2004286967

    /**
     * @type {Integer (Int32)}
     */
    static SPTLAUD_MD_CLNT_E_NO_ITEMS_FOUND => -2004286960

    /**
     * @type {Integer (Int32)}
     */
    static SPTLAUD_MD_CLNT_E_ITEM_COPY_OVERFLOW => -2004286959

    /**
     * @type {Integer (Int32)}
     */
    static SPTLAUD_MD_CLNT_E_NO_ITEMS_OPEN => -2004286958

    /**
     * @type {Integer (Int32)}
     */
    static SPTLAUD_MD_CLNT_E_ITEMS_ALREADY_OPEN => -2004286957

    /**
     * @type {Integer (Int32)}
     */
    static SPTLAUD_MD_CLNT_E_ATTACH_FAILED_INTERNAL_BUFFER => -2004286956

    /**
     * @type {Integer (Int32)}
     */
    static SPTLAUD_MD_CLNT_E_DETACH_FAILED_INTERNAL_BUFFER => -2004286955

    /**
     * @type {Integer (Int32)}
     */
    static SPTLAUD_MD_CLNT_E_NO_BUFFER_ATTACHED => -2004286954

    /**
     * @type {Integer (Int32)}
     */
    static SPTLAUD_MD_CLNT_E_NO_MORE_ITEMS => -2004286953

    /**
     * @type {Integer (Int32)}
     */
    static SPTLAUD_MD_CLNT_E_FRAMEOFFSET_OUT_OF_RANGE => -2004286952

    /**
     * @type {Integer (Int32)}
     */
    static SPTLAUD_MD_CLNT_E_ITEM_MUST_HAVE_COMMANDS => -2004286951

    /**
     * @type {Integer (Int32)}
     */
    static SPTLAUD_MD_CLNT_E_NO_ITEMOFFSET_WRITTEN => -2004286944

    /**
     * @type {Integer (Int32)}
     */
    static SPTLAUD_MD_CLNT_E_NO_ITEMS_WRITTEN => -2004286943

    /**
     * @type {Integer (Int32)}
     */
    static SPTLAUD_MD_CLNT_E_COMMAND_ALREADY_WRITTEN => -2004286942

    /**
     * @type {Integer (Int32)}
     */
    static SPTLAUD_MD_CLNT_E_FORMAT_MISMATCH => -2004286941

    /**
     * @type {Integer (Int32)}
     */
    static SPTLAUD_MD_CLNT_E_BUFFER_STILL_ATTACHED => -2004286940

    /**
     * @type {Integer (Int32)}
     */
    static SPTLAUD_MD_CLNT_E_ITEMS_LOCKED_FOR_WRITING => -2004286939

    /**
     * @type {String}
     */
    static VIRTUAL_AUDIO_DEVICE_PROCESS_LOOPBACK => "VAD\Process_Loopback"

    /**
     * @type {Integer (UInt32)}
     */
    static WAVERR_BADFORMAT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WAVERR_STILLPLAYING => 33

    /**
     * @type {Integer (UInt32)}
     */
    static WAVERR_UNPREPARED => 34

    /**
     * @type {Integer (UInt32)}
     */
    static WAVERR_SYNC => 35

    /**
     * @type {Integer (UInt32)}
     */
    static WAVERR_LASTERROR => 35

    /**
     * @type {Integer (UInt32)}
     */
    static WHDR_DONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WHDR_PREPARED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WHDR_BEGINLOOP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WHDR_ENDLOOP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WHDR_INQUEUE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WAVECAPS_PITCH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WAVECAPS_PLAYBACKRATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WAVECAPS_VOLUME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WAVECAPS_LRVOLUME => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WAVECAPS_SYNC => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WAVECAPS_SAMPLEACCURATE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_INVALIDFORMAT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_1M08 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_1S08 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_1M16 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_1S16 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_2M08 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_2S08 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_2M16 => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_2S16 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_4M08 => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_4S08 => 512

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_4M16 => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_4S16 => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_44M08 => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_44S08 => 512

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_44M16 => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_44S16 => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_48M08 => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_48S08 => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_48M16 => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_48S16 => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_96M08 => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_96S08 => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_96M16 => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_96S16 => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_PCM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MIDIERR_UNPREPARED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MIDIERR_STILLPLAYING => 65

    /**
     * @type {Integer (UInt32)}
     */
    static MIDIERR_NOMAP => 66

    /**
     * @type {Integer (UInt32)}
     */
    static MIDIERR_NOTREADY => 67

    /**
     * @type {Integer (UInt32)}
     */
    static MIDIERR_NODEVICE => 68

    /**
     * @type {Integer (UInt32)}
     */
    static MIDIERR_INVALIDSETUP => 69

    /**
     * @type {Integer (UInt32)}
     */
    static MIDIERR_BADOPENMODE => 70

    /**
     * @type {Integer (UInt32)}
     */
    static MIDIERR_DONT_CONTINUE => 71

    /**
     * @type {Integer (UInt32)}
     */
    static MIDIERR_LASTERROR => 71

    /**
     * @type {Integer (UInt32)}
     */
    static MIDIPATCHSIZE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MIDI_CACHE_ALL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MIDI_CACHE_BESTFIT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MIDI_CACHE_QUERY => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MIDI_UNCACHE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MOD_MIDIPORT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MOD_SYNTH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MOD_SQSYNTH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MOD_FMSYNTH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MOD_MAPPER => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MOD_WAVETABLE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MOD_SWSYNTH => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MIDICAPS_VOLUME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MIDICAPS_LRVOLUME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MIDICAPS_CACHE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MIDICAPS_STREAM => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MHDR_DONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MHDR_PREPARED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MHDR_INQUEUE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MHDR_ISSTRM => 8

    /**
     * @type {Integer (Int32)}
     */
    static MEVT_F_SHORT => 0

    /**
     * @type {Integer (Int32)}
     */
    static MEVT_F_LONG => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static MEVT_F_CALLBACK => 1073741824

    /**
     * @type {Integer (Byte)}
     */
    static MEVT_SHORTMSG => 0x00

    /**
     * @type {Integer (Byte)}
     */
    static MEVT_TEMPO => 0x01

    /**
     * @type {Integer (Byte)}
     */
    static MEVT_NOP => 0x02

    /**
     * @type {Integer (Byte)}
     */
    static MEVT_LONGMSG => 0x80

    /**
     * @type {Integer (Byte)}
     */
    static MEVT_COMMENT => 0x82

    /**
     * @type {Integer (Byte)}
     */
    static MEVT_VERSION => 0x84

    /**
     * @type {Integer (Int32)}
     */
    static MIDISTRM_ERROR => -2

    /**
     * @type {Integer (Int32)}
     */
    static MIDIPROP_SET => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static MIDIPROP_GET => 1073741824

    /**
     * @type {Integer (Int32)}
     */
    static MIDIPROP_TIMEDIV => 1

    /**
     * @type {Integer (Int32)}
     */
    static MIDIPROP_TEMPO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AUXCAPS_CDAUDIO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AUXCAPS_AUXIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AUXCAPS_VOLUME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AUXCAPS_LRVOLUME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MIXER_SHORT_NAME_CHARS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MIXER_LONG_NAME_CHARS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERR_INVALLINE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERR_INVALCONTROL => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERR_INVALVALUE => 1026

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERR_LASTERROR => 1026

    /**
     * @type {Integer (Int32)}
     */
    static MIXER_OBJECTF_HANDLE => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static MIXER_OBJECTF_MIXER => 0

    /**
     * @type {Integer (Int32)}
     */
    static MIXER_OBJECTF_WAVEOUT => 268435456

    /**
     * @type {Integer (Int32)}
     */
    static MIXER_OBJECTF_WAVEIN => 536870912

    /**
     * @type {Integer (Int32)}
     */
    static MIXER_OBJECTF_MIDIOUT => 805306368

    /**
     * @type {Integer (Int32)}
     */
    static MIXER_OBJECTF_MIDIIN => 1073741824

    /**
     * @type {Integer (Int32)}
     */
    static MIXER_OBJECTF_AUX => 1342177280

    /**
     * @type {Integer (Int32)}
     */
    static MIXERLINE_LINEF_ACTIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static MIXERLINE_LINEF_DISCONNECTED => 32768

    /**
     * @type {Integer (Int32)}
     */
    static MIXERLINE_LINEF_SOURCE => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static MIXERLINE_COMPONENTTYPE_DST_FIRST => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERLINE_COMPONENTTYPE_DST_LAST => 8

    /**
     * @type {Integer (Int32)}
     */
    static MIXERLINE_COMPONENTTYPE_SRC_FIRST => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERLINE_COMPONENTTYPE_SRC_LAST => 4106

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERLINE_TARGETTYPE_UNDEFINED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERLINE_TARGETTYPE_WAVEOUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERLINE_TARGETTYPE_WAVEIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERLINE_TARGETTYPE_MIDIOUT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERLINE_TARGETTYPE_MIDIIN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERLINE_TARGETTYPE_AUX => 5

    /**
     * @type {Integer (Int32)}
     */
    static MIXER_GETLINEINFOF_DESTINATION => 0

    /**
     * @type {Integer (Int32)}
     */
    static MIXER_GETLINEINFOF_SOURCE => 1

    /**
     * @type {Integer (Int32)}
     */
    static MIXER_GETLINEINFOF_LINEID => 2

    /**
     * @type {Integer (Int32)}
     */
    static MIXER_GETLINEINFOF_COMPONENTTYPE => 3

    /**
     * @type {Integer (Int32)}
     */
    static MIXER_GETLINEINFOF_TARGETTYPE => 4

    /**
     * @type {Integer (Int32)}
     */
    static MIXER_GETLINEINFOF_QUERYMASK => 15

    /**
     * @type {Integer (Int32)}
     */
    static MIXERCONTROL_CONTROLF_UNIFORM => 1

    /**
     * @type {Integer (Int32)}
     */
    static MIXERCONTROL_CONTROLF_MULTIPLE => 2

    /**
     * @type {Integer (Int32)}
     */
    static MIXERCONTROL_CONTROLF_DISABLED => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static MIXERCONTROL_CT_CLASS_MASK => -268435456

    /**
     * @type {Integer (Int32)}
     */
    static MIXERCONTROL_CT_CLASS_CUSTOM => 0

    /**
     * @type {Integer (Int32)}
     */
    static MIXERCONTROL_CT_CLASS_METER => 268435456

    /**
     * @type {Integer (Int32)}
     */
    static MIXERCONTROL_CT_CLASS_SWITCH => 536870912

    /**
     * @type {Integer (Int32)}
     */
    static MIXERCONTROL_CT_CLASS_NUMBER => 805306368

    /**
     * @type {Integer (Int32)}
     */
    static MIXERCONTROL_CT_CLASS_SLIDER => 1073741824

    /**
     * @type {Integer (Int32)}
     */
    static MIXERCONTROL_CT_CLASS_FADER => 1342177280

    /**
     * @type {Integer (Int32)}
     */
    static MIXERCONTROL_CT_CLASS_TIME => 1610612736

    /**
     * @type {Integer (Int32)}
     */
    static MIXERCONTROL_CT_CLASS_LIST => 1879048192

    /**
     * @type {Integer (Int32)}
     */
    static MIXERCONTROL_CT_SUBCLASS_MASK => 251658240

    /**
     * @type {Integer (Int32)}
     */
    static MIXERCONTROL_CT_SC_SWITCH_BOOLEAN => 0

    /**
     * @type {Integer (Int32)}
     */
    static MIXERCONTROL_CT_SC_SWITCH_BUTTON => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static MIXERCONTROL_CT_SC_METER_POLLED => 0

    /**
     * @type {Integer (Int32)}
     */
    static MIXERCONTROL_CT_SC_TIME_MICROSECS => 0

    /**
     * @type {Integer (Int32)}
     */
    static MIXERCONTROL_CT_SC_TIME_MILLISECS => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static MIXERCONTROL_CT_SC_LIST_SINGLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MIXERCONTROL_CT_SC_LIST_MULTIPLE => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static MIXERCONTROL_CT_UNITS_MASK => 16711680

    /**
     * @type {Integer (Int32)}
     */
    static MIXERCONTROL_CT_UNITS_CUSTOM => 0

    /**
     * @type {Integer (Int32)}
     */
    static MIXERCONTROL_CT_UNITS_BOOLEAN => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MIXERCONTROL_CT_UNITS_SIGNED => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MIXERCONTROL_CT_UNITS_UNSIGNED => 196608

    /**
     * @type {Integer (Int32)}
     */
    static MIXERCONTROL_CT_UNITS_DECIBELS => 262144

    /**
     * @type {Integer (Int32)}
     */
    static MIXERCONTROL_CT_UNITS_PERCENT => 327680

    /**
     * @type {Integer (Int32)}
     */
    static MIXER_GETLINECONTROLSF_ALL => 0

    /**
     * @type {Integer (Int32)}
     */
    static MIXER_GETLINECONTROLSF_ONEBYID => 1

    /**
     * @type {Integer (Int32)}
     */
    static MIXER_GETLINECONTROLSF_ONEBYTYPE => 2

    /**
     * @type {Integer (Int32)}
     */
    static MIXER_GETLINECONTROLSF_QUERYMASK => 15

    /**
     * @type {Integer (Int32)}
     */
    static MIXER_GETCONTROLDETAILSF_VALUE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MIXER_GETCONTROLDETAILSF_LISTTEXT => 1

    /**
     * @type {Integer (Int32)}
     */
    static MIXER_GETCONTROLDETAILSF_QUERYMASK => 15

    /**
     * @type {Integer (Int32)}
     */
    static MIXER_SETCONTROLDETAILSF_VALUE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MIXER_SETCONTROLDETAILSF_CUSTOM => 1

    /**
     * @type {Integer (Int32)}
     */
    static MIXER_SETCONTROLDETAILSF_QUERYMASK => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DRV_MAPPER_PREFERRED_INPUT_GET => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static DRV_MAPPER_PREFERRED_OUTPUT_GET => 16386

    /**
     * @type {Integer (UInt32)}
     */
    static DRVM_MAPPER => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static DRVM_MAPPER_STATUS => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static WIDM_MAPPER_STATUS => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static WAVEIN_MAPPER_STATUS_DEVICE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WAVEIN_MAPPER_STATUS_MAPPED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WAVEIN_MAPPER_STATUS_FORMAT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WODM_MAPPER_STATUS => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static WAVEOUT_MAPPER_STATUS_DEVICE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WAVEOUT_MAPPER_STATUS_MAPPED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WAVEOUT_MAPPER_STATUS_FORMAT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ACMERR_BASE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static ACMERR_NOTPOSSIBLE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static ACMERR_BUSY => 513

    /**
     * @type {Integer (UInt32)}
     */
    static ACMERR_UNPREPARED => 514

    /**
     * @type {Integer (UInt32)}
     */
    static ACMERR_CANCELED => 515

    /**
     * @type {Integer (UInt32)}
     */
    static ACM_METRIC_COUNT_DRIVERS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ACM_METRIC_COUNT_CODECS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ACM_METRIC_COUNT_CONVERTERS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ACM_METRIC_COUNT_FILTERS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ACM_METRIC_COUNT_DISABLED => 5

    /**
     * @type {Integer (UInt32)}
     */
    static ACM_METRIC_COUNT_HARDWARE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static ACM_METRIC_COUNT_LOCAL_DRIVERS => 20

    /**
     * @type {Integer (UInt32)}
     */
    static ACM_METRIC_COUNT_LOCAL_CODECS => 21

    /**
     * @type {Integer (UInt32)}
     */
    static ACM_METRIC_COUNT_LOCAL_CONVERTERS => 22

    /**
     * @type {Integer (UInt32)}
     */
    static ACM_METRIC_COUNT_LOCAL_FILTERS => 23

    /**
     * @type {Integer (UInt32)}
     */
    static ACM_METRIC_COUNT_LOCAL_DISABLED => 24

    /**
     * @type {Integer (UInt32)}
     */
    static ACM_METRIC_HARDWARE_WAVE_INPUT => 30

    /**
     * @type {Integer (UInt32)}
     */
    static ACM_METRIC_HARDWARE_WAVE_OUTPUT => 31

    /**
     * @type {Integer (UInt32)}
     */
    static ACM_METRIC_MAX_SIZE_FORMAT => 50

    /**
     * @type {Integer (UInt32)}
     */
    static ACM_METRIC_MAX_SIZE_FILTER => 51

    /**
     * @type {Integer (UInt32)}
     */
    static ACM_METRIC_DRIVER_SUPPORT => 100

    /**
     * @type {Integer (UInt32)}
     */
    static ACM_METRIC_DRIVER_PRIORITY => 101

    /**
     * @type {Integer (Int32)}
     */
    static ACM_DRIVERENUMF_NOLOCAL => 1073741824

    /**
     * @type {Integer (Int32)}
     */
    static ACM_DRIVERENUMF_DISABLED => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static ACM_DRIVERADDF_NAME => 1

    /**
     * @type {Integer (Int32)}
     */
    static ACM_DRIVERADDF_FUNCTION => 3

    /**
     * @type {Integer (Int32)}
     */
    static ACM_DRIVERADDF_NOTIFYHWND => 4

    /**
     * @type {Integer (Int32)}
     */
    static ACM_DRIVERADDF_TYPEMASK => 7

    /**
     * @type {Integer (Int32)}
     */
    static ACM_DRIVERADDF_LOCAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static ACM_DRIVERADDF_GLOBAL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ACMDM_USER => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static ACMDM_RESERVED_LOW => 24576

    /**
     * @type {Integer (UInt32)}
     */
    static ACMDM_RESERVED_HIGH => 28671

    /**
     * @type {Integer (UInt32)}
     */
    static ACMDM_DRIVER_ABOUT => 24587

    /**
     * @type {Integer (Int32)}
     */
    static ACM_DRIVERPRIORITYF_ENABLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static ACM_DRIVERPRIORITYF_DISABLE => 2

    /**
     * @type {Integer (Int32)}
     */
    static ACM_DRIVERPRIORITYF_ABLEMASK => 3

    /**
     * @type {Integer (Int32)}
     */
    static ACM_DRIVERPRIORITYF_BEGIN => 65536

    /**
     * @type {Integer (Int32)}
     */
    static ACM_DRIVERPRIORITYF_END => 131072

    /**
     * @type {Integer (Int32)}
     */
    static ACM_DRIVERPRIORITYF_DEFERMASK => 196608

    /**
     * @type {Integer (UInt32)}
     */
    static ACMDRIVERDETAILS_SHORTNAME_CHARS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ACMDRIVERDETAILS_LONGNAME_CHARS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static ACMDRIVERDETAILS_COPYRIGHT_CHARS => 80

    /**
     * @type {Integer (UInt32)}
     */
    static ACMDRIVERDETAILS_LICENSING_CHARS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static ACMDRIVERDETAILS_FEATURES_CHARS => 512

    /**
     * @type {Integer (Int32)}
     */
    static ACMDRIVERDETAILS_SUPPORTF_CODEC => 1

    /**
     * @type {Integer (Int32)}
     */
    static ACMDRIVERDETAILS_SUPPORTF_CONVERTER => 2

    /**
     * @type {Integer (Int32)}
     */
    static ACMDRIVERDETAILS_SUPPORTF_FILTER => 4

    /**
     * @type {Integer (Int32)}
     */
    static ACMDRIVERDETAILS_SUPPORTF_HARDWARE => 8

    /**
     * @type {Integer (Int32)}
     */
    static ACMDRIVERDETAILS_SUPPORTF_ASYNC => 16

    /**
     * @type {Integer (Int32)}
     */
    static ACMDRIVERDETAILS_SUPPORTF_LOCAL => 1073741824

    /**
     * @type {Integer (Int32)}
     */
    static ACMDRIVERDETAILS_SUPPORTF_DISABLED => -2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static ACMFORMATTAGDETAILS_FORMATTAG_CHARS => 48

    /**
     * @type {Integer (Int32)}
     */
    static ACM_FORMATTAGDETAILSF_INDEX => 0

    /**
     * @type {Integer (Int32)}
     */
    static ACM_FORMATTAGDETAILSF_FORMATTAG => 1

    /**
     * @type {Integer (Int32)}
     */
    static ACM_FORMATTAGDETAILSF_LARGESTSIZE => 2

    /**
     * @type {Integer (Int32)}
     */
    static ACM_FORMATTAGDETAILSF_QUERYMASK => 15

    /**
     * @type {Integer (UInt32)}
     */
    static ACMFORMATDETAILS_FORMAT_CHARS => 128

    /**
     * @type {Integer (Int32)}
     */
    static ACM_FORMATDETAILSF_INDEX => 0

    /**
     * @type {Integer (Int32)}
     */
    static ACM_FORMATDETAILSF_FORMAT => 1

    /**
     * @type {Integer (Int32)}
     */
    static ACM_FORMATDETAILSF_QUERYMASK => 15

    /**
     * @type {Integer (Int32)}
     */
    static ACM_FORMATENUMF_WFORMATTAG => 65536

    /**
     * @type {Integer (Int32)}
     */
    static ACM_FORMATENUMF_NCHANNELS => 131072

    /**
     * @type {Integer (Int32)}
     */
    static ACM_FORMATENUMF_NSAMPLESPERSEC => 262144

    /**
     * @type {Integer (Int32)}
     */
    static ACM_FORMATENUMF_WBITSPERSAMPLE => 524288

    /**
     * @type {Integer (Int32)}
     */
    static ACM_FORMATENUMF_CONVERT => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static ACM_FORMATENUMF_SUGGEST => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static ACM_FORMATENUMF_HARDWARE => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static ACM_FORMATENUMF_INPUT => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static ACM_FORMATENUMF_OUTPUT => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static ACM_FORMATSUGGESTF_WFORMATTAG => 65536

    /**
     * @type {Integer (Int32)}
     */
    static ACM_FORMATSUGGESTF_NCHANNELS => 131072

    /**
     * @type {Integer (Int32)}
     */
    static ACM_FORMATSUGGESTF_NSAMPLESPERSEC => 262144

    /**
     * @type {Integer (Int32)}
     */
    static ACM_FORMATSUGGESTF_WBITSPERSAMPLE => 524288

    /**
     * @type {Integer (Int32)}
     */
    static ACM_FORMATSUGGESTF_TYPEMASK => 16711680

    /**
     * @type {String}
     */
    static ACMHELPMSGSTRINGA => "acmchoose_help"

    /**
     * @type {String}
     */
    static ACMHELPMSGSTRINGW => "acmchoose_help"

    /**
     * @type {String}
     */
    static ACMHELPMSGCONTEXTMENUA => "acmchoose_contextmenu"

    /**
     * @type {String}
     */
    static ACMHELPMSGCONTEXTMENUW => "acmchoose_contextmenu"

    /**
     * @type {String}
     */
    static ACMHELPMSGCONTEXTHELPA => "acmchoose_contexthelp"

    /**
     * @type {String}
     */
    static ACMHELPMSGCONTEXTHELPW => "acmchoose_contexthelp"

    /**
     * @type {String}
     */
    static ACMHELPMSGSTRING => "acmchoose_help"

    /**
     * @type {String}
     */
    static ACMHELPMSGCONTEXTMENU => "acmchoose_contextmenu"

    /**
     * @type {String}
     */
    static ACMHELPMSGCONTEXTHELP => "acmchoose_contexthelp"

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ACM_FORMATCHOOSE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static FORMATCHOOSE_MESSAGE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FORMATCHOOSE_FORMATTAG_VERIFY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FORMATCHOOSE_FORMAT_VERIFY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FORMATCHOOSE_CUSTOM_VERIFY => 2

    /**
     * @type {Integer (Int32)}
     */
    static ACMFORMATCHOOSE_STYLEF_SHOWHELP => 4

    /**
     * @type {Integer (Int32)}
     */
    static ACMFORMATCHOOSE_STYLEF_ENABLEHOOK => 8

    /**
     * @type {Integer (Int32)}
     */
    static ACMFORMATCHOOSE_STYLEF_ENABLETEMPLATE => 16

    /**
     * @type {Integer (Int32)}
     */
    static ACMFORMATCHOOSE_STYLEF_ENABLETEMPLATEHANDLE => 32

    /**
     * @type {Integer (Int32)}
     */
    static ACMFORMATCHOOSE_STYLEF_INITTOWFXSTRUCT => 64

    /**
     * @type {Integer (Int32)}
     */
    static ACMFORMATCHOOSE_STYLEF_CONTEXTHELP => 128

    /**
     * @type {Integer (UInt32)}
     */
    static ACMFILTERTAGDETAILS_FILTERTAG_CHARS => 48

    /**
     * @type {Integer (Int32)}
     */
    static ACM_FILTERTAGDETAILSF_INDEX => 0

    /**
     * @type {Integer (Int32)}
     */
    static ACM_FILTERTAGDETAILSF_FILTERTAG => 1

    /**
     * @type {Integer (Int32)}
     */
    static ACM_FILTERTAGDETAILSF_LARGESTSIZE => 2

    /**
     * @type {Integer (Int32)}
     */
    static ACM_FILTERTAGDETAILSF_QUERYMASK => 15

    /**
     * @type {Integer (UInt32)}
     */
    static ACMFILTERDETAILS_FILTER_CHARS => 128

    /**
     * @type {Integer (Int32)}
     */
    static ACM_FILTERDETAILSF_INDEX => 0

    /**
     * @type {Integer (Int32)}
     */
    static ACM_FILTERDETAILSF_FILTER => 1

    /**
     * @type {Integer (Int32)}
     */
    static ACM_FILTERDETAILSF_QUERYMASK => 15

    /**
     * @type {Integer (Int32)}
     */
    static ACM_FILTERENUMF_DWFILTERTAG => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ACM_FILTERCHOOSE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static FILTERCHOOSE_MESSAGE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FILTERCHOOSE_FILTERTAG_VERIFY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FILTERCHOOSE_FILTER_VERIFY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILTERCHOOSE_CUSTOM_VERIFY => 2

    /**
     * @type {Integer (Int32)}
     */
    static ACMFILTERCHOOSE_STYLEF_SHOWHELP => 4

    /**
     * @type {Integer (Int32)}
     */
    static ACMFILTERCHOOSE_STYLEF_ENABLEHOOK => 8

    /**
     * @type {Integer (Int32)}
     */
    static ACMFILTERCHOOSE_STYLEF_ENABLETEMPLATE => 16

    /**
     * @type {Integer (Int32)}
     */
    static ACMFILTERCHOOSE_STYLEF_ENABLETEMPLATEHANDLE => 32

    /**
     * @type {Integer (Int32)}
     */
    static ACMFILTERCHOOSE_STYLEF_INITTOFILTERSTRUCT => 64

    /**
     * @type {Integer (Int32)}
     */
    static ACMFILTERCHOOSE_STYLEF_CONTEXTHELP => 128

    /**
     * @type {Integer (Int32)}
     */
    static ACMSTREAMHEADER_STATUSF_DONE => 65536

    /**
     * @type {Integer (Int32)}
     */
    static ACMSTREAMHEADER_STATUSF_PREPARED => 131072

    /**
     * @type {Integer (Int32)}
     */
    static ACMSTREAMHEADER_STATUSF_INQUEUE => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static ACM_STREAMOPENF_QUERY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ACM_STREAMOPENF_ASYNC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ACM_STREAMOPENF_NONREALTIME => 4

    /**
     * @type {Integer (Int32)}
     */
    static ACM_STREAMSIZEF_SOURCE => 0

    /**
     * @type {Integer (Int32)}
     */
    static ACM_STREAMSIZEF_DESTINATION => 1

    /**
     * @type {Integer (Int32)}
     */
    static ACM_STREAMSIZEF_QUERYMASK => 15

    /**
     * @type {Integer (UInt32)}
     */
    static ACM_STREAMCONVERTF_BLOCKALIGN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ACM_STREAMCONVERTF_START => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ACM_STREAMCONVERTF_END => 32

    /**
     * @type {Integer (Int32)}
     */
    static SND_RING => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static SND_ALIAS_START => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ACMDM_DRIVER_NOTIFY => 24577

    /**
     * @type {Integer (UInt32)}
     */
    static ACMDM_DRIVER_DETAILS => 24586

    /**
     * @type {Integer (UInt32)}
     */
    static ACMDM_HARDWARE_WAVE_CAPS_INPUT => 24596

    /**
     * @type {Integer (UInt32)}
     */
    static ACMDM_HARDWARE_WAVE_CAPS_OUTPUT => 24597

    /**
     * @type {Integer (UInt32)}
     */
    static ACMDM_FORMATTAG_DETAILS => 24601

    /**
     * @type {Integer (UInt32)}
     */
    static ACMDM_FORMAT_DETAILS => 24602

    /**
     * @type {Integer (UInt32)}
     */
    static ACMDM_FORMAT_SUGGEST => 24603

    /**
     * @type {Integer (UInt32)}
     */
    static ACMDM_FILTERTAG_DETAILS => 24626

    /**
     * @type {Integer (UInt32)}
     */
    static ACMDM_FILTER_DETAILS => 24627

    /**
     * @type {Integer (UInt32)}
     */
    static ACMDM_STREAM_OPEN => 24652

    /**
     * @type {Integer (UInt32)}
     */
    static ACMDM_STREAM_CLOSE => 24653

    /**
     * @type {Integer (UInt32)}
     */
    static ACMDM_STREAM_SIZE => 24654

    /**
     * @type {Integer (UInt32)}
     */
    static ACMDM_STREAM_CONVERT => 24655

    /**
     * @type {Integer (UInt32)}
     */
    static ACMDM_STREAM_RESET => 24656

    /**
     * @type {Integer (UInt32)}
     */
    static ACMDM_STREAM_PREPARE => 24657

    /**
     * @type {Integer (UInt32)}
     */
    static ACMDM_STREAM_UNPREPARE => 24658

    /**
     * @type {Integer (UInt32)}
     */
    static ACMDM_STREAM_UPDATE => 24659
;@endregion Constants

;@region Methods
    /**
     * Registers with OLE the instance of an IMessageFilter interface, which is to be used for handling concurrency issues on the current thread.
     * @param {Pointer<IMessageFilter>} lpMessageFilter A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imessagefilter">IMessageFilter</a> interface on the message filter. This message filter should be registered on the current thread, replacing the previous message filter (if any). This parameter can be <b>NULL</b>, indicating that no message filter should be registered on the current thread.
     * 
     * Note that this function calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the interface pointer to the message filter.
     * @param {Pointer<IMessageFilter>} lplpMessageFilter Address of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imessagefilter">IMessageFilter</a>* pointer variable that receives the interface pointer to the previously registered message filter. If there was no previously registered message filter for the current thread, the value of *<i>lplpMessageFilter</i> is <b>NULL</b>.
     * @returns {HRESULT} If the instance was registered or revoked successfully, the return value is S_OK; otherwise, it is S_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-coregistermessagefilter
     * @since windows5.0
     */
    static CoRegisterMessageFilter(lpMessageFilter, lplpMessageFilter) {
        result := DllCall("OLE32.dll\CoRegisterMessageFilter", "ptr", lpMessageFilter, "ptr", lplpMessageFilter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} pszSound 
     * @param {Integer} fuSound 
     * @returns {BOOL} 
     */
    static sndPlaySoundA(pszSound, fuSound) {
        pszSound := pszSound is String ? StrPtr(pszSound) : pszSound

        result := DllCall("WINMM.dll\sndPlaySoundA", "ptr", pszSound, "uint", fuSound, "ptr")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszSound 
     * @param {Integer} fuSound 
     * @returns {BOOL} 
     */
    static sndPlaySoundW(pszSound, fuSound) {
        pszSound := pszSound is String ? StrPtr(pszSound) : pszSound

        result := DllCall("WINMM.dll\sndPlaySoundW", "ptr", pszSound, "uint", fuSound, "ptr")
        return result
    }

    /**
     * 
     * @param {PSTR} pszSound 
     * @param {HMODULE} hmod 
     * @param {Integer} fdwSound 
     * @returns {BOOL} 
     */
    static PlaySoundA(pszSound, hmod, fdwSound) {
        pszSound := pszSound is String ? StrPtr(pszSound) : pszSound
        hmod := hmod is Win32Handle ? NumGet(hmod, "ptr") : hmod

        result := DllCall("WINMM.dll\PlaySoundA", "ptr", pszSound, "ptr", hmod, "uint", fdwSound, "ptr")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszSound 
     * @param {HMODULE} hmod 
     * @param {Integer} fdwSound 
     * @returns {BOOL} 
     */
    static PlaySoundW(pszSound, hmod, fdwSound) {
        pszSound := pszSound is String ? StrPtr(pszSound) : pszSound
        hmod := hmod is Win32Handle ? NumGet(hmod, "ptr") : hmod

        result := DllCall("WINMM.dll\PlaySoundW", "ptr", pszSound, "ptr", hmod, "uint", fdwSound, "ptr")
        return result
    }

    /**
     * The waveOutGetNumDevs function retrieves the number of waveform-audio output devices present in the system.
     * @returns {Integer} Returns the number of devices. A return value of zero means that no devices are present or that an error occurred.
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-waveoutgetnumdevs
     * @since windows5.0
     */
    static waveOutGetNumDevs() {
        result := DllCall("WINMM.dll\waveOutGetNumDevs", "uint")
        return result
    }

    /**
     * 
     * @param {Pointer} uDeviceID 
     * @param {Pointer<WAVEOUTCAPSA>} pwoc 
     * @param {Integer} cbwoc 
     * @returns {Integer} 
     */
    static waveOutGetDevCapsA(uDeviceID, pwoc, cbwoc) {
        result := DllCall("WINMM.dll\waveOutGetDevCapsA", "ptr", uDeviceID, "ptr", pwoc, "uint", cbwoc, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer} uDeviceID 
     * @param {Pointer<WAVEOUTCAPSW>} pwoc 
     * @param {Integer} cbwoc 
     * @returns {Integer} 
     */
    static waveOutGetDevCapsW(uDeviceID, pwoc, cbwoc) {
        result := DllCall("WINMM.dll\waveOutGetDevCapsW", "ptr", uDeviceID, "ptr", pwoc, "uint", cbwoc, "uint")
        return result
    }

    /**
     * The waveOutGetVolume function retrieves the current volume level of the specified waveform-audio output device.
     * @param {HWAVEOUT} hwo Handle to an open waveform-audio output device. This parameter can also be a device identifier.
     * @param {Pointer<UInt32>} pdwVolume Pointer to a variable to be filled with the current volume setting. The low-order word of this location contains the left-channel volume setting, and the high-order word contains the right-channel setting. A value of 0xFFFF represents full volume, and a value of 0x0000 is silence.
     * 
     * If a device does not support both left and right volume control, the low-order word of the specified location contains the mono volume level.
     * 
     * The full 16-bit setting(s) set with the <a href="https://docs.microsoft.com/previous-versions/dd743874(v=vs.85)">waveOutSetVolume</a> function is returned, regardless of whether the device supports the full 16 bits of volume-level control.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No device driver is present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Function isn't supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-waveoutgetvolume
     * @since windows5.0
     */
    static waveOutGetVolume(hwo, pdwVolume) {
        hwo := hwo is Win32Handle ? NumGet(hwo, "ptr") : hwo

        result := DllCall("WINMM.dll\waveOutGetVolume", "ptr", hwo, "uint*", pdwVolume, "uint")
        return result
    }

    /**
     * The waveOutSetVolume function sets the volume level of the specified waveform-audio output device.
     * @param {HWAVEOUT} hwo Handle to an open waveform-audio output device. This parameter can also be a device identifier.
     * @param {Integer} dwVolume New volume setting. The low-order word contains the left-channel volume setting, and the high-order word contains the right-channel setting. A value of 0xFFFF represents full volume, and a value of 0x0000 is silence.
     * 
     * If a device does not support both left and right volume control, the low-order word of <i>dwVolume</i> specifies the volume level, and the high-order word is ignored.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No device driver is present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Function is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-waveoutsetvolume
     * @since windows5.0
     */
    static waveOutSetVolume(hwo, dwVolume) {
        hwo := hwo is Win32Handle ? NumGet(hwo, "ptr") : hwo

        result := DllCall("WINMM.dll\waveOutSetVolume", "ptr", hwo, "uint", dwVolume, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} mmrError 
     * @param {PSTR} pszText 
     * @param {Integer} cchText 
     * @returns {Integer} 
     */
    static waveOutGetErrorTextA(mmrError, pszText, cchText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := DllCall("WINMM.dll\waveOutGetErrorTextA", "uint", mmrError, "ptr", pszText, "uint", cchText, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} mmrError 
     * @param {PWSTR} pszText 
     * @param {Integer} cchText 
     * @returns {Integer} 
     */
    static waveOutGetErrorTextW(mmrError, pszText, cchText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := DllCall("WINMM.dll\waveOutGetErrorTextW", "uint", mmrError, "ptr", pszText, "uint", cchText, "uint")
        return result
    }

    /**
     * The waveOutOpen function opens the given waveform-audio output device for playback.
     * @param {Pointer<HWAVEOUT>} phwo Pointer to a buffer that receives a handle identifying the open waveform-audio output device. Use the handle to identify the device when calling other waveform-audio output functions. This parameter might be <b>NULL</b> if the <b>WAVE_FORMAT_QUERY</b> flag is specified for <i>fdwOpen</i>.
     * @param {Integer} uDeviceID Identifier of the waveform-audio output device to open. It can be either a device identifier or a handle of an open waveform-audio input device. You can also use the following flag instead of a device identifier:
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td><b>WAVE_MAPPER</b></td>
     * <td>The function selects a waveform-audio output device capable of playing the given format.</td>
     * </tr>
     * </table>
     * @param {Pointer<WAVEFORMATEX>} pwfx Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure that identifies the format of the waveform-audio data to be sent to the device. You can free this structure immediately after passing it to <b>waveOutOpen</b>.
     * @param {Pointer} dwCallback Specifies the callback mechanism. The value must be one of the following:
     * 
     * <ul>
     * <li>A pointer to a callback function. For the function signature, see <a href="https://docs.microsoft.com/previous-versions/dd743869(v=vs.85)">waveOutProc</a>.</li>
     * <li>A handle to a window.</li>
     * <li>A thread identifier.</li>
     * <li>A handle to an event.</li>
     * <li>The value <b>NULL</b>.</li>
     * </ul>
     * The <i>fdwOpen</i> parameter specifies how the <i>dwCallback</i> parameter is interpreted. For more information, see Remarks.
     * @param {Pointer} dwInstance User-instance data passed to the callback mechanism. This parameter is not used with the window callback mechanism.
     * @param {Integer} fdwOpen Flags for opening the device. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td><b>CALLBACK_EVENT</b></td>
     * <td>The <i>dwCallback</i> parameter is an event handle.</td>
     * </tr>
     * <tr>
     * <td><b>CALLBACK_FUNCTION</b></td>
     * <td>The <i>dwCallback</i> parameter is a callback procedure address.</td>
     * </tr>
     * <tr>
     * <td><b>CALLBACK_NULL</b></td>
     * <td>No callback mechanism. This is the default setting.</td>
     * </tr>
     * <tr>
     * <td><b>CALLBACK_THREAD</b></td>
     * <td>The <i>dwCallback</i> parameter is a thread identifier.</td>
     * </tr>
     * <tr>
     * <td><b>CALLBACK_WINDOW</b></td>
     * <td>The <i>dwCallback</i> parameter is a window handle.</td>
     * </tr>
     * <tr>
     * <td><b>WAVE_ALLOWSYNC</b></td>
     * <td>If this flag is specified, a synchronous waveform-audio device can be opened. If this flag is not specified while opening a synchronous driver, the device will fail to open.</td>
     * </tr>
     * <tr>
     * <td><b>WAVE_MAPPED_DEFAULT_COMMUNICATION_DEVICE</b></td>
     * <td>
     * If this flag is specified and the  <i>uDeviceID</i> parameter is <b>WAVE_MAPPER</b>, the function opens the default communication device. 
     * 
     * This flag applies only when <i>uDeviceID</i> equals <b>WAVE_MAPPER</b>.
     * 
     * <div class="alert"><b>Note</b>  Requires Windows 7</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td><b>WAVE_FORMAT_DIRECT</b></td>
     * <td>If this flag is specified, the ACM driver does not perform conversions on the audio data.</td>
     * </tr>
     * <tr>
     * <td><b>WAVE_FORMAT_QUERY</b></td>
     * <td>If this flag is specified, <b>waveOutOpen</b> queries the device to determine if it supports the given format, but the device is not actually opened.</td>
     * </tr>
     * <tr>
     * <td><b>WAVE_MAPPED</b></td>
     * <td>If this flag is specified, the <i>uDeviceID</i> parameter specifies a waveform-audio device to be mapped to by the wave mapper.</td>
     * </tr>
     * </table>
     * @returns {Integer} Returns <b>MMSYSERR_NOERROR</b> if successful or an error otherwise. Possible error values include the following.
     *           
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_ALLOCATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified resource is already allocated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_BADDEVICEID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified device identifier is out of range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No device driver is present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAVERR_BADFORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Attempted to open with an unsupported waveform-audio format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAVERR_SYNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device is synchronous but <a href="/previous-versions/dd743866(v=vs.85)">waveOutOpen</a> was called without using the <b>WAVE_ALLOWSYNC</b> flag.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-waveoutopen
     * @since windows5.0
     */
    static waveOutOpen(phwo, uDeviceID, pwfx, dwCallback, dwInstance, fdwOpen) {
        result := DllCall("WINMM.dll\waveOutOpen", "ptr", phwo, "uint", uDeviceID, "ptr", pwfx, "ptr", dwCallback, "ptr", dwInstance, "uint", fdwOpen, "uint")
        return result
    }

    /**
     * The waveOutClose function closes the given waveform-audio output device.
     * @param {HWAVEOUT} hwo Handle to the waveform-audio output device. If the function succeeds, the handle is no longer valid after this call.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No device driver is present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAVERR_STILLPLAYING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are still buffers in the queue.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-waveoutclose
     * @since windows5.0
     */
    static waveOutClose(hwo) {
        hwo := hwo is Win32Handle ? NumGet(hwo, "ptr") : hwo

        result := DllCall("WINMM.dll\waveOutClose", "ptr", hwo, "uint")
        return result
    }

    /**
     * The waveOutPrepareHeader function prepares a waveform-audio data block for playback.
     * @param {HWAVEOUT} hwo Handle to the waveform-audio output device.
     * @param {Pointer} pwh Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd743837(v=vs.85)">WAVEHDR</a> structure that identifies the data block to be prepared.
     * @param {Integer} cbwh Size, in bytes, of the <a href="https://docs.microsoft.com/previous-versions/dd743837(v=vs.85)">WAVEHDR</a> structure.
     * @returns {Integer} Returns <b>MMSYSERR_NOERROR</b> if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No device driver is present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-waveoutprepareheader
     * @since windows5.0
     */
    static waveOutPrepareHeader(hwo, pwh, cbwh) {
        hwo := hwo is Win32Handle ? NumGet(hwo, "ptr") : hwo

        result := DllCall("WINMM.dll\waveOutPrepareHeader", "ptr", hwo, "ptr", pwh, "uint", cbwh, "uint")
        return result
    }

    /**
     * The waveOutUnprepareHeader function cleans up the preparation performed by the waveOutPrepareHeader function. This function must be called after the device driver is finished with a data block. You must call this function before freeing the buffer.
     * @param {HWAVEOUT} hwo Handle to the waveform-audio output device.
     * @param {Pointer} pwh Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd743837(v=vs.85)">WAVEHDR</a> structure identifying the data block to be cleaned up.
     * @param {Integer} cbwh Size, in bytes, of the <b>WAVEHDR</b> structure.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No device driver is present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAVERR_STILLPLAYING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data block pointed to by the <i>pwh</i> parameter is still in the queue.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-waveoutunprepareheader
     * @since windows5.0
     */
    static waveOutUnprepareHeader(hwo, pwh, cbwh) {
        hwo := hwo is Win32Handle ? NumGet(hwo, "ptr") : hwo

        result := DllCall("WINMM.dll\waveOutUnprepareHeader", "ptr", hwo, "ptr", pwh, "uint", cbwh, "uint")
        return result
    }

    /**
     * The waveOutWrite function sends a data block to the given waveform-audio output device.
     * @param {HWAVEOUT} hwo Handle to the waveform-audio output device.
     * @param {Pointer} pwh Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd743837(v=vs.85)">WAVEHDR</a> structure containing information about the data block.
     * @param {Integer} cbwh Size, in bytes, of the <b>WAVEHDR</b> structure.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No device driver is present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAVERR_UNPREPARED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data block pointed to by the <i>pwh</i> parameter hasn't been prepared.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-waveoutwrite
     * @since windows5.0
     */
    static waveOutWrite(hwo, pwh, cbwh) {
        hwo := hwo is Win32Handle ? NumGet(hwo, "ptr") : hwo

        result := DllCall("WINMM.dll\waveOutWrite", "ptr", hwo, "ptr", pwh, "uint", cbwh, "uint")
        return result
    }

    /**
     * The waveOutPause function pauses playback on the given waveform-audio output device. The current position is saved. Use the waveOutRestart function to resume playback from the current position.
     * @param {HWAVEOUT} hwo Handle to the waveform-audio output device.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No device driver is present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified device is synchronous and does not support pausing.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-waveoutpause
     * @since windows5.0
     */
    static waveOutPause(hwo) {
        hwo := hwo is Win32Handle ? NumGet(hwo, "ptr") : hwo

        result := DllCall("WINMM.dll\waveOutPause", "ptr", hwo, "uint")
        return result
    }

    /**
     * The waveOutRestart function resumes playback on a paused waveform-audio output device.
     * @param {HWAVEOUT} hwo Handle to the waveform-audio output device.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No device driver is present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified device is synchronous and does not support pausing.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-waveoutrestart
     * @since windows5.0
     */
    static waveOutRestart(hwo) {
        hwo := hwo is Win32Handle ? NumGet(hwo, "ptr") : hwo

        result := DllCall("WINMM.dll\waveOutRestart", "ptr", hwo, "uint")
        return result
    }

    /**
     * The waveOutReset function stops playback on the given waveform-audio output device and resets the current position to zero. All pending playback buffers are marked as done (WHDR_DONE) and returned to the application.
     * @param {HWAVEOUT} hwo Handle to the waveform-audio output device.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No device driver is present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified device is synchronous and does not support pausing.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-waveoutreset
     * @since windows5.0
     */
    static waveOutReset(hwo) {
        hwo := hwo is Win32Handle ? NumGet(hwo, "ptr") : hwo

        result := DllCall("WINMM.dll\waveOutReset", "ptr", hwo, "uint")
        return result
    }

    /**
     * The waveOutBreakLoop function breaks a loop on the given waveform-audio output device and allows playback to continue with the next block in the driver list.
     * @param {HWAVEOUT} hwo Handle to the waveform-audio output device.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No device driver is present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-waveoutbreakloop
     * @since windows5.0
     */
    static waveOutBreakLoop(hwo) {
        hwo := hwo is Win32Handle ? NumGet(hwo, "ptr") : hwo

        result := DllCall("WINMM.dll\waveOutBreakLoop", "ptr", hwo, "uint")
        return result
    }

    /**
     * The waveOutGetPosition function retrieves the current playback position of the given waveform-audio output device.
     * @param {HWAVEOUT} hwo Handle to the waveform-audio output device.
     * @param {Pointer} pmmt Pointer to an <a href="https://docs.microsoft.com/previous-versions/dd757347(v=vs.85)">MMTIME</a> structure.
     * @param {Integer} cbmmt Size, in bytes, of the <b>MMTIME</b> structure.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No device driver is present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-waveoutgetposition
     * @since windows5.0
     */
    static waveOutGetPosition(hwo, pmmt, cbmmt) {
        hwo := hwo is Win32Handle ? NumGet(hwo, "ptr") : hwo

        result := DllCall("WINMM.dll\waveOutGetPosition", "ptr", hwo, "ptr", pmmt, "uint", cbmmt, "uint")
        return result
    }

    /**
     * The waveOutGetPitch function retrieves the current pitch setting for the specified waveform-audio output device.
     * @param {HWAVEOUT} hwo Handle to the waveform-audio output device.
     * @param {Pointer<UInt32>} pdwPitch Pointer to a variable to be filled with the current pitch multiplier setting. The pitch multiplier indicates the current change in pitch from the original authored setting. The pitch multiplier must be a positive value.
     * 
     * The pitch multiplier is specified as a fixed-point value. The high-order word of the variable contains the signed integer part of the number, and the low-order word contains the fractional part. A value of 0x8000 in the low-order word represents one-half, and 0x4000 represents one-quarter. For example, the value 0x00010000 specifies a multiplier of 1.0 (no pitch change), and a value of 0x000F8000 specifies a multiplier of 15.5.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No device driver is present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Function isn't supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-waveoutgetpitch
     * @since windows5.0
     */
    static waveOutGetPitch(hwo, pdwPitch) {
        hwo := hwo is Win32Handle ? NumGet(hwo, "ptr") : hwo

        result := DllCall("WINMM.dll\waveOutGetPitch", "ptr", hwo, "uint*", pdwPitch, "uint")
        return result
    }

    /**
     * The waveOutSetPitch function sets the pitch for the specified waveform-audio output device.
     * @param {HWAVEOUT} hwo Handle to the waveform-audio output device.
     * @param {Integer} dwPitch New pitch multiplier setting. This setting indicates the current change in pitch from the original authored setting. The pitch multiplier must be a positive value.
     * 
     * The pitch multiplier is specified as a fixed-point value. The high-order word contains the signed integer part of the number, and the low-order word contains the fractional part. A value of 0x8000 in the low-order word represents one-half, and 0x4000 represents one-quarter. For example, the value 0x00010000 specifies a multiplier of 1.0 (no pitch change), and a value of 0x000F8000 specifies a multiplier of 15.5.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No device driver is present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Function isn't supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-waveoutsetpitch
     * @since windows5.0
     */
    static waveOutSetPitch(hwo, dwPitch) {
        hwo := hwo is Win32Handle ? NumGet(hwo, "ptr") : hwo

        result := DllCall("WINMM.dll\waveOutSetPitch", "ptr", hwo, "uint", dwPitch, "uint")
        return result
    }

    /**
     * The waveOutGetPlaybackRate function retrieves the current playback rate for the specified waveform-audio output device.
     * @param {HWAVEOUT} hwo Handle to the waveform-audio output device.
     * @param {Pointer<UInt32>} pdwRate Pointer to a variable to be filled with the current playback rate. The playback rate setting is a multiplier indicating the current change in playback rate from the original authored setting. The playback rate multiplier must be a positive value.
     * 
     * The rate is specified as a fixed-point value. The high-order word of the variable contains the signed integer part of the number, and the low-order word contains the fractional part. A value of 0x8000 in the low-order word represents one-half, and 0x4000 represents one-quarter. For example, the value 0x00010000 specifies a multiplier of 1.0 (no playback rate change), and a value of 0x000F8000 specifies a multiplier of 15.5.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No device driver is present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Function isn't supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-waveoutgetplaybackrate
     * @since windows5.0
     */
    static waveOutGetPlaybackRate(hwo, pdwRate) {
        hwo := hwo is Win32Handle ? NumGet(hwo, "ptr") : hwo

        result := DllCall("WINMM.dll\waveOutGetPlaybackRate", "ptr", hwo, "uint*", pdwRate, "uint")
        return result
    }

    /**
     * The waveOutSetPlaybackRate function sets the playback rate for the specified waveform-audio output device.
     * @param {HWAVEOUT} hwo Handle to the waveform-audio output device.
     * @param {Integer} dwRate New playback rate setting. This setting is a multiplier indicating the current change in playback rate from the original authored setting. The playback rate multiplier must be a positive value.
     * 
     * The rate is specified as a fixed-point value. The high-order word contains the signed integer part of the number, and the low-order word contains the fractional part. A value of 0x8000 in the low-order word represents one-half, and 0x4000 represents one-quarter. For example, the value 0x00010000 specifies a multiplier of 1.0 (no playback rate change), and a value of 0x000F8000 specifies a multiplier of 15.5.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No device driver is present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Function isn't supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-waveoutsetplaybackrate
     * @since windows5.0
     */
    static waveOutSetPlaybackRate(hwo, dwRate) {
        hwo := hwo is Win32Handle ? NumGet(hwo, "ptr") : hwo

        result := DllCall("WINMM.dll\waveOutSetPlaybackRate", "ptr", hwo, "uint", dwRate, "uint")
        return result
    }

    /**
     * The waveOutGetID function retrieves the device identifier for the given waveform-audio output device.
     * @param {HWAVEOUT} hwo Handle to the waveform-audio output device.
     * @param {Pointer<UInt32>} puDeviceID Pointer to a variable to be filled with the device identifier.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hwo</i> parameter specifies an invalid handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No device driver is present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-waveoutgetid
     * @since windows5.0
     */
    static waveOutGetID(hwo, puDeviceID) {
        hwo := hwo is Win32Handle ? NumGet(hwo, "ptr") : hwo

        result := DllCall("WINMM.dll\waveOutGetID", "ptr", hwo, "uint*", puDeviceID, "uint")
        return result
    }

    /**
     * The waveOutMessage function sends messages to the waveform-audio output device drivers.
     * @param {HWAVEOUT} hwo Identifier of the waveform device that receives the message. You must cast the device ID to the <b>HWAVEOUT</b> handle type. If you supply a handle instead of a device ID, the function fails and returns the MMSYSERR_NOSUPPORT error code.
     * @param {Integer} uMsg Message to send.
     * @param {Pointer} dw1 Message parameter.
     * @param {Pointer} dw2 Message parameter.
     * @returns {Integer} Returns the value returned from the driver.
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-waveoutmessage
     * @since windows5.0
     */
    static waveOutMessage(hwo, uMsg, dw1, dw2) {
        hwo := hwo is Win32Handle ? NumGet(hwo, "ptr") : hwo

        result := DllCall("WINMM.dll\waveOutMessage", "ptr", hwo, "uint", uMsg, "ptr", dw1, "ptr", dw2, "uint")
        return result
    }

    /**
     * The waveInGetNumDevs function returns the number of waveform-audio input devices present in the system.
     * @returns {Integer} Returns the number of devices. A return value of zero means that no devices are present or that an error occurred.
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-waveingetnumdevs
     * @since windows5.0
     */
    static waveInGetNumDevs() {
        result := DllCall("WINMM.dll\waveInGetNumDevs", "uint")
        return result
    }

    /**
     * 
     * @param {Pointer} uDeviceID 
     * @param {Pointer} pwic 
     * @param {Integer} cbwic 
     * @returns {Integer} 
     */
    static waveInGetDevCapsA(uDeviceID, pwic, cbwic) {
        result := DllCall("WINMM.dll\waveInGetDevCapsA", "ptr", uDeviceID, "ptr", pwic, "uint", cbwic, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer} uDeviceID 
     * @param {Pointer} pwic 
     * @param {Integer} cbwic 
     * @returns {Integer} 
     */
    static waveInGetDevCapsW(uDeviceID, pwic, cbwic) {
        result := DllCall("WINMM.dll\waveInGetDevCapsW", "ptr", uDeviceID, "ptr", pwic, "uint", cbwic, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} mmrError 
     * @param {PSTR} pszText 
     * @param {Integer} cchText 
     * @returns {Integer} 
     */
    static waveInGetErrorTextA(mmrError, pszText, cchText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := DllCall("WINMM.dll\waveInGetErrorTextA", "uint", mmrError, "ptr", pszText, "uint", cchText, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} mmrError 
     * @param {PWSTR} pszText 
     * @param {Integer} cchText 
     * @returns {Integer} 
     */
    static waveInGetErrorTextW(mmrError, pszText, cchText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := DllCall("WINMM.dll\waveInGetErrorTextW", "uint", mmrError, "ptr", pszText, "uint", cchText, "uint")
        return result
    }

    /**
     * The waveInOpen function opens the given waveform-audio input device for recording.
     * @param {Pointer<HWAVEIN>} phwi Pointer to a buffer that receives a handle identifying the open waveform-audio input device. Use this handle to identify the device when calling other waveform-audio input functions. This parameter can be <b>NULL</b> if <b>WAVE_FORMAT_QUERY</b> is specified for <i>fdwOpen</i>.
     * @param {Integer} uDeviceID Identifier of the waveform-audio input device to open. It can be either a device identifier or a handle of an open waveform-audio input device. You can use the following flag instead of a device identifier.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>WAVE_MAPPER</td>
     * <td>The function selects a waveform-audio input device capable of recording in the specified format.</td>
     * </tr>
     * </table>
     * @param {Pointer<WAVEFORMATEX>} pwfx Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure that identifies the desired format for recording waveform-audio data. You can free this structure immediately after <b>waveInOpen</b> returns.
     * @param {Pointer} dwCallback Pointer to a fixed callback function, an event handle, a handle to a window, or the identifier of a thread to be called during waveform-audio recording to process messages related to the progress of recording. If no callback function is required, this value can be zero. For more information on the callback function, see <a href="https://docs.microsoft.com/previous-versions/dd743849(v=vs.85)">waveInProc</a>.
     * @param {Pointer} dwInstance User-instance data passed to the callback mechanism. This parameter is not used with the window callback mechanism.
     * @param {Integer} fdwOpen Flags for opening the device. The following values are defined.
     *             
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td><b>CALLBACK_EVENT</b></td>
     * <td>The <i>dwCallback</i> parameter is an event handle.</td>
     * </tr>
     * <tr>
     * <td><b>CALLBACK_FUNCTION</b></td>
     * <td>The <i>dwCallback</i> parameter is a callback procedure address.</td>
     * </tr>
     * <tr>
     * <td><b>CALLBACK_NULL</b></td>
     * <td>No callback mechanism. This is the default setting.</td>
     * </tr>
     * <tr>
     * <td><b>CALLBACK_THREAD</b></td>
     * <td>The <i>dwCallback</i> parameter is a thread identifier.</td>
     * </tr>
     * <tr>
     * <td><b>CALLBACK_WINDOW</b></td>
     * <td>The <i>dwCallback</i> parameter is a window handle.</td>
     * </tr>
     * <tr>
     * <td><b>WAVE_MAPPED_DEFAULT_COMMUNICATION_DEVICE</b></td>
     * <td>
     * If this flag is specified and the  <i>uDeviceID</i> parameter is <b>WAVE_MAPPER</b>, the function opens the default communication device. 
     * 
     * This flag applies only when <i>uDeviceID</i> equals <b>WAVE_MAPPER</b>.
     * 
     * <div class="alert"><b>Note</b>  Requires Windows 7</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td><b>WAVE_FORMAT_DIRECT</b></td>
     * <td>If this flag is specified, the ACM driver does not perform conversions on the audio data.</td>
     * </tr>
     * <tr>
     * <td><b>WAVE_FORMAT_QUERY</b></td>
     * <td>The function queries the device to determine whether it supports the given format, but it does not open the device.</td>
     * </tr>
     * <tr>
     * <td><b>WAVE_MAPPED</b></td>
     * <td>The <i>uDeviceID</i> parameter specifies a waveform-audio device to be mapped to by the wave mapper.</td>
     * </tr>
     * </table>
     * @returns {Integer} Returns <b>MMSYSERR_NOERROR</b> if successful or an error otherwise. Possible error values include the following.
     *           
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_ALLOCATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified resource is already allocated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_BADDEVICEID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified device identifier is out of range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No device driver is present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAVERR_BADFORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Attempted to open with an unsupported waveform-audio format.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-waveinopen
     * @since windows5.0
     */
    static waveInOpen(phwi, uDeviceID, pwfx, dwCallback, dwInstance, fdwOpen) {
        result := DllCall("WINMM.dll\waveInOpen", "ptr", phwi, "uint", uDeviceID, "ptr", pwfx, "ptr", dwCallback, "ptr", dwInstance, "uint", fdwOpen, "uint")
        return result
    }

    /**
     * The waveInClose function closes the given waveform-audio input device.
     * @param {HWAVEIN} hwi Handle to the waveform-audio input device. If the function succeeds, the handle is no longer valid after this call.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No device driver is present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAVERR_STILLPLAYING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are still buffers in the queue.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-waveinclose
     * @since windows5.0
     */
    static waveInClose(hwi) {
        hwi := hwi is Win32Handle ? NumGet(hwi, "ptr") : hwi

        result := DllCall("WINMM.dll\waveInClose", "ptr", hwi, "uint")
        return result
    }

    /**
     * The waveInPrepareHeader function prepares a buffer for waveform-audio input.
     * @param {HWAVEIN} hwi Handle to the waveform-audio input device.
     * @param {Pointer} pwh Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd743837(v=vs.85)">WAVEHDR</a> structure that identifies the buffer to be prepared.
     * @param {Integer} cbwh Size, in bytes, of the <b>WAVEHDR</b> structure.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No device driver is present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-waveinprepareheader
     * @since windows5.0
     */
    static waveInPrepareHeader(hwi, pwh, cbwh) {
        hwi := hwi is Win32Handle ? NumGet(hwi, "ptr") : hwi

        result := DllCall("WINMM.dll\waveInPrepareHeader", "ptr", hwi, "ptr", pwh, "uint", cbwh, "uint")
        return result
    }

    /**
     * The waveInUnprepareHeader function cleans up the preparation performed by the waveInPrepareHeader function.
     * @param {HWAVEIN} hwi Handle to the waveform-audio input device.
     * @param {Pointer} pwh Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd743837(v=vs.85)">WAVEHDR</a> structure identifying the buffer to be cleaned up.
     * @param {Integer} cbwh Size, in bytes, of the <b>WAVEHDR</b> structure.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No device driver is present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAVERR_STILLPLAYING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by the <i>pwh</i> parameter is still in the queue.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-waveinunprepareheader
     * @since windows5.0
     */
    static waveInUnprepareHeader(hwi, pwh, cbwh) {
        hwi := hwi is Win32Handle ? NumGet(hwi, "ptr") : hwi

        result := DllCall("WINMM.dll\waveInUnprepareHeader", "ptr", hwi, "ptr", pwh, "uint", cbwh, "uint")
        return result
    }

    /**
     * The waveInAddBuffer function sends an input buffer to the given waveform-audio input device. When the buffer is filled, the application is notified.
     * @param {HWAVEIN} hwi Handle to the waveform-audio input device.
     * @param {Pointer} pwh Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd743837(v=vs.85)">WAVEHDR</a> structure that identifies the buffer.
     * @param {Integer} cbwh Size, in bytes, of the <b>WAVEHDR</b> structure.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No device driver is present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAVERR_UNPREPARED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by the <i>pwh</i> parameter hasn't been prepared.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-waveinaddbuffer
     * @since windows5.0
     */
    static waveInAddBuffer(hwi, pwh, cbwh) {
        hwi := hwi is Win32Handle ? NumGet(hwi, "ptr") : hwi

        result := DllCall("WINMM.dll\waveInAddBuffer", "ptr", hwi, "ptr", pwh, "uint", cbwh, "uint")
        return result
    }

    /**
     * The waveInStart function starts input on the given waveform-audio input device.
     * @param {HWAVEIN} hwi Handle to the waveform-audio input device.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No device driver is present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-waveinstart
     * @since windows5.0
     */
    static waveInStart(hwi) {
        hwi := hwi is Win32Handle ? NumGet(hwi, "ptr") : hwi

        result := DllCall("WINMM.dll\waveInStart", "ptr", hwi, "uint")
        return result
    }

    /**
     * The waveInStop function stops waveform-audio input.
     * @param {HWAVEIN} hwi Handle to the waveform-audio input device.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No device driver is present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-waveinstop
     * @since windows5.0
     */
    static waveInStop(hwi) {
        hwi := hwi is Win32Handle ? NumGet(hwi, "ptr") : hwi

        result := DllCall("WINMM.dll\waveInStop", "ptr", hwi, "uint")
        return result
    }

    /**
     * The waveInReset function stops input on the given waveform-audio input device and resets the current position to zero. All pending buffers are marked as done and returned to the application.
     * @param {HWAVEIN} hwi Handle to the waveform-audio input device.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No device driver is present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-waveinreset
     * @since windows5.0
     */
    static waveInReset(hwi) {
        hwi := hwi is Win32Handle ? NumGet(hwi, "ptr") : hwi

        result := DllCall("WINMM.dll\waveInReset", "ptr", hwi, "uint")
        return result
    }

    /**
     * waveInGetPosition is no longer supported for use as of Windows Vista.
     * @param {HWAVEIN} hwi Handle to the waveform-audio input device.
     * @param {Pointer} pmmt Pointer to an <a href="https://docs.microsoft.com/previous-versions/dd757347(v=vs.85)">MMTIME</a> structure.
     * @param {Integer} cbmmt Size, in bytes, of the <a href="https://docs.microsoft.com/previous-versions/dd757347(v=vs.85)">MMTIME</a> structure.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     *           
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No device driver is present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-waveingetposition
     * @since windows5.0
     */
    static waveInGetPosition(hwi, pmmt, cbmmt) {
        hwi := hwi is Win32Handle ? NumGet(hwi, "ptr") : hwi

        result := DllCall("WINMM.dll\waveInGetPosition", "ptr", hwi, "ptr", pmmt, "uint", cbmmt, "uint")
        return result
    }

    /**
     * The waveInGetID function gets the device identifier for the given waveform-audio input device.
     * @param {HWAVEIN} hwi Handle to the waveform-audio input device.
     * @param {Pointer<UInt32>} puDeviceID Pointer to a variable to be filled with the device identifier.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hwi</i> parameter specifies an invalid handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No device driver is present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-waveingetid
     * @since windows5.0
     */
    static waveInGetID(hwi, puDeviceID) {
        hwi := hwi is Win32Handle ? NumGet(hwi, "ptr") : hwi

        result := DllCall("WINMM.dll\waveInGetID", "ptr", hwi, "uint*", puDeviceID, "uint")
        return result
    }

    /**
     * The waveInMessage function sends messages to the waveform-audio input device drivers.
     * @param {HWAVEIN} hwi Identifier of the waveform device that receives the message. You must cast the device ID to the <b>HWAVEIN</b> handle type. If you supply a handle instead of a device ID, the function fails and returns the MMSYSERR_NOSUPPORT error code.
     * @param {Integer} uMsg Message to send.
     * @param {Pointer} dw1 Message parameter.
     * @param {Pointer} dw2 Message parameter.
     * @returns {Integer} Returns the value returned from the driver.
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-waveinmessage
     * @since windows5.0
     */
    static waveInMessage(hwi, uMsg, dw1, dw2) {
        hwi := hwi is Win32Handle ? NumGet(hwi, "ptr") : hwi

        result := DllCall("WINMM.dll\waveInMessage", "ptr", hwi, "uint", uMsg, "ptr", dw1, "ptr", dw2, "uint")
        return result
    }

    /**
     * The midiOutGetNumDevs function retrieves the number of MIDI output devices present in the system.
     * @returns {Integer} Returns the number of MIDI output devices. A return value of zero means that there are no devices (not that there is no error).
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midioutgetnumdevs
     * @since windows5.0
     */
    static midiOutGetNumDevs() {
        result := DllCall("WINMM.dll\midiOutGetNumDevs", "uint")
        return result
    }

    /**
     * The midiStreamOpen function opens a MIDI stream for output. By default, the device is opened in paused mode. The stream handle retrieved by this function must be used in all subsequent references to the stream.
     * @param {Pointer<HMIDISTRM>} phms Pointer to a variable to contain the stream handle when the function returns.
     * @param {Pointer<UInt32>} puDeviceID Pointer to a device identifier. The device is opened on behalf of the stream and closed again when the stream is closed.
     * @param {Integer} cMidi Reserved; must be 1.
     * @param {Pointer} dwCallback Pointer to a callback function, an event handle, a thread identifier, or a handle of a window or thread called during MIDI playback to process messages related to the progress of the playback. If no callback mechanism is desired, specify <b>NULL</b> for this parameter.
     * @param {Pointer} dwInstance Application-specific instance data that is returned to the application with every callback function.
     * @param {Integer} fdwOpen Callback flag for opening the device. One of the following callback flags must be specified.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>CALLBACK_EVENT</td>
     * <td>The <i>dwCallback</i> parameter is an event handle. This callback mechanism is for output only.</td>
     * </tr>
     * <tr>
     * <td>CALLBACK_FUNCTION</td>
     * <td>The <i>dwCallback</i> parameter is a callback procedure address. For the callback signature, see <a href="https://docs.microsoft.com/previous-versions/dd798478(v=vs.85)">MidiOutProc</a>.</td>
     * </tr>
     * <tr>
     * <td>CALLBACK_NULL</td>
     * <td>There is no callback mechanism. This is the default setting.</td>
     * </tr>
     * <tr>
     * <td>CALLBACK_THREAD</td>
     * <td>The <i>dwCallback</i> parameter is a thread identifier.</td>
     * </tr>
     * <tr>
     * <td>CALLBACK_WINDOW</td>
     * <td>The <i>dwCallback</i> parameter is a window handle.</td>
     * </tr>
     * </table>
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_BADDEVICEID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified device identifier is out of range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The given handle or flags parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midistreamopen
     * @since windows5.0
     */
    static midiStreamOpen(phms, puDeviceID, cMidi, dwCallback, dwInstance, fdwOpen) {
        result := DllCall("WINMM.dll\midiStreamOpen", "ptr", phms, "uint*", puDeviceID, "uint", cMidi, "ptr", dwCallback, "ptr", dwInstance, "uint", fdwOpen, "uint")
        return result
    }

    /**
     * The midiStreamClose function closes an open MIDI stream.
     * @param {HMIDISTRM} hms Handle to a MIDI stream, as retrieved by using the <a href="https://docs.microsoft.com/previous-versions/dd798486(v=vs.85)">midiStreamOpen</a> function.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midistreamclose
     * @since windows5.0
     */
    static midiStreamClose(hms) {
        hms := hms is Win32Handle ? NumGet(hms, "ptr") : hms

        result := DllCall("WINMM.dll\midiStreamClose", "ptr", hms, "uint")
        return result
    }

    /**
     * The midiStreamProperty function sets or retrieves properties of a MIDI data stream associated with a MIDI output device.
     * @param {HMIDISTRM} hms Handle to the MIDI device that the property is associated with.
     * @param {Pointer<Byte>} lppropdata Pointer to the property data.
     * @param {Integer} dwProperty Flags that specify the action to perform and identify the appropriate property of the MIDI data stream. The <b>midiStreamProperty</b> function requires setting two flags in each use. One flag (either MIDIPROP_GET or MIDIPROP_SET) specifies an action, and the other identifies a specific property to examine or edit.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>MIDIPROP_GET</td>
     * <td>Retrieves the current setting of the given property.</td>
     * </tr>
     * <tr>
     * <td>MIDIPROP_SET</td>
     * <td>Sets the given property.</td>
     * </tr>
     * <tr>
     * <td>MIDIPROP_TEMPO</td>
     * <td>Retrieves the tempo property. The <i>lppropdata</i> parameter points to a <a href="https://docs.microsoft.com/previous-versions/dd798483(v=vs.85)">MIDIPROPTEMPO</a> structure. The current tempo value can be retrieved at any time. Output devices set the tempo by inserting MEVT_TEMPO events into the MIDI data.</td>
     * </tr>
     * <tr>
     * <td>MIDIPROP_TIMEDIV</td>
     * <td>Specifies the time division property. You can get or set this property. The <i>lppropdata</i> parameter points to a <a href="https://docs.microsoft.com/previous-versions/dd798484(v=vs.85)">MIDIPROPTIMEDIV</a> structure. This property can be set only when the device is stopped.</td>
     * </tr>
     * </table>
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is not a stream handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The given handle or flags parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midistreamproperty
     * @since windows5.0
     */
    static midiStreamProperty(hms, lppropdata, dwProperty) {
        hms := hms is Win32Handle ? NumGet(hms, "ptr") : hms

        result := DllCall("WINMM.dll\midiStreamProperty", "ptr", hms, "char*", lppropdata, "uint", dwProperty, "uint")
        return result
    }

    /**
     * The midiStreamPosition function retrieves the current position in a MIDI stream.
     * @param {HMIDISTRM} hms Handle to a MIDI stream. This handle must have been returned by a call to the <a href="https://docs.microsoft.com/previous-versions/dd798486(v=vs.85)">midiStreamOpen</a> function. This handle identifies the output device.
     * @param {Pointer} lpmmt Pointer to an <a href="https://docs.microsoft.com/previous-versions/dd757347(v=vs.85)">MMTIME</a> structure.
     * @param {Integer} cbmmt Size, in bytes, of the <a href="https://docs.microsoft.com/previous-versions/dd757347(v=vs.85)">MMTIME</a> structure.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified pointer or structure is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midistreamposition
     * @since windows5.0
     */
    static midiStreamPosition(hms, lpmmt, cbmmt) {
        hms := hms is Win32Handle ? NumGet(hms, "ptr") : hms

        result := DllCall("WINMM.dll\midiStreamPosition", "ptr", hms, "ptr", lpmmt, "uint", cbmmt, "uint")
        return result
    }

    /**
     * The midiStreamOut function plays or queues a stream (buffer) of MIDI data to a MIDI output device.
     * @param {HMIDISTRM} hms Handle to a MIDI stream. This handle must have been returned by a call to the <a href="https://docs.microsoft.com/previous-versions/dd798486(v=vs.85)">midiStreamOpen</a> function. This handle identifies the output device.
     * @param {Pointer} pmh Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd798449(v=vs.85)">MIDIHDR</a> structure that identifies the MIDI buffer.
     * @param {Integer} cbmh Size, in bytes, of the <a href="https://docs.microsoft.com/previous-versions/dd798449(v=vs.85)">MIDIHDR</a> structure.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MIDIERR_STILLPLAYING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The output buffer pointed to by <i>lpMidiHdr</i> is still playing or is queued from a previous call to <a href="/previous-versions/dd798487(v=vs.85)">midiStreamOut</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MIDIERR_UNPREPARED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The header pointed to by <i>lpMidiHdr</i> has not been prepared.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pointer specified by <i>lpMidiHdr</i> is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midistreamout
     * @since windows5.0
     */
    static midiStreamOut(hms, pmh, cbmh) {
        hms := hms is Win32Handle ? NumGet(hms, "ptr") : hms

        result := DllCall("WINMM.dll\midiStreamOut", "ptr", hms, "ptr", pmh, "uint", cbmh, "uint")
        return result
    }

    /**
     * The midiStreamPause function pauses playback of a specified MIDI stream.
     * @param {HMIDISTRM} hms Handle to a MIDI stream. This handle must have been returned by a call to the <a href="https://docs.microsoft.com/previous-versions/dd798448(v=vs.85)">MIDIEVENT</a> function. This handle identifies the output device.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midistreampause
     * @since windows5.0
     */
    static midiStreamPause(hms) {
        hms := hms is Win32Handle ? NumGet(hms, "ptr") : hms

        result := DllCall("WINMM.dll\midiStreamPause", "ptr", hms, "uint")
        return result
    }

    /**
     * The midiStreamRestart function restarts a paused MIDI stream.
     * @param {HMIDISTRM} hms Handle to a MIDI stream. This handle must have been returned by a call to the <a href="https://docs.microsoft.com/previous-versions/dd798486(v=vs.85)">midiStreamOpen</a> function. This handle identifies the output device.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midistreamrestart
     * @since windows5.0
     */
    static midiStreamRestart(hms) {
        hms := hms is Win32Handle ? NumGet(hms, "ptr") : hms

        result := DllCall("WINMM.dll\midiStreamRestart", "ptr", hms, "uint")
        return result
    }

    /**
     * The midiStreamStop function turns off all notes on all MIDI channels for the specified MIDI output device.
     * @param {HMIDISTRM} hms Handle to a MIDI stream. This handle must have been returned by a call to the <a href="https://docs.microsoft.com/previous-versions/dd798486(v=vs.85)">midiStreamOpen</a> function. This handle identifies the output device.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midistreamstop
     * @since windows5.0
     */
    static midiStreamStop(hms) {
        hms := hms is Win32Handle ? NumGet(hms, "ptr") : hms

        result := DllCall("WINMM.dll\midiStreamStop", "ptr", hms, "uint")
        return result
    }

    /**
     * The midiConnect function connects a MIDI input device to a MIDI thru or output device, or connects a MIDI thru device to a MIDI output device.
     * @param {HMIDI} hmi Handle to a MIDI input device or a MIDI thru device. (For thru devices, this handle must have been returned by a call to the <a href="https://docs.microsoft.com/previous-versions/dd798476(v=vs.85)">midiOutOpen</a> function.)
     * @param {HMIDIOUT} hmo Handle to the MIDI output or thru device.
     * @param {Pointer<Void>} pReserved Reserved; must be <b>NULL</b>.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MIDIERR_NOTREADY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified input device is already connected to an output device.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midiconnect
     * @since windows5.0
     */
    static midiConnect(hmi, hmo, pReserved) {
        hmi := hmi is Win32Handle ? NumGet(hmi, "ptr") : hmi
        hmo := hmo is Win32Handle ? NumGet(hmo, "ptr") : hmo

        result := DllCall("WINMM.dll\midiConnect", "ptr", hmi, "ptr", hmo, "ptr", pReserved, "uint")
        return result
    }

    /**
     * The midiDisconnect function disconnects a MIDI input device from a MIDI thru or output device, or disconnects a MIDI thru device from a MIDI output device.
     * @param {HMIDI} hmi Handle to a MIDI input device or a MIDI thru device.
     * @param {HMIDIOUT} hmo Handle to the MIDI output device to be disconnected.
     * @param {Pointer<Void>} pReserved Reserved; must be <b>NULL</b>.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following:.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-mididisconnect
     * @since windows5.0
     */
    static midiDisconnect(hmi, hmo, pReserved) {
        hmi := hmi is Win32Handle ? NumGet(hmi, "ptr") : hmi
        hmo := hmo is Win32Handle ? NumGet(hmo, "ptr") : hmo

        result := DllCall("WINMM.dll\midiDisconnect", "ptr", hmi, "ptr", hmo, "ptr", pReserved, "uint")
        return result
    }

    /**
     * The midiOutGetDevCaps function queries a specified MIDI output device to determine its capabilities.
     * @param {Pointer} uDeviceID Identifier of the MIDI output device. The device identifier specified by this parameter varies from zero to one less than the number of devices present. The MIDI_MAPPER constant is also a valid device identifier.
     * 
     * This parameter can also be a properly cast device handle.
     * @param {Pointer} pmoc Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd798467(v=vs.85)">MIDIOUTCAPS</a> structure. This structure is filled with information about the capabilities of the device.
     * @param {Integer} cbmoc Size, in bytes, of the <a href="https://docs.microsoft.com/previous-versions/dd798467(v=vs.85)">MIDIOUTCAPS</a> structure. Only <i>cbMidiOutCaps</i> bytes (or less) of information is copied to the location pointed to by <i>lpMidiOutCaps</i>. If <i>cbMidiOutCaps</i> is zero, nothing is copied, and the function returns MMSYSERR_NOERROR.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_BADDEVICEID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified device identifier is out of range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified pointer or structure is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The driver is not installed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is unable to load mapper string description.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midioutgetdevcapsa
     * @since windows5.0
     */
    static midiOutGetDevCapsA(uDeviceID, pmoc, cbmoc) {
        result := DllCall("WINMM.dll\midiOutGetDevCapsA", "ptr", uDeviceID, "ptr", pmoc, "uint", cbmoc, "uint")
        return result
    }

    /**
     * The midiOutGetDevCaps function queries a specified MIDI output device to determine its capabilities.
     * @param {Pointer} uDeviceID Identifier of the MIDI output device. The device identifier specified by this parameter varies from zero to one less than the number of devices present. The MIDI_MAPPER constant is also a valid device identifier.
     * 
     * This parameter can also be a properly cast device handle.
     * @param {Pointer} pmoc Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd798467(v=vs.85)">MIDIOUTCAPS</a> structure. This structure is filled with information about the capabilities of the device.
     * @param {Integer} cbmoc Size, in bytes, of the <a href="https://docs.microsoft.com/previous-versions/dd798467(v=vs.85)">MIDIOUTCAPS</a> structure. Only <i>cbMidiOutCaps</i> bytes (or less) of information is copied to the location pointed to by <i>lpMidiOutCaps</i>. If <i>cbMidiOutCaps</i> is zero, nothing is copied, and the function returns MMSYSERR_NOERROR.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_BADDEVICEID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified device identifier is out of range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified pointer or structure is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The driver is not installed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is unable to load mapper string description.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midioutgetdevcapsw
     * @since windows5.0
     */
    static midiOutGetDevCapsW(uDeviceID, pmoc, cbmoc) {
        result := DllCall("WINMM.dll\midiOutGetDevCapsW", "ptr", uDeviceID, "ptr", pmoc, "uint", cbmoc, "uint")
        return result
    }

    /**
     * The midiOutGetVolume function retrieves the current volume setting of a MIDI output device.
     * @param {HMIDIOUT} hmo Handle to an open MIDI output device. This parameter can also contain the handle of a MIDI stream, as long as it is cast to <b>HMIDIOUT</b>. This parameter can also be a device identifier.
     * @param {Pointer<UInt32>} pdwVolume Pointer to the location to contain the current volume setting. The low-order word of this location contains the left-channel volume setting, and the high-order word contains the right-channel setting. A value of 0xFFFF represents full volume, and a value of 0x0000 is silence.
     * 
     * If a device does not support both left and right volume control, the low-order word of the specified location contains the mono volume level.
     * 
     * Any value set by using the <a href="https://docs.microsoft.com/previous-versions/dd798480(v=vs.85)">midiOutSetVolume</a> function is returned, regardless of whether the device supports that value.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified pointer or structure is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midioutgetvolume
     * @since windows5.0
     */
    static midiOutGetVolume(hmo, pdwVolume) {
        hmo := hmo is Win32Handle ? NumGet(hmo, "ptr") : hmo

        result := DllCall("WINMM.dll\midiOutGetVolume", "ptr", hmo, "uint*", pdwVolume, "uint")
        return result
    }

    /**
     * The midiOutSetVolume function sets the volume of a MIDI output device.
     * @param {HMIDIOUT} hmo Handle to an open MIDI output device. This parameter can also contain the handle of a MIDI stream, as long as it is cast to <b>HMIDIOUT</b>. This parameter can also be a device identifier.
     * @param {Integer} dwVolume New volume setting. The low-order word contains the left-channel volume setting, and the high-order word contains the right-channel setting. A value of 0xFFFF represents full volume, and a value of 0x0000 is silence.
     * 
     * If a device does not support both left and right volume control, the low-order word of <i>dwVolume</i> specifies the mono volume level, and the high-order word is ignored.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midioutsetvolume
     * @since windows5.0
     */
    static midiOutSetVolume(hmo, dwVolume) {
        hmo := hmo is Win32Handle ? NumGet(hmo, "ptr") : hmo

        result := DllCall("WINMM.dll\midiOutSetVolume", "ptr", hmo, "uint", dwVolume, "uint")
        return result
    }

    /**
     * The midiOutGetErrorText function retrieves a textual description for an error identified by the specified error code.
     * @param {Integer} mmrError Error code.
     * @param {PSTR} pszText Pointer to a buffer to be filled with the textual error description.
     * @param {Integer} cchText Length, in characters, of the buffer pointed to by <i>lpText</i>.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_BADERRNUM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified error number is out of range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified pointer or structure is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midioutgeterrortexta
     * @since windows5.0
     */
    static midiOutGetErrorTextA(mmrError, pszText, cchText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := DllCall("WINMM.dll\midiOutGetErrorTextA", "uint", mmrError, "ptr", pszText, "uint", cchText, "uint")
        return result
    }

    /**
     * The midiOutGetErrorText function retrieves a textual description for an error identified by the specified error code.
     * @param {Integer} mmrError Error code.
     * @param {PWSTR} pszText Pointer to a buffer to be filled with the textual error description.
     * @param {Integer} cchText Length, in characters, of the buffer pointed to by <i>lpText</i>.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_BADERRNUM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified error number is out of range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified pointer or structure is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midioutgeterrortextw
     * @since windows5.0
     */
    static midiOutGetErrorTextW(mmrError, pszText, cchText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := DllCall("WINMM.dll\midiOutGetErrorTextW", "uint", mmrError, "ptr", pszText, "uint", cchText, "uint")
        return result
    }

    /**
     * The midiOutOpen function opens a MIDI output device for playback.
     * @param {Pointer<HMIDIOUT>} phmo Pointer to an <b>HMIDIOUT</b> handle. This location is filled with a handle identifying the opened MIDI output device. The handle is used to identify the device in calls to other MIDI output functions.
     * @param {Integer} uDeviceID Identifier of the MIDI output device that is to be opened.
     * @param {Pointer} dwCallback Pointer to a callback function, an event handle, a thread identifier, or a handle of a window or thread called during MIDI playback to process messages related to the progress of the playback. If no callback is desired, specify <b>NULL</b> for this parameter. For more information on the callback function, see <a href="https://docs.microsoft.com/previous-versions/dd798478(v=vs.85)">MidiOutProc</a>.
     * @param {Pointer} dwInstance User instance data passed to the callback. This parameter is not used with window callbacks or threads.
     * @param {Integer} fdwOpen Callback flag for opening the device. It can be the following values.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>CALLBACK_EVENT</td>
     * <td>The <i>dwCallback</i> parameter is an event handle. This callback mechanism is for output only.</td>
     * </tr>
     * <tr>
     * <td>CALLBACK_FUNCTION</td>
     * <td>The <i>dwCallback</i> parameter is a callback function address.</td>
     * </tr>
     * <tr>
     * <td>CALLBACK_NULL</td>
     * <td>There is no callback mechanism. This value is the default setting.</td>
     * </tr>
     * <tr>
     * <td>CALLBACK_THREAD</td>
     * <td>The <i>dwCallback</i> parameter is a thread identifier.</td>
     * </tr>
     * <tr>
     * <td>CALLBACK_WINDOW</td>
     * <td>The <i>dwCallback</i> parameter is a window handle.</td>
     * </tr>
     * </table>
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MIDIERR_NODEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No MIDI port was found. This error occurs only when the mapper is opened.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_ALLOCATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified resource is already allocated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_BADDEVICEID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified device identifier is out of range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified pointer or structure is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midioutopen
     * @since windows5.0
     */
    static midiOutOpen(phmo, uDeviceID, dwCallback, dwInstance, fdwOpen) {
        result := DllCall("WINMM.dll\midiOutOpen", "ptr", phmo, "uint", uDeviceID, "ptr", dwCallback, "ptr", dwInstance, "uint", fdwOpen, "uint")
        return result
    }

    /**
     * The midiOutClose function closes the specified MIDI output device.
     * @param {HMIDIOUT} hmo Handle to the MIDI output device. If the function is successful, the handle is no longer valid after the call to this function.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MIDIERR_STILLPLAYING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Buffers are still in the queue.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is unable to load mapper string description.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midioutclose
     * @since windows5.0
     */
    static midiOutClose(hmo) {
        hmo := hmo is Win32Handle ? NumGet(hmo, "ptr") : hmo

        result := DllCall("WINMM.dll\midiOutClose", "ptr", hmo, "uint")
        return result
    }

    /**
     * The midiOutPrepareHeader function prepares a MIDI system-exclusive or stream buffer for output.
     * @param {HMIDIOUT} hmo Handle to the MIDI output device. To get the device handle, call <a href="https://docs.microsoft.com/previous-versions/dd798476(v=vs.85)">midiOutOpen</a>. This parameter can also be the handle of a MIDI stream cast to a <b>HMIDIOUT</b> type.
     * @param {Pointer} pmh Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd798449(v=vs.85)">MIDIHDR</a> structure that identifies the buffer to be prepared.
     *           
     * 
     * Before calling the function, set the <b>lpData</b>, <b>dwBufferLength</b>, and <b>dwFlags</b> members of the <a href="https://docs.microsoft.com/previous-versions/dd798449(v=vs.85)">MIDIHDR</a> structure. The <b>dwFlags</b> member must be set to zero.
     * @param {Integer} cbmh Size, in bytes, of the <a href="https://docs.microsoft.com/previous-versions/dd798449(v=vs.85)">MIDIHDR</a> structure.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified address is invalid or the given stream buffer is greater than 64K.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midioutprepareheader
     * @since windows5.0
     */
    static midiOutPrepareHeader(hmo, pmh, cbmh) {
        hmo := hmo is Win32Handle ? NumGet(hmo, "ptr") : hmo

        result := DllCall("WINMM.dll\midiOutPrepareHeader", "ptr", hmo, "ptr", pmh, "uint", cbmh, "uint")
        return result
    }

    /**
     * The midiOutUnprepareHeader function cleans up the preparation performed by the midiOutPrepareHeader function.
     * @param {HMIDIOUT} hmo Handle to the MIDI output device. This parameter can also be the handle of a MIDI stream cast to <b>HMIDIOUT</b>.
     * @param {Pointer} pmh Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd798449(v=vs.85)">MIDIHDR</a> structure identifying the buffer to be cleaned up.
     * @param {Integer} cbmh Size, in bytes, of the <a href="https://docs.microsoft.com/previous-versions/dd798449(v=vs.85)">MIDIHDR</a> structure.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MIDIERR_STILLPLAYING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by <i>lpMidiOutHdr</i> is still in the queue.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified pointer or structure is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midioutunprepareheader
     * @since windows5.0
     */
    static midiOutUnprepareHeader(hmo, pmh, cbmh) {
        hmo := hmo is Win32Handle ? NumGet(hmo, "ptr") : hmo

        result := DllCall("WINMM.dll\midiOutUnprepareHeader", "ptr", hmo, "ptr", pmh, "uint", cbmh, "uint")
        return result
    }

    /**
     * The midiOutShortMsg function sends a short MIDI message to the specified MIDI output device.
     * @param {HMIDIOUT} hmo Handle to the MIDI output device. This parameter can also be the handle of a MIDI stream cast to <b>HMIDIOUT</b>.
     * @param {Integer} dwMsg MIDI message. The message is packed into a <b>DWORD</b> value with the first byte of the message in the low-order byte. The message is packed into this parameter as follows.
     * 
     * <table>
     * <tr>
     * <th>Word
     *                 </th>
     * <th>Byte
     *                 </th>
     * <th>Usage
     *                 </th>
     * </tr>
     * <tr>
     * <td>High</td>
     * <td>High-order</td>
     * <td>Not used.</td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>Low-order</td>
     * <td>The second byte of MIDI data (when needed).</td>
     * </tr>
     * <tr>
     * <td>Low</td>
     * <td>High-order</td>
     * <td>The first byte of MIDI data (when needed).</td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>Low-order</td>
     * <td>The MIDI status.</td>
     * </tr>
     * </table>
     *  
     * 
     * The two MIDI data bytes are optional, depending on the MIDI status byte. When a series of messages have the same status byte, the status byte can be omitted from messages after the first one in the series, creating a running status. Pack a message for running status as follows:
     * 
     * <table>
     * <tr>
     * <th>Word
     *                 </th>
     * <th>Byte
     *                 </th>
     * <th>Usage
     *                 </th>
     * </tr>
     * <tr>
     * <td>High</td>
     * <td>High-order</td>
     * <td>Not used.</td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>Low-order</td>
     * <td>Not used.</td>
     * </tr>
     * <tr>
     * <td>Low</td>
     * <td>High-order</td>
     * <td>The second byte of MIDI data (when needed).</td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>Low-order</td>
     * <td>The first byte of MIDI data.</td>
     * </tr>
     * </table>
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MIDIERR_BADOPENMODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application sent a message without a status byte to a stream handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MIDIERR_NOTREADY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The hardware is busy with other data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midioutshortmsg
     * @since windows5.0
     */
    static midiOutShortMsg(hmo, dwMsg) {
        hmo := hmo is Win32Handle ? NumGet(hmo, "ptr") : hmo

        result := DllCall("WINMM.dll\midiOutShortMsg", "ptr", hmo, "uint", dwMsg, "uint")
        return result
    }

    /**
     * The midiOutLongMsg function sends a system-exclusive MIDI message to the specified MIDI output device.
     * @param {HMIDIOUT} hmo Handle to the MIDI output device. This parameter can also be the handle of a MIDI stream cast to <b>HMIDIOUT</b>.
     * @param {Pointer} pmh Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd798449(v=vs.85)">MIDIHDR</a> structure that identifies the MIDI buffer.
     * @param {Integer} cbmh Size, in bytes, of the <a href="https://docs.microsoft.com/previous-versions/dd798449(v=vs.85)">MIDIHDR</a> structure.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MIDIERR_NOTREADY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The hardware is busy with other data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MIDIERR_UNPREPARED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by <i>lpMidiOutHdr</i> has not been prepared.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified pointer or structure is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midioutlongmsg
     * @since windows5.0
     */
    static midiOutLongMsg(hmo, pmh, cbmh) {
        hmo := hmo is Win32Handle ? NumGet(hmo, "ptr") : hmo

        result := DllCall("WINMM.dll\midiOutLongMsg", "ptr", hmo, "ptr", pmh, "uint", cbmh, "uint")
        return result
    }

    /**
     * The midiOutReset function turns off all notes on all MIDI channels for the specified MIDI output device.
     * @param {HMIDIOUT} hmo Handle to the MIDI output device. This parameter can also be the handle of a MIDI stream cast to <b>HMIDIOUT</b>.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midioutreset
     * @since windows5.0
     */
    static midiOutReset(hmo) {
        hmo := hmo is Win32Handle ? NumGet(hmo, "ptr") : hmo

        result := DllCall("WINMM.dll\midiOutReset", "ptr", hmo, "uint")
        return result
    }

    /**
     * The midiOutCachePatches function requests that an internal MIDI synthesizer device preload and cache a specified set of patches.
     * @param {HMIDIOUT} hmo Handle to the opened MIDI output device. This device must be an internal MIDI synthesizer. This parameter can also be the handle of a MIDI stream, cast to <b>HMIDIOUT</b>.
     * @param {Integer} uBank Bank of patches that should be used. This parameter should be set to zero to cache the default patch bank.
     * @param {Pointer<UInt16>} pwpa Pointer to a <a href="https://docs.microsoft.com/windows/desktop/Multimedia/patcharray">PATCHARRAY</a> array indicating the patches to be cached or uncached.
     * @param {Integer} fuCache Options for the cache operation. It can be one of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>MIDI_CACHE_ALL</td>
     * <td>Caches all of the specified patches. If they cannot all be cached, it caches none, clears the <a href="https://docs.microsoft.com/windows/desktop/Multimedia/patcharray">PATCHARRAY</a> array, and returns MMSYSERR_NOMEM.</td>
     * </tr>
     * <tr>
     * <td>MIDI_CACHE_BESTFIT</td>
     * <td>Caches all of the specified patches. If they cannot all be cached, it caches as many patches as possible, changes the PATCHARRAY array to reflect which patches were cached, and returns MMSYSERR_NOMEM.</td>
     * </tr>
     * <tr>
     * <td>MIDI_CACHE_QUERY</td>
     * <td>Changes the <a href="https://docs.microsoft.com/windows/desktop/Multimedia/patcharray">PATCHARRAY</a> array to indicate which patches are currently cached.</td>
     * </tr>
     * <tr>
     * <td>MIDI_UNCACHE</td>
     * <td>Uncaches the specified patches and clears the PATCHARRAY array.</td>
     * </tr>
     * </table>
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flag specified by <i>wFlags</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The array pointed to by <i>lpPatchArray</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device does not have enough memory to cache all of the requested patches.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified device does not support patch caching.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midioutcachepatches
     * @since windows5.0
     */
    static midiOutCachePatches(hmo, uBank, pwpa, fuCache) {
        hmo := hmo is Win32Handle ? NumGet(hmo, "ptr") : hmo

        result := DllCall("WINMM.dll\midiOutCachePatches", "ptr", hmo, "uint", uBank, "ushort*", pwpa, "uint", fuCache, "uint")
        return result
    }

    /**
     * The midiOutCacheDrumPatches function requests that an internal MIDI synthesizer device preload and cache a specified set of key-based percussion patches.
     * @param {HMIDIOUT} hmo Handle to the opened MIDI output device. This device should be an internal MIDI synthesizer. This parameter can also be the handle of a MIDI stream, cast to <b>HMIDIOUT</b>.
     * @param {Integer} uPatch Drum patch number that should be used. This parameter should be set to zero to cache the default drum patch.
     * @param {Pointer<UInt16>} pwkya Pointer to a <a href="https://docs.microsoft.com/windows/desktop/Multimedia/keyarray">KEYARRAY</a> array indicating the key numbers of the specified percussion patches to be cached or uncached.
     * @param {Integer} fuCache Options for the cache operation. It can be one of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>MIDI_CACHE_ALL</td>
     * <td>Caches all of the specified patches. If they cannot all be cached, it caches none, clears the <a href="https://docs.microsoft.com/windows/desktop/Multimedia/keyarray">KEYARRAY</a> array, and returns MMSYSERR_NOMEM.</td>
     * </tr>
     * <tr>
     * <td>MIDI_CACHE_BESTFIT</td>
     * <td>Caches all of the specified patches. If they cannot all be cached, it caches as many patches as possible, changes the KEYARRAY array to reflect which patches were cached, and returns MMSYSERR_NOMEM.</td>
     * </tr>
     * <tr>
     * <td>MIDI_CACHE_QUERY</td>
     * <td>Changes the <a href="https://docs.microsoft.com/windows/desktop/Multimedia/keyarray">KEYARRAY</a> array to indicate which patches are currently cached.</td>
     * </tr>
     * <tr>
     * <td>MIDI_UNCACHE</td>
     * <td>Uncaches the specified patches and clears the KEYARRAY array.</td>
     * </tr>
     * </table>
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flag specified by <i>wFlags</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The array pointed to by the <i>lpKeyArray</i> array is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device does not have enough memory to cache all of the requested patches.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified device does not support patch caching.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midioutcachedrumpatches
     * @since windows5.0
     */
    static midiOutCacheDrumPatches(hmo, uPatch, pwkya, fuCache) {
        hmo := hmo is Win32Handle ? NumGet(hmo, "ptr") : hmo

        result := DllCall("WINMM.dll\midiOutCacheDrumPatches", "ptr", hmo, "uint", uPatch, "ushort*", pwkya, "uint", fuCache, "uint")
        return result
    }

    /**
     * The midiOutGetID function retrieves the device identifier for the given MIDI output device.
     * @param {HMIDIOUT} hmo Handle to the MIDI output device.
     * @param {Pointer<UInt32>} puDeviceID Pointer to a variable to be filled with the device identifier.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hmo</i> parameter specifies an invalid handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No device driver is present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midioutgetid
     * @since windows5.0
     */
    static midiOutGetID(hmo, puDeviceID) {
        hmo := hmo is Win32Handle ? NumGet(hmo, "ptr") : hmo

        result := DllCall("WINMM.dll\midiOutGetID", "ptr", hmo, "uint*", puDeviceID, "uint")
        return result
    }

    /**
     * The midiOutMessage function sends a message to the MIDI device drivers. This function is used only for driver-specific messages that are not supported by the MIDI API.
     * @param {HMIDIOUT} hmo Identifier of the MIDI device that receives the message. You must cast the device ID to the <b>HMIDIOUT</b> handle type. If you supply a handle instead of a device ID, the function fails and returns the MMSYSERR_NOSUPPORT error code.
     * @param {Integer} uMsg Message to send.
     * @param {Pointer} dw1 Message parameter.
     * @param {Pointer} dw2 Message parameter.
     * @returns {Integer} Returns the value returned by the audio device driver.
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midioutmessage
     * @since windows5.0
     */
    static midiOutMessage(hmo, uMsg, dw1, dw2) {
        hmo := hmo is Win32Handle ? NumGet(hmo, "ptr") : hmo

        result := DllCall("WINMM.dll\midiOutMessage", "ptr", hmo, "uint", uMsg, "ptr", dw1, "ptr", dw2, "uint")
        return result
    }

    /**
     * The midiInGetNumDevs function retrieves the number of MIDI input devices in the system.
     * @returns {Integer} Returns the number of MIDI input devices present in the system. A return value of zero means that there are no devices (not that there is no error).
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midiingetnumdevs
     * @since windows5.0
     */
    static midiInGetNumDevs() {
        result := DllCall("WINMM.dll\midiInGetNumDevs", "uint")
        return result
    }

    /**
     * The midiInGetDevCaps function determines the capabilities of a specified MIDI input device.
     * @param {Pointer} uDeviceID Identifier of the MIDI input device. The device identifier varies from zero to one less than the number of devices present. This parameter can also be a properly cast device handle.
     * @param {Pointer} pmic Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd798451(v=vs.85)">MIDIINCAPS</a> structure that is filled with information about the capabilities of the device.
     * @param {Integer} cbmic Size, in bytes, of the <a href="https://docs.microsoft.com/previous-versions/dd798451(v=vs.85)">MIDIINCAPS</a> structure. Only <i>cbMidiInCaps</i> bytes (or less) of information is copied to the location pointed to by <i>lpMidiInCaps</i>. If <i>cbMidiInCaps</i> is zero, nothing is copied, and the function returns MMSYSERR_NOERROR.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_BADDEVICEID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified device identifier is out of range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified pointer or structure is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The driver is not installed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midiingetdevcapsa
     * @since windows5.0
     */
    static midiInGetDevCapsA(uDeviceID, pmic, cbmic) {
        result := DllCall("WINMM.dll\midiInGetDevCapsA", "ptr", uDeviceID, "ptr", pmic, "uint", cbmic, "uint")
        return result
    }

    /**
     * The midiInGetDevCaps function determines the capabilities of a specified MIDI input device.
     * @param {Pointer} uDeviceID Identifier of the MIDI input device. The device identifier varies from zero to one less than the number of devices present. This parameter can also be a properly cast device handle.
     * @param {Pointer} pmic Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd798451(v=vs.85)">MIDIINCAPS</a> structure that is filled with information about the capabilities of the device.
     * @param {Integer} cbmic Size, in bytes, of the <a href="https://docs.microsoft.com/previous-versions/dd798451(v=vs.85)">MIDIINCAPS</a> structure. Only <i>cbMidiInCaps</i> bytes (or less) of information is copied to the location pointed to by <i>lpMidiInCaps</i>. If <i>cbMidiInCaps</i> is zero, nothing is copied, and the function returns MMSYSERR_NOERROR.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_BADDEVICEID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified device identifier is out of range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified pointer or structure is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The driver is not installed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midiingetdevcapsw
     * @since windows5.0
     */
    static midiInGetDevCapsW(uDeviceID, pmic, cbmic) {
        result := DllCall("WINMM.dll\midiInGetDevCapsW", "ptr", uDeviceID, "ptr", pmic, "uint", cbmic, "uint")
        return result
    }

    /**
     * The midiInGetErrorText function retrieves a textual description for an error identified by the specified error code.
     * @param {Integer} mmrError Error code.
     * @param {PSTR} pszText Pointer to the buffer to be filled with the textual error description.
     * @param {Integer} cchText Length, in characters, of the buffer pointed to by <i>lpText</i>.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_BADERRNUM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified error number is out of range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified pointer or structure is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midiingeterrortexta
     * @since windows5.0
     */
    static midiInGetErrorTextA(mmrError, pszText, cchText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := DllCall("WINMM.dll\midiInGetErrorTextA", "uint", mmrError, "ptr", pszText, "uint", cchText, "uint")
        return result
    }

    /**
     * The midiInGetErrorText function retrieves a textual description for an error identified by the specified error code.
     * @param {Integer} mmrError Error code.
     * @param {PWSTR} pszText Pointer to the buffer to be filled with the textual error description.
     * @param {Integer} cchText Length, in characters, of the buffer pointed to by <i>lpText</i>.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_BADERRNUM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified error number is out of range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified pointer or structure is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midiingeterrortextw
     * @since windows5.0
     */
    static midiInGetErrorTextW(mmrError, pszText, cchText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := DllCall("WINMM.dll\midiInGetErrorTextW", "uint", mmrError, "ptr", pszText, "uint", cchText, "uint")
        return result
    }

    /**
     * The midiInOpen function opens a specified MIDI input device.
     * @param {Pointer<HMIDIIN>} phmi Pointer to an <b>HMIDIIN</b> handle. This location is filled with a handle identifying the opened MIDI input device. The handle is used to identify the device in calls to other MIDI input functions.
     * @param {Integer} uDeviceID Identifier of the MIDI input device to be opened.
     * @param {Pointer} dwCallback Pointer to a callback function, a thread identifier, or a handle of a window called with information about incoming MIDI messages. For more information on the callback function, see <a href="https://docs.microsoft.com/previous-versions/dd798460(v=vs.85)">MidiInProc</a>.
     * @param {Pointer} dwInstance User instance data passed to the callback function. This parameter is not used with window callback functions or threads.
     * @param {Integer} fdwOpen Callback flag for opening the device and, optionally, a status flag that helps regulate rapid data transfers. It can be the following values.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>CALLBACK_FUNCTION</td>
     * <td>The <i>dwCallback</i> parameter is a callback procedure address.</td>
     * </tr>
     * <tr>
     * <td>CALLBACK_NULL</td>
     * <td>There is no callback mechanism. This value is the default setting.</td>
     * </tr>
     * <tr>
     * <td>CALLBACK_THREAD</td>
     * <td>The <i>dwCallback</i> parameter is a thread identifier.</td>
     * </tr>
     * <tr>
     * <td>CALLBACK_WINDOW</td>
     * <td>The <i>dwCallback</i> parameter is a window handle.</td>
     * </tr>
     * <tr>
     * <td>MIDI_IO_STATUS</td>
     * <td>When this parameter also specifies CALLBACK_FUNCTION, <a href="https://docs.microsoft.com/windows/desktop/Multimedia/mim-moredata">MIM_MOREDATA</a> messages are sent to the callback function as well as <a href="https://docs.microsoft.com/windows/desktop/Multimedia/mim-data">MIM_DATA</a> messages. Or, if this parameter also specifies CALLBACK_WINDOW, <a href="https://docs.microsoft.com/windows/desktop/Multimedia/mm-mim-moredata">MM_MIM_MOREDATA</a> messages are sent to the window as well as <a href="https://docs.microsoft.com/windows/desktop/Multimedia/mm-mim-data">MM_MIM_DATA</a> messages. This flag does not affect event or thread callbacks.</td>
     * </tr>
     * </table>
     *  
     * 
     * Most applications that use a callback mechanism will specify CALLBACK_FUNCTION for this parameter.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following/
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_ALLOCATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified resource is already allocated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_BADDEVICEID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified device identifier is out of range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flags specified by <i>dwFlags</i> are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified pointer or structure is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midiinopen
     * @since windows5.0
     */
    static midiInOpen(phmi, uDeviceID, dwCallback, dwInstance, fdwOpen) {
        result := DllCall("WINMM.dll\midiInOpen", "ptr", phmi, "uint", uDeviceID, "ptr", dwCallback, "ptr", dwInstance, "uint", fdwOpen, "uint")
        return result
    }

    /**
     * The midiInClose function closes the specified MIDI input device.
     * @param {HMIDIIN} hmi Handle to the MIDI input device. If the function is successful, the handle is no longer valid after the call to this function.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MIDIERR_STILLPLAYING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Buffers are still in the queue.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midiinclose
     * @since windows5.0
     */
    static midiInClose(hmi) {
        hmi := hmi is Win32Handle ? NumGet(hmi, "ptr") : hmi

        result := DllCall("WINMM.dll\midiInClose", "ptr", hmi, "uint")
        return result
    }

    /**
     * The midiInPrepareHeader function prepares a buffer for MIDI input.
     * @param {HMIDIIN} hmi Handle to the MIDI input device.
     *           To get the device handle, call <a href="https://docs.microsoft.com/previous-versions/dd798458(v=vs.85)">midiInOpen</a>.
     * @param {Pointer} pmh Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd798449(v=vs.85)">MIDIHDR</a> structure that identifies the buffer to be prepared.
     *            
     * 
     * Before calling the function, set the <b>lpData</b>, <b>dwBufferLength</b>, and <b>dwFlags</b> members of the <a href="https://docs.microsoft.com/previous-versions/dd798449(v=vs.85)">MIDIHDR</a> structure. The <b>dwFlags</b> member must be set to zero.
     * @param {Integer} cbmh Size, in bytes, of the <a href="https://docs.microsoft.com/previous-versions/dd798449(v=vs.85)">MIDIHDR</a> structure.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified address is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midiinprepareheader
     * @since windows5.0
     */
    static midiInPrepareHeader(hmi, pmh, cbmh) {
        hmi := hmi is Win32Handle ? NumGet(hmi, "ptr") : hmi

        result := DllCall("WINMM.dll\midiInPrepareHeader", "ptr", hmi, "ptr", pmh, "uint", cbmh, "uint")
        return result
    }

    /**
     * The midiInUnprepareHeader function cleans up the preparation performed by the midiInPrepareHeader function.
     * @param {HMIDIIN} hmi Handle to the MIDI input device.
     * @param {Pointer} pmh Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd798449(v=vs.85)">MIDIHDR</a> structure identifying the buffer to be cleaned up.
     * @param {Integer} cbmh Size of the <a href="https://docs.microsoft.com/previous-versions/dd798449(v=vs.85)">MIDIHDR</a> structure.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MIDIERR_STILLPLAYING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by <i>lpMidiInHdr</i> is still in the queue.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified pointer or structure is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midiinunprepareheader
     * @since windows5.0
     */
    static midiInUnprepareHeader(hmi, pmh, cbmh) {
        hmi := hmi is Win32Handle ? NumGet(hmi, "ptr") : hmi

        result := DllCall("WINMM.dll\midiInUnprepareHeader", "ptr", hmi, "ptr", pmh, "uint", cbmh, "uint")
        return result
    }

    /**
     * The midiInAddBuffer function sends an input buffer to a specified opened MIDI input device. This function is used for system-exclusive messages.
     * @param {HMIDIIN} hmi Handle to the MIDI input device.
     * @param {Pointer} pmh Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd798449(v=vs.85)">MIDIHDR</a> structure that identifies the buffer.
     * @param {Integer} cbmh Size, in bytes, of the <a href="https://docs.microsoft.com/previous-versions/dd798449(v=vs.85)">MIDIHDR</a> structure.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MIDIERR_STILLPLAYING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by <i>lpMidiInHdr</i> is still in the queue.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MIDIERR_UNPREPARED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by <i>lpMidiInHdr</i> has not been prepared.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified pointer or structure is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midiinaddbuffer
     * @since windows5.0
     */
    static midiInAddBuffer(hmi, pmh, cbmh) {
        hmi := hmi is Win32Handle ? NumGet(hmi, "ptr") : hmi

        result := DllCall("WINMM.dll\midiInAddBuffer", "ptr", hmi, "ptr", pmh, "uint", cbmh, "uint")
        return result
    }

    /**
     * The midiInStart function starts MIDI input on the specified MIDI input device.
     * @param {HMIDIIN} hmi Handle to the MIDI input device.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midiinstart
     * @since windows5.0
     */
    static midiInStart(hmi) {
        hmi := hmi is Win32Handle ? NumGet(hmi, "ptr") : hmi

        result := DllCall("WINMM.dll\midiInStart", "ptr", hmi, "uint")
        return result
    }

    /**
     * The midiInStop function stops MIDI input on the specified MIDI input device.
     * @param {HMIDIIN} hmi Handle to the MIDI input device.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midiinstop
     * @since windows5.0
     */
    static midiInStop(hmi) {
        hmi := hmi is Win32Handle ? NumGet(hmi, "ptr") : hmi

        result := DllCall("WINMM.dll\midiInStop", "ptr", hmi, "uint")
        return result
    }

    /**
     * The midiInReset function stops input on a given MIDI input device.
     * @param {HMIDIIN} hmi Handle to the MIDI input device.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midiinreset
     * @since windows5.0
     */
    static midiInReset(hmi) {
        hmi := hmi is Win32Handle ? NumGet(hmi, "ptr") : hmi

        result := DllCall("WINMM.dll\midiInReset", "ptr", hmi, "uint")
        return result
    }

    /**
     * The midiInGetID function gets the device identifier for the given MIDI input device.
     * @param {HMIDIIN} hmi Handle to the MIDI input device.
     * @param {Pointer<UInt32>} puDeviceID Pointer to a variable to be filled with the device identifier.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hwi</i> parameter specifies an invalid handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No device driver is present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate or lock memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midiingetid
     * @since windows5.0
     */
    static midiInGetID(hmi, puDeviceID) {
        hmi := hmi is Win32Handle ? NumGet(hmi, "ptr") : hmi

        result := DllCall("WINMM.dll\midiInGetID", "ptr", hmi, "uint*", puDeviceID, "uint")
        return result
    }

    /**
     * The midiInMessage function sends a message to the MIDI device driver.
     * @param {HMIDIIN} hmi Identifier of the MIDI device that receives the message. You must cast the device ID to the <b>HMIDIIN</b> handle type. If you supply a handle instead of a device ID, the function fails and returns the MMSYSERR_NOSUPPORT error code.
     * @param {Integer} uMsg Message to send.
     * @param {Pointer} dw1 Message parameter.
     * @param {Pointer} dw2 Message parameter.
     * @returns {Integer} Returns the value returned by the audio device driver.
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-midiinmessage
     * @since windows5.0
     */
    static midiInMessage(hmi, uMsg, dw1, dw2) {
        hmi := hmi is Win32Handle ? NumGet(hmi, "ptr") : hmi

        result := DllCall("WINMM.dll\midiInMessage", "ptr", hmi, "uint", uMsg, "ptr", dw1, "ptr", dw2, "uint")
        return result
    }

    /**
     * The auxGetNumDevs function retrieves the number of auxiliary output devices present in the system.
     * @returns {Integer} Returns the number of device. A return value of zero means that no devices are present or that an error occurred.
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-auxgetnumdevs
     * @since windows5.0
     */
    static auxGetNumDevs() {
        result := DllCall("WINMM.dll\auxGetNumDevs", "uint")
        return result
    }

    /**
     * The auxGetDevCaps function retrieves the capabilities of a given auxiliary output device.
     * @param {Pointer} uDeviceID Identifier of the auxiliary output device to be queried. Specify a valid device identifier (see the following comments section), or use the following constant:
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>AUX_MAPPER</td>
     * <td>Auxiliary audio mapper. The function returns an error if no auxiliary audio mapper is installed.</td>
     * </tr>
     * </table>
     * @param {Pointer} pac Pointer to an <a href="https://docs.microsoft.com/previous-versions/dd756711(v=vs.85)">AUXCAPS</a> structure to be filled with information about the capabilities of the device.
     * @param {Integer} cbac Size, in bytes, of the <a href="https://docs.microsoft.com/previous-versions/dd756711(v=vs.85)">AUXCAPS</a> structure.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_BADDEVICEID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified device identifier is out of range.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-auxgetdevcapsa
     * @since windows5.0
     */
    static auxGetDevCapsA(uDeviceID, pac, cbac) {
        result := DllCall("WINMM.dll\auxGetDevCapsA", "ptr", uDeviceID, "ptr", pac, "uint", cbac, "uint")
        return result
    }

    /**
     * The auxGetDevCaps function retrieves the capabilities of a given auxiliary output device.
     * @param {Pointer} uDeviceID Identifier of the auxiliary output device to be queried. Specify a valid device identifier (see the following comments section), or use the following constant:
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>AUX_MAPPER</td>
     * <td>Auxiliary audio mapper. The function returns an error if no auxiliary audio mapper is installed.</td>
     * </tr>
     * </table>
     * @param {Pointer} pac Pointer to an <a href="https://docs.microsoft.com/previous-versions/dd756711(v=vs.85)">AUXCAPS</a> structure to be filled with information about the capabilities of the device.
     * @param {Integer} cbac Size, in bytes, of the <a href="https://docs.microsoft.com/previous-versions/dd756711(v=vs.85)">AUXCAPS</a> structure.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_BADDEVICEID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified device identifier is out of range.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-auxgetdevcapsw
     * @since windows5.0
     */
    static auxGetDevCapsW(uDeviceID, pac, cbac) {
        result := DllCall("WINMM.dll\auxGetDevCapsW", "ptr", uDeviceID, "ptr", pac, "uint", cbac, "uint")
        return result
    }

    /**
     * The auxSetVolume function sets the volume of the specified auxiliary output device.
     * @param {Integer} uDeviceID Identifier of the auxiliary output device to be queried. Device identifiers are determined implicitly from the number of devices present in the system. Device identifier values range from zero to one less than the number of devices present. Use the <a href="https://docs.microsoft.com/previous-versions/dd756713(v=vs.85)">auxGetNumDevs</a> function to determine the number of auxiliary devices in the system.
     * @param {Integer} dwVolume Specifies the new volume setting. The low-order word specifies the left-channel volume setting, and the high-order word specifies the right-channel setting. A value of 0xFFFF represents full volume, and a value of 0x0000 is silence.
     * 
     * If a device does not support both left and right volume control, the low-order word of <i>dwVolume</i> specifies the volume level, and the high-order word is ignored.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_BADDEVICEID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified device identifier is out of range.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-auxsetvolume
     * @since windows5.0
     */
    static auxSetVolume(uDeviceID, dwVolume) {
        result := DllCall("WINMM.dll\auxSetVolume", "uint", uDeviceID, "uint", dwVolume, "uint")
        return result
    }

    /**
     * The auxGetVolume function retrieves the current volume setting of the specified auxiliary output device.
     * @param {Integer} uDeviceID Identifier of the auxiliary output device to be queried.
     * @param {Pointer<UInt32>} pdwVolume Pointer to a variable to be filled with the current volume setting. The low-order word of this location contains the left channel volume setting, and the high-order word contains the right channel setting. A value of 0xFFFF represents full volume, and a value of 0x0000 is silence.
     * 
     * If a device does not support both left and right volume control, the low-order word of the specified location contains the volume level.
     * 
     * The full 16-bit setting(s) set with the <a href="https://docs.microsoft.com/previous-versions/dd756717(v=vs.85)">auxSetVolume</a> function are returned, regardless of whether the device supports the full 16 bits of volume-level control.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_BADDEVICEID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified device identifier is out of range.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-auxgetvolume
     * @since windows5.0
     */
    static auxGetVolume(uDeviceID, pdwVolume) {
        result := DllCall("WINMM.dll\auxGetVolume", "uint", uDeviceID, "uint*", pdwVolume, "uint")
        return result
    }

    /**
     * The auxOutMessage function sends a message to the given auxiliary output device. This function also performs error checking on the device identifier passed as part of the message.
     * @param {Integer} uDeviceID Identifier of the auxiliary output device to receive the message.
     * @param {Integer} uMsg Message to send.
     * @param {Pointer} dw1 Message parameter.
     * @param {Pointer} dw2 Message parameter.
     * @returns {Integer} Returns the message return value.
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-auxoutmessage
     * @since windows5.0
     */
    static auxOutMessage(uDeviceID, uMsg, dw1, dw2) {
        result := DllCall("WINMM.dll\auxOutMessage", "uint", uDeviceID, "uint", uMsg, "ptr", dw1, "ptr", dw2, "uint")
        return result
    }

    /**
     * The mixerGetNumDevs function retrieves the number of mixer devices present in the system.
     * @returns {Integer} Returns the number of mixer devices or zero if no mixer devices are available.
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-mixergetnumdevs
     * @since windows5.0
     */
    static mixerGetNumDevs() {
        result := DllCall("WINMM.dll\mixerGetNumDevs", "uint")
        return result
    }

    /**
     * The mixerGetDevCaps function queries a specified mixer device to determine its capabilities.
     * @param {Pointer} uMxId Identifier or handle of an open mixer device.
     * @param {Pointer} pmxcaps Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixercapsa">MIXERCAPS</a> structure that receives information about the capabilities of the device.
     * @param {Integer} cbmxcaps Size, in bytes, of the <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixercapsa">MIXERCAPS</a> structure.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_BADDEVICEID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified device identifier is out of range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The mixer device handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-mixergetdevcapsa
     * @since windows5.0
     */
    static mixerGetDevCapsA(uMxId, pmxcaps, cbmxcaps) {
        result := DllCall("WINMM.dll\mixerGetDevCapsA", "ptr", uMxId, "ptr", pmxcaps, "uint", cbmxcaps, "uint")
        return result
    }

    /**
     * The mixerGetDevCaps function queries a specified mixer device to determine its capabilities.
     * @param {Pointer} uMxId Identifier or handle of an open mixer device.
     * @param {Pointer} pmxcaps Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixercapsa">MIXERCAPS</a> structure that receives information about the capabilities of the device.
     * @param {Integer} cbmxcaps Size, in bytes, of the <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixercapsa">MIXERCAPS</a> structure.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_BADDEVICEID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified device identifier is out of range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The mixer device handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-mixergetdevcapsw
     * @since windows5.0
     */
    static mixerGetDevCapsW(uMxId, pmxcaps, cbmxcaps) {
        result := DllCall("WINMM.dll\mixerGetDevCapsW", "ptr", uMxId, "ptr", pmxcaps, "uint", cbmxcaps, "uint")
        return result
    }

    /**
     * The mixerOpen function opens a specified mixer device and ensures that the device will not be removed until the application closes the handle.
     * @param {Pointer<HMIXER>} phmx Pointer to a variable that will receive a handle identifying the opened mixer device. Use this handle to identify the device when calling other audio mixer functions. This parameter cannot be <b>NULL</b>.
     * @param {Integer} uMxId Identifier of the mixer device to open. Use a valid device identifier or any <b>HMIXEROBJ</b> (see the <a href="https://docs.microsoft.com/previous-versions/dd757301(v=vs.85)">mixerGetID</a> function for a description of mixer object handles). A "mapper" for audio mixer devices does not currently exist, so a mixer device identifier of -1 is not valid.
     * @param {Pointer} dwCallback Handle to a window called when the state of an audio line and/or control associated with the device being opened is changed. Specify <b>NULL</b> for this parameter if no callback mechanism is to be used.
     * @param {Pointer} dwInstance Reserved. Must be zero.
     * @param {Integer} fdwOpen Flags for opening the device. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td><b>CALLBACK_WINDOW</b></td>
     * <td>The <i>dwCallback</i> parameter is assumed to be a window handle (<b>HWND</b>).</td>
     * </tr>
     * <tr>
     * <td><b>MIXER_OBJECTF_AUX</b></td>
     * <td>The <i>uMxId</i> parameter is an auxiliary device identifier in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd756713(v=vs.85)">auxGetNumDevs</a> function.</td>
     * </tr>
     * <tr>
     * <td><b>MIXER_OBJECTF_HMIDIIN</b></td>
     * <td>The <i>uMxId</i> parameter is the handle of a MIDI input device. This handle must have been returned by the <a href="https://docs.microsoft.com/previous-versions/dd798458(v=vs.85)">midiInOpen</a> function.</td>
     * </tr>
     * <tr>
     * <td><b>MIXER_OBJECTF_HMIDIOUT</b></td>
     * <td>The <i>uMxId</i> parameter is the handle of a MIDI output device. This handle must have been returned by the <a href="https://docs.microsoft.com/previous-versions/dd798476(v=vs.85)">midiOutOpen</a> function.</td>
     * </tr>
     * <tr>
     * <td><b>MIXER_OBJECTF_HMIXER</b></td>
     * <td>The <i>uMxId</i> parameter is a mixer device handle returned by the <b>mixerOpen</b> function. This flag is optional.</td>
     * </tr>
     * <tr>
     * <td><b>MIXER_OBJECTF_HWAVEIN</b></td>
     * <td>The <i>uMxId</i> parameter is a waveform-audio input handle returned by the <a href="https://docs.microsoft.com/previous-versions/dd743847(v=vs.85)">waveInOpen</a> function.</td>
     * </tr>
     * <tr>
     * <td><b>MIXER_OBJECTF_HWAVEOUT</b></td>
     * <td>The <i>uMxId</i> parameter is a waveform-audio output handle returned by the <a href="https://docs.microsoft.com/previous-versions/dd743866(v=vs.85)">waveOutOpen</a> function.</td>
     * </tr>
     * <tr>
     * <td><b>MIXER_OBJECTF_MIDIIN</b></td>
     * <td>The <i>uMxId</i> parameter is the identifier of a MIDI input device. This identifier must be in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd798456(v=vs.85)">midiInGetNumDevs</a> function.</td>
     * </tr>
     * <tr>
     * <td><b>MIXER_OBJECTF_MIDIOUT</b></td>
     * <td>The <i>uMxId</i> parameter is the identifier of a MIDI output device. This identifier must be in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd798472(v=vs.85)">midiOutGetNumDevs</a> function.</td>
     * </tr>
     * <tr>
     * <td><b>MIXER_OBJECTF_MIXER</b></td>
     * <td>The <i>uMxId</i> parameter is a mixer device identifier in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd757304(v=vs.85)">mixerGetNumDevs</a> function. This flag is optional.</td>
     * </tr>
     * <tr>
     * <td><b>MIXER_OBJECTF_WAVEIN</b></td>
     * <td>The <i>uMxId</i> parameter is the identifier of a waveform-audio input device in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd743844(v=vs.85)">waveInGetNumDevs</a> function.</td>
     * </tr>
     * <tr>
     * <td><b>MIXER_OBJECTF_WAVEOUT</b></td>
     * <td>The <i>uMxId</i> parameter is the identifier of a waveform-audio output device in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd743860(v=vs.85)">waveOutGetNumDevs</a> function.</td>
     * </tr>
     * </table>
     * @returns {Integer} Returns <b>MMSYSERR_NOERROR</b> if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_ALLOCATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified resource is already allocated by the maximum number of clients possible.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_BADDEVICEID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>uMxId</i> parameter specifies an invalid device identifier.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more flags are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>uMxId</i> parameter specifies an invalid handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No mixer device is available for the object specified by <i>uMxId</i>. Note that the location referenced by <i>uMxId</i> will also contain the value –1.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate resources.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-mixeropen
     * @since windows5.0
     */
    static mixerOpen(phmx, uMxId, dwCallback, dwInstance, fdwOpen) {
        result := DllCall("WINMM.dll\mixerOpen", "ptr", phmx, "uint", uMxId, "ptr", dwCallback, "ptr", dwInstance, "uint", fdwOpen, "uint")
        return result
    }

    /**
     * The mixerClose function closes the specified mixer device.
     * @param {HMIXER} hmx Handle to the mixer device. This handle must have been returned successfully by the <a href="https://docs.microsoft.com/previous-versions/dd757308(v=vs.85)">mixerOpen</a> function. If <b>mixerClose</b> is successful, <i>hmx</i> is no longer valid.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-mixerclose
     * @since windows5.0
     */
    static mixerClose(hmx) {
        hmx := hmx is Win32Handle ? NumGet(hmx, "ptr") : hmx

        result := DllCall("WINMM.dll\mixerClose", "ptr", hmx, "uint")
        return result
    }

    /**
     * The mixerMessage function sends a custom mixer driver message directly to a mixer driver.
     * @param {HMIXER} hmx Identifier of the mixer that receives the message. You must cast the device ID to the <b>HMIXER</b> handle type. If you supply a handle instead of a device ID, the function fails and returns the MMSYSERR_NOSUPPORT error code.
     * @param {Integer} uMsg Custom mixer driver message to send to the mixer driver. This message must be above or equal to the MXDM_USER constant.
     * @param {Pointer} dwParam1 Parameter associated with the message being sent.
     * @param {Pointer} dwParam2 Parameter associated with the message being sent.
     * @returns {Integer} Returns a value that is specific to the custom mixer driver message. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified device handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>uMsg</i> parameter specified in the MXDM_USER message is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOSUPPORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>deviceID</i> parameter must be a valid device ID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The mixer device did not process the message.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-mixermessage
     * @since windows5.0
     */
    static mixerMessage(hmx, uMsg, dwParam1, dwParam2) {
        hmx := hmx is Win32Handle ? NumGet(hmx, "ptr") : hmx

        result := DllCall("WINMM.dll\mixerMessage", "ptr", hmx, "uint", uMsg, "ptr", dwParam1, "ptr", dwParam2, "uint")
        return result
    }

    /**
     * The mixerGetLineInfo function retrieves information about a specific line of a mixer device.
     * @param {HMIXEROBJ} hmxobj Handle to the mixer device object that controls the specific audio line.
     * @param {Pointer<MIXERLINEA>} pmxl Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixerlinea">MIXERLINE</a> structure. This structure is filled with information about the audio line for the mixer device. The <b>cbStruct</b> member must always be initialized to be the size, in bytes, of the <b>MIXERLINE</b> structure.
     * @param {Integer} fdwInfo Flags for retrieving information about an audio line. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>MIXER_GETLINEINFOF_COMPONENTTYPE</td>
     * <td>The <i>pmxl</i> parameter will receive information about the first audio line of the type specified in the <b>dwComponentType</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixerlinea">MIXERLINE</a> structure. This flag is used to retrieve information about an audio line of a specific component type. Remaining structure members except <b>cbStruct</b> require no further initialization.</td>
     * </tr>
     * <tr>
     * <td>MIXER_GETLINEINFOF_DESTINATION</td>
     * <td>The <i>pmxl</i> parameter will receive information about the destination audio line specified by the <b>dwDestination</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixerlinea">MIXERLINE</a> structure. This index ranges from zero to one less than the value in the <b>cDestinations</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixercapsa">MIXERCAPS</a> structure. All remaining structure members except <b>cbStruct</b> require no further initialization.</td>
     * </tr>
     * <tr>
     * <td>MIXER_GETLINEINFOF_LINEID</td>
     * <td>The <i>pmxl</i> parameter will receive information about the audio line specified by the <b>dwLineID</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixerlinea">MIXERLINE</a> structure. This is usually used to retrieve updated information about the state of an audio line. All remaining structure members except <b>cbStruct</b> require no further initialization.</td>
     * </tr>
     * <tr>
     * <td>MIXER_GETLINEINFOF_SOURCE</td>
     * <td>The <i>pmxl</i> parameter will receive information about the source audio line specified by the <b>dwDestination</b> and <b>dwSource</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixerlinea">MIXERLINE</a> structure. The index specified by <b>dwDestination</b> ranges from zero to one less than the value in the <b>cDestinations</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixercapsa">MIXERCAPS</a> structure. The index specified by <b>dwSource</b> ranges from zero to one less than the value in the <b>cConnections</b> member of the <b>MIXERLINE</b> structure returned for the audio line stored in the <b>dwDestination</b> member. All remaining structure members except <b>cbStruct</b> require no further initialization.</td>
     * </tr>
     * <tr>
     * <td>MIXER_GETLINEINFOF_TARGETTYPE</td>
     * <td>The <i>pmxl</i> parameter will receive information about the audio line that is for the <b>dwType</b> member of the <b>Target</b> structure, which is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixerlinea">MIXERLINE</a> structure. This flag is used to retrieve information about an audio line that handles the target type (for example, <b>MIXERLINE_TARGETTYPE_WAVEOUT</b>). The application must initialize the <b>dwType</b>, <b>wMid</b>, <b>wPid</b>, <b>vDriverVersion</b> and <b>szPname</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixerlinea">MIXERLINE</a> structure before calling <b>mixerGetLineInfo</b>. All of these values can be retrieved from the device capabilities structures for all media devices. Remaining structure members except <b>cbStruct</b> require no further initialization.
     * 
     * 
     * <div class="alert"><b>Note</b>  In the ANSI version of this function (<b>mixerGetLineInfoA</b>), you cannot use the ANSI string returned from <b>mixerGetLineInfo</b> or <a href="https://docs.microsoft.com/previous-versions/dd743857(v=vs.85)">waveOutGetDevCaps</a> for the value of the <b>psPname</b> string when calling <b>mixerGetLineInfo</b> with the <b>MIXER_GETLINEINFOF_TARGETTYPE</b> flag. The reason is that an internal conversion to and from Unicode is performed, which might  result in loss of data. </div>
     * <div> </div>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_AUX</td>
     * <td>The <i>hmxobj</i> parameter is an auxiliary device identifier in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd756713(v=vs.85)">auxGetNumDevs</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HMIDIIN</td>
     * <td>The <i>hmxobj</i> parameter is the handle of a MIDI input device. This handle must have been returned by the <a href="https://docs.microsoft.com/previous-versions/dd798458(v=vs.85)">midiInOpen</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HMIDIOUT</td>
     * <td>The <i>hmxobj</i> parameter is the handle of a MIDI output device. This handle must have been returned by the <a href="https://docs.microsoft.com/previous-versions/dd798476(v=vs.85)">midiOutOpen</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HMIXER</td>
     * <td>The <i>hmxobj</i> parameter is a mixer device handle returned by the <a href="https://docs.microsoft.com/previous-versions/dd757308(v=vs.85)">mixerOpen</a> function. This flag is optional.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HWAVEIN</td>
     * <td>The <i>hmxobj</i> parameter is a waveform-audio input handle returned by the <a href="https://docs.microsoft.com/previous-versions/dd743847(v=vs.85)">waveInOpen</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HWAVEOUT</td>
     * <td>The <i>hmxobj</i> parameter is a waveform-audio output handle returned by the <a href="https://docs.microsoft.com/previous-versions/dd743866(v=vs.85)">waveOutOpen</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_MIDIIN</td>
     * <td>The <i>hmxobj</i> parameter is the identifier of a MIDI input device. This identifier must be in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd798456(v=vs.85)">midiInGetNumDevs</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_MIDIOUT</td>
     * <td>The <i>hmxobj</i> parameter is the identifier of a MIDI output device. This identifier must be in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd798472(v=vs.85)">midiOutGetNumDevs</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_MIXER</td>
     * <td>The <i>hmxobj</i> parameter is a mixer device identifier in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd757304(v=vs.85)">mixerGetNumDevs</a> function. This flag is optional.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_WAVEIN</td>
     * <td>The <i>hmxobj</i> parameter is the identifier of a waveform-audio input device in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd743844(v=vs.85)">waveInGetNumDevs</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_WAVEOUT</td>
     * <td>The <i>hmxobj</i> parameter is the identifier of a waveform-audio output device in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd743860(v=vs.85)">waveOutGetNumDevs</a> function.</td>
     * </tr>
     * </table>
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MIXERR_INVALLINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The audio line reference is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_BADDEVICEID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hmxobj</i> parameter specifies an invalid device identifier.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more flags are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hmxobj</i> parameter specifies an invalid handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No mixer device is available for the object specified by <i>hmxobj</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-mixergetlineinfoa
     * @since windows5.0
     */
    static mixerGetLineInfoA(hmxobj, pmxl, fdwInfo) {
        hmxobj := hmxobj is Win32Handle ? NumGet(hmxobj, "ptr") : hmxobj

        result := DllCall("WINMM.dll\mixerGetLineInfoA", "ptr", hmxobj, "ptr", pmxl, "uint", fdwInfo, "uint")
        return result
    }

    /**
     * The mixerGetLineInfo function retrieves information about a specific line of a mixer device.
     * @param {HMIXEROBJ} hmxobj Handle to the mixer device object that controls the specific audio line.
     * @param {Pointer<MIXERLINEW>} pmxl Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixerlinea">MIXERLINE</a> structure. This structure is filled with information about the audio line for the mixer device. The <b>cbStruct</b> member must always be initialized to be the size, in bytes, of the <b>MIXERLINE</b> structure.
     * @param {Integer} fdwInfo Flags for retrieving information about an audio line. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>MIXER_GETLINEINFOF_COMPONENTTYPE</td>
     * <td>The <i>pmxl</i> parameter will receive information about the first audio line of the type specified in the <b>dwComponentType</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixerlinea">MIXERLINE</a> structure. This flag is used to retrieve information about an audio line of a specific component type. Remaining structure members except <b>cbStruct</b> require no further initialization.</td>
     * </tr>
     * <tr>
     * <td>MIXER_GETLINEINFOF_DESTINATION</td>
     * <td>The <i>pmxl</i> parameter will receive information about the destination audio line specified by the <b>dwDestination</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixerlinea">MIXERLINE</a> structure. This index ranges from zero to one less than the value in the <b>cDestinations</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixercapsa">MIXERCAPS</a> structure. All remaining structure members except <b>cbStruct</b> require no further initialization.</td>
     * </tr>
     * <tr>
     * <td>MIXER_GETLINEINFOF_LINEID</td>
     * <td>The <i>pmxl</i> parameter will receive information about the audio line specified by the <b>dwLineID</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixerlinea">MIXERLINE</a> structure. This is usually used to retrieve updated information about the state of an audio line. All remaining structure members except <b>cbStruct</b> require no further initialization.</td>
     * </tr>
     * <tr>
     * <td>MIXER_GETLINEINFOF_SOURCE</td>
     * <td>The <i>pmxl</i> parameter will receive information about the source audio line specified by the <b>dwDestination</b> and <b>dwSource</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixerlinea">MIXERLINE</a> structure. The index specified by <b>dwDestination</b> ranges from zero to one less than the value in the <b>cDestinations</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixercapsa">MIXERCAPS</a> structure. The index specified by <b>dwSource</b> ranges from zero to one less than the value in the <b>cConnections</b> member of the <b>MIXERLINE</b> structure returned for the audio line stored in the <b>dwDestination</b> member. All remaining structure members except <b>cbStruct</b> require no further initialization.</td>
     * </tr>
     * <tr>
     * <td>MIXER_GETLINEINFOF_TARGETTYPE</td>
     * <td>The <i>pmxl</i> parameter will receive information about the audio line that is for the <b>dwType</b> member of the <b>Target</b> structure, which is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixerlinea">MIXERLINE</a> structure. This flag is used to retrieve information about an audio line that handles the target type (for example, <b>MIXERLINE_TARGETTYPE_WAVEOUT</b>). The application must initialize the <b>dwType</b>, <b>wMid</b>, <b>wPid</b>, <b>vDriverVersion</b> and <b>szPname</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixerlinea">MIXERLINE</a> structure before calling <b>mixerGetLineInfo</b>. All of these values can be retrieved from the device capabilities structures for all media devices. Remaining structure members except <b>cbStruct</b> require no further initialization.
     * 
     * 
     * <div class="alert"><b>Note</b>  In the ANSI version of this function (<b>mixerGetLineInfoA</b>), you cannot use the ANSI string returned from <b>mixerGetLineInfo</b> or <a href="https://docs.microsoft.com/previous-versions/dd743857(v=vs.85)">waveOutGetDevCaps</a> for the value of the <b>psPname</b> string when calling <b>mixerGetLineInfo</b> with the <b>MIXER_GETLINEINFOF_TARGETTYPE</b> flag. The reason is that an internal conversion to and from Unicode is performed, which might  result in loss of data. </div>
     * <div> </div>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_AUX</td>
     * <td>The <i>hmxobj</i> parameter is an auxiliary device identifier in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd756713(v=vs.85)">auxGetNumDevs</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HMIDIIN</td>
     * <td>The <i>hmxobj</i> parameter is the handle of a MIDI input device. This handle must have been returned by the <a href="https://docs.microsoft.com/previous-versions/dd798458(v=vs.85)">midiInOpen</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HMIDIOUT</td>
     * <td>The <i>hmxobj</i> parameter is the handle of a MIDI output device. This handle must have been returned by the <a href="https://docs.microsoft.com/previous-versions/dd798476(v=vs.85)">midiOutOpen</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HMIXER</td>
     * <td>The <i>hmxobj</i> parameter is a mixer device handle returned by the <a href="https://docs.microsoft.com/previous-versions/dd757308(v=vs.85)">mixerOpen</a> function. This flag is optional.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HWAVEIN</td>
     * <td>The <i>hmxobj</i> parameter is a waveform-audio input handle returned by the <a href="https://docs.microsoft.com/previous-versions/dd743847(v=vs.85)">waveInOpen</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HWAVEOUT</td>
     * <td>The <i>hmxobj</i> parameter is a waveform-audio output handle returned by the <a href="https://docs.microsoft.com/previous-versions/dd743866(v=vs.85)">waveOutOpen</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_MIDIIN</td>
     * <td>The <i>hmxobj</i> parameter is the identifier of a MIDI input device. This identifier must be in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd798456(v=vs.85)">midiInGetNumDevs</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_MIDIOUT</td>
     * <td>The <i>hmxobj</i> parameter is the identifier of a MIDI output device. This identifier must be in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd798472(v=vs.85)">midiOutGetNumDevs</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_MIXER</td>
     * <td>The <i>hmxobj</i> parameter is a mixer device identifier in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd757304(v=vs.85)">mixerGetNumDevs</a> function. This flag is optional.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_WAVEIN</td>
     * <td>The <i>hmxobj</i> parameter is the identifier of a waveform-audio input device in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd743844(v=vs.85)">waveInGetNumDevs</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_WAVEOUT</td>
     * <td>The <i>hmxobj</i> parameter is the identifier of a waveform-audio output device in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd743860(v=vs.85)">waveOutGetNumDevs</a> function.</td>
     * </tr>
     * </table>
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MIXERR_INVALLINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The audio line reference is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_BADDEVICEID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hmxobj</i> parameter specifies an invalid device identifier.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more flags are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hmxobj</i> parameter specifies an invalid handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No mixer device is available for the object specified by <i>hmxobj</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-mixergetlineinfow
     * @since windows5.0
     */
    static mixerGetLineInfoW(hmxobj, pmxl, fdwInfo) {
        hmxobj := hmxobj is Win32Handle ? NumGet(hmxobj, "ptr") : hmxobj

        result := DllCall("WINMM.dll\mixerGetLineInfoW", "ptr", hmxobj, "ptr", pmxl, "uint", fdwInfo, "uint")
        return result
    }

    /**
     * The mixerGetID function retrieves the device identifier for a mixer device associated with a specified device handle.
     * @param {HMIXEROBJ} hmxobj Handle to the audio mixer object to map to a mixer device identifier.
     * @param {Pointer<UInt32>} puMxId Pointer to a variable that receives the mixer device identifier. If no mixer device is available for the <i>hmxobj</i> object, the value -1 is placed in this location and the MMSYSERR_NODRIVER error value is returned.
     * @param {Integer} fdwId Flags for mapping the mixer object <i>hmxobj</i>. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_AUX</td>
     * <td>The <i>hmxobj</i> parameter is an auxiliary device identifier in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd756713(v=vs.85)">auxGetNumDevs</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HMIDIIN</td>
     * <td>The <i>hmxobj</i> parameter is the handle of a MIDI input device. This handle must have been returned by the <a href="https://docs.microsoft.com/previous-versions/dd798458(v=vs.85)">midiInOpen</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HMIDIOUT</td>
     * <td>The <i>hmxobj</i> parameter is the handle of a MIDI output device. This handle must have been returned by the <a href="https://docs.microsoft.com/previous-versions/dd798476(v=vs.85)">midiOutOpen</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HMIXER</td>
     * <td>The <i>hmxobj</i> parameter is a mixer device handle returned by the <a href="https://docs.microsoft.com/previous-versions/dd757308(v=vs.85)">mixerOpen</a> function. This flag is optional.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HWAVEIN</td>
     * <td>The <i>hmxobj</i> parameter is a waveform-audio input handle returned by the <a href="https://docs.microsoft.com/previous-versions/dd743847(v=vs.85)">waveInOpen</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HWAVEOUT</td>
     * <td>The <i>hmxobj</i> parameter is a waveform-audio output handle returned by the <a href="https://docs.microsoft.com/previous-versions/dd743866(v=vs.85)">waveOutOpen</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_MIDIIN</td>
     * <td>The <i>hmxobj</i> parameter is the identifier of a MIDI input device. This identifier must be in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd798456(v=vs.85)">midiInGetNumDevs</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_MIDIOUT</td>
     * <td>The <i>hmxobj</i> parameter is the identifier of a MIDI output device. This identifier must be in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd798472(v=vs.85)">midiOutGetNumDevs</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_MIXER</td>
     * <td>The <i>hmxobj</i> parameter is the identifier of a mixer device in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd757304(v=vs.85)">mixerGetNumDevs</a> function. This flag is optional.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_WAVEIN</td>
     * <td>The <i>hmxobj</i> parameter is the identifier of a waveform-audio input device in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd743844(v=vs.85)">waveInGetNumDevs</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_WAVEOUT</td>
     * <td>The <i>hmxobj</i> parameter is the identifier of a waveform-audio output device in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd743860(v=vs.85)">waveOutGetNumDevs</a> function.</td>
     * </tr>
     * </table>
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_BADDEVICEID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hmxobj</i> parameter specifies an invalid device identifier.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more flags are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hmxobj</i> parameter specifies an invalid handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No audio mixer device is available for the object specified by <i>hmxobj</i>. The location referenced by <i>puMxId</i> also contains the value -1.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-mixergetid
     * @since windows5.0
     */
    static mixerGetID(hmxobj, puMxId, fdwId) {
        hmxobj := hmxobj is Win32Handle ? NumGet(hmxobj, "ptr") : hmxobj

        result := DllCall("WINMM.dll\mixerGetID", "ptr", hmxobj, "uint*", puMxId, "uint", fdwId, "uint")
        return result
    }

    /**
     * The mixerGetLineControls function retrieves one or more controls associated with an audio line.
     * @param {HMIXEROBJ} hmxobj Handle to the mixer device object that is being queried.
     * @param {Pointer<MIXERLINECONTROLSA>} pmxlc Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixerlinecontrolsa">MIXERLINECONTROLS</a> structure. This structure is used to reference one or more <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixercontrola">MIXERCONTROL</a> structures to be filled with information about the controls associated with an audio line. The <b>cbStruct</b> member of the <b>MIXERLINECONTROLS</b> structure must always be initialized to be the size, in bytes, of the <b>MIXERLINECONTROLS</b> structure.
     * @param {Integer} fdwControls Flags for retrieving information about one or more controls associated with an audio line. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>MIXER_GETLINECONTROLSF_ALL</td>
     * <td>The <i>pmxlc</i> parameter references a list of <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixercontrola">MIXERCONTROL</a> structures that will receive information on all controls associated with the audio line identified by the <b>dwLineID</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixerlinecontrolsa">MIXERLINECONTROLS</a> structure. The <b>cControls</b> member must be initialized to the number of controls associated with the line. This number is retrieved from the <b>cControls</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixerlinea">MIXERLINE</a> structure returned by the <a href="https://docs.microsoft.com/previous-versions/dd757303(v=vs.85)">mixerGetLineInfo</a> function. The <b>cbmxctrl</b> member must be initialized to the size, in bytes, of a single <b>MIXERCONTROL</b> structure. The <b>pamxctrl</b> member must point to the first <b>MIXERCONTROL</b> structure to be filled. The <b>dwControlID</b> and <b>dwControlType</b> members are ignored for this query.</td>
     * </tr>
     * <tr>
     * <td>MIXER_GETLINECONTROLSF_ONEBYID</td>
     * <td>The <i>pmxlc</i> parameter references a single <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixercontrola">MIXERCONTROL</a> structure that will receive information on the control identified by the <b>dwControlID</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixerlinecontrolsa">MIXERLINECONTROLS</a> structure. The <b>cControls</b> member must be initialized to 1. The <b>cbmxctrl</b> member must be initialized to the size, in bytes, of a single <b>MIXERCONTROL</b> structure. The <b>pamxctrl</b> member must point to a <b>MIXERCONTROL</b> structure to be filled. The <b>dwLineID</b> and <b>dwControlType</b> members are ignored for this query. This query is usually used to refresh a control after receiving a <a href="https://docs.microsoft.com/windows/desktop/Multimedia/mm-mixm-control-change">MM_MIXM_CONTROL_CHANGE</a> control change notification message by the user-defined callback (see <a href="https://docs.microsoft.com/previous-versions/dd757308(v=vs.85)">mixerOpen</a>).</td>
     * </tr>
     * <tr>
     * <td>MIXER_GETLINECONTROLSF_ONEBYTYPE</td>
     * <td>The <b>mixerGetLineControls</b> function retrieves information about the first control of a specific class for the audio line that is being queried. The <i>pmxlc</i> parameter references a single <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixercontrola">MIXERCONTROL</a> structure that will receive information about the specific control. The audio line is identified by the <b>dwLineID</b> member. The control class is specified in the <b>dwControlType</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixerlinecontrolsa">MIXERLINECONTROLS</a> structure.The <b>dwControlID</b> member is ignored for this query. This query can be used by an application to get information on a single control associated with a line. For example, you might want your application to use a peak meter only from a waveform-audio output line.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_AUX</td>
     * <td>The <i>hmxobj</i> parameter is an auxiliary device identifier in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd756713(v=vs.85)">auxGetNumDevs</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HMIDIIN</td>
     * <td>The <i>hmxobj</i> parameter is the handle of a MIDI input device. This handle must have been returned by the <a href="https://docs.microsoft.com/previous-versions/dd798458(v=vs.85)">midiInOpen</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HMIDIOUT</td>
     * <td>The <i>hmxobj</i> parameter is the handle of a MIDI output device. This handle must have been returned by the <a href="https://docs.microsoft.com/previous-versions/dd798476(v=vs.85)">midiOutOpen</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HMIXER</td>
     * <td>The <i>hmxobj</i> parameter is a mixer device handle returned by the <a href="https://docs.microsoft.com/previous-versions/dd757308(v=vs.85)">mixerOpen</a> function. This flag is optional.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HWAVEIN</td>
     * <td>The <i>hmxobj</i> parameter is a waveform-audio input handle returned by the <a href="https://docs.microsoft.com/previous-versions/dd743847(v=vs.85)">waveInOpen</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HWAVEOUT</td>
     * <td>The <i>hmxobj</i> parameter is a waveform-audio output handle returned by the <a href="https://docs.microsoft.com/previous-versions/dd743866(v=vs.85)">waveOutOpen</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_MIDIIN</td>
     * <td>The <i>hmxobj</i> parameter is the identifier of a MIDI input device. This identifier must be in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd798456(v=vs.85)">midiInGetNumDevs</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_MIDIOUT</td>
     * <td>The <i>hmxobj</i> parameter is the identifier of a MIDI output device. This identifier must be in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd798472(v=vs.85)">midiOutGetNumDevs</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_MIXER</td>
     * <td>The <i>hmxobj</i> parameter is the identifier of a mixer device in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd757304(v=vs.85)">mixerGetNumDevs</a> function. This flag is optional.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_WAVEIN</td>
     * <td>The <i>hmxobj</i> parameter is the identifier of a waveform-audio input device in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd743844(v=vs.85)">waveInGetNumDevs</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_WAVEOUT</td>
     * <td>The <i>hmxobj</i> parameter is the identifier of a waveform-audio output device in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd743860(v=vs.85)">waveOutGetNumDevs</a> function.</td>
     * </tr>
     * </table>
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MIXERR_INVALCONTROL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The control reference is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MIXERR_INVALLINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The audio line reference is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_BADDEVICEID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hmxobj</i> parameter specifies an invalid device identifier.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more flags are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hmxobj</i> parameter specifies an invalid handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No mixer device is available for the object specified by <i>hmxobj</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-mixergetlinecontrolsa
     * @since windows5.0
     */
    static mixerGetLineControlsA(hmxobj, pmxlc, fdwControls) {
        hmxobj := hmxobj is Win32Handle ? NumGet(hmxobj, "ptr") : hmxobj

        result := DllCall("WINMM.dll\mixerGetLineControlsA", "ptr", hmxobj, "ptr", pmxlc, "uint", fdwControls, "uint")
        return result
    }

    /**
     * The mixerGetLineControls function retrieves one or more controls associated with an audio line.
     * @param {HMIXEROBJ} hmxobj Handle to the mixer device object that is being queried.
     * @param {Pointer<MIXERLINECONTROLSW>} pmxlc Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixerlinecontrolsa">MIXERLINECONTROLS</a> structure. This structure is used to reference one or more <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixercontrola">MIXERCONTROL</a> structures to be filled with information about the controls associated with an audio line. The <b>cbStruct</b> member of the <b>MIXERLINECONTROLS</b> structure must always be initialized to be the size, in bytes, of the <b>MIXERLINECONTROLS</b> structure.
     * @param {Integer} fdwControls Flags for retrieving information about one or more controls associated with an audio line. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>MIXER_GETLINECONTROLSF_ALL</td>
     * <td>The <i>pmxlc</i> parameter references a list of <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixercontrola">MIXERCONTROL</a> structures that will receive information on all controls associated with the audio line identified by the <b>dwLineID</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixerlinecontrolsa">MIXERLINECONTROLS</a> structure. The <b>cControls</b> member must be initialized to the number of controls associated with the line. This number is retrieved from the <b>cControls</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixerlinea">MIXERLINE</a> structure returned by the <a href="https://docs.microsoft.com/previous-versions/dd757303(v=vs.85)">mixerGetLineInfo</a> function. The <b>cbmxctrl</b> member must be initialized to the size, in bytes, of a single <b>MIXERCONTROL</b> structure. The <b>pamxctrl</b> member must point to the first <b>MIXERCONTROL</b> structure to be filled. The <b>dwControlID</b> and <b>dwControlType</b> members are ignored for this query.</td>
     * </tr>
     * <tr>
     * <td>MIXER_GETLINECONTROLSF_ONEBYID</td>
     * <td>The <i>pmxlc</i> parameter references a single <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixercontrola">MIXERCONTROL</a> structure that will receive information on the control identified by the <b>dwControlID</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixerlinecontrolsa">MIXERLINECONTROLS</a> structure. The <b>cControls</b> member must be initialized to 1. The <b>cbmxctrl</b> member must be initialized to the size, in bytes, of a single <b>MIXERCONTROL</b> structure. The <b>pamxctrl</b> member must point to a <b>MIXERCONTROL</b> structure to be filled. The <b>dwLineID</b> and <b>dwControlType</b> members are ignored for this query. This query is usually used to refresh a control after receiving a <a href="https://docs.microsoft.com/windows/desktop/Multimedia/mm-mixm-control-change">MM_MIXM_CONTROL_CHANGE</a> control change notification message by the user-defined callback (see <a href="https://docs.microsoft.com/previous-versions/dd757308(v=vs.85)">mixerOpen</a>).</td>
     * </tr>
     * <tr>
     * <td>MIXER_GETLINECONTROLSF_ONEBYTYPE</td>
     * <td>The <b>mixerGetLineControls</b> function retrieves information about the first control of a specific class for the audio line that is being queried. The <i>pmxlc</i> parameter references a single <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixercontrola">MIXERCONTROL</a> structure that will receive information about the specific control. The audio line is identified by the <b>dwLineID</b> member. The control class is specified in the <b>dwControlType</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixerlinecontrolsa">MIXERLINECONTROLS</a> structure.The <b>dwControlID</b> member is ignored for this query. This query can be used by an application to get information on a single control associated with a line. For example, you might want your application to use a peak meter only from a waveform-audio output line.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_AUX</td>
     * <td>The <i>hmxobj</i> parameter is an auxiliary device identifier in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd756713(v=vs.85)">auxGetNumDevs</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HMIDIIN</td>
     * <td>The <i>hmxobj</i> parameter is the handle of a MIDI input device. This handle must have been returned by the <a href="https://docs.microsoft.com/previous-versions/dd798458(v=vs.85)">midiInOpen</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HMIDIOUT</td>
     * <td>The <i>hmxobj</i> parameter is the handle of a MIDI output device. This handle must have been returned by the <a href="https://docs.microsoft.com/previous-versions/dd798476(v=vs.85)">midiOutOpen</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HMIXER</td>
     * <td>The <i>hmxobj</i> parameter is a mixer device handle returned by the <a href="https://docs.microsoft.com/previous-versions/dd757308(v=vs.85)">mixerOpen</a> function. This flag is optional.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HWAVEIN</td>
     * <td>The <i>hmxobj</i> parameter is a waveform-audio input handle returned by the <a href="https://docs.microsoft.com/previous-versions/dd743847(v=vs.85)">waveInOpen</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HWAVEOUT</td>
     * <td>The <i>hmxobj</i> parameter is a waveform-audio output handle returned by the <a href="https://docs.microsoft.com/previous-versions/dd743866(v=vs.85)">waveOutOpen</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_MIDIIN</td>
     * <td>The <i>hmxobj</i> parameter is the identifier of a MIDI input device. This identifier must be in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd798456(v=vs.85)">midiInGetNumDevs</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_MIDIOUT</td>
     * <td>The <i>hmxobj</i> parameter is the identifier of a MIDI output device. This identifier must be in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd798472(v=vs.85)">midiOutGetNumDevs</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_MIXER</td>
     * <td>The <i>hmxobj</i> parameter is the identifier of a mixer device in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd757304(v=vs.85)">mixerGetNumDevs</a> function. This flag is optional.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_WAVEIN</td>
     * <td>The <i>hmxobj</i> parameter is the identifier of a waveform-audio input device in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd743844(v=vs.85)">waveInGetNumDevs</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_WAVEOUT</td>
     * <td>The <i>hmxobj</i> parameter is the identifier of a waveform-audio output device in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd743860(v=vs.85)">waveOutGetNumDevs</a> function.</td>
     * </tr>
     * </table>
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MIXERR_INVALCONTROL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The control reference is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MIXERR_INVALLINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The audio line reference is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_BADDEVICEID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hmxobj</i> parameter specifies an invalid device identifier.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more flags are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hmxobj</i> parameter specifies an invalid handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No mixer device is available for the object specified by <i>hmxobj</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-mixergetlinecontrolsw
     * @since windows5.0
     */
    static mixerGetLineControlsW(hmxobj, pmxlc, fdwControls) {
        hmxobj := hmxobj is Win32Handle ? NumGet(hmxobj, "ptr") : hmxobj

        result := DllCall("WINMM.dll\mixerGetLineControlsW", "ptr", hmxobj, "ptr", pmxlc, "uint", fdwControls, "uint")
        return result
    }

    /**
     * The mixerGetControlDetails function retrieves details about a single control associated with an audio line.
     * @param {HMIXEROBJ} hmxobj Handle to the mixer device object being queried.
     * @param {Pointer<MIXERCONTROLDETAILS>} pmxcd Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixercontroldetails_listtexta">MIXERCONTROLDETAILS</a> structure, which is filled with state information about the control.
     * @param {Integer} fdwDetails Flags for retrieving control details. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>MIXER_GETCONTROLDETAILSF_LISTTEXT</td>
     * <td>The <b>paDetails</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixercontroldetails_listtexta">MIXERCONTROLDETAILS</a> structure points to one or more <a href="https://docs.microsoft.com/previous-versions/dd757296(v=vs.85)">MIXERCONTROLDETAILS_LISTTEXT</a> structures to receive text labels for multiple-item controls. An application must get all list text items for a multiple-item control at once. This flag cannot be used with MIXERCONTROL_CONTROLTYPE_CUSTOM controls.</td>
     * </tr>
     * <tr>
     * <td>MIXER_GETCONTROLDETAILSF_VALUE</td>
     * <td>Current values for a control are retrieved. The <b>paDetails</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixercontroldetails_listtexta">MIXERCONTROLDETAILS</a> structure points to one or more details structures appropriate for the control class.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_AUX</td>
     * <td>The <i>hmxobj</i> parameter is an auxiliary device identifier in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd756713(v=vs.85)">auxGetNumDevs</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HMIDIIN</td>
     * <td>The <i>hmxobj</i> parameter is the handle of a MIDI (Musical Instrument Digital Interface) input device. This handle must have been returned by the <a href="https://docs.microsoft.com/previous-versions/dd798458(v=vs.85)">midiInOpen</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HMIDIOUT</td>
     * <td>The <i>hmxobj</i> parameter is the handle of a MIDI output device. This handle must have been returned by the <a href="https://docs.microsoft.com/previous-versions/dd798476(v=vs.85)">midiOutOpen</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HMIXER</td>
     * <td>The <i>hmxobj</i> parameter is a mixer device handle returned by the <a href="https://docs.microsoft.com/previous-versions/dd757308(v=vs.85)">mixerOpen</a> function. This flag is optional.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HWAVEIN</td>
     * <td>The <i>hmxobj</i> parameter is a waveform-audio input handle returned by the <a href="https://docs.microsoft.com/previous-versions/dd743847(v=vs.85)">waveInOpen</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HWAVEOUT</td>
     * <td>The <i>hmxobj</i> parameter is a waveform-audio output handle returned by the <a href="https://docs.microsoft.com/previous-versions/dd743866(v=vs.85)">waveOutOpen</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_MIDIIN</td>
     * <td>The <i>hmxobj</i> parameter is the identifier of a MIDI input device. This identifier must be in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd798456(v=vs.85)">midiInGetNumDevs</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_MIDIOUT</td>
     * <td>The <i>hmxobj</i> parameter is the identifier of a MIDI output device. This identifier must be in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd798472(v=vs.85)">midiOutGetNumDevs</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_MIXER</td>
     * <td>The <i>hmxobj</i> parameter is the identifier of a mixer device in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd757304(v=vs.85)">mixerGetNumDevs</a> function. This flag is optional.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_WAVEIN</td>
     * <td>The <i>hmxobj</i> parameter is the identifier of a waveform-audio input device in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd743844(v=vs.85)">waveInGetNumDevs</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_WAVEOUT</td>
     * <td>The <i>hmxobj</i> parameter is the identifier of a waveform-audio output device in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd743860(v=vs.85)">waveOutGetNumDevs</a> function.</td>
     * </tr>
     * </table>
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MIXERR_INVALCONTROL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The control reference is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_BADDEVICEID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hmxobj</i> parameter specifies an invalid device identifier.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more flags are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hmxobj</i> parameter specifies an invalid handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No mixer device is available for the object specified by <i>hmxobj</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-mixergetcontroldetailsa
     * @since windows5.0
     */
    static mixerGetControlDetailsA(hmxobj, pmxcd, fdwDetails) {
        hmxobj := hmxobj is Win32Handle ? NumGet(hmxobj, "ptr") : hmxobj

        result := DllCall("WINMM.dll\mixerGetControlDetailsA", "ptr", hmxobj, "ptr", pmxcd, "uint", fdwDetails, "uint")
        return result
    }

    /**
     * The mixerGetControlDetails function retrieves details about a single control associated with an audio line.
     * @param {HMIXEROBJ} hmxobj Handle to the mixer device object being queried.
     * @param {Pointer<MIXERCONTROLDETAILS>} pmxcd Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixercontroldetails_listtexta">MIXERCONTROLDETAILS</a> structure, which is filled with state information about the control.
     * @param {Integer} fdwDetails Flags for retrieving control details. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>MIXER_GETCONTROLDETAILSF_LISTTEXT</td>
     * <td>The <b>paDetails</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixercontroldetails_listtexta">MIXERCONTROLDETAILS</a> structure points to one or more <a href="https://docs.microsoft.com/previous-versions/dd757296(v=vs.85)">MIXERCONTROLDETAILS_LISTTEXT</a> structures to receive text labels for multiple-item controls. An application must get all list text items for a multiple-item control at once. This flag cannot be used with MIXERCONTROL_CONTROLTYPE_CUSTOM controls.</td>
     * </tr>
     * <tr>
     * <td>MIXER_GETCONTROLDETAILSF_VALUE</td>
     * <td>Current values for a control are retrieved. The <b>paDetails</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixercontroldetails_listtexta">MIXERCONTROLDETAILS</a> structure points to one or more details structures appropriate for the control class.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_AUX</td>
     * <td>The <i>hmxobj</i> parameter is an auxiliary device identifier in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd756713(v=vs.85)">auxGetNumDevs</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HMIDIIN</td>
     * <td>The <i>hmxobj</i> parameter is the handle of a MIDI (Musical Instrument Digital Interface) input device. This handle must have been returned by the <a href="https://docs.microsoft.com/previous-versions/dd798458(v=vs.85)">midiInOpen</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HMIDIOUT</td>
     * <td>The <i>hmxobj</i> parameter is the handle of a MIDI output device. This handle must have been returned by the <a href="https://docs.microsoft.com/previous-versions/dd798476(v=vs.85)">midiOutOpen</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HMIXER</td>
     * <td>The <i>hmxobj</i> parameter is a mixer device handle returned by the <a href="https://docs.microsoft.com/previous-versions/dd757308(v=vs.85)">mixerOpen</a> function. This flag is optional.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HWAVEIN</td>
     * <td>The <i>hmxobj</i> parameter is a waveform-audio input handle returned by the <a href="https://docs.microsoft.com/previous-versions/dd743847(v=vs.85)">waveInOpen</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HWAVEOUT</td>
     * <td>The <i>hmxobj</i> parameter is a waveform-audio output handle returned by the <a href="https://docs.microsoft.com/previous-versions/dd743866(v=vs.85)">waveOutOpen</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_MIDIIN</td>
     * <td>The <i>hmxobj</i> parameter is the identifier of a MIDI input device. This identifier must be in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd798456(v=vs.85)">midiInGetNumDevs</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_MIDIOUT</td>
     * <td>The <i>hmxobj</i> parameter is the identifier of a MIDI output device. This identifier must be in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd798472(v=vs.85)">midiOutGetNumDevs</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_MIXER</td>
     * <td>The <i>hmxobj</i> parameter is the identifier of a mixer device in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd757304(v=vs.85)">mixerGetNumDevs</a> function. This flag is optional.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_WAVEIN</td>
     * <td>The <i>hmxobj</i> parameter is the identifier of a waveform-audio input device in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd743844(v=vs.85)">waveInGetNumDevs</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_WAVEOUT</td>
     * <td>The <i>hmxobj</i> parameter is the identifier of a waveform-audio output device in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd743860(v=vs.85)">waveOutGetNumDevs</a> function.</td>
     * </tr>
     * </table>
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MIXERR_INVALCONTROL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The control reference is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_BADDEVICEID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hmxobj</i> parameter specifies an invalid device identifier.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more flags are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hmxobj</i> parameter specifies an invalid handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No mixer device is available for the object specified by <i>hmxobj</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-mixergetcontroldetailsw
     * @since windows5.0
     */
    static mixerGetControlDetailsW(hmxobj, pmxcd, fdwDetails) {
        hmxobj := hmxobj is Win32Handle ? NumGet(hmxobj, "ptr") : hmxobj

        result := DllCall("WINMM.dll\mixerGetControlDetailsW", "ptr", hmxobj, "ptr", pmxcd, "uint", fdwDetails, "uint")
        return result
    }

    /**
     * The mixerSetControlDetails function sets properties of a single control associated with an audio line.
     * @param {HMIXEROBJ} hmxobj Handle to the mixer device object for which properties are being set.
     * @param {Pointer<MIXERCONTROLDETAILS>} pmxcd Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixercontroldetails_listtexta">MIXERCONTROLDETAILS</a> structure. This structure is used to reference control detail structures that contain the desired state for the control.
     * @param {Integer} fdwDetails Flags for setting properties for a control. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_AUX</td>
     * <td>The <i>hmxobj</i> parameter is an auxiliary device identifier in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd756713(v=vs.85)">auxGetNumDevs</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HMIDIIN</td>
     * <td>The <i>hmxobj</i> parameter is the handle of a MIDI input device. This handle must have been returned by the <a href="https://docs.microsoft.com/previous-versions/dd798458(v=vs.85)">midiInOpen</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HMIDIOUT</td>
     * <td>The <i>hmxobj</i> parameter is the handle of a MIDI output device. This handle must have been returned by the <a href="https://docs.microsoft.com/previous-versions/dd798476(v=vs.85)">midiOutOpen</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HMIXER</td>
     * <td>The <i>hmxobj</i> parameter is a mixer device handle returned by the <a href="https://docs.microsoft.com/previous-versions/dd757308(v=vs.85)">mixerOpen</a> function. This flag is optional.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HWAVEIN</td>
     * <td>The <i>hmxobj</i> parameter is a waveform-audio input handle returned by the <a href="https://docs.microsoft.com/previous-versions/dd743847(v=vs.85)">waveInOpen</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_HWAVEOUT</td>
     * <td>The <i>hmxobj</i> parameter is a waveform-audio output handle returned by the <a href="https://docs.microsoft.com/previous-versions/dd743866(v=vs.85)">waveOutOpen</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_MIDIIN</td>
     * <td>The <i>hmxobj</i> parameter is the identifier of a MIDI input device. This identifier must be in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd798456(v=vs.85)">midiInGetNumDevs</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_MIDIOUT</td>
     * <td>The <i>hmxobj</i> parameter is the identifier of a MIDI output device. This identifier must be in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd798472(v=vs.85)">midiOutGetNumDevs</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_MIXER</td>
     * <td>The <i>hmxobj</i> parameter is a mixer device identifier in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd757304(v=vs.85)">mixerGetNumDevs</a> function. This flag is optional.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_WAVEIN</td>
     * <td>The <i>hmxobj</i> parameter is the identifier of a waveform-audio input device in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd743844(v=vs.85)">waveInGetNumDevs</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_OBJECTF_WAVEOUT</td>
     * <td>The <i>hmxobj</i> parameter is the identifier of a waveform-audio output device in the range of zero to one less than the number of devices returned by the <a href="https://docs.microsoft.com/previous-versions/dd743860(v=vs.85)">waveOutGetNumDevs</a> function.</td>
     * </tr>
     * <tr>
     * <td>MIXER_SETCONTROLDETAILSF_CUSTOM</td>
     * <td>A custom dialog box for the specified custom mixer control is displayed. The mixer device gathers the required information from the user and returns the data in the specified buffer. The handle for the owning window is specified in the <b>hwndOwner</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixercontroldetails_listtexta">MIXERCONTROLDETAILS</a> structure. (This handle can be set to <b>NULL</b>.) The application can then save the data from the dialog box and use it later to reset the control to the same state by using the MIXER_SETCONTROLDETAILSF_VALUE flag.</td>
     * </tr>
     * <tr>
     * <td>MIXER_SETCONTROLDETAILSF_VALUE</td>
     * <td>The current value(s) for a control are set. The <b>paDetails</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixercontroldetails_listtexta">MIXERCONTROLDETAILS</a> structure points to one or more mixer-control details structures of the appropriate class for the control.</td>
     * </tr>
     * </table>
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MIXERR_INVALCONTROL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The control reference is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_BADDEVICEID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hmxobj</i> parameter specifies an invalid device identifier.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more flags are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hmxobj</i> parameter specifies an invalid handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No mixer device is available for the object specified by <i>hmxobj</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmeapi/nf-mmeapi-mixersetcontroldetails
     * @since windows5.0
     */
    static mixerSetControlDetails(hmxobj, pmxcd, fdwDetails) {
        hmxobj := hmxobj is Win32Handle ? NumGet(hmxobj, "ptr") : hmxobj

        result := DllCall("WINMM.dll\mixerSetControlDetails", "ptr", hmxobj, "ptr", pmxcd, "uint", fdwDetails, "uint")
        return result
    }

    /**
     * Enables Windows Store apps to access preexisting Component Object Model (COM) interfaces in the WASAPI family.
     * @param {PWSTR} deviceInterfacePath A device interface ID for an audio device. This is normally retrieved from a <a href="https://docs.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformation">DeviceInformation</a> object or one of the methods of the <a href="https://docs.microsoft.com/uwp/api/windows.media.devices.mediadevice">MediaDevice</a> class. 
     * 
     * The GUIDs <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/devinterface-xxx-guids">DEVINTERFACE_AUDIO_CAPTURE</a>  and <b>DEVINTERFACE_AUDIO_RENDER</b>  represent the default audio capture and render device respectively. Call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-stringfromiid">StringFromIID</a> to convert either of these GUIDs to an <b>LPCWSTR</b> to use for this argument.
     * 
     * Specify **AUDIOCLIENT_ACTIVATION_TYPE_PROCESS_LOOPBACK** to activate the audio interface for process loopback capture.
     * @param {Pointer<Guid>} riid The IID of a COM interface in the <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/wasapi">WASAPI</a> family, such as <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nn-audioclient-iaudioclient">IAudioClient</a>.
     * @param {Pointer<PROPVARIANT>} activationParams Interface-specific activation parameters. For more information, see the <i>pActivationParams</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nf-mmdeviceapi-immdevice-activate">IMMDevice::Activate</a>.
     * 
     * Starting with TBD, you can specify [AUDIOCLIENT_ACTIVATION_PARAMS](/windows/desktop/api/audioclientactivationparams/ns-audioclientactivationparams-audioclient_activation_params) to activate the interface to include or exclude audio streams associated with a specified process ID.
     * @param {Pointer<IActivateAudioInterfaceCompletionHandler>} completionHandler An interface implemented by the caller that is called by Windows when the result of the activation procedure is available.
     * @param {Pointer<IActivateAudioInterfaceAsyncOperation>} activationOperation Returns an <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nn-mmdeviceapi-iactivateaudiointerfaceasyncoperation">IActivateAudioInterfaceAsyncOperation</a> interface that represents the asynchronous operation of activating the requested <b>WASAPI</b> interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The underlying object and asynchronous operation were created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ILLEGAL_METHOD_CALL </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * On versions of Windows previous to Windows 10, this error may result if the function is called from an incorrect COM apartment, or if the passed <a href="/windows/desktop/api/mmdeviceapi/nn-mmdeviceapi-iactivateaudiointerfacecompletionhandler">IActivateAudioInterfaceCompletionHandler</a> is not implemented on an agile object (aggregating a free-threaded marshaler).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmdeviceapi/nf-mmdeviceapi-activateaudiointerfaceasync
     * @since windows8.0
     */
    static ActivateAudioInterfaceAsync(deviceInterfacePath, riid, activationParams, completionHandler, activationOperation) {
        deviceInterfacePath := deviceInterfacePath is String ? StrPtr(deviceInterfacePath) : deviceInterfacePath

        result := DllCall("MMDevAPI.dll\ActivateAudioInterfaceAsync", "ptr", deviceInterfacePath, "ptr", riid, "ptr", activationParams, "ptr", completionHandler, "ptr", activationOperation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAudioStateMonitor>} audioStateMonitor 
     * @returns {HRESULT} 
     */
    static CreateRenderAudioStateMonitor(audioStateMonitor) {
        result := DllCall("Windows.Media.MediaControl.dll\CreateRenderAudioStateMonitor", "ptr", audioStateMonitor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} category 
     * @param {Pointer<IAudioStateMonitor>} audioStateMonitor 
     * @returns {HRESULT} 
     */
    static CreateRenderAudioStateMonitorForCategory(category, audioStateMonitor) {
        result := DllCall("Windows.Media.MediaControl.dll\CreateRenderAudioStateMonitorForCategory", "int", category, "ptr", audioStateMonitor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} category 
     * @param {Integer} role 
     * @param {Pointer<IAudioStateMonitor>} audioStateMonitor 
     * @returns {HRESULT} 
     */
    static CreateRenderAudioStateMonitorForCategoryAndDeviceRole(category, role, audioStateMonitor) {
        result := DllCall("Windows.Media.MediaControl.dll\CreateRenderAudioStateMonitorForCategoryAndDeviceRole", "int", category, "int", role, "ptr", audioStateMonitor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} category 
     * @param {PWSTR} deviceId 
     * @param {Pointer<IAudioStateMonitor>} audioStateMonitor 
     * @returns {HRESULT} 
     */
    static CreateRenderAudioStateMonitorForCategoryAndDeviceId(category, deviceId, audioStateMonitor) {
        deviceId := deviceId is String ? StrPtr(deviceId) : deviceId

        result := DllCall("Windows.Media.MediaControl.dll\CreateRenderAudioStateMonitorForCategoryAndDeviceId", "int", category, "ptr", deviceId, "ptr", audioStateMonitor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAudioStateMonitor>} audioStateMonitor 
     * @returns {HRESULT} 
     */
    static CreateCaptureAudioStateMonitor(audioStateMonitor) {
        result := DllCall("Windows.Media.MediaControl.dll\CreateCaptureAudioStateMonitor", "ptr", audioStateMonitor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} category 
     * @param {Pointer<IAudioStateMonitor>} audioStateMonitor 
     * @returns {HRESULT} 
     */
    static CreateCaptureAudioStateMonitorForCategory(category, audioStateMonitor) {
        result := DllCall("Windows.Media.MediaControl.dll\CreateCaptureAudioStateMonitorForCategory", "int", category, "ptr", audioStateMonitor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} category 
     * @param {Integer} role 
     * @param {Pointer<IAudioStateMonitor>} audioStateMonitor 
     * @returns {HRESULT} 
     */
    static CreateCaptureAudioStateMonitorForCategoryAndDeviceRole(category, role, audioStateMonitor) {
        result := DllCall("Windows.Media.MediaControl.dll\CreateCaptureAudioStateMonitorForCategoryAndDeviceRole", "int", category, "int", role, "ptr", audioStateMonitor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} category 
     * @param {PWSTR} deviceId 
     * @param {Pointer<IAudioStateMonitor>} audioStateMonitor 
     * @returns {HRESULT} 
     */
    static CreateCaptureAudioStateMonitorForCategoryAndDeviceId(category, deviceId, audioStateMonitor) {
        deviceId := deviceId is String ? StrPtr(deviceId) : deviceId

        result := DllCall("Windows.Media.MediaControl.dll\CreateCaptureAudioStateMonitorForCategoryAndDeviceId", "int", category, "ptr", deviceId, "ptr", audioStateMonitor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The acmGetVersion function returns the version number of the ACM.
     * @returns {Integer} The version number is returned as a hexadecimal number of the form 0xAABBCCCC, where AA is the major version number, BB is the minor version number, and CCCC is the build number.
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmgetversion
     * @since windows5.0
     */
    static acmGetVersion() {
        result := DllCall("MSACM32.dll\acmGetVersion", "uint")
        return result
    }

    /**
     * The acmMetrics function returns various metrics for the ACM or related ACM objects.
     * @param {HACMOBJ} hao Handle to the ACM object to query for the metric specified in <i>uMetric</i>. For some queries, this parameter can be <b>NULL</b>.
     * @param {Integer} uMetric Metric index to be returned in <i>pMetric</i>.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>ACM_METRIC_COUNT_CODECS</td>
     * <td>Returned value is the number of global ACM compressor or decompressor drivers in the system. The <i>hao</i> parameter must be <b>NULL</b> for this metric index. The <i>pMetric</i> parameter must point to a buffer of a size equal to a <b>DWORD</b> value.</td>
     * </tr>
     * <tr>
     * <td>ACM_METRIC_COUNT_CONVERTERS</td>
     * <td>Returned value is the number of global ACM converter drivers in the system. The <i>hao</i> parameter must be <b>NULL</b> for this metric index. The <i>pMetric</i> parameter must point to a buffer of a size equal to a <b>DWORD</b> value.</td>
     * </tr>
     * <tr>
     * <td>ACM_METRIC_COUNT_DISABLED</td>
     * <td>Returned value is the total number of global disabled ACM drivers (of all support types) in the system. The <i>hao</i> parameter must be <b>NULL</b> for this metric index. The <i>pMetric</i> parameter must point to a buffer of a size equal to a <b>DWORD</b> value. The sum of the ACM_METRIC_COUNT_DRIVERS and ACM_METRIC_COUNT_DISABLED metric indices is the total number of globally installed ACM drivers.</td>
     * </tr>
     * <tr>
     * <td>ACM_METRIC_COUNT_DRIVERS</td>
     * <td>Returned value is the total number of enabled global ACM drivers (of all support types) in the system. The <i>hao</i> parameter must be <b>NULL</b> for this metric index. The <i>pMetric</i> parameter must point to a buffer of a size equal to a <b>DWORD</b> value.</td>
     * </tr>
     * <tr>
     * <td>ACM_METRIC_COUNT_FILTERS</td>
     * <td>Returned value is the number of global ACM filter drivers in the system. The <i>hao</i> parameter must be <b>NULL</b> for this metric index. The <i>pMetric</i> parameter must point to a buffer of a size equal to a <b>DWORD</b> value.</td>
     * </tr>
     * <tr>
     * <td>ACM_METRIC_COUNT_HARDWARE</td>
     * <td>Returned value is the number of global ACM hardware drivers in the system. The <i>hao</i> parameter must be <b>NULL</b> for this metric index. The <i>pMetric</i> parameter must point to a buffer of a size equal to a <b>DWORD</b> value.</td>
     * </tr>
     * <tr>
     * <td>ACM_METRIC_COUNT_LOCAL_CODECS</td>
     * <td>Returned value is the number of local ACM compressor drivers, ACM decompressor drivers, or both for the calling task. The <i>hao</i> parameter must be <b>NULL</b> for this metric index. The <i>pMetric</i> parameter must point to a buffer of a size equal to a <b>DWORD</b> value.</td>
     * </tr>
     * <tr>
     * <td>ACM_METRIC_COUNT_LOCAL_CONVERTERS</td>
     * <td>Returned value is the number of local ACM converter drivers for the calling task. The <i>hao</i> parameter must be <b>NULL</b> for this metric index. The <i>pMetric</i> parameter must point to a buffer of a size equal to a <b>DWORD</b> value.</td>
     * </tr>
     * <tr>
     * <td>ACM_METRIC_COUNT_LOCAL_DISABLED</td>
     * <td>Returned value is the total number of local disabled ACM drivers, of all support types, for the calling task. The <i>hao</i> parameter must be <b>NULL</b> for this metric index. The <i>pMetric</i> parameter must point to a buffer of a size equal to a <b>DWORD</b> value. The sum of the ACM_METRIC_COUNT_LOCAL_DRIVERS and ACM_METRIC_COUNT_LOCAL_DISABLED metric indices is the total number of locally installed ACM drivers.</td>
     * </tr>
     * <tr>
     * <td>ACM_METRIC_COUNT_LOCAL_DRIVERS</td>
     * <td>Returned value is the total number of enabled local ACM drivers (of all support types) for the calling task. The <i>hao</i> parameter must be <b>NULL</b> for this metric index. The <i>pMetric</i> parameter must point to a buffer of a size equal to a <b>DWORD</b> value.</td>
     * </tr>
     * <tr>
     * <td>ACM_METRIC_COUNT_LOCAL_FILTERS</td>
     * <td>Returned value is the number of local ACM filter drivers for the calling task. The <i>hao</i> parameter must be <b>NULL</b> for this metric index. The <i>pMetric</i> parameter must point to a buffer of a size equal to a <b>DWORD</b> value.</td>
     * </tr>
     * <tr>
     * <td>ACM_METRIC_DRIVER_PRIORITY</td>
     * <td>Returned value is the current priority for the specified driver. The <i>hao</i> parameter must be a valid ACM driver identifier of the <b>HACMDRIVERID</b> data type. The <i>pMetric</i> parameter must point to a buffer of a size equal to a <b>DWORD</b> value.</td>
     * </tr>
     * <tr>
     * <td>ACM_METRIC_DRIVER_SUPPORT</td>
     * <td>Returned value is the <b>fdwSupport</b> flags for the specified driver. The <i>hao</i> parameter must be a valid ACM driver identifier of the <b>HACMDRIVERID</b> data type. The <i>pMetric</i> parameter must point to a buffer of a size equal to a <b>DWORD</b> value.</td>
     * </tr>
     * <tr>
     * <td>ACM_METRIC_HARDWARE_WAVE_INPUT</td>
     * <td>Returned value is the waveform-audio input device identifier associated with the specified driver. The <i>hao</i> parameter must be a valid ACM driver identifier of the <b>HACMDRIVERID</b> data type that supports the ACMDRIVERDETAILS_SUPPORTF_HARDWARE flag. If no waveform-audio input device is associated with the driver, MMSYSERR_NOTSUPPORTED is returned. The <i>pMetric</i> parameter must point to a buffer of a size equal to a <b>DWORD</b> value.</td>
     * </tr>
     * <tr>
     * <td>ACM_METRIC_HARDWARE_WAVE_OUTPUT</td>
     * <td>Returned value is the waveform-audio output device identifier associated with the specified driver. The <i>hao</i> parameter must be a valid ACM driver identifier of the <b>HACMDRIVERID</b> data type that supports the ACMDRIVERDETAILS_SUPPORTF_HARDWARE flag. If no waveform-audio output device is associated with the driver, MMSYSERR_NOTSUPPORTED is returned. The <i>pMetric</i> parameter must point to a buffer of a size equal to a <b>DWORD</b> value.</td>
     * </tr>
     * <tr>
     * <td>ACM_METRIC_MAX_SIZE_FILTER</td>
     * <td>Returned value is the size of the largest <a href="https://docs.microsoft.com/windows/desktop/api/mmreg/ns-mmreg-wavefilter">WAVEFILTER</a> structure. If <i>hao</i> is <b>NULL</b>, the return value is the largest <b>WAVEFILTER</b> structure in the system. If <i>hao</i> identifies an open instance of an ACM driver of the <b>HACMDRIVER</b> data type or an ACM driver identifier of the <b>HACMDRIVERID</b> data type, the largest <b>WAVEFILTER</b> structure for that driver is returned. The <i>pMetric</i> parameter must point to a buffer of a size equal to a <b>DWORD</b> value. This metric is not allowed for an ACM stream handle of the <b>HACMSTREAM</b> data type.</td>
     * </tr>
     * <tr>
     * <td>ACM_METRIC_MAX_SIZE_FORMAT</td>
     * <td>Returned value is the size of the largest <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure. If <i>hao</i> is <b>NULL</b>, the return value is the largest <b>WAVEFORMATEX</b> structure in the system. If <i>hao</i> identifies an open instance of an ACM driver of the <b>HACMDRIVER</b> data type or an ACM driver identifier of the <b>HACMDRIVERID</b> data type, the largest <b>WAVEFORMATEX</b> structure for that driver is returned. The <i>pMetric</i> parameter must point to a buffer of a size equal to a <b>DWORD</b> value. This metric is not allowed for an ACM stream handle of the <b>HACMSTREAM</b> data type.</td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} pMetric Pointer to the buffer to receive the metric details. The exact definition depends on the <i>uMetric</i> index.
     * @returns {Integer} Returns zero if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ACMERR_NOTPOSSIBLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The index specified in <i>uMetric</i> cannot be returned for the specified <i>hao</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The index specified in <i>uMetric</i> is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmmetrics
     * @since windows5.0
     */
    static acmMetrics(hao, uMetric, pMetric) {
        hao := hao is Win32Handle ? NumGet(hao, "ptr") : hao

        result := DllCall("MSACM32.dll\acmMetrics", "ptr", hao, "uint", uMetric, "ptr", pMetric, "uint")
        return result
    }

    /**
     * The acmDriverEnum function enumerates the available ACM drivers, continuing until there are no more drivers or the callback function returns FALSE.
     * @param {Pointer<ACMDRIVERENUMCB>} fnCallback Procedure instance address of the application-defined callback function.
     * @param {Pointer} dwInstance A 64-bit (DWORD_PTR) or 32-bit (DWORD) application-defined value that is passed to the callback function along with ACM driver information.
     * @param {Integer} fdwEnum Flags for enumerating ACM drivers. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>ACM_DRIVERENUMF_DISABLED</td>
     * <td>Disabled ACM drivers should be included in the enumeration. Drivers can be disabled by the user through the Control Panel or by an application using the <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmdriverpriority">acmDriverPriority</a> function. If a driver is disabled, the <i>fdwSupport</i> parameter to the callback function will have the ACMDRIVERDETAILS_SUPPORTF_DISABLED flag set.</td>
     * </tr>
     * <tr>
     * <td>ACM_DRIVERENUMF_NOLOCAL</td>
     * <td>Only global drivers should be included in the enumeration.</td>
     * </tr>
     * </table>
     * @returns {Integer} Returns zero if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmdriverenum
     * @since windows5.0
     */
    static acmDriverEnum(fnCallback, dwInstance, fdwEnum) {
        result := DllCall("MSACM32.dll\acmDriverEnum", "ptr", fnCallback, "ptr", dwInstance, "uint", fdwEnum, "uint")
        return result
    }

    /**
     * The acmDriverID function returns the handle of an ACM driver identifier associated with an open ACM driver instance or stream handle.
     * @param {HACMOBJ} hao Handle to the open driver instance or stream handle. This is the handle of an ACM object, such as <b>HACMDRIVER</b> or <b>HACMSTREAM</b>.
     * @param {Pointer<HACMDRIVERID>} phadid Pointer to a buffer that receives a handle identifying the installed driver that is associated with <i>hao</i>.
     * @param {Integer} fdwDriverID Reserved; must be zero.
     * @returns {Integer} Returns zero if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmdriverid
     * @since windows5.0
     */
    static acmDriverID(hao, phadid, fdwDriverID) {
        hao := hao is Win32Handle ? NumGet(hao, "ptr") : hao

        result := DllCall("MSACM32.dll\acmDriverID", "ptr", hao, "ptr", phadid, "uint", fdwDriverID, "uint")
        return result
    }

    /**
     * The acmDriverAdd function adds a driver to the list of available ACM drivers.
     * @param {Pointer<HACMDRIVERID>} phadid Pointer to the buffer that receives a handle identifying the installed driver. This handle is used to identify the driver in calls to other ACM functions.
     * @param {HINSTANCE} hinstModule Handle to the instance of the module whose executable or dynamic-link library (DLL) contains the driver entry function.
     * @param {LPARAM} lParam Driver function address or a notification window handle, depending on the <i>fdwAdd</i> flags.
     * @param {Integer} dwPriority Window message to send for notification broadcasts. This parameter is used only with the ACM_DRIVERADDF_NOTIFYHWND flag. All other flags require this member to be set to zero.
     * @param {Integer} fdwAdd Flags for adding ACM drivers. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>ACM_DRIVERADDF_FUNCTION</td>
     * <td>The <i>lParam</i> parameter is a driver function address conforming to the <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nc-msacm-acmdriverproc">acmDriverProc</a> prototype. The function may reside in either an executable or DLL file.</td>
     * </tr>
     * <tr>
     * <td>ACM_DRIVERADDF_GLOBAL</td>
     * <td>Provided for compatibility with 16-bit applications. For the Win32 API, ACM drivers added by the <b>acmDriverAdd</b> function can be used only by the application that added the driver. This is true whether or not ACM_DRIVERADDF_GLOBAL is specified. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Multimedia/adding-drivers-within-an-application">Adding Drivers Within an Application</a>.</td>
     * </tr>
     * <tr>
     * <td>ACM_DRIVERADDF_LOCAL</td>
     * <td>The ACM automatically gives a local driver higher priority than a global driver when searching for a driver to satisfy a function call. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Multimedia/adding-drivers-within-an-application">Adding Drivers Within an Application</a>.</td>
     * </tr>
     * <tr>
     * <td>ACM_DRIVERADDF_NAME</td>
     * <td>The <i>lParam</i> parameter is a registry value name in HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Drivers32. The value identifies a DLL that implements an ACM codec. Applications can use this flag if new registry entries are created after the application has already started using the ACM.</td>
     * </tr>
     * <tr>
     * <td>ACM_DRIVERADDF_NOTIFYHWND</td>
     * <td>The <i>lParam</i> parameter is a handle of a notification window that receives messages when changes to global driver priorities and states are made. The window message to receive is defined by the application and must be passed in <i>dwPriority</i>. The <i>wParam</i> and <i>lParam</i> parameters passed with the window message are reserved for future use and should be ignored. ACM_DRIVERADDF_GLOBAL cannot be specified in conjunction with this flag. For more information about driver priorities, see the description for the <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmdriverpriority">acmDriverPriority</a> function.</td>
     * </tr>
     * </table>
     * @returns {Integer} Returns zero if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is unable to allocate resources.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmdriveradda
     * @since windows5.0
     */
    static acmDriverAddA(phadid, hinstModule, lParam, dwPriority, fdwAdd) {
        hinstModule := hinstModule is Win32Handle ? NumGet(hinstModule, "ptr") : hinstModule

        result := DllCall("MSACM32.dll\acmDriverAddA", "ptr", phadid, "ptr", hinstModule, "ptr", lParam, "uint", dwPriority, "uint", fdwAdd, "uint")
        return result
    }

    /**
     * The acmDriverAdd function adds a driver to the list of available ACM drivers.
     * @param {Pointer<HACMDRIVERID>} phadid Pointer to the buffer that receives a handle identifying the installed driver. This handle is used to identify the driver in calls to other ACM functions.
     * @param {HINSTANCE} hinstModule Handle to the instance of the module whose executable or dynamic-link library (DLL) contains the driver entry function.
     * @param {LPARAM} lParam Driver function address or a notification window handle, depending on the <i>fdwAdd</i> flags.
     * @param {Integer} dwPriority Window message to send for notification broadcasts. This parameter is used only with the ACM_DRIVERADDF_NOTIFYHWND flag. All other flags require this member to be set to zero.
     * @param {Integer} fdwAdd Flags for adding ACM drivers. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>ACM_DRIVERADDF_FUNCTION</td>
     * <td>The <i>lParam</i> parameter is a driver function address conforming to the <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nc-msacm-acmdriverproc">acmDriverProc</a> prototype. The function may reside in either an executable or DLL file.</td>
     * </tr>
     * <tr>
     * <td>ACM_DRIVERADDF_GLOBAL</td>
     * <td>Provided for compatibility with 16-bit applications. For the Win32 API, ACM drivers added by the <b>acmDriverAdd</b> function can be used only by the application that added the driver. This is true whether or not ACM_DRIVERADDF_GLOBAL is specified. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Multimedia/adding-drivers-within-an-application">Adding Drivers Within an Application</a>.</td>
     * </tr>
     * <tr>
     * <td>ACM_DRIVERADDF_LOCAL</td>
     * <td>The ACM automatically gives a local driver higher priority than a global driver when searching for a driver to satisfy a function call. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Multimedia/adding-drivers-within-an-application">Adding Drivers Within an Application</a>.</td>
     * </tr>
     * <tr>
     * <td>ACM_DRIVERADDF_NAME</td>
     * <td>The <i>lParam</i> parameter is a registry value name in HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Drivers32. The value identifies a DLL that implements an ACM codec. Applications can use this flag if new registry entries are created after the application has already started using the ACM.</td>
     * </tr>
     * <tr>
     * <td>ACM_DRIVERADDF_NOTIFYHWND</td>
     * <td>The <i>lParam</i> parameter is a handle of a notification window that receives messages when changes to global driver priorities and states are made. The window message to receive is defined by the application and must be passed in <i>dwPriority</i>. The <i>wParam</i> and <i>lParam</i> parameters passed with the window message are reserved for future use and should be ignored. ACM_DRIVERADDF_GLOBAL cannot be specified in conjunction with this flag. For more information about driver priorities, see the description for the <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmdriverpriority">acmDriverPriority</a> function.</td>
     * </tr>
     * </table>
     * @returns {Integer} Returns zero if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is unable to allocate resources.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmdriveraddw
     * @since windows5.0
     */
    static acmDriverAddW(phadid, hinstModule, lParam, dwPriority, fdwAdd) {
        hinstModule := hinstModule is Win32Handle ? NumGet(hinstModule, "ptr") : hinstModule

        result := DllCall("MSACM32.dll\acmDriverAddW", "ptr", phadid, "ptr", hinstModule, "ptr", lParam, "uint", dwPriority, "uint", fdwAdd, "uint")
        return result
    }

    /**
     * The acmDriverRemove function removes an ACM driver from the list of available ACM drivers. The driver will be removed for the calling application only. If the driver is globally installed, other applications will still be able to use it.
     * @param {HACMDRIVERID} hadid Handle to the driver identifier to be removed.
     * @param {Integer} fdwRemove Reserved; must be zero.
     * @returns {Integer} Returns zero if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ACMERR_BUSY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The driver is in use and cannot be removed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmdriverremove
     * @since windows5.0
     */
    static acmDriverRemove(hadid, fdwRemove) {
        hadid := hadid is Win32Handle ? NumGet(hadid, "ptr") : hadid

        result := DllCall("MSACM32.dll\acmDriverRemove", "ptr", hadid, "uint", fdwRemove, "uint")
        return result
    }

    /**
     * The acmDriverOpen function opens the specified ACM driver and returns a driver instance handle that can be used to communicate with the driver.
     * @param {Pointer<HACMDRIVER>} phad Pointer to a buffer that receives the new driver instance handle that can be used to communicate with the driver.
     * @param {HACMDRIVERID} hadid Handle to the driver identifier of an installed and enabled ACM driver.
     * @param {Integer} fdwOpen Reserved; must be zero.
     * @returns {Integer} Returns zero if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is unable to allocate resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOTENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The driver is not enabled.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmdriveropen
     * @since windows5.0
     */
    static acmDriverOpen(phad, hadid, fdwOpen) {
        hadid := hadid is Win32Handle ? NumGet(hadid, "ptr") : hadid

        result := DllCall("MSACM32.dll\acmDriverOpen", "ptr", phad, "ptr", hadid, "uint", fdwOpen, "uint")
        return result
    }

    /**
     * The acmDriverClose function closes a previously opened ACM driver instance. If the function is successful, the handle is invalidated.
     * @param {HACMDRIVER} had Handle to the open driver instance to be closed.
     * @param {Integer} fdwClose Reserved; must be zero.
     * @returns {Integer} Returns zero if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ACMERR_BUSY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The driver is in use and cannot be closed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmdriverclose
     * @since windows5.0
     */
    static acmDriverClose(had, fdwClose) {
        had := had is Win32Handle ? NumGet(had, "ptr") : had

        result := DllCall("MSACM32.dll\acmDriverClose", "ptr", had, "uint", fdwClose, "uint")
        return result
    }

    /**
     * The acmDriverMessage function sends a user-defined message to a given ACM driver instance.
     * @param {HACMDRIVER} had Handle to the ACM driver instance to which the message will be sent.
     * @param {Integer} uMsg Message that the ACM driver must process. This message must be in the ACMDM_USER message range (above or equal to ACMDM_USER and less than ACMDM_RESERVED_LOW). The exceptions to this restriction are the ACMDM_DRIVER_ABOUT, <a href="https://docs.microsoft.com/windows/desktop/Multimedia/drv-queryconfigure">DRV_QUERYCONFIGURE</a>, and <a href="https://docs.microsoft.com/windows/desktop/Multimedia/drv-configure">DRV_CONFIGURE</a> messages.
     * @param {LPARAM} lParam1 Message parameter.
     * @param {LPARAM} lParam2 Message parameter.
     * @returns {LRESULT} The return value is specific to the user-defined ACM driver message specified by the uMsg parameter. However, possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>uMsg</i> parameter is not in the ACMDM_USER range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The ACM driver did not process the message.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmdrivermessage
     * @since windows5.0
     */
    static acmDriverMessage(had, uMsg, lParam1, lParam2) {
        had := had is Win32Handle ? NumGet(had, "ptr") : had

        result := DllCall("MSACM32.dll\acmDriverMessage", "ptr", had, "uint", uMsg, "ptr", lParam1, "ptr", lParam2, "ptr")
        return result
    }

    /**
     * The acmDriverPriority function modifies the priority and state of an ACM driver.
     * @param {HACMDRIVERID} hadid Handle to the driver identifier of an installed ACM driver. If the ACM_DRIVERPRIORITYF_BEGIN and ACM_DRIVERPRIORITYF_END flags are specified, this parameter must be <b>NULL</b>.
     * @param {Integer} dwPriority New priority for a global ACM driver identifier. A zero value specifies that the priority of the driver identifier should remain unchanged. A value of 1 specifies that the driver should be placed as the highest search priority driver. A value of –1 specifies that the driver should be placed as the lowest search priority driver. Priorities are used only for global drivers.
     * @param {Integer} fdwPriority Flags for setting priorities of ACM drivers. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>ACM_DRIVERPRIORITYF_BEGIN</td>
     * <td>Change notification broadcasts should be deferred. An application must reenable notification broadcasts as soon as possible with the ACM_DRIVERPRIORITYF_END flag. Note that <i>hadid</i> must be <b>NULL</b>, <i>dwPriority</i> must be zero, and only the ACM_DRIVERPRIORITYF_BEGIN flag can be set.</td>
     * </tr>
     * <tr>
     * <td>ACM_DRIVERPRIORITYF_DISABLE</td>
     * <td>ACM driver should be disabled if it is currently enabled. Disabling a disabled driver does nothing.</td>
     * </tr>
     * <tr>
     * <td>ACM_DRIVERPRIORITYF_ENABLE</td>
     * <td>ACM driver should be enabled if it is currently disabled. Enabling an enabled driver does nothing.</td>
     * </tr>
     * <tr>
     * <td>ACM_DRIVERPRIORITYF_END</td>
     * <td>Calling task wants to reenable change notification broadcasts. An application must call <b>acmDriverPriority</b> with ACM_DRIVERPRIORITYF_END for each successful call with the ACM_DRIVERPRIORITYF_BEGIN flag. Note that <i>hadid</i> must be <b>NULL</b>, <i>dwPriority</i> must be zero, and only the ACM_DRIVERPRIORITYF_END flag can be set.</td>
     * </tr>
     * </table>
     * @returns {Integer} Returns zero if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_ALLOCATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The deferred broadcast lock is owned by a different task.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested operation is not supported for the specified driver. For example, local and notify driver identifiers do not support priorities (but can be enabled and disabled). If an application specifies a nonzero value for <i>dwPriority</i> for local and notify driver identifiers, this error will be returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmdriverpriority
     * @since windows5.0
     */
    static acmDriverPriority(hadid, dwPriority, fdwPriority) {
        hadid := hadid is Win32Handle ? NumGet(hadid, "ptr") : hadid

        result := DllCall("MSACM32.dll\acmDriverPriority", "ptr", hadid, "uint", dwPriority, "uint", fdwPriority, "uint")
        return result
    }

    /**
     * The acmDriverDetails function queries a specified ACM driver to determine its capabilities.
     * @param {HACMDRIVERID} hadid Handle to the driver identifier of an installed ACM driver. Disabled drivers can be queried for details.
     * @param {Pointer<ACMDRIVERDETAILSA>} padd Pointer to an [ACMDRIVERDETAILS](./nf-msacm-acmdriverdetails.md) structure that will receive the driver details. The <b>cbStruct</b> member must be initialized to the size, in bytes, of the structure.
     * @param {Integer} fdwDetails Reserved; must be zero.
     * @returns {Integer} Returns zero if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmdriverdetailsa
     * @since windows5.0
     */
    static acmDriverDetailsA(hadid, padd, fdwDetails) {
        hadid := hadid is Win32Handle ? NumGet(hadid, "ptr") : hadid

        result := DllCall("MSACM32.dll\acmDriverDetailsA", "ptr", hadid, "ptr", padd, "uint", fdwDetails, "uint")
        return result
    }

    /**
     * The acmDriverDetails function queries a specified ACM driver to determine its capabilities.
     * @param {HACMDRIVERID} hadid Handle to the driver identifier of an installed ACM driver. Disabled drivers can be queried for details.
     * @param {Pointer<ACMDRIVERDETAILSW>} padd Pointer to an [ACMDRIVERDETAILS](./nf-msacm-acmdriverdetails.md) structure that will receive the driver details. The <b>cbStruct</b> member must be initialized to the size, in bytes, of the structure.
     * @param {Integer} fdwDetails Reserved; must be zero.
     * @returns {Integer} Returns zero if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmdriverdetailsw
     * @since windows5.0
     */
    static acmDriverDetailsW(hadid, padd, fdwDetails) {
        hadid := hadid is Win32Handle ? NumGet(hadid, "ptr") : hadid

        result := DllCall("MSACM32.dll\acmDriverDetailsW", "ptr", hadid, "ptr", padd, "uint", fdwDetails, "uint")
        return result
    }

    /**
     * The acmFormatTagDetails function queries the ACM for details on a specific waveform-audio format tag.
     * @param {HACMDRIVER} had Handle to the ACM driver to query for waveform-audio format tag details. If this parameter is <b>NULL</b>, the ACM uses the details from the first suitable ACM driver. An application must specify a valid handle or driver identifier when using the ACM_FORMATTAGDETAILSF_INDEX query type. Driver identifiers for disabled drivers are not allowed.
     * @param {Pointer<ACMFORMATTAGDETAILSA>} paftd Pointer to the [ACMFORMATTAGDETAILS](./nf-msacm-acmformattagdetails.md) structure that is to receive the format tag details.
     * @param {Integer} fdwDetails Flags for getting the details. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>ACM_FORMATTAGDETAILSF_FORMATTAG</td>
     * [ACMFORMATTAGDETAILS](./nf-msacm-acmformattagdetails.md) structure. The format tag details will be returned in the structure pointed to by <i>paftd</i>. If an application specifies an ACM driver handle for <i>had</i>, details on the format tag will be returned for that driver. If an application specifies <b>NULL</b> for <i>had</i>, the ACM finds the first acceptable driver to return the details.</td>
     * </tr>
     * <tr>
     * <td>ACM_FORMATTAGDETAILSF_INDEX</td>
     * [ACMDRIVERDETAILS](./nf-msacm-acmdriverdetails.md) structure for an ACM driver. An application must specify a driver handle for <i>had</i> when retrieving format tag details with this flag.</td>
     * </tr>
     * <tr>
     * <td>ACM_FORMATTAGDETAILSF_LARGESTSIZE</td>
     * [ACMFORMATTAGDETAILS](./nf-msacm-acmformattagdetails.md) structure must either be WAVE_FORMAT_UNKNOWN or the format tag to find the largest size for. If an application specifies an ACM driver handle for <i>had</i>, details on the largest format tag will be returned for that driver. If an application specifies <b>NULL</b> for <i>had</i>, the ACM finds an acceptable driver with the largest format tag requested to return the details.</td>
     * </tr>
     * </table>
     * @returns {Integer} Returns zero if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ACMERR_NOTPOSSIBLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The details requested are not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmformattagdetailsa
     * @since windows5.0
     */
    static acmFormatTagDetailsA(had, paftd, fdwDetails) {
        had := had is Win32Handle ? NumGet(had, "ptr") : had

        result := DllCall("MSACM32.dll\acmFormatTagDetailsA", "ptr", had, "ptr", paftd, "uint", fdwDetails, "uint")
        return result
    }

    /**
     * The acmFormatTagDetails function queries the ACM for details on a specific waveform-audio format tag.
     * @param {HACMDRIVER} had Handle to the ACM driver to query for waveform-audio format tag details. If this parameter is <b>NULL</b>, the ACM uses the details from the first suitable ACM driver. An application must specify a valid handle or driver identifier when using the ACM_FORMATTAGDETAILSF_INDEX query type. Driver identifiers for disabled drivers are not allowed.
     * @param {Pointer<ACMFORMATTAGDETAILSW>} paftd Pointer to the [ACMFORMATTAGDETAILS](./nf-msacm-acmformattagdetails.md) structure that is to receive the format tag details.
     * @param {Integer} fdwDetails Flags for getting the details. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>ACM_FORMATTAGDETAILSF_FORMATTAG</td>
     * [ACMFORMATTAGDETAILS](./nf-msacm-acmformattagdetails.md) structure. The format tag details will be returned in the structure pointed to by <i>paftd</i>. If an application specifies an ACM driver handle for <i>had</i>, details on the format tag will be returned for that driver. If an application specifies <b>NULL</b> for <i>had</i>, the ACM finds the first acceptable driver to return the details.</td>
     * </tr>
     * <tr>
     * <td>ACM_FORMATTAGDETAILSF_INDEX</td>
     * [ACMDRIVERDETAILS](./nf-msacm-acmdriverdetails.md) structure for an ACM driver. An application must specify a driver handle for <i>had</i> when retrieving format tag details with this flag.</td>
     * </tr>
     * <tr>
     * <td>ACM_FORMATTAGDETAILSF_LARGESTSIZE</td>
     * [ACMFORMATTAGDETAILS](./nf-msacm-acmformattagdetails.md) structure must either be WAVE_FORMAT_UNKNOWN or the format tag to find the largest size for. If an application specifies an ACM driver handle for <i>had</i>, details on the largest format tag will be returned for that driver. If an application specifies <b>NULL</b> for <i>had</i>, the ACM finds an acceptable driver with the largest format tag requested to return the details.</td>
     * </tr>
     * </table>
     * @returns {Integer} Returns zero if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ACMERR_NOTPOSSIBLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The details requested are not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmformattagdetailsw
     * @since windows5.0
     */
    static acmFormatTagDetailsW(had, paftd, fdwDetails) {
        had := had is Win32Handle ? NumGet(had, "ptr") : had

        result := DllCall("MSACM32.dll\acmFormatTagDetailsW", "ptr", had, "ptr", paftd, "uint", fdwDetails, "uint")
        return result
    }

    /**
     * The acmFormatTagEnum function enumerates waveform-audio format tags available from an ACM driver. This function continues enumerating until there are no more suitable format tags or the callback function returns FALSE.
     * @param {HACMDRIVER} had Handle to the ACM driver to query for waveform-audio format tag details. If this parameter is <b>NULL</b>, the ACM uses the details from the first suitable ACM driver.
     * @param {Pointer<ACMFORMATTAGDETAILSA>} paftd Pointer to the [ACMFORMATTAGDETAILS](./nf-msacm-acmformattagdetails.md) structure that is to receive the format tag details passed to the function specified in <i>fnCallback</i>. This structure must have the <b>cbStruct</b> member of the <b>ACMFORMATTAGDETAILS</b> structure initialized.
     * @param {Pointer<ACMFORMATTAGENUMCBA>} fnCallback Procedure instance address of the application-defined callback function.
     * @param {Pointer} dwInstance A 64-bit (DWORD_PTR) or 32-bit (DWORD) application-defined value that is passed to the callback function along with ACM format tag details.
     * @param {Integer} fdwEnum Reserved; must be zero.
     * @returns {Integer} Returns zero if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmformattagenuma
     * @since windows5.0
     */
    static acmFormatTagEnumA(had, paftd, fnCallback, dwInstance, fdwEnum) {
        had := had is Win32Handle ? NumGet(had, "ptr") : had

        result := DllCall("MSACM32.dll\acmFormatTagEnumA", "ptr", had, "ptr", paftd, "ptr", fnCallback, "ptr", dwInstance, "uint", fdwEnum, "uint")
        return result
    }

    /**
     * The acmFormatTagEnum function enumerates waveform-audio format tags available from an ACM driver. This function continues enumerating until there are no more suitable format tags or the callback function returns FALSE.
     * @param {HACMDRIVER} had Handle to the ACM driver to query for waveform-audio format tag details. If this parameter is <b>NULL</b>, the ACM uses the details from the first suitable ACM driver.
     * @param {Pointer<ACMFORMATTAGDETAILSW>} paftd Pointer to the [ACMFORMATTAGDETAILS](./nf-msacm-acmformattagdetails.md) structure that is to receive the format tag details passed to the function specified in <i>fnCallback</i>. This structure must have the <b>cbStruct</b> member of the <b>ACMFORMATTAGDETAILS</b> structure initialized.
     * @param {Pointer<ACMFORMATTAGENUMCBW>} fnCallback Procedure instance address of the application-defined callback function.
     * @param {Pointer} dwInstance A 64-bit (DWORD_PTR) or 32-bit (DWORD) application-defined value that is passed to the callback function along with ACM format tag details.
     * @param {Integer} fdwEnum Reserved; must be zero.
     * @returns {Integer} Returns zero if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmformattagenumw
     * @since windows5.0
     */
    static acmFormatTagEnumW(had, paftd, fnCallback, dwInstance, fdwEnum) {
        had := had is Win32Handle ? NumGet(had, "ptr") : had

        result := DllCall("MSACM32.dll\acmFormatTagEnumW", "ptr", had, "ptr", paftd, "ptr", fnCallback, "ptr", dwInstance, "uint", fdwEnum, "uint")
        return result
    }

    /**
     * The acmFormatDetails function queries the ACM for format details for a specific waveform-audio format tag.
     * @param {HACMDRIVER} had Handle to the ACM driver to query for waveform-audio format details for a format tag. If this parameter is <b>NULL</b>, the ACM uses the details from the first suitable ACM driver.
     * @param {Pointer<ACMFORMATDETAILSA>} pafd Pointer to an [ACMFORMATDETAILS](./nf-msacm-acmformatdetails.md) structure to contain the format details for the given format tag.
     * @param {Integer} fdwDetails Flags for getting the waveform-audio format tag details. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>ACM_FORMATDETAILSF_FORMAT</td>
     * [ACMFORMATDETAILS](./nf-msacm-acmformatdetails.md) structure was given and the remaining details should be returned. The <b>dwFormatTag</b> member of the <b>ACMFORMATDETAILS</b> structure must be initialized to the same format tag as <b>pwfx</b> specifies. This query type can be used to get a string description of an arbitrary format structure. If an application specifies an ACM driver handle for <i>had</i>, details on the format will be returned for that driver. If an application specifies <b>NULL</b> for <i>had</i>, the ACM finds the first acceptable driver to return the details.</td>
     * </tr>
     * <tr>
     * <td>ACM_FORMATDETAILSF_INDEX</td>
     * <td>A format index for the format tag was given in the <b>dwFormatIndex</b> member of the <b>ACMFORMATDETAILS</b> structure. The format details will be returned in the structure defined by <i>pafd</i>. The index ranges from zero to one less than the <b>cStandardFormats</b> member returned in the <b>ACMFORMATTAGDETAILS</b> structure for a format tag. An application must specify a driver handle for <i>had</i> when retrieving format details with this flag. For information about which members should be initialized before calling this function, see the <b>ACMFORMATDETAILS</b> structure.</td>
     * </tr>
     * </table>
     * @returns {Integer} Returns zero if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ACMERR_NOTPOSSIBLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The details requested are not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmformatdetailsa
     * @since windows5.0
     */
    static acmFormatDetailsA(had, pafd, fdwDetails) {
        had := had is Win32Handle ? NumGet(had, "ptr") : had

        result := DllCall("MSACM32.dll\acmFormatDetailsA", "ptr", had, "ptr", pafd, "uint", fdwDetails, "uint")
        return result
    }

    /**
     * The acmFormatDetails function queries the ACM for format details for a specific waveform-audio format tag.
     * @param {HACMDRIVER} had Handle to the ACM driver to query for waveform-audio format details for a format tag. If this parameter is <b>NULL</b>, the ACM uses the details from the first suitable ACM driver.
     * @param {Pointer<tACMFORMATDETAILSW>} pafd Pointer to an [ACMFORMATDETAILS](./nf-msacm-acmformatdetails.md) structure to contain the format details for the given format tag.
     * @param {Integer} fdwDetails Flags for getting the waveform-audio format tag details. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>ACM_FORMATDETAILSF_FORMAT</td>
     * [ACMFORMATDETAILS](./nf-msacm-acmformatdetails.md) structure was given and the remaining details should be returned. The <b>dwFormatTag</b> member of the <b>ACMFORMATDETAILS</b> structure must be initialized to the same format tag as <b>pwfx</b> specifies. This query type can be used to get a string description of an arbitrary format structure. If an application specifies an ACM driver handle for <i>had</i>, details on the format will be returned for that driver. If an application specifies <b>NULL</b> for <i>had</i>, the ACM finds the first acceptable driver to return the details.</td>
     * </tr>
     * <tr>
     * <td>ACM_FORMATDETAILSF_INDEX</td>
     * <td>A format index for the format tag was given in the <b>dwFormatIndex</b> member of the <b>ACMFORMATDETAILS</b> structure. The format details will be returned in the structure defined by <i>pafd</i>. The index ranges from zero to one less than the <b>cStandardFormats</b> member returned in the <b>ACMFORMATTAGDETAILS</b> structure for a format tag. An application must specify a driver handle for <i>had</i> when retrieving format details with this flag. For information about which members should be initialized before calling this function, see the <b>ACMFORMATDETAILS</b> structure.</td>
     * </tr>
     * </table>
     * @returns {Integer} Returns zero if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ACMERR_NOTPOSSIBLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The details requested are not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmformatdetailsw
     * @since windows5.0
     */
    static acmFormatDetailsW(had, pafd, fdwDetails) {
        had := had is Win32Handle ? NumGet(had, "ptr") : had

        result := DllCall("MSACM32.dll\acmFormatDetailsW", "ptr", had, "ptr", pafd, "uint", fdwDetails, "uint")
        return result
    }

    /**
     * The acmFormatEnum function enumerates waveform-audio formats available for a given format tag from an ACM driver. This function continues enumerating until there are no more suitable formats for the format tag or the callback function returns FALSE.
     * @param {HACMDRIVER} had Handle to the ACM driver to query for waveform-audio format details. If this parameter is <b>NULL</b>, the ACM uses the details from the first suitable ACM driver.
     * @param {Pointer<ACMFORMATDETAILSA>} pafd Pointer to an [ACMFORMATDETAILS](./nf-msacm-acmformatdetails.md) structure to contain the format details passed to the <b>fnCallback</b> function. This structure must have the <b>cbStruct</b>, <b>pwfx</b>, and <b>cbwfx</b> members of the <b>ACMFORMATDETAILS</b> structure initialized. The <b>dwFormatTag</b> member must also be initialized to either WAVE_FORMAT_UNKNOWN or a valid format tag.
     * 
     * The <b>fdwSupport</b> member of the structure must be initialized to zero.
     * 
     * To find the required size of the <b>pwfx</b> buffer, call <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmmetrics">acmMetrics</a> with the ACM_METRIC_MAX_SIZE_FORMAT flag.
     * @param {Pointer<ACMFORMATENUMCBA>} fnCallback Address of an application-defined callback function. See <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nc-msacm-acmformatenumcb">acmFormatEnumCallback</a>. This parameter cannot be <b>NULL</b>.
     * @param {Pointer} dwInstance A 64-bit (DWORD_PTR) or 32-bit (DWORD) application-defined value that is passed to the callback function along with ACM format details.
     * @param {Integer} fdwEnum Flags for enumerating the formats for a given format tag. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>ACM_FORMATENUMF_CONVERT</td>
     * [ACMFORMATDETAILS](./nf-msacm-acmformatdetails.md) structure is valid. The enumerator will only enumerate destination formats that can be converted from the given <b>pwfx</b> format.If this flag is used, the <b>wFormatTag</b> member of the <b>WAVEFORMATEX</b> structure cannot be WAVE_FORMAT_UNKNOWN.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>ACM_FORMATENUMF_HARDWARE</td>
     * <td>The enumerator should only enumerate formats that are supported as native input or output formats on one or more of the installed waveform-audio devices. This flag provides a way for an application to choose only formats native to an installed waveform-audio device. This flag must be used with one or both of the ACM_FORMATENUMF_INPUT and ACM_FORMATENUMF_OUTPUT flags. Specifying both ACM_FORMATENUMF_INPUT and ACM_FORMATENUMF_OUTPUT will enumerate only formats that can be opened for input or output. This is true regardless of whether this flag is specified.</td>
     * </tr>
     * <tr>
     * <td>ACM_FORMATENUMF_INPUT</td>
     * <td>Enumerator should enumerate only formats that are supported for input (recording).</td>
     * </tr>
     * <tr>
     * <td>ACM_FORMATENUMF_NCHANNELS</td>
     * [ACMFORMATDETAILS](./nf-msacm-acmformatdetails.md) structure is valid. The enumerator will enumerate only a format that conforms to this attribute.</td>
     * </tr>
     * <tr>
     * <td>ACM_FORMATENUMF_NSAMPLESPERSEC</td>
     * <td>The <b>nSamplesPerSec</b> member of the <b>WAVEFORMATEX</b> structure pointed to by the <b>pwfx</b> member of the <b>ACMFORMATDETAILS</b> structure is valid. The enumerator will enumerate only a format that conforms to this attribute.</td>
     * </tr>
     * <tr>
     * <td>ACM_FORMATENUMF_OUTPUT</td>
     * <td>Enumerator should enumerate only formats that are supported for output (playback).</td>
     * </tr>
     * <tr>
     * <td>ACM_FORMATENUMF_SUGGEST</td>
     * [ACMFORMATDETAILS](./nf-msacm-acmformatdetails.md) structure is valid. The enumerator will enumerate all suggested destination formats for the given <b>pwfx</b> format. This mechanism can be used instead of the <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmformatsuggest">acmFormatSuggest</a> function to allow an application to choose the best suggested format for conversion. The <b>dwFormatIndex</b> member will always be set to zero on return.If this flag is used, the <b>wFormatTag</b> member of the <b>WAVEFORMATEX</b> structure cannot be WAVE_FORMAT_UNKNOWN.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>ACM_FORMATENUMF_WBITSPERSAMPLE</td>
     * <td>The <b>wBitsPerSample</b> member of the <b>WAVEFORMATEX</b> structure pointed to by the <b>pwfx</b> member of the <b>ACMFORMATDETAILS</b> structure is valid. The enumerator will enumerate only a format that conforms to this attribute.</td>
     * </tr>
     * <tr>
     * <td>ACM_FORMATENUMF_WFORMATTAG</td>
     * <td>The <b>wFormatTag</b> member of the <b>WAVEFORMATEX</b> structure pointed to by the <b>pwfx</b> member of the <b>ACMFORMATDETAILS</b> structure is valid. The enumerator will enumerate only a format that conforms to this attribute. The <b>dwFormatTag</b> member of the <b>ACMFORMATDETAILS</b> structure must be equal to the <b>wFormatTag</b> member.The value of <b>wFormatTag</b> cannot be WAVE_FORMAT_UNKNOWN in this case.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} Returns zero if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ACMERR_NOTPOSSIBLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The details for the format cannot be returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmformatenuma
     * @since windows5.0
     */
    static acmFormatEnumA(had, pafd, fnCallback, dwInstance, fdwEnum) {
        had := had is Win32Handle ? NumGet(had, "ptr") : had

        result := DllCall("MSACM32.dll\acmFormatEnumA", "ptr", had, "ptr", pafd, "ptr", fnCallback, "ptr", dwInstance, "uint", fdwEnum, "uint")
        return result
    }

    /**
     * The acmFormatEnum function enumerates waveform-audio formats available for a given format tag from an ACM driver. This function continues enumerating until there are no more suitable formats for the format tag or the callback function returns FALSE.
     * @param {HACMDRIVER} had Handle to the ACM driver to query for waveform-audio format details. If this parameter is <b>NULL</b>, the ACM uses the details from the first suitable ACM driver.
     * @param {Pointer<tACMFORMATDETAILSW>} pafd Pointer to an [ACMFORMATDETAILS](./nf-msacm-acmformatdetails.md) structure to contain the format details passed to the <b>fnCallback</b> function. This structure must have the <b>cbStruct</b>, <b>pwfx</b>, and <b>cbwfx</b> members of the <b>ACMFORMATDETAILS</b> structure initialized. The <b>dwFormatTag</b> member must also be initialized to either WAVE_FORMAT_UNKNOWN or a valid format tag.
     * 
     * The <b>fdwSupport</b> member of the structure must be initialized to zero.
     * 
     * To find the required size of the <b>pwfx</b> buffer, call <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmmetrics">acmMetrics</a> with the ACM_METRIC_MAX_SIZE_FORMAT flag.
     * @param {Pointer<ACMFORMATENUMCBW>} fnCallback Address of an application-defined callback function. See <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nc-msacm-acmformatenumcb">acmFormatEnumCallback</a>. This parameter cannot be <b>NULL</b>.
     * @param {Pointer} dwInstance A 64-bit (DWORD_PTR) or 32-bit (DWORD) application-defined value that is passed to the callback function along with ACM format details.
     * @param {Integer} fdwEnum Flags for enumerating the formats for a given format tag. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>ACM_FORMATENUMF_CONVERT</td>
     * [ACMFORMATDETAILS](./nf-msacm-acmformatdetails.md) structure is valid. The enumerator will only enumerate destination formats that can be converted from the given <b>pwfx</b> format.If this flag is used, the <b>wFormatTag</b> member of the <b>WAVEFORMATEX</b> structure cannot be WAVE_FORMAT_UNKNOWN.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>ACM_FORMATENUMF_HARDWARE</td>
     * <td>The enumerator should only enumerate formats that are supported as native input or output formats on one or more of the installed waveform-audio devices. This flag provides a way for an application to choose only formats native to an installed waveform-audio device. This flag must be used with one or both of the ACM_FORMATENUMF_INPUT and ACM_FORMATENUMF_OUTPUT flags. Specifying both ACM_FORMATENUMF_INPUT and ACM_FORMATENUMF_OUTPUT will enumerate only formats that can be opened for input or output. This is true regardless of whether this flag is specified.</td>
     * </tr>
     * <tr>
     * <td>ACM_FORMATENUMF_INPUT</td>
     * <td>Enumerator should enumerate only formats that are supported for input (recording).</td>
     * </tr>
     * <tr>
     * <td>ACM_FORMATENUMF_NCHANNELS</td>
     * [ACMFORMATDETAILS](./nf-msacm-acmformatdetails.md) structure is valid. The enumerator will enumerate only a format that conforms to this attribute.</td>
     * </tr>
     * <tr>
     * <td>ACM_FORMATENUMF_NSAMPLESPERSEC</td>
     * <td>The <b>nSamplesPerSec</b> member of the <b>WAVEFORMATEX</b> structure pointed to by the <b>pwfx</b> member of the <b>ACMFORMATDETAILS</b> structure is valid. The enumerator will enumerate only a format that conforms to this attribute.</td>
     * </tr>
     * <tr>
     * <td>ACM_FORMATENUMF_OUTPUT</td>
     * <td>Enumerator should enumerate only formats that are supported for output (playback).</td>
     * </tr>
     * <tr>
     * <td>ACM_FORMATENUMF_SUGGEST</td>
     * [ACMFORMATDETAILS](./nf-msacm-acmformatdetails.md) structure is valid. The enumerator will enumerate all suggested destination formats for the given <b>pwfx</b> format. This mechanism can be used instead of the <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmformatsuggest">acmFormatSuggest</a> function to allow an application to choose the best suggested format for conversion. The <b>dwFormatIndex</b> member will always be set to zero on return.If this flag is used, the <b>wFormatTag</b> member of the <b>WAVEFORMATEX</b> structure cannot be WAVE_FORMAT_UNKNOWN.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>ACM_FORMATENUMF_WBITSPERSAMPLE</td>
     * <td>The <b>wBitsPerSample</b> member of the <b>WAVEFORMATEX</b> structure pointed to by the <b>pwfx</b> member of the <b>ACMFORMATDETAILS</b> structure is valid. The enumerator will enumerate only a format that conforms to this attribute.</td>
     * </tr>
     * <tr>
     * <td>ACM_FORMATENUMF_WFORMATTAG</td>
     * <td>The <b>wFormatTag</b> member of the <b>WAVEFORMATEX</b> structure pointed to by the <b>pwfx</b> member of the <b>ACMFORMATDETAILS</b> structure is valid. The enumerator will enumerate only a format that conforms to this attribute. The <b>dwFormatTag</b> member of the <b>ACMFORMATDETAILS</b> structure must be equal to the <b>wFormatTag</b> member.The value of <b>wFormatTag</b> cannot be WAVE_FORMAT_UNKNOWN in this case.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} Returns zero if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ACMERR_NOTPOSSIBLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The details for the format cannot be returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmformatenumw
     * @since windows5.0
     */
    static acmFormatEnumW(had, pafd, fnCallback, dwInstance, fdwEnum) {
        had := had is Win32Handle ? NumGet(had, "ptr") : had

        result := DllCall("MSACM32.dll\acmFormatEnumW", "ptr", had, "ptr", pafd, "ptr", fnCallback, "ptr", dwInstance, "uint", fdwEnum, "uint")
        return result
    }

    /**
     * The acmFormatSuggest function queries the ACM or a specified ACM driver to suggest a destination format for the supplied source format.
     * @param {HACMDRIVER} had Handle to an open instance of a driver to query for a suggested destination format. If this parameter is <b>NULL</b>, the ACM attempts to find the best driver to suggest a destination format.
     * @param {Pointer<WAVEFORMATEX>} pwfxSrc Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure that identifies the source format for which a destination format will be suggested by the ACM or specified driver.
     * @param {Pointer<WAVEFORMATEX>} pwfxDst Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure that will receive the suggested destination format for the <i>pwfxSrc</i> format. Depending on the <i>fdwSuggest</i> parameter, some members of the structure pointed to by <i>pwfxDst</i> may require initialization.
     * @param {Integer} cbwfxDst Size, in bytes, available for the destination format. The <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmmetrics">acmMetrics</a> and <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmformattagdetails">acmFormatTagDetails</a> functions can be used to determine the maximum size required for any format available for the specified driver (or for all installed ACM drivers).
     * @param {Integer} fdwSuggest Flags for matching the desired destination format. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>ACM_FORMATSUGGESTF_NCHANNELS</td>
     * <td>The <b>nChannels</b> member of the structure pointed to by <i>pwfxDst</i> is valid. The ACM will query acceptable installed drivers that can suggest a destination format matching <b>nChannels</b> or fail.</td>
     * </tr>
     * <tr>
     * <td>ACM_FORMATSUGGESTF_NSAMPLESPERSEC</td>
     * <td>The <b>nSamplesPerSec</b> member of the structure pointed to by <i>pwfxDst</i> is valid. The ACM will query acceptable installed drivers that can suggest a destination format matching <b>nSamplesPerSec</b> or fail.</td>
     * </tr>
     * <tr>
     * <td>ACM_FORMATSUGGESTF_WBITSPERSAMPLE</td>
     * <td>The <b>wBitsPerSample</b> member of the structure pointed to by <i>pwfxDst</i> is valid. The ACM will query acceptable installed drivers that can suggest a destination format matching <b>wBitsPerSample</b> or fail.</td>
     * </tr>
     * <tr>
     * <td>ACM_FORMATSUGGESTF_WFORMATTAG</td>
     * <td>The <b>wFormatTag</b> member of the structure pointed to by <i>pwfxDst</i> is valid. The ACM will query acceptable installed drivers that can suggest a destination format matching <b>wFormatTag</b> or fail.</td>
     * </tr>
     * </table>
     * @returns {Integer} Returns zero if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmformatsuggest
     * @since windows5.0
     */
    static acmFormatSuggest(had, pwfxSrc, pwfxDst, cbwfxDst, fdwSuggest) {
        had := had is Win32Handle ? NumGet(had, "ptr") : had

        result := DllCall("MSACM32.dll\acmFormatSuggest", "ptr", had, "ptr", pwfxSrc, "ptr", pwfxDst, "uint", cbwfxDst, "uint", fdwSuggest, "uint")
        return result
    }

    /**
     * The acmFormatChoose function creates an ACM-defined dialog box that enables the user to select a waveform-audio format.
     * @param {Pointer<ACMFORMATCHOOSEA>} pafmtc Pointer to an [ACMFORMATCHOOSE](./nf-msacm-acmformatchoose.md) structure that contains information used to initialize the dialog box. When this function returns, this structure contains information about the user's format selection.
     * 
     * The <b>pwfx</b> member of this structure must contain a valid pointer to a memory location that will contain the returned format header structure. Moreover, the <b>cbwfx</b> member must be filled in with the size, in bytes, of this memory buffer.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ACMERR_CANCELED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user chose the Cancel button or the Close command on the System menu to close the dialog box.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ACMERR_NOTPOSSIBLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer identified by the <b>pwfx</b> member of the <b>ACMFORMATCHOOSE</b> structure is too small to contain the selected format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A suitable driver is not available to provide valid format selections.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmformatchoosea
     * @since windows5.0
     */
    static acmFormatChooseA(pafmtc) {
        result := DllCall("MSACM32.dll\acmFormatChooseA", "ptr", pafmtc, "uint")
        return result
    }

    /**
     * The acmFormatChoose function creates an ACM-defined dialog box that enables the user to select a waveform-audio format.
     * @param {Pointer<ACMFORMATCHOOSEW>} pafmtc Pointer to an [ACMFORMATCHOOSE](./nf-msacm-acmformatchoose.md) structure that contains information used to initialize the dialog box. When this function returns, this structure contains information about the user's format selection.
     * 
     * The <b>pwfx</b> member of this structure must contain a valid pointer to a memory location that will contain the returned format header structure. Moreover, the <b>cbwfx</b> member must be filled in with the size, in bytes, of this memory buffer.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ACMERR_CANCELED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user chose the Cancel button or the Close command on the System menu to close the dialog box.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ACMERR_NOTPOSSIBLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer identified by the <b>pwfx</b> member of the <b>ACMFORMATCHOOSE</b> structure is too small to contain the selected format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A suitable driver is not available to provide valid format selections.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmformatchoosew
     * @since windows5.0
     */
    static acmFormatChooseW(pafmtc) {
        result := DllCall("MSACM32.dll\acmFormatChooseW", "ptr", pafmtc, "uint")
        return result
    }

    /**
     * The acmFilterTagDetails function queries the ACM for details about a specific waveform-audio filter tag.
     * @param {HACMDRIVER} had Handle to the ACM driver to query for waveform-audio filter tag details. If this parameter is <b>NULL</b>, the ACM uses the details from the first suitable ACM driver. An application must specify a valid <b>HACMDRIVER</b> or <b>HACMDRIVERID</b> identifier when using the ACM_FILTERTAGDETAILSF_INDEX query type. Driver identifiers for disabled drivers are not allowed.
     * @param {Pointer<ACMFILTERTAGDETAILSA>} paftd Pointer to the [ACMFILTERTAGDETAILS](./nf-msacm-acmfiltertagdetails.md) structure that is to receive the filter tag details.
     * @param {Integer} fdwDetails Flags for getting the details. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>ACM_FILTERTAGDETAILSF_FILTERTAG</td>
     * [ACMFILTERTAGDETAILS](./nf-msacm-acmfiltertagdetails.md) structure. The filter tag details will be returned in the structure pointed to by <i>paftd</i>. If an application specifies an ACM driver handle for <i>had</i>, details on the filter tag will be returned for that driver. If an application specifies <b>NULL</b> for <i>had</i>, the ACM finds the first acceptable driver to return the details.</td>
     * </tr>
     * <tr>
     * <td>ACM_FILTERTAGDETAILSF_INDEX</td>
     * [ACMDRIVERDETAILS](./nf-msacm-acmdriverdetails.md) structure for an ACM driver. An application must specify a driver handle for <i>had</i> when retrieving filter tag details with this flag.</td>
     * </tr>
     * <tr>
     * <td>ACM_FILTERTAGDETAILSF_LARGESTSIZE</td>
     * <td>Details on the filter tag with the largest filter size, in bytes, are to be returned. The <b>dwFilterTag</b> member must either be WAVE_FILTER_UNKNOWN or the filter tag to find the largest size for. If an application specifies an ACM driver handle for <i>had</i>, details on the largest filter tag will be returned for that driver. If an application specifies <b>NULL</b> for <i>had</i>, the ACM finds an acceptable driver with the largest filter tag requested to return the details.</td>
     * </tr>
     * </table>
     * @returns {Integer} Returns zero if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ACMERR_NOTPOSSIBLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The details requested are not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmfiltertagdetailsa
     * @since windows5.0
     */
    static acmFilterTagDetailsA(had, paftd, fdwDetails) {
        had := had is Win32Handle ? NumGet(had, "ptr") : had

        result := DllCall("MSACM32.dll\acmFilterTagDetailsA", "ptr", had, "ptr", paftd, "uint", fdwDetails, "uint")
        return result
    }

    /**
     * The acmFilterTagDetails function queries the ACM for details about a specific waveform-audio filter tag.
     * @param {HACMDRIVER} had Handle to the ACM driver to query for waveform-audio filter tag details. If this parameter is <b>NULL</b>, the ACM uses the details from the first suitable ACM driver. An application must specify a valid <b>HACMDRIVER</b> or <b>HACMDRIVERID</b> identifier when using the ACM_FILTERTAGDETAILSF_INDEX query type. Driver identifiers for disabled drivers are not allowed.
     * @param {Pointer<ACMFILTERTAGDETAILSW>} paftd Pointer to the [ACMFILTERTAGDETAILS](./nf-msacm-acmfiltertagdetails.md) structure that is to receive the filter tag details.
     * @param {Integer} fdwDetails Flags for getting the details. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>ACM_FILTERTAGDETAILSF_FILTERTAG</td>
     * [ACMFILTERTAGDETAILS](./nf-msacm-acmfiltertagdetails.md) structure. The filter tag details will be returned in the structure pointed to by <i>paftd</i>. If an application specifies an ACM driver handle for <i>had</i>, details on the filter tag will be returned for that driver. If an application specifies <b>NULL</b> for <i>had</i>, the ACM finds the first acceptable driver to return the details.</td>
     * </tr>
     * <tr>
     * <td>ACM_FILTERTAGDETAILSF_INDEX</td>
     * [ACMDRIVERDETAILS](./nf-msacm-acmdriverdetails.md) structure for an ACM driver. An application must specify a driver handle for <i>had</i> when retrieving filter tag details with this flag.</td>
     * </tr>
     * <tr>
     * <td>ACM_FILTERTAGDETAILSF_LARGESTSIZE</td>
     * <td>Details on the filter tag with the largest filter size, in bytes, are to be returned. The <b>dwFilterTag</b> member must either be WAVE_FILTER_UNKNOWN or the filter tag to find the largest size for. If an application specifies an ACM driver handle for <i>had</i>, details on the largest filter tag will be returned for that driver. If an application specifies <b>NULL</b> for <i>had</i>, the ACM finds an acceptable driver with the largest filter tag requested to return the details.</td>
     * </tr>
     * </table>
     * @returns {Integer} Returns zero if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ACMERR_NOTPOSSIBLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The details requested are not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmfiltertagdetailsw
     * @since windows5.0
     */
    static acmFilterTagDetailsW(had, paftd, fdwDetails) {
        had := had is Win32Handle ? NumGet(had, "ptr") : had

        result := DllCall("MSACM32.dll\acmFilterTagDetailsW", "ptr", had, "ptr", paftd, "uint", fdwDetails, "uint")
        return result
    }

    /**
     * The acmFilterTagEnum function enumerates waveform-audio filter tags available from an ACM driver. This function continues enumerating until there are no more suitable filter tags or the callback function returns FALSE.
     * @param {HACMDRIVER} had Handle to the ACM driver to query for waveform-audio filter tag details. If this parameter is <b>NULL</b>, the ACM uses the details from the first suitable ACM driver.
     * @param {Pointer<ACMFILTERTAGDETAILSA>} paftd Pointer to the [ACMFILTERTAGDETAILS](./nf-msacm-acmfiltertagdetails.md) structure that contains the filter tag details when it is passed to the <b>fnCallback</b> function. When your application calls <b>acmFilterTagEnum</b>, the <b>cbStruct</b> member of this structure must be initialized.
     * @param {Pointer<ACMFILTERTAGENUMCBA>} fnCallback Procedure instance address of the application-defined callback function.
     * @param {Pointer} dwInstance A 64-bit (DWORD_PTR) or 32-bit (DWORD) application-defined value that is passed to the callback function along with ACM filter tag details.
     * @param {Integer} fdwEnum Reserved; must be zero.
     * @returns {Integer} Returns zero if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmfiltertagenuma
     * @since windows5.0
     */
    static acmFilterTagEnumA(had, paftd, fnCallback, dwInstance, fdwEnum) {
        had := had is Win32Handle ? NumGet(had, "ptr") : had

        result := DllCall("MSACM32.dll\acmFilterTagEnumA", "ptr", had, "ptr", paftd, "ptr", fnCallback, "ptr", dwInstance, "uint", fdwEnum, "uint")
        return result
    }

    /**
     * The acmFilterTagEnum function enumerates waveform-audio filter tags available from an ACM driver. This function continues enumerating until there are no more suitable filter tags or the callback function returns FALSE.
     * @param {HACMDRIVER} had Handle to the ACM driver to query for waveform-audio filter tag details. If this parameter is <b>NULL</b>, the ACM uses the details from the first suitable ACM driver.
     * @param {Pointer<ACMFILTERTAGDETAILSW>} paftd Pointer to the [ACMFILTERTAGDETAILS](./nf-msacm-acmfiltertagdetails.md) structure that contains the filter tag details when it is passed to the <b>fnCallback</b> function. When your application calls <b>acmFilterTagEnum</b>, the <b>cbStruct</b> member of this structure must be initialized.
     * @param {Pointer<ACMFILTERTAGENUMCBW>} fnCallback Procedure instance address of the application-defined callback function.
     * @param {Pointer} dwInstance A 64-bit (DWORD_PTR) or 32-bit (DWORD) application-defined value that is passed to the callback function along with ACM filter tag details.
     * @param {Integer} fdwEnum Reserved; must be zero.
     * @returns {Integer} Returns zero if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmfiltertagenumw
     * @since windows5.0
     */
    static acmFilterTagEnumW(had, paftd, fnCallback, dwInstance, fdwEnum) {
        had := had is Win32Handle ? NumGet(had, "ptr") : had

        result := DllCall("MSACM32.dll\acmFilterTagEnumW", "ptr", had, "ptr", paftd, "ptr", fnCallback, "ptr", dwInstance, "uint", fdwEnum, "uint")
        return result
    }

    /**
     * The acmFilterDetails function queries the ACM for details about a filter with a specific waveform-audio filter tag.
     * @param {HACMDRIVER} had Handle to the ACM driver to query for waveform-audio filter details for a filter tag. If this parameter is <b>NULL</b>, the ACM uses the details from the first suitable ACM driver.
     * @param {Pointer<ACMFILTERDETAILSA>} pafd Pointer to the [ACMFILTERDETAILS](./nf-msacm-acmfilterdetails.md) structure that is to receive the filter details for the given filter tag.
     * @param {Integer} fdwDetails Flags for getting the details. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>ACM_FILTERDETAILSF_FILTER</td>
     * [ACMFILTERDETAILS](./nf-msacm-acmfilterdetails.md) structure was given and the remaining details should be returned. The <b>dwFilterTag</b> member of the <b>ACMFILTERDETAILS</b> structure must be initialized to the same filter tag <b>pwfltr</b> specifies. This query type can be used to get a string description of an arbitrary filter structure. If an application specifies an ACM driver handle for <i>had</i>, details on the filter will be returned for that driver. If an application specifies <b>NULL</b> for <i>had</i>, the ACM finds the first acceptable driver to return the details.</td>
     * </tr>
     * <tr>
     * <td>ACM_FILTERDETAILSF_INDEX</td>
     * <td>A filter index for the filter tag was given in the <b>dwFilterIndex</b> member of the <b>ACMFILTERDETAILS</b> structure. The filter details will be returned in the structure defined by <i>pafd</i>. The index ranges from zero to one less than the <b>cStandardFilters</b> member returned in the <b>ACMFILTERTAGDETAILS</b> structure for a filter tag. An application must specify a driver handle for <i>had</i> when retrieving filter details with this flag. For information about what members should be initialized before calling this function, see the <b>ACMFILTERDETAILS</b> structure.</td>
     * </tr>
     * </table>
     * @returns {Integer} Returns zero if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ACMERR_NOTPOSSIBLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The details requested are not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmfilterdetailsa
     * @since windows5.0
     */
    static acmFilterDetailsA(had, pafd, fdwDetails) {
        had := had is Win32Handle ? NumGet(had, "ptr") : had

        result := DllCall("MSACM32.dll\acmFilterDetailsA", "ptr", had, "ptr", pafd, "uint", fdwDetails, "uint")
        return result
    }

    /**
     * The acmFilterDetails function queries the ACM for details about a filter with a specific waveform-audio filter tag.
     * @param {HACMDRIVER} had Handle to the ACM driver to query for waveform-audio filter details for a filter tag. If this parameter is <b>NULL</b>, the ACM uses the details from the first suitable ACM driver.
     * @param {Pointer<ACMFILTERDETAILSW>} pafd Pointer to the [ACMFILTERDETAILS](./nf-msacm-acmfilterdetails.md) structure that is to receive the filter details for the given filter tag.
     * @param {Integer} fdwDetails Flags for getting the details. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>ACM_FILTERDETAILSF_FILTER</td>
     * [ACMFILTERDETAILS](./nf-msacm-acmfilterdetails.md) structure was given and the remaining details should be returned. The <b>dwFilterTag</b> member of the <b>ACMFILTERDETAILS</b> structure must be initialized to the same filter tag <b>pwfltr</b> specifies. This query type can be used to get a string description of an arbitrary filter structure. If an application specifies an ACM driver handle for <i>had</i>, details on the filter will be returned for that driver. If an application specifies <b>NULL</b> for <i>had</i>, the ACM finds the first acceptable driver to return the details.</td>
     * </tr>
     * <tr>
     * <td>ACM_FILTERDETAILSF_INDEX</td>
     * <td>A filter index for the filter tag was given in the <b>dwFilterIndex</b> member of the <b>ACMFILTERDETAILS</b> structure. The filter details will be returned in the structure defined by <i>pafd</i>. The index ranges from zero to one less than the <b>cStandardFilters</b> member returned in the <b>ACMFILTERTAGDETAILS</b> structure for a filter tag. An application must specify a driver handle for <i>had</i> when retrieving filter details with this flag. For information about what members should be initialized before calling this function, see the <b>ACMFILTERDETAILS</b> structure.</td>
     * </tr>
     * </table>
     * @returns {Integer} Returns zero if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ACMERR_NOTPOSSIBLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The details requested are not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmfilterdetailsw
     * @since windows5.0
     */
    static acmFilterDetailsW(had, pafd, fdwDetails) {
        had := had is Win32Handle ? NumGet(had, "ptr") : had

        result := DllCall("MSACM32.dll\acmFilterDetailsW", "ptr", had, "ptr", pafd, "uint", fdwDetails, "uint")
        return result
    }

    /**
     * The acmFilterEnum function enumerates waveform-audio filters available for a given filter tag from an ACM driver. This function continues enumerating until there are no more suitable filters for the filter tag or the callback function returns FALSE.
     * @param {HACMDRIVER} had Handle to the ACM driver to query for waveform-audio filter details. If this parameter is <b>NULL</b>, the ACM uses the details from the first suitable ACM driver.
     * @param {Pointer<ACMFILTERDETAILSA>} pafd Pointer to the [ACMFILTERDETAILS](./nf-msacm-acmfilterdetails.md) structure that contains the filter details when it is passed to the function specified by <i>fnCallback</i>. When your application calls <b>acmFilterEnum</b>, the <b>cbStruct</b>, <b>pwfltr</b>, and <b>cbwfltr</b> members of this structure must be initialized. The <b>dwFilterTag</b> member must also be initialized to either WAVE_FILTER_UNKNOWN or a valid filter tag.
     * @param {Pointer<ACMFILTERENUMCBA>} fnCallback Procedure-instance address of the application-defined callback function.
     * @param {Pointer} dwInstance A 32-bit (DWORD), 64-bit (DWORD_PTR) application-defined value that is passed to the callback function along with ACM filter details.
     * @param {Integer} fdwEnum Flags for enumerating the filters for a given filter tag. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>ACM_FILTERENUMF_DWFILTERTAG</td>
     * [ACMFILTERDETAILS](./nf-msacm-acmfilterdetails.md) structure is valid. The enumerator will enumerate only a filter that conforms to this attribute. The <b>dwFilterTag</b> member of the <b>ACMFILTERDETAILS</b> structure must be equal to the <b>dwFilterTag</b> member of the <b>WAVEFILTER</b> structure.</td>
     * </tr>
     * </table>
     * @returns {Integer} Returns zero if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ACMERR_NOTPOSSIBLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The details for the filter cannot be returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmfilterenuma
     * @since windows5.0
     */
    static acmFilterEnumA(had, pafd, fnCallback, dwInstance, fdwEnum) {
        had := had is Win32Handle ? NumGet(had, "ptr") : had

        result := DllCall("MSACM32.dll\acmFilterEnumA", "ptr", had, "ptr", pafd, "ptr", fnCallback, "ptr", dwInstance, "uint", fdwEnum, "uint")
        return result
    }

    /**
     * The acmFilterEnum function enumerates waveform-audio filters available for a given filter tag from an ACM driver. This function continues enumerating until there are no more suitable filters for the filter tag or the callback function returns FALSE.
     * @param {HACMDRIVER} had Handle to the ACM driver to query for waveform-audio filter details. If this parameter is <b>NULL</b>, the ACM uses the details from the first suitable ACM driver.
     * @param {Pointer<ACMFILTERDETAILSW>} pafd Pointer to the [ACMFILTERDETAILS](./nf-msacm-acmfilterdetails.md) structure that contains the filter details when it is passed to the function specified by <i>fnCallback</i>. When your application calls <b>acmFilterEnum</b>, the <b>cbStruct</b>, <b>pwfltr</b>, and <b>cbwfltr</b> members of this structure must be initialized. The <b>dwFilterTag</b> member must also be initialized to either WAVE_FILTER_UNKNOWN or a valid filter tag.
     * @param {Pointer<ACMFILTERENUMCBW>} fnCallback Procedure-instance address of the application-defined callback function.
     * @param {Pointer} dwInstance A 32-bit (DWORD), 64-bit (DWORD_PTR) application-defined value that is passed to the callback function along with ACM filter details.
     * @param {Integer} fdwEnum Flags for enumerating the filters for a given filter tag. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>ACM_FILTERENUMF_DWFILTERTAG</td>
     * [ACMFILTERDETAILS](./nf-msacm-acmfilterdetails.md) structure is valid. The enumerator will enumerate only a filter that conforms to this attribute. The <b>dwFilterTag</b> member of the <b>ACMFILTERDETAILS</b> structure must be equal to the <b>dwFilterTag</b> member of the <b>WAVEFILTER</b> structure.</td>
     * </tr>
     * </table>
     * @returns {Integer} Returns zero if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ACMERR_NOTPOSSIBLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The details for the filter cannot be returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmfilterenumw
     * @since windows5.0
     */
    static acmFilterEnumW(had, pafd, fnCallback, dwInstance, fdwEnum) {
        had := had is Win32Handle ? NumGet(had, "ptr") : had

        result := DllCall("MSACM32.dll\acmFilterEnumW", "ptr", had, "ptr", pafd, "ptr", fnCallback, "ptr", dwInstance, "uint", fdwEnum, "uint")
        return result
    }

    /**
     * The acmFilterChoose function creates an ACM-defined dialog box that enables the user to select a waveform-audio filter.
     * @param {Pointer<ACMFILTERCHOOSEA>} pafltrc Pointer to an [ACMFILTERCHOOSE](./nf-msacm-acmfilterchoose.md) structure that contains information used to initialize the dialog box. When <b>acmFilterChoose</b> returns, this structure contains information about the user's filter selection.
     * 
     * The <b>pwfltr</b> member of this structure must contain a valid pointer to a memory location that will contain the returned filter header structure. The <b>cbwfltr</b> member must be filled in with the size, in bytes, of this memory buffer.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ACMERR_CANCELED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user chose the Cancel button or the Close command on the System menu to close the dialog box.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ACMERR_NOTPOSSIBLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer identified by the [ACMFILTERCHOOSE](./nf-msacm-acmfilterchoose.md) structure is too small to contain the selected filter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A suitable driver is not available to provide valid filter selections.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmfilterchoosea
     * @since windows5.0
     */
    static acmFilterChooseA(pafltrc) {
        result := DllCall("MSACM32.dll\acmFilterChooseA", "ptr", pafltrc, "uint")
        return result
    }

    /**
     * The acmFilterChoose function creates an ACM-defined dialog box that enables the user to select a waveform-audio filter.
     * @param {Pointer<ACMFILTERCHOOSEW>} pafltrc Pointer to an [ACMFILTERCHOOSE](./nf-msacm-acmfilterchoose.md) structure that contains information used to initialize the dialog box. When <b>acmFilterChoose</b> returns, this structure contains information about the user's filter selection.
     * 
     * The <b>pwfltr</b> member of this structure must contain a valid pointer to a memory location that will contain the returned filter header structure. The <b>cbwfltr</b> member must be filled in with the size, in bytes, of this memory buffer.
     * @returns {Integer} Returns MMSYSERR_NOERROR if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ACMERR_CANCELED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user chose the Cancel button or the Close command on the System menu to close the dialog box.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ACMERR_NOTPOSSIBLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer identified by the [ACMFILTERCHOOSE](./nf-msacm-acmfilterchoose.md) structure is too small to contain the selected filter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A suitable driver is not available to provide valid filter selections.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmfilterchoosew
     * @since windows5.0
     */
    static acmFilterChooseW(pafltrc) {
        result := DllCall("MSACM32.dll\acmFilterChooseW", "ptr", pafltrc, "uint")
        return result
    }

    /**
     * The acmStreamOpen function opens an ACM conversion stream. Conversion streams are used to convert data from one specified audio format to another.
     * @param {Pointer<HACMSTREAM>} phas Pointer to a handle that will receive the new stream handle that can be used to perform conversions. This handle is used to identify the stream in calls to other ACM stream conversion functions. If the ACM_STREAMOPENF_QUERY flag is specified, this parameter should be <b>NULL</b>.
     * @param {HACMDRIVER} had Handle to an ACM driver. If this handle is specified, it identifies a specific driver to be used for a conversion stream. If this parameter is <b>NULL</b>, all suitable installed ACM drivers are queried until a match is found.
     * @param {Pointer<WAVEFORMATEX>} pwfxSrc Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure that identifies the desired source format for the conversion.
     * @param {Pointer<WAVEFORMATEX>} pwfxDst Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure that identifies the desired destination format for the conversion.
     * @param {Pointer<WAVEFILTER>} pwfltr Pointer to a [WAVEFILTER](../mmreg/ns-mmreg-wavefilter.md) structure that identifies the desired filtering operation to perform on the conversion stream. If no filtering operation is desired, this parameter can be <b>NULL</b>. If a filter is specified, the source (<i>pwfxSrc</i>) and destination (<i>pwfxDst</i>) formats must be the same.
     * @param {Pointer} dwCallback Pointer to a callback function, a handle of a window, or a handle of an event. A callback function will be called only if the conversion stream is opened with the ACM_STREAMOPENF_ASYNC flag. A callback function is notified when the conversion stream is opened or closed and after each buffer is converted. If the conversion stream is opened without the ACM_STREAMOPENF_ASYNC flag, this parameter should be set to zero.
     * @param {Pointer} dwInstance User-instance data passed to the callback function specified by the <i>dwCallback</i> parameter. This parameter is not used with window and event callbacks. If the conversion stream is opened without the ACM_STREAMOPENF_ASYNC flag, this parameter should be set to zero.
     * @param {Integer} fdwOpen Flags for opening the conversion stream. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>ACM_STREAMOPENF_ASYNC</td>
     * [ACMSTREAMHEADER](./ns-msacm-acmstreamheader.md) structure for the ACMSTREAMHEADER_STATUSF_DONE flag.</td>
     * </tr>
     * <tr>
     * <td>ACM_STREAMOPENF_NONREALTIME</td>
     * <td>ACM will not consider time constraints when converting the data. By default, the driver will attempt to convert the data in real time. For some formats, specifying this flag might improve the audio quality or other characteristics.</td>
     * </tr>
     * <tr>
     * <td>ACM_STREAMOPENF_QUERY</td>
     * <td>ACM will be queried to determine whether it supports the given conversion. A conversion stream will not be opened, and no handle will be returned in the <i>phas</i> parameter.</td>
     * </tr>
     * <tr>
     * <td>CALLBACK_EVENT</td>
     * <td>The <i>dwCallback</i> parameter is a handle of an event.</td>
     * </tr>
     * <tr>
     * <td>CALLBACK_FUNCTION</td>
     * <td>The <i>dwCallback</i> parameter is a callback procedure address. The function prototype must conform to the <a href="https://docs.microsoft.com/previous-versions/dd742925(v=vs.85)">acmStreamConvertCallback</a> prototype.</td>
     * </tr>
     * <tr>
     * <td>CALLBACK_WINDOW</td>
     * <td>The <i>dwCallback</i> parameter is a window handle.</td>
     * </tr>
     * </table>
     * @returns {Integer} Returns zero if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ACMERR_NOTPOSSIBLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested operation cannot be performed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is unable to allocate resources.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmstreamopen
     * @since windows5.0
     */
    static acmStreamOpen(phas, had, pwfxSrc, pwfxDst, pwfltr, dwCallback, dwInstance, fdwOpen) {
        had := had is Win32Handle ? NumGet(had, "ptr") : had

        result := DllCall("MSACM32.dll\acmStreamOpen", "ptr", phas, "ptr", had, "ptr", pwfxSrc, "ptr", pwfxDst, "ptr", pwfltr, "ptr", dwCallback, "ptr", dwInstance, "uint", fdwOpen, "uint")
        return result
    }

    /**
     * The acmStreamClose function closes an ACM conversion stream. If the function is successful, the handle is invalidated.
     * @param {HACMSTREAM} has Handle to the open conversion stream to be closed.
     * @param {Integer} fdwClose Reserved; must be zero.
     * @returns {Integer} Returns zero if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ACMERR_BUSY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The conversion stream cannot be closed because an asynchronous conversion is still in progress.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmstreamclose
     * @since windows5.0
     */
    static acmStreamClose(has, fdwClose) {
        has := has is Win32Handle ? NumGet(has, "ptr") : has

        result := DllCall("MSACM32.dll\acmStreamClose", "ptr", has, "uint", fdwClose, "uint")
        return result
    }

    /**
     * The acmStreamSize function returns a recommended size for a source or destination buffer on an ACM stream.
     * @param {HACMSTREAM} has Handle to the conversion stream.
     * @param {Integer} cbInput Size, in bytes, of the source or destination buffer. The <i>fdwSize</i> flags specify what the input parameter defines. This parameter must be nonzero.
     * @param {Pointer<UInt32>} pdwOutputBytes Pointer to a variable that contains the size, in bytes, of the source or destination buffer. The <i>fdwSize</i> flags specify what the output parameter defines. If the <b>acmStreamSize</b> function succeeds, this location will always be filled with a nonzero value.
     * @param {Integer} fdwSize Flags for the stream size query. The following values are defined:
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>ACM_STREAMSIZEF_DESTINATION</td>
     * <td>The <i>cbInput</i> parameter contains the size of the destination buffer. The <i>pdwOutputBytes</i> parameter will receive the recommended source buffer size, in bytes.</td>
     * </tr>
     * <tr>
     * <td>ACM_STREAMSIZEF_SOURCE</td>
     * <td>The <i>cbInput</i> parameter contains the size of the source buffer. The <i>pdwOutputBytes</i> parameter will receive the recommended destination buffer size, in bytes.</td>
     * </tr>
     * </table>
     * @returns {Integer} Returns zero if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ACMERR_NOTPOSSIBLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested operation cannot be performed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmstreamsize
     * @since windows5.0
     */
    static acmStreamSize(has, cbInput, pdwOutputBytes, fdwSize) {
        has := has is Win32Handle ? NumGet(has, "ptr") : has

        result := DllCall("MSACM32.dll\acmStreamSize", "ptr", has, "uint", cbInput, "uint*", pdwOutputBytes, "uint", fdwSize, "uint")
        return result
    }

    /**
     * The acmStreamReset function stops conversions for a given ACM stream. All pending buffers are marked as done and returned to the application.
     * @param {HACMSTREAM} has Handle to the conversion stream.
     * @param {Integer} fdwReset Reserved; must be zero.
     * @returns {Integer} Returns zero if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmstreamreset
     * @since windows5.0
     */
    static acmStreamReset(has, fdwReset) {
        has := has is Win32Handle ? NumGet(has, "ptr") : has

        result := DllCall("MSACM32.dll\acmStreamReset", "ptr", has, "uint", fdwReset, "uint")
        return result
    }

    /**
     * The acmStreamMessage function sends a driver-specific message to an ACM driver.
     * @param {HACMSTREAM} has Handle to an open conversion stream.
     * @param {Integer} uMsg Message to send.
     * @param {LPARAM} lParam1 Message parameter.
     * @param {LPARAM} lParam2 Message parameter.
     * @returns {Integer} Returns the value returned by the ACM device driver.
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmstreammessage
     * @since windows5.0
     */
    static acmStreamMessage(has, uMsg, lParam1, lParam2) {
        has := has is Win32Handle ? NumGet(has, "ptr") : has

        result := DllCall("MSACM32.dll\acmStreamMessage", "ptr", has, "uint", uMsg, "ptr", lParam1, "ptr", lParam2, "uint")
        return result
    }

    /**
     * The acmStreamConvert function requests the ACM to perform a conversion on the specified conversion stream. A conversion may be synchronous or asynchronous, depending on how the stream was opened.
     * @param {HACMSTREAM} has Handle to the open conversion stream.
     * @param {Pointer<ACMSTREAMHEADER>} pash Pointer to a stream header that describes source and destination buffers for a conversion. This header must have been prepared previously by using the <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmstreamprepareheader">acmStreamPrepareHeader</a> function.
     * @param {Integer} fdwConvert Flags for doing the conversion. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>ACM_STREAMCONVERTF_BLOCKALIGN</td>
     * <td>Only integral numbers of blocks will be converted. Converted data will end on block-aligned boundaries. An application should use this flag for all conversions on a stream until there is not enough source data to convert to a block-aligned destination. In this case, the last conversion should be specified without this flag.</td>
     * </tr>
     * <tr>
     * <td>ACM_STREAMCONVERTF_END</td>
     * <td>ACM conversion stream should begin returning pending instance data. For example, if a conversion stream holds instance data, such as the end of an echo filter operation, this flag will cause the stream to start returning this remaining data with optional source data. This flag can be specified with the ACM_STREAMCONVERTF_START flag.</td>
     * </tr>
     * <tr>
     * <td>ACM_STREAMCONVERTF_START</td>
     * <td>ACM conversion stream should reinitialize its instance data. For example, if a conversion stream holds instance data, such as delta or predictor information, this flag will restore the stream to starting defaults. This flag can be specified with the ACM_STREAMCONVERTF_END flag.</td>
     * </tr>
     * </table>
     * @returns {Integer} Returns zero if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ACMERR_BUSY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stream header specified in <i>pash</i> is currently in use and cannot be reused.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ACMERR_UNPREPARED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stream header specified in <i>pash</i> is currently not prepared by the <a href="/windows/desktop/api/msacm/nf-msacm-acmstreamprepareheader">acmStreamPrepareHeader</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmstreamconvert
     * @since windows5.0
     */
    static acmStreamConvert(has, pash, fdwConvert) {
        has := has is Win32Handle ? NumGet(has, "ptr") : has

        result := DllCall("MSACM32.dll\acmStreamConvert", "ptr", has, "ptr", pash, "uint", fdwConvert, "uint")
        return result
    }

    /**
     * The acmStreamPrepareHeader function prepares an ACMSTREAMHEADER structure for an ACM stream conversion.
     * @param {HACMSTREAM} has Handle to the conversion steam.
     * @param {Pointer<ACMSTREAMHEADER>} pash Pointer to an [ACMSTREAMHEADER](./ns-msacm-acmstreamheader.md) structure that identifies the source and destination buffers to be prepared.
     * @param {Integer} fdwPrepare Reserved; must be zero.
     * @returns {Integer} Returns zero if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NOMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is unable to allocate resources.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmstreamprepareheader
     * @since windows5.0
     */
    static acmStreamPrepareHeader(has, pash, fdwPrepare) {
        has := has is Win32Handle ? NumGet(has, "ptr") : has

        result := DllCall("MSACM32.dll\acmStreamPrepareHeader", "ptr", has, "ptr", pash, "uint", fdwPrepare, "uint")
        return result
    }

    /**
     * The acmStreamUnprepareHeader function cleans up the preparation performed by the acmStreamPrepareHeader function for an ACM stream.
     * @param {HACMSTREAM} has Handle to the conversion steam.
     * @param {Pointer<ACMSTREAMHEADER>} pash Pointer to an [ACMSTREAMHEADER](./ns-msacm-acmstreamheader.md) structure that identifies the source and destination buffers to be unprepared.
     * @param {Integer} fdwUnprepare Reserved; must be zero.
     * @returns {Integer} Returns zero if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ACMERR_BUSY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stream header specified in <i>pash</i> is currently in use and cannot be unprepared.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ACMERR_UNPREPARED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stream header specified in <i>pash</i> is currently not prepared by the <a href="/windows/desktop/api/msacm/nf-msacm-acmstreamprepareheader">acmStreamPrepareHeader</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALFLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALHANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msacm/nf-msacm-acmstreamunprepareheader
     * @since windows5.0
     */
    static acmStreamUnprepareHeader(has, pash, fdwUnprepare) {
        has := has is Win32Handle ? NumGet(has, "ptr") : has

        result := DllCall("MSACM32.dll\acmStreamUnprepareHeader", "ptr", has, "ptr", pash, "uint", fdwUnprepare, "uint")
        return result
    }

;@endregion Methods
}
