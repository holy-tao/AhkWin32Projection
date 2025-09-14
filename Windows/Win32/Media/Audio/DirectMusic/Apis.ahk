#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 * @version v4.0.30319
 */
class DirectMusic {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_MAX_DESCRIPTION => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_MAX_DRIVER => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_EFFECT_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_EFFECT_REVERB => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_EFFECT_CHORUS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_EFFECT_DELAY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_PC_INPUTCLASS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_PC_OUTPUTCLASS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_PC_DLS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_PC_EXTERNAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_PC_SOFTWARESYNTH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_PC_MEMORYSIZEFIXED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_PC_GMINHARDWARE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_PC_GSINHARDWARE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_PC_XGINHARDWARE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_PC_DIRECTSOUND => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_PC_SHAREABLE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_PC_DLS2 => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_PC_AUDIOPATH => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_PC_WAVE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_PC_SYSTEMMEMORY => 2147483647

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_PORT_WINMM_DRIVER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_PORT_USER_MODE_SYNTH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_PORT_KERNEL_MODE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_PORTPARAMS_VOICES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_PORTPARAMS_CHANNELGROUPS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_PORTPARAMS_AUDIOCHANNELS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_PORTPARAMS_SAMPLERATE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_PORTPARAMS_EFFECTS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_PORTPARAMS_SHARE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_PORTPARAMS_FEATURES => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_PORT_FEATURE_AUDIOPATH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_PORT_FEATURE_STREAMING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_SYNTHSTATS_VOICES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_SYNTHSTATS_TOTAL_CPU => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_SYNTHSTATS_CPU_PER_VOICE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_SYNTHSTATS_LOST_NOTES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_SYNTHSTATS_PEAK_VOLUME => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_SYNTHSTATS_FREE_MEMORY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_SYNTHSTATS_SYSTEMMEMORY => 2147483647

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_CLOCKF_GLOBAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSBUSID_FIRST_SPKR_LOC => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DSBUSID_FRONT_LEFT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DSBUSID_LEFT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DSBUSID_FRONT_RIGHT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSBUSID_RIGHT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSBUSID_FRONT_CENTER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DSBUSID_LOW_FREQUENCY => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DSBUSID_BACK_LEFT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DSBUSID_BACK_RIGHT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DSBUSID_FRONT_LEFT_OF_CENTER => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DSBUSID_FRONT_RIGHT_OF_CENTER => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DSBUSID_BACK_CENTER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DSBUSID_SIDE_LEFT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DSBUSID_SIDE_RIGHT => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DSBUSID_TOP_CENTER => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DSBUSID_TOP_FRONT_LEFT => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DSBUSID_TOP_FRONT_CENTER => 13

    /**
     * @type {Integer (UInt32)}
     */
    static DSBUSID_TOP_FRONT_RIGHT => 14

    /**
     * @type {Integer (UInt32)}
     */
    static DSBUSID_TOP_BACK_LEFT => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DSBUSID_TOP_BACK_CENTER => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DSBUSID_TOP_BACK_RIGHT => 17

    /**
     * @type {Integer (UInt32)}
     */
    static DSBUSID_LAST_SPKR_LOC => 17

    /**
     * @type {Integer (UInt32)}
     */
    static DSBUSID_REVERB_SEND => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DSBUSID_CHORUS_SEND => 65

    /**
     * @type {Integer (UInt32)}
     */
    static DSBUSID_DYNAMIC_0 => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DSBUSID_NULL => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static DAUD_CRITICAL_VOICE_PRIORITY => 4026531840

    /**
     * @type {Integer (UInt32)}
     */
    static DAUD_HIGH_VOICE_PRIORITY => 3221225472

    /**
     * @type {Integer (UInt32)}
     */
    static DAUD_STANDARD_VOICE_PRIORITY => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static DAUD_LOW_VOICE_PRIORITY => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static DAUD_PERSIST_VOICE_PRIORITY => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static DAUD_CHAN1_VOICE_PRIORITY_OFFSET => 14

    /**
     * @type {Integer (UInt32)}
     */
    static DAUD_CHAN2_VOICE_PRIORITY_OFFSET => 13

    /**
     * @type {Integer (UInt32)}
     */
    static DAUD_CHAN3_VOICE_PRIORITY_OFFSET => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DAUD_CHAN4_VOICE_PRIORITY_OFFSET => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DAUD_CHAN5_VOICE_PRIORITY_OFFSET => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DAUD_CHAN6_VOICE_PRIORITY_OFFSET => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DAUD_CHAN7_VOICE_PRIORITY_OFFSET => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DAUD_CHAN8_VOICE_PRIORITY_OFFSET => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DAUD_CHAN9_VOICE_PRIORITY_OFFSET => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DAUD_CHAN10_VOICE_PRIORITY_OFFSET => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DAUD_CHAN11_VOICE_PRIORITY_OFFSET => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DAUD_CHAN12_VOICE_PRIORITY_OFFSET => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DAUD_CHAN13_VOICE_PRIORITY_OFFSET => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DAUD_CHAN14_VOICE_PRIORITY_OFFSET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DAUD_CHAN15_VOICE_PRIORITY_OFFSET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DAUD_CHAN16_VOICE_PRIORITY_OFFSET => 0

    /**
     * @type {String}
     */
    static CLSID_DirectMusic => "{636b9f10-0c7d-11d1-95b2-0020afdc7421}"

    /**
     * @type {String}
     */
    static CLSID_DirectMusicCollection => "{480ff4b0-28b2-11d1-bef7-00c04fbf8fef}"

    /**
     * @type {String}
     */
    static CLSID_DirectMusicSynth => "{58c2b4d0-46e7-11d1-89ac-00a0c9054129}"

    /**
     * @type {String}
     */
    static GUID_DMUS_PROP_GM_Hardware => "{178f2f24-c364-11d1-a760-0000f875ac12}"

    /**
     * @type {String}
     */
    static GUID_DMUS_PROP_GS_Hardware => "{178f2f25-c364-11d1-a760-0000f875ac12}"

    /**
     * @type {String}
     */
    static GUID_DMUS_PROP_XG_Hardware => "{178f2f26-c364-11d1-a760-0000f875ac12}"

    /**
     * @type {String}
     */
    static GUID_DMUS_PROP_XG_Capable => "{6496aba1-61b0-11d2-afa6-00aa0024d8b6}"

    /**
     * @type {String}
     */
    static GUID_DMUS_PROP_GS_Capable => "{6496aba2-61b0-11d2-afa6-00aa0024d8b6}"

    /**
     * @type {String}
     */
    static GUID_DMUS_PROP_DLS1 => "{178f2f27-c364-11d1-a760-0000f875ac12}"

    /**
     * @type {String}
     */
    static GUID_DMUS_PROP_DLS2 => "{f14599e5-4689-11d2-afa6-00aa0024d8b6}"

    /**
     * @type {String}
     */
    static GUID_DMUS_PROP_INSTRUMENT2 => "{865fd372-9f67-11d2-872a-00600893b1bd}"

    /**
     * @type {String}
     */
    static GUID_DMUS_PROP_SynthSink_DSOUND => "{0aa97844-c877-11d1-870c-00600893b1bd}"

    /**
     * @type {String}
     */
    static GUID_DMUS_PROP_SynthSink_WAVE => "{0aa97845-c877-11d1-870c-00600893b1bd}"

    /**
     * @type {String}
     */
    static GUID_DMUS_PROP_SampleMemorySize => "{178f2f28-c364-11d1-a760-0000f875ac12}"

    /**
     * @type {String}
     */
    static GUID_DMUS_PROP_SamplePlaybackRate => "{2a91f713-a4bf-11d2-bbdf-00600833dbd8}"

    /**
     * @type {String}
     */
    static GUID_DMUS_PROP_WriteLatency => "{268a0fa0-60f2-11d2-afa6-00aa0024d8b6}"

    /**
     * @type {String}
     */
    static GUID_DMUS_PROP_WritePeriod => "{268a0fa1-60f2-11d2-afa6-00aa0024d8b6}"

    /**
     * @type {String}
     */
    static GUID_DMUS_PROP_MemorySize => "{178f2f28-c364-11d1-a760-0000f875ac12}"

    /**
     * @type {String}
     */
    static GUID_DMUS_PROP_WavesReverb => "{04cb5622-32e5-11d2-afa6-00aa0024d8b6}"

    /**
     * @type {String}
     */
    static GUID_DMUS_PROP_Effects => "{cda8d611-684a-11d2-871e-00600893b1bd}"

    /**
     * @type {String}
     */
    static GUID_DMUS_PROP_LegacyCaps => "{cfa7cdc2-00a1-11d2-aad5-0000f875ac12}"

    /**
     * @type {String}
     */
    static GUID_DMUS_PROP_Volume => "{fedfae25-e46e-11d1-aace-0000f875ac12}"

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_VOLUME_MAX => 2000

    /**
     * @type {Integer (Int32)}
     */
    static DMUS_VOLUME_MIN => -20000

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_EVENT_STRUCTURED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_DOWNLOADINFO_INSTRUMENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_DOWNLOADINFO_WAVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_DOWNLOADINFO_INSTRUMENT2 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_DOWNLOADINFO_WAVEARTICULATION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_DOWNLOADINFO_STREAMINGWAVE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_DOWNLOADINFO_ONESHOTWAVE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_DEFAULT_SIZE_OFFSETTABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_INSTRUMENT_GM_INSTRUMENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_MIN_DATA_SIZE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_SRC_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_SRC_LFO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_SRC_KEYONVELOCITY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_SRC_KEYNUMBER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_SRC_EG1 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_SRC_EG2 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_SRC_PITCHWHEEL => 6

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_SRC_CC1 => 129

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_SRC_CC7 => 135

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_SRC_CC10 => 138

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_SRC_CC11 => 139

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_DST_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_DST_ATTENUATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_DST_PITCH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_DST_PAN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_DST_LFO_FREQUENCY => 260

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_DST_LFO_STARTDELAY => 261

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_DST_EG1_ATTACKTIME => 518

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_DST_EG1_DECAYTIME => 519

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_DST_EG1_RELEASETIME => 521

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_DST_EG1_SUSTAINLEVEL => 522

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_DST_EG2_ATTACKTIME => 778

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_DST_EG2_DECAYTIME => 779

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_DST_EG2_RELEASETIME => 781

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_DST_EG2_SUSTAINLEVEL => 782

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_TRN_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_TRN_CONCAVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static F_INSTRUMENT_DRUMS => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static F_RGN_OPTION_SELFNONEXCLUSIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static WAVELINK_CHANNEL_LEFT => 1

    /**
     * @type {Integer (Int32)}
     */
    static WAVELINK_CHANNEL_RIGHT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static F_WAVELINK_PHASE_MASTER => 1

    /**
     * @type {Integer (Int32)}
     */
    static POOL_CUE_NULL => -1

    /**
     * @type {Integer (Int32)}
     */
    static F_WSMP_NO_TRUNCATION => 1

    /**
     * @type {Integer (Int32)}
     */
    static F_WSMP_NO_COMPRESSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WLOOP_TYPE_FORWARD => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_SRC_POLYPRESSURE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_SRC_CHANNELPRESSURE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_SRC_VIBRATO => 9

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_SRC_MONOPRESSURE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_SRC_CC91 => 219

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_SRC_CC93 => 221

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_DST_GAIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_DST_KEYNUMBER => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_DST_LEFT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_DST_RIGHT => 17

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_DST_CENTER => 18

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_DST_LEFTREAR => 19

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_DST_RIGHTREAR => 20

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_DST_LFE_CHANNEL => 21

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_DST_CHORUS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_DST_REVERB => 129

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_DST_VIB_FREQUENCY => 276

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_DST_VIB_STARTDELAY => 277

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_DST_EG1_DELAYTIME => 523

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_DST_EG1_HOLDTIME => 524

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_DST_EG1_SHUTDOWNTIME => 525

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_DST_EG2_DELAYTIME => 783

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_DST_EG2_HOLDTIME => 784

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_DST_FILTER_CUTOFF => 1280

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_DST_FILTER_Q => 1281

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_TRN_CONVEX => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CONN_TRN_SWITCH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DLS_CDL_AND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DLS_CDL_OR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DLS_CDL_XOR => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DLS_CDL_ADD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DLS_CDL_SUBTRACT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DLS_CDL_MULTIPLY => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DLS_CDL_DIVIDE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DLS_CDL_LOGICAL_AND => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DLS_CDL_LOGICAL_OR => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DLS_CDL_LT => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DLS_CDL_LE => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DLS_CDL_GT => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DLS_CDL_GE => 13

    /**
     * @type {Integer (UInt32)}
     */
    static DLS_CDL_EQ => 14

    /**
     * @type {Integer (UInt32)}
     */
    static DLS_CDL_NOT => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DLS_CDL_CONST => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DLS_CDL_QUERY => 17

    /**
     * @type {Integer (UInt32)}
     */
    static DLS_CDL_QUERYSUPPORTED => 18

    /**
     * @type {Integer (UInt32)}
     */
    static WLOOP_TYPE_RELEASE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static F_WAVELINK_MULTICHANNEL => 2

    /**
     * @type {String}
     */
    static DLSID_GMInHardware => "{178f2f24-c364-11d1-a760-0000f875ac12}"

    /**
     * @type {String}
     */
    static DLSID_GSInHardware => "{178f2f25-c364-11d1-a760-0000f875ac12}"

    /**
     * @type {String}
     */
    static DLSID_XGInHardware => "{178f2f26-c364-11d1-a760-0000f875ac12}"

    /**
     * @type {String}
     */
    static DLSID_SupportsDLS1 => "{178f2f27-c364-11d1-a760-0000f875ac12}"

    /**
     * @type {String}
     */
    static DLSID_SupportsDLS2 => "{f14599e5-4689-11d2-afa6-00aa0024d8b6}"

    /**
     * @type {String}
     */
    static DLSID_SampleMemorySize => "{178f2f28-c364-11d1-a760-0000f875ac12}"

    /**
     * @type {String}
     */
    static DLSID_ManufacturersID => "{b03e1181-8095-11d2-a1ef-00600833dbd8}"

    /**
     * @type {String}
     */
    static DLSID_ProductID => "{b03e1182-8095-11d2-a1ef-00600833dbd8}"

    /**
     * @type {String}
     */
    static DLSID_SamplePlaybackRate => "{2a91f713-a4bf-11d2-bbdf-00600833dbd8}"

    /**
     * @type {String}
     */
    static REGSTR_PATH_SOFTWARESYNTHS => "Software\Microsoft\DirectMusic\SoftwareSynths"

    /**
     * @type {Integer (UInt32)}
     */
    static REFRESH_F_LASTBUFFER => 1

    /**
     * @type {String}
     */
    static CLSID_DirectMusicSynthSink => "{aec17ce3-a514-11d1-afa6-00aa0024d8b6}"

    /**
     * @type {String}
     */
    static GUID_DMUS_PROP_SetSynthSink => "{0a3a5ba5-37b6-11d2-b9f9-0000f875ac12}"

    /**
     * @type {String}
     */
    static GUID_DMUS_PROP_SinkUsesDSound => "{be208857-8952-11d2-ba1c-0000f875ac12}"

    /**
     * @type {String}
     */
    static CLSID_DirectSoundPrivate => "{11ab3ec0-25ec-11d1-a4d8-00c04fc28aca}"

    /**
     * @type {String}
     */
    static DSPROPSETID_DirectSoundDevice => "{84624f82-25ec-11d1-a4d8-00c04fc28aca}"

    /**
     * @type {Integer (Int32)}
     */
    static DV_DVSD_NTSC_FRAMESIZE => 120000

    /**
     * @type {Integer (Int32)}
     */
    static DV_DVSD_PAL_FRAMESIZE => 144000

    /**
     * @type {Integer (UInt32)}
     */
    static DV_SMCHN => 57344

    /**
     * @type {Integer (UInt32)}
     */
    static DV_AUDIOMODE => 3840

    /**
     * @type {Integer (UInt32)}
     */
    static DV_AUDIOSMP => 939524096

    /**
     * @type {Integer (UInt32)}
     */
    static DV_AUDIOQU => 117440512

    /**
     * @type {Integer (UInt32)}
     */
    static DV_NTSCPAL => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static DV_STYPE => 2031616

    /**
     * @type {Integer (UInt32)}
     */
    static DV_NTSC => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DV_PAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DV_SD => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DV_HD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DV_SL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DV_CAP_AUD16Bits => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DV_CAP_AUD12Bits => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SIZE_DVINFO => 32
;@endregion Constants

;@region Methods
;@endregion Methods
}
