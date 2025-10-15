#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk
/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class DirectSound {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static DIRECTSOUND_VERSION => 1792

    /**
     * @type {Integer (UInt32)}
     */
    static _FACDS => 2168

    /**
     * @type {String}
     */
    static CLSID_DirectSound => "{47d4d946-62e8-11cf-93bc-444553540000}"

    /**
     * @type {String}
     */
    static CLSID_DirectSound8 => "{3901cc3f-84b5-4fa4-ba35-aa8172b8a09b}"

    /**
     * @type {String}
     */
    static CLSID_DirectSoundCapture => "{b0210780-89cd-11d0-af08-00a0c925cd16}"

    /**
     * @type {String}
     */
    static CLSID_DirectSoundCapture8 => "{e4bcac13-7f99-4908-9a8e-74e3bf24b6e1}"

    /**
     * @type {String}
     */
    static CLSID_DirectSoundFullDuplex => "{fea4300c-7959-4147-b26a-2377b9e7a91d}"

    /**
     * @type {String}
     */
    static DSDEVID_DefaultPlayback => "{def00000-9c6d-47ed-aaf1-4dda8f2b5c03}"

    /**
     * @type {String}
     */
    static DSDEVID_DefaultCapture => "{def00001-9c6d-47ed-aaf1-4dda8f2b5c03}"

    /**
     * @type {String}
     */
    static DSDEVID_DefaultVoicePlayback => "{def00002-9c6d-47ed-aaf1-4dda8f2b5c03}"

    /**
     * @type {String}
     */
    static DSDEVID_DefaultVoiceCapture => "{def00003-9c6d-47ed-aaf1-4dda8f2b5c03}"

    /**
     * @type {Integer (UInt32)}
     */
    static DSFX_LOCHARDWARE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSFX_LOCSOFTWARE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DSCFX_LOCHARDWARE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSCFX_LOCSOFTWARE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DSCFXR_LOCHARDWARE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DSCFXR_LOCSOFTWARE => 32

    /**
     * @type {String}
     */
    static GUID_All_Objects => "{aa114de5-c262-4169-a1c8-23d698cc73b5}"

    /**
     * @type {Integer (UInt32)}
     */
    static KSPROPERTY_SUPPORT_GET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSPROPERTY_SUPPORT_SET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DSFXGARGLE_WAVE_TRIANGLE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DSFXGARGLE_WAVE_SQUARE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSFXGARGLE_RATEHZ_MIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSFXGARGLE_RATEHZ_MAX => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DSFXCHORUS_WAVE_TRIANGLE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DSFXCHORUS_WAVE_SIN => 1

    /**
     * @type {Integer (Single)}
     */
    static DSFXCHORUS_WETDRYMIX_MIN => 0

    /**
     * @type {Integer (Single)}
     */
    static DSFXCHORUS_WETDRYMIX_MAX => 100

    /**
     * @type {Integer (Single)}
     */
    static DSFXCHORUS_DEPTH_MIN => 0

    /**
     * @type {Integer (Single)}
     */
    static DSFXCHORUS_DEPTH_MAX => 100

    /**
     * @type {Integer (Single)}
     */
    static DSFXCHORUS_FEEDBACK_MIN => -99

    /**
     * @type {Integer (Single)}
     */
    static DSFXCHORUS_FEEDBACK_MAX => 99

    /**
     * @type {Integer (Single)}
     */
    static DSFXCHORUS_FREQUENCY_MIN => 0

    /**
     * @type {Integer (Single)}
     */
    static DSFXCHORUS_FREQUENCY_MAX => 10

    /**
     * @type {Integer (Single)}
     */
    static DSFXCHORUS_DELAY_MIN => 0

    /**
     * @type {Integer (Single)}
     */
    static DSFXCHORUS_DELAY_MAX => 20

    /**
     * @type {Integer (UInt32)}
     */
    static DSFXCHORUS_PHASE_MIN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DSFXCHORUS_PHASE_MAX => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DSFXCHORUS_PHASE_NEG_180 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DSFXCHORUS_PHASE_NEG_90 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSFXCHORUS_PHASE_ZERO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DSFXCHORUS_PHASE_90 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DSFXCHORUS_PHASE_180 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DSFXFLANGER_WAVE_TRIANGLE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DSFXFLANGER_WAVE_SIN => 1

    /**
     * @type {Integer (Single)}
     */
    static DSFXFLANGER_WETDRYMIX_MIN => 0

    /**
     * @type {Integer (Single)}
     */
    static DSFXFLANGER_WETDRYMIX_MAX => 100

    /**
     * @type {Integer (Single)}
     */
    static DSFXFLANGER_FREQUENCY_MIN => 0

    /**
     * @type {Integer (Single)}
     */
    static DSFXFLANGER_FREQUENCY_MAX => 10

    /**
     * @type {Integer (Single)}
     */
    static DSFXFLANGER_DEPTH_MIN => 0

    /**
     * @type {Integer (Single)}
     */
    static DSFXFLANGER_DEPTH_MAX => 100

    /**
     * @type {Integer (UInt32)}
     */
    static DSFXFLANGER_PHASE_MIN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DSFXFLANGER_PHASE_MAX => 4

    /**
     * @type {Integer (Single)}
     */
    static DSFXFLANGER_FEEDBACK_MIN => -99

    /**
     * @type {Integer (Single)}
     */
    static DSFXFLANGER_FEEDBACK_MAX => 99

    /**
     * @type {Integer (Single)}
     */
    static DSFXFLANGER_DELAY_MIN => 0

    /**
     * @type {Integer (Single)}
     */
    static DSFXFLANGER_DELAY_MAX => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DSFXFLANGER_PHASE_NEG_180 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DSFXFLANGER_PHASE_NEG_90 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSFXFLANGER_PHASE_ZERO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DSFXFLANGER_PHASE_90 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DSFXFLANGER_PHASE_180 => 4

    /**
     * @type {Integer (Single)}
     */
    static DSFXECHO_WETDRYMIX_MIN => 0

    /**
     * @type {Integer (Single)}
     */
    static DSFXECHO_WETDRYMIX_MAX => 100

    /**
     * @type {Integer (Single)}
     */
    static DSFXECHO_FEEDBACK_MIN => 0

    /**
     * @type {Integer (Single)}
     */
    static DSFXECHO_FEEDBACK_MAX => 100

    /**
     * @type {Integer (Single)}
     */
    static DSFXECHO_LEFTDELAY_MIN => 1

    /**
     * @type {Integer (Single)}
     */
    static DSFXECHO_LEFTDELAY_MAX => 2000

    /**
     * @type {Integer (Single)}
     */
    static DSFXECHO_RIGHTDELAY_MIN => 1

    /**
     * @type {Integer (Single)}
     */
    static DSFXECHO_RIGHTDELAY_MAX => 2000

    /**
     * @type {Integer (UInt32)}
     */
    static DSFXECHO_PANDELAY_MIN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DSFXECHO_PANDELAY_MAX => 1

    /**
     * @type {Integer (Single)}
     */
    static DSFXDISTORTION_GAIN_MIN => -60

    /**
     * @type {Integer (Single)}
     */
    static DSFXDISTORTION_GAIN_MAX => 0

    /**
     * @type {Integer (Single)}
     */
    static DSFXDISTORTION_EDGE_MIN => 0

    /**
     * @type {Integer (Single)}
     */
    static DSFXDISTORTION_EDGE_MAX => 100

    /**
     * @type {Integer (Single)}
     */
    static DSFXDISTORTION_POSTEQCENTERFREQUENCY_MIN => 100

    /**
     * @type {Integer (Single)}
     */
    static DSFXDISTORTION_POSTEQCENTERFREQUENCY_MAX => 8000

    /**
     * @type {Integer (Single)}
     */
    static DSFXDISTORTION_POSTEQBANDWIDTH_MIN => 100

    /**
     * @type {Integer (Single)}
     */
    static DSFXDISTORTION_POSTEQBANDWIDTH_MAX => 8000

    /**
     * @type {Integer (Single)}
     */
    static DSFXDISTORTION_PRELOWPASSCUTOFF_MIN => 100

    /**
     * @type {Integer (Single)}
     */
    static DSFXDISTORTION_PRELOWPASSCUTOFF_MAX => 8000

    /**
     * @type {Integer (Single)}
     */
    static DSFXCOMPRESSOR_GAIN_MIN => -60

    /**
     * @type {Integer (Single)}
     */
    static DSFXCOMPRESSOR_GAIN_MAX => 60

    /**
     * @type {Integer (Single)}
     */
    static DSFXCOMPRESSOR_ATTACK_MIN => 0.01

    /**
     * @type {Integer (Single)}
     */
    static DSFXCOMPRESSOR_ATTACK_MAX => 500

    /**
     * @type {Integer (Single)}
     */
    static DSFXCOMPRESSOR_RELEASE_MIN => 50

    /**
     * @type {Integer (Single)}
     */
    static DSFXCOMPRESSOR_RELEASE_MAX => 3000

    /**
     * @type {Integer (Single)}
     */
    static DSFXCOMPRESSOR_THRESHOLD_MIN => -60

    /**
     * @type {Integer (Single)}
     */
    static DSFXCOMPRESSOR_THRESHOLD_MAX => 0

    /**
     * @type {Integer (Single)}
     */
    static DSFXCOMPRESSOR_RATIO_MIN => 1

    /**
     * @type {Integer (Single)}
     */
    static DSFXCOMPRESSOR_RATIO_MAX => 100

    /**
     * @type {Integer (Single)}
     */
    static DSFXCOMPRESSOR_PREDELAY_MIN => 0

    /**
     * @type {Integer (Single)}
     */
    static DSFXCOMPRESSOR_PREDELAY_MAX => 4

    /**
     * @type {Integer (Single)}
     */
    static DSFXPARAMEQ_CENTER_MIN => 80

    /**
     * @type {Integer (Single)}
     */
    static DSFXPARAMEQ_CENTER_MAX => 16000

    /**
     * @type {Integer (Single)}
     */
    static DSFXPARAMEQ_BANDWIDTH_MIN => 1

    /**
     * @type {Integer (Single)}
     */
    static DSFXPARAMEQ_BANDWIDTH_MAX => 36

    /**
     * @type {Integer (Single)}
     */
    static DSFXPARAMEQ_GAIN_MIN => -15

    /**
     * @type {Integer (Single)}
     */
    static DSFXPARAMEQ_GAIN_MAX => 15

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2REVERB_ROOM_MIN => -10000

    /**
     * @type {Integer (UInt32)}
     */
    static DSFX_I3DL2REVERB_ROOM_MAX => 0

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2REVERB_ROOM_DEFAULT => -1000

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2REVERB_ROOMHF_MIN => -10000

    /**
     * @type {Integer (UInt32)}
     */
    static DSFX_I3DL2REVERB_ROOMHF_MAX => 0

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2REVERB_ROOMHF_DEFAULT => -100

    /**
     * @type {Integer (Single)}
     */
    static DSFX_I3DL2REVERB_ROOMROLLOFFFACTOR_MIN => 0

    /**
     * @type {Integer (Single)}
     */
    static DSFX_I3DL2REVERB_ROOMROLLOFFFACTOR_MAX => 10

    /**
     * @type {Integer (Single)}
     */
    static DSFX_I3DL2REVERB_ROOMROLLOFFFACTOR_DEFAULT => 0

    /**
     * @type {Integer (Single)}
     */
    static DSFX_I3DL2REVERB_DECAYTIME_MIN => 0.1

    /**
     * @type {Integer (Single)}
     */
    static DSFX_I3DL2REVERB_DECAYTIME_MAX => 20

    /**
     * @type {Integer (Single)}
     */
    static DSFX_I3DL2REVERB_DECAYTIME_DEFAULT => 1.49

    /**
     * @type {Integer (Single)}
     */
    static DSFX_I3DL2REVERB_DECAYHFRATIO_MIN => 0.1

    /**
     * @type {Integer (Single)}
     */
    static DSFX_I3DL2REVERB_DECAYHFRATIO_MAX => 2

    /**
     * @type {Integer (Single)}
     */
    static DSFX_I3DL2REVERB_DECAYHFRATIO_DEFAULT => 0.83

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2REVERB_REFLECTIONS_MIN => -10000

    /**
     * @type {Integer (UInt32)}
     */
    static DSFX_I3DL2REVERB_REFLECTIONS_MAX => 1000

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2REVERB_REFLECTIONS_DEFAULT => -2602

    /**
     * @type {Integer (Single)}
     */
    static DSFX_I3DL2REVERB_REFLECTIONSDELAY_MIN => 0

    /**
     * @type {Integer (Single)}
     */
    static DSFX_I3DL2REVERB_REFLECTIONSDELAY_MAX => 0.3

    /**
     * @type {Integer (Single)}
     */
    static DSFX_I3DL2REVERB_REFLECTIONSDELAY_DEFAULT => 0.007

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2REVERB_REVERB_MIN => -10000

    /**
     * @type {Integer (UInt32)}
     */
    static DSFX_I3DL2REVERB_REVERB_MAX => 2000

    /**
     * @type {Integer (UInt32)}
     */
    static DSFX_I3DL2REVERB_REVERB_DEFAULT => 200

    /**
     * @type {Integer (Single)}
     */
    static DSFX_I3DL2REVERB_REVERBDELAY_MIN => 0

    /**
     * @type {Integer (Single)}
     */
    static DSFX_I3DL2REVERB_REVERBDELAY_MAX => 0.1

    /**
     * @type {Integer (Single)}
     */
    static DSFX_I3DL2REVERB_REVERBDELAY_DEFAULT => 0.011

    /**
     * @type {Integer (Single)}
     */
    static DSFX_I3DL2REVERB_DIFFUSION_MIN => 0

    /**
     * @type {Integer (Single)}
     */
    static DSFX_I3DL2REVERB_DIFFUSION_MAX => 100

    /**
     * @type {Integer (Single)}
     */
    static DSFX_I3DL2REVERB_DIFFUSION_DEFAULT => 100

    /**
     * @type {Integer (Single)}
     */
    static DSFX_I3DL2REVERB_DENSITY_MIN => 0

    /**
     * @type {Integer (Single)}
     */
    static DSFX_I3DL2REVERB_DENSITY_MAX => 100

    /**
     * @type {Integer (Single)}
     */
    static DSFX_I3DL2REVERB_DENSITY_DEFAULT => 100

    /**
     * @type {Integer (Single)}
     */
    static DSFX_I3DL2REVERB_HFREFERENCE_MIN => 20

    /**
     * @type {Integer (Single)}
     */
    static DSFX_I3DL2REVERB_HFREFERENCE_MAX => 20000

    /**
     * @type {Integer (Single)}
     */
    static DSFX_I3DL2REVERB_HFREFERENCE_DEFAULT => 5000

    /**
     * @type {Integer (UInt32)}
     */
    static DSFX_I3DL2REVERB_QUALITY_MIN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DSFX_I3DL2REVERB_QUALITY_MAX => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DSFX_I3DL2REVERB_QUALITY_DEFAULT => 2

    /**
     * @type {Integer (Single)}
     */
    static DSFX_WAVESREVERB_INGAIN_MIN => -96

    /**
     * @type {Integer (Single)}
     */
    static DSFX_WAVESREVERB_INGAIN_MAX => 0

    /**
     * @type {Integer (Single)}
     */
    static DSFX_WAVESREVERB_INGAIN_DEFAULT => 0

    /**
     * @type {Integer (Single)}
     */
    static DSFX_WAVESREVERB_REVERBMIX_MIN => -96

    /**
     * @type {Integer (Single)}
     */
    static DSFX_WAVESREVERB_REVERBMIX_MAX => 0

    /**
     * @type {Integer (Single)}
     */
    static DSFX_WAVESREVERB_REVERBMIX_DEFAULT => 0

    /**
     * @type {Integer (Single)}
     */
    static DSFX_WAVESREVERB_REVERBTIME_MIN => 0.001

    /**
     * @type {Integer (Single)}
     */
    static DSFX_WAVESREVERB_REVERBTIME_MAX => 3000

    /**
     * @type {Integer (Single)}
     */
    static DSFX_WAVESREVERB_REVERBTIME_DEFAULT => 1000

    /**
     * @type {Integer (Single)}
     */
    static DSFX_WAVESREVERB_HIGHFREQRTRATIO_MIN => 0.001

    /**
     * @type {Integer (Single)}
     */
    static DSFX_WAVESREVERB_HIGHFREQRTRATIO_MAX => 0.999

    /**
     * @type {Integer (Single)}
     */
    static DSFX_WAVESREVERB_HIGHFREQRTRATIO_DEFAULT => 0.001

    /**
     * @type {Integer (UInt32)}
     */
    static DSCFX_AEC_MODE_PASS_THROUGH => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DSCFX_AEC_MODE_HALF_DUPLEX => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSCFX_AEC_MODE_FULL_DUPLEX => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DSCFX_AEC_STATUS_HISTORY_UNINITIALIZED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DSCFX_AEC_STATUS_HISTORY_CONTINUOUSLY_CONVERGED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSCFX_AEC_STATUS_HISTORY_PREVIOUSLY_DIVERGED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DSCFX_AEC_STATUS_CURRENTLY_CONVERGED => 8

    /**
     * @type {Integer (Int32)}
     */
    static DS_NO_VIRTUALIZATION => 142082058

    /**
     * @type {Integer (UInt32)}
     */
    static DSCAPS_PRIMARYMONO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSCAPS_PRIMARYSTEREO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DSCAPS_PRIMARY8BIT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DSCAPS_PRIMARY16BIT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DSCAPS_CONTINUOUSRATE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DSCAPS_EMULDRIVER => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DSCAPS_CERTIFIED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DSCAPS_SECONDARYMONO => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DSCAPS_SECONDARYSTEREO => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DSCAPS_SECONDARY8BIT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DSCAPS_SECONDARY16BIT => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static DSSCL_NORMAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSSCL_PRIORITY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DSSCL_EXCLUSIVE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DSSCL_WRITEPRIMARY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DSSPEAKER_DIRECTOUT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DSSPEAKER_HEADPHONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSSPEAKER_MONO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DSSPEAKER_QUAD => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DSSPEAKER_STEREO => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DSSPEAKER_SURROUND => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DSSPEAKER_5POINT1 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DSSPEAKER_7POINT1 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DSSPEAKER_7POINT1_SURROUND => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DSSPEAKER_5POINT1_SURROUND => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DSSPEAKER_7POINT1_WIDE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DSSPEAKER_5POINT1_BACK => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DSSPEAKER_GEOMETRY_MIN => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DSSPEAKER_GEOMETRY_NARROW => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DSSPEAKER_GEOMETRY_WIDE => 20

    /**
     * @type {Integer (UInt32)}
     */
    static DSSPEAKER_GEOMETRY_MAX => 180

    /**
     * @type {Integer (UInt32)}
     */
    static DSBCAPS_PRIMARYBUFFER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSBCAPS_STATIC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DSBCAPS_LOCHARDWARE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DSBCAPS_LOCSOFTWARE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DSBCAPS_CTRL3D => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DSBCAPS_CTRLFREQUENCY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DSBCAPS_CTRLPAN => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DSBCAPS_CTRLVOLUME => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DSBCAPS_CTRLPOSITIONNOTIFY => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DSBCAPS_CTRLFX => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DSBCAPS_STICKYFOCUS => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static DSBCAPS_GLOBALFOCUS => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static DSBCAPS_GETCURRENTPOSITION2 => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DSBCAPS_MUTE3DATMAXDISTANCE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static DSBCAPS_LOCDEFER => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static DSBCAPS_TRUEPLAYPOSITION => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static DSBPLAY_LOOPING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSBPLAY_LOCHARDWARE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DSBPLAY_LOCSOFTWARE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DSBPLAY_TERMINATEBY_TIME => 8

    /**
     * @type {Integer (UInt64)}
     */
    static DSBPLAY_TERMINATEBY_DISTANCE => 16

    /**
     * @type {Integer (UInt64)}
     */
    static DSBPLAY_TERMINATEBY_PRIORITY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DSBSTATUS_PLAYING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSBSTATUS_BUFFERLOST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DSBSTATUS_LOOPING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DSBSTATUS_LOCHARDWARE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DSBSTATUS_LOCSOFTWARE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DSBSTATUS_TERMINATED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DSBLOCK_FROMWRITECURSOR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSBLOCK_ENTIREBUFFER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DSBFREQUENCY_ORIGINAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DSBFREQUENCY_MIN => 100

    /**
     * @type {Integer (UInt32)}
     */
    static DSBFREQUENCY_MAX => 200000

    /**
     * @type {Integer (Int32)}
     */
    static DSBPAN_LEFT => -10000

    /**
     * @type {Integer (UInt32)}
     */
    static DSBPAN_CENTER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DSBPAN_RIGHT => 10000

    /**
     * @type {Integer (Int32)}
     */
    static DSBVOLUME_MIN => -10000

    /**
     * @type {Integer (UInt32)}
     */
    static DSBVOLUME_MAX => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DSBSIZE_MIN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DSBSIZE_MAX => 268435455

    /**
     * @type {Integer (UInt32)}
     */
    static DSBSIZE_FX_MIN => 150

    /**
     * @type {Integer (UInt32)}
     */
    static DSBNOTIFICATIONS_MAX => 100000

    /**
     * @type {Integer (UInt32)}
     */
    static DS3DMODE_NORMAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DS3DMODE_HEADRELATIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DS3DMODE_DISABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DS3D_IMMEDIATE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DS3D_DEFERRED => 1

    /**
     * @type {Integer (Single)}
     */
    static DS3D_DEFAULTDISTANCEFACTOR => 1

    /**
     * @type {Integer (Single)}
     */
    static DS3D_MINROLLOFFFACTOR => 0

    /**
     * @type {Integer (Single)}
     */
    static DS3D_MAXROLLOFFFACTOR => 10

    /**
     * @type {Integer (Single)}
     */
    static DS3D_DEFAULTROLLOFFFACTOR => 1

    /**
     * @type {Integer (Single)}
     */
    static DS3D_MINDOPPLERFACTOR => 0

    /**
     * @type {Integer (Single)}
     */
    static DS3D_MAXDOPPLERFACTOR => 10

    /**
     * @type {Integer (Single)}
     */
    static DS3D_DEFAULTDOPPLERFACTOR => 1

    /**
     * @type {Integer (Single)}
     */
    static DS3D_DEFAULTMINDISTANCE => 1

    /**
     * @type {Integer (Single)}
     */
    static DS3D_DEFAULTMAXDISTANCE => 1E+09

    /**
     * @type {Integer (UInt32)}
     */
    static DS3D_MINCONEANGLE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DS3D_MAXCONEANGLE => 360

    /**
     * @type {Integer (UInt32)}
     */
    static DS3D_DEFAULTCONEANGLE => 360

    /**
     * @type {Integer (UInt32)}
     */
    static DS3D_DEFAULTCONEOUTSIDEVOLUME => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DSCCAPS_EMULDRIVER => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DSCCAPS_CERTIFIED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DSCCAPS_MULTIPLECAPTURE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSCBCAPS_WAVEMAPPED => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static DSCBCAPS_CTRLFX => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DSCBLOCK_ENTIREBUFFER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSCBSTATUS_CAPTURING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSCBSTATUS_LOOPING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DSCBSTART_LOOPING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSBPN_OFFSETSTOP => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static DS_CERTIFIED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DS_UNCERTIFIED => 1

    /**
     * @type {String}
     */
    static DS3DALG_NO_VIRTUALIZATION => "{c241333f-1c1b-11d2-94f5-00c04fc28aca}"

    /**
     * @type {String}
     */
    static DS3DALG_HRTF_FULL => "{c2413340-1c1b-11d2-94f5-00c04fc28aca}"

    /**
     * @type {String}
     */
    static DS3DALG_HRTF_LIGHT => "{c2413342-1c1b-11d2-94f5-00c04fc28aca}"

    /**
     * @type {String}
     */
    static GUID_DSFX_STANDARD_GARGLE => "{dafd8210-5711-4b91-9fe3-f75b7ae279bf}"

    /**
     * @type {String}
     */
    static GUID_DSFX_STANDARD_CHORUS => "{efe6629c-81f7-4281-bd91-c9d604a95af6}"

    /**
     * @type {String}
     */
    static GUID_DSFX_STANDARD_FLANGER => "{efca3d92-dfd8-4672-a603-7420894bad98}"

    /**
     * @type {String}
     */
    static GUID_DSFX_STANDARD_ECHO => "{ef3e932c-d40b-4f51-8ccf-3f98f1b29d5d}"

    /**
     * @type {String}
     */
    static GUID_DSFX_STANDARD_DISTORTION => "{ef114c90-cd1d-484e-96e5-09cfaf912a21}"

    /**
     * @type {String}
     */
    static GUID_DSFX_STANDARD_COMPRESSOR => "{ef011f79-4000-406d-87af-bffb3fc39d57}"

    /**
     * @type {String}
     */
    static GUID_DSFX_STANDARD_PARAMEQ => "{120ced89-3bf4-4173-a132-3cb406cf3231}"

    /**
     * @type {String}
     */
    static GUID_DSFX_STANDARD_I3DL2REVERB => "{ef985e71-d5c7-42d4-ba4d-2d073e2e96f4}"

    /**
     * @type {String}
     */
    static GUID_DSFX_WAVES_REVERB => "{87fc0268-9a55-4360-95aa-004a1d9de26c}"

    /**
     * @type {String}
     */
    static GUID_DSCFX_CLASS_AEC => "{bf963d80-c559-11d0-8a2b-00a0c9255ac1}"

    /**
     * @type {String}
     */
    static GUID_DSCFX_MS_AEC => "{cdebb919-379a-488a-8765-f53cfd36de40}"

    /**
     * @type {String}
     */
    static GUID_DSCFX_SYSTEM_AEC => "{1c22c56d-9879-4f5b-a389-27996ddc2810}"

    /**
     * @type {String}
     */
    static GUID_DSCFX_CLASS_NS => "{e07f903f-62fd-4e60-8cdd-dea7236665b5}"

    /**
     * @type {String}
     */
    static GUID_DSCFX_MS_NS => "{11c5c73b-66e9-4ba1-a0ba-e814c6eed92d}"

    /**
     * @type {String}
     */
    static GUID_DSCFX_SYSTEM_NS => "{5ab0882e-7274-4516-877d-4eee99ba4fd0}"

    /**
     * @type {Integer (Int32)}
     */
    static DSFXR_PRESENT => 0

    /**
     * @type {Integer (Int32)}
     */
    static DSFXR_LOCHARDWARE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DSFXR_LOCSOFTWARE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DSFXR_UNALLOCATED => 3

    /**
     * @type {Integer (Int32)}
     */
    static DSFXR_FAILED => 4

    /**
     * @type {Integer (Int32)}
     */
    static DSFXR_UNKNOWN => 5

    /**
     * @type {Integer (Int32)}
     */
    static DSFXR_SENDLOOP => 6

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2_MATERIAL_PRESET_SINGLEWINDOW => 0

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2_MATERIAL_PRESET_DOUBLEWINDOW => 1

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2_MATERIAL_PRESET_THINDOOR => 2

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2_MATERIAL_PRESET_THICKDOOR => 3

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2_MATERIAL_PRESET_WOODWALL => 4

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2_MATERIAL_PRESET_BRICKWALL => 5

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2_MATERIAL_PRESET_STONEWALL => 6

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2_MATERIAL_PRESET_CURTAIN => 7

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2_ENVIRONMENT_PRESET_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2_ENVIRONMENT_PRESET_GENERIC => 1

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2_ENVIRONMENT_PRESET_PADDEDCELL => 2

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2_ENVIRONMENT_PRESET_ROOM => 3

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2_ENVIRONMENT_PRESET_BATHROOM => 4

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2_ENVIRONMENT_PRESET_LIVINGROOM => 5

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2_ENVIRONMENT_PRESET_STONEROOM => 6

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2_ENVIRONMENT_PRESET_AUDITORIUM => 7

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2_ENVIRONMENT_PRESET_CONCERTHALL => 8

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2_ENVIRONMENT_PRESET_CAVE => 9

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2_ENVIRONMENT_PRESET_ARENA => 10

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2_ENVIRONMENT_PRESET_HANGAR => 11

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2_ENVIRONMENT_PRESET_CARPETEDHALLWAY => 12

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2_ENVIRONMENT_PRESET_HALLWAY => 13

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2_ENVIRONMENT_PRESET_STONECORRIDOR => 14

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2_ENVIRONMENT_PRESET_ALLEY => 15

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2_ENVIRONMENT_PRESET_FOREST => 16

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2_ENVIRONMENT_PRESET_CITY => 17

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2_ENVIRONMENT_PRESET_MOUNTAINS => 18

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2_ENVIRONMENT_PRESET_QUARRY => 19

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2_ENVIRONMENT_PRESET_PLAIN => 20

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2_ENVIRONMENT_PRESET_PARKINGLOT => 21

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2_ENVIRONMENT_PRESET_SEWERPIPE => 22

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2_ENVIRONMENT_PRESET_UNDERWATER => 23

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2_ENVIRONMENT_PRESET_SMALLROOM => 24

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2_ENVIRONMENT_PRESET_MEDIUMROOM => 25

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2_ENVIRONMENT_PRESET_LARGEROOM => 26

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2_ENVIRONMENT_PRESET_MEDIUMHALL => 27

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2_ENVIRONMENT_PRESET_LARGEHALL => 28

    /**
     * @type {Integer (Int32)}
     */
    static DSFX_I3DL2_ENVIRONMENT_PRESET_PLATE => 29
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {Pointer<Guid>} pcGuidDevice 
     * @param {Pointer<IDirectSound>} ppDS 
     * @param {Pointer<IUnknown>} pUnkOuter 
     * @returns {HRESULT} 
     */
    static DirectSoundCreate(pcGuidDevice, ppDS, pUnkOuter) {
        result := DllCall("DSOUND.dll\DirectSoundCreate", "ptr", pcGuidDevice, "ptr", ppDS, "ptr", pUnkOuter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<LPDSENUMCALLBACKA>} pDSEnumCallback 
     * @param {Pointer<Void>} pContext 
     * @returns {HRESULT} 
     */
    static DirectSoundEnumerateA(pDSEnumCallback, pContext) {
        result := DllCall("DSOUND.dll\DirectSoundEnumerateA", "ptr", pDSEnumCallback, "ptr", pContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<LPDSENUMCALLBACKW>} pDSEnumCallback 
     * @param {Pointer<Void>} pContext 
     * @returns {HRESULT} 
     */
    static DirectSoundEnumerateW(pDSEnumCallback, pContext) {
        result := DllCall("DSOUND.dll\DirectSoundEnumerateW", "ptr", pDSEnumCallback, "ptr", pContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pcGuidDevice 
     * @param {Pointer<IDirectSoundCapture>} ppDSC 
     * @param {Pointer<IUnknown>} pUnkOuter 
     * @returns {HRESULT} 
     */
    static DirectSoundCaptureCreate(pcGuidDevice, ppDSC, pUnkOuter) {
        result := DllCall("DSOUND.dll\DirectSoundCaptureCreate", "ptr", pcGuidDevice, "ptr", ppDSC, "ptr", pUnkOuter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<LPDSENUMCALLBACKA>} pDSEnumCallback 
     * @param {Pointer<Void>} pContext 
     * @returns {HRESULT} 
     */
    static DirectSoundCaptureEnumerateA(pDSEnumCallback, pContext) {
        result := DllCall("DSOUND.dll\DirectSoundCaptureEnumerateA", "ptr", pDSEnumCallback, "ptr", pContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<LPDSENUMCALLBACKW>} pDSEnumCallback 
     * @param {Pointer<Void>} pContext 
     * @returns {HRESULT} 
     */
    static DirectSoundCaptureEnumerateW(pDSEnumCallback, pContext) {
        result := DllCall("DSOUND.dll\DirectSoundCaptureEnumerateW", "ptr", pDSEnumCallback, "ptr", pContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pcGuidDevice 
     * @param {Pointer<IDirectSound8>} ppDS8 
     * @param {Pointer<IUnknown>} pUnkOuter 
     * @returns {HRESULT} 
     */
    static DirectSoundCreate8(pcGuidDevice, ppDS8, pUnkOuter) {
        result := DllCall("DSOUND.dll\DirectSoundCreate8", "ptr", pcGuidDevice, "ptr", ppDS8, "ptr", pUnkOuter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pcGuidDevice 
     * @param {Pointer<IDirectSoundCapture>} ppDSC8 
     * @param {Pointer<IUnknown>} pUnkOuter 
     * @returns {HRESULT} 
     */
    static DirectSoundCaptureCreate8(pcGuidDevice, ppDSC8, pUnkOuter) {
        result := DllCall("DSOUND.dll\DirectSoundCaptureCreate8", "ptr", pcGuidDevice, "ptr", ppDSC8, "ptr", pUnkOuter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pcGuidCaptureDevice 
     * @param {Pointer<Guid>} pcGuidRenderDevice 
     * @param {Pointer<DSCBUFFERDESC>} pcDSCBufferDesc 
     * @param {Pointer<DSBUFFERDESC>} pcDSBufferDesc 
     * @param {HWND} hWnd 
     * @param {Integer} dwLevel 
     * @param {Pointer<IDirectSoundFullDuplex>} ppDSFD 
     * @param {Pointer<IDirectSoundCaptureBuffer8>} ppDSCBuffer8 
     * @param {Pointer<IDirectSoundBuffer8>} ppDSBuffer8 
     * @param {Pointer<IUnknown>} pUnkOuter 
     * @returns {HRESULT} 
     */
    static DirectSoundFullDuplexCreate(pcGuidCaptureDevice, pcGuidRenderDevice, pcDSCBufferDesc, pcDSBufferDesc, hWnd, dwLevel, ppDSFD, ppDSCBuffer8, ppDSBuffer8, pUnkOuter) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := DllCall("DSOUND.dll\DirectSoundFullDuplexCreate", "ptr", pcGuidCaptureDevice, "ptr", pcGuidRenderDevice, "ptr", pcDSCBufferDesc, "ptr", pcDSBufferDesc, "ptr", hWnd, "uint", dwLevel, "ptr", ppDSFD, "ptr", ppDSCBuffer8, "ptr", ppDSBuffer8, "ptr", pUnkOuter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pGuidSrc 
     * @param {Pointer<Guid>} pGuidDest 
     * @returns {HRESULT} 
     */
    static GetDeviceID(pGuidSrc, pGuidDest) {
        result := DllCall("DSOUND.dll\GetDeviceID", "ptr", pGuidSrc, "ptr", pGuidDest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
