#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DirectShow {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static EC_SND_DEVICE_ERROR_BASE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static EC_SNDDEV_IN_ERROR => 512

    /**
     * @type {Integer (UInt32)}
     */
    static EC_SNDDEV_OUT_ERROR => 513

    /**
     * @type {Integer (UInt32)}
     */
    static EC_SYSTEMBASE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static EC_USER => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static EC_COMPLETE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EC_USERABORT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EC_ERRORABORT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static EC_TIME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EC_REPAINT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static EC_STREAM_ERROR_STOPPED => 6

    /**
     * @type {Integer (UInt32)}
     */
    static EC_STREAM_ERROR_STILLPLAYING => 7

    /**
     * @type {Integer (UInt32)}
     */
    static EC_ERROR_STILLPLAYING => 8

    /**
     * @type {Integer (UInt32)}
     */
    static EC_PALETTE_CHANGED => 9

    /**
     * @type {Integer (UInt32)}
     */
    static EC_VIDEO_SIZE_CHANGED => 10

    /**
     * @type {Integer (UInt32)}
     */
    static EC_QUALITY_CHANGE => 11

    /**
     * @type {Integer (UInt32)}
     */
    static EC_SHUTTING_DOWN => 12

    /**
     * @type {Integer (UInt32)}
     */
    static EC_CLOCK_CHANGED => 13

    /**
     * @type {Integer (UInt32)}
     */
    static EC_PAUSED => 14

    /**
     * @type {Integer (UInt32)}
     */
    static EC_OPENING_FILE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static EC_BUFFERING_DATA => 17

    /**
     * @type {Integer (UInt32)}
     */
    static EC_FULLSCREEN_LOST => 18

    /**
     * @type {Integer (UInt32)}
     */
    static EC_ACTIVATE => 19

    /**
     * @type {Integer (UInt32)}
     */
    static EC_NEED_RESTART => 20

    /**
     * @type {Integer (UInt32)}
     */
    static EC_WINDOW_DESTROYED => 21

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DISPLAY_CHANGED => 22

    /**
     * @type {Integer (UInt32)}
     */
    static EC_STARVATION => 23

    /**
     * @type {Integer (UInt32)}
     */
    static EC_OLE_EVENT => 24

    /**
     * @type {Integer (UInt32)}
     */
    static EC_NOTIFY_WINDOW => 25

    /**
     * @type {Integer (UInt32)}
     */
    static EC_STREAM_CONTROL_STOPPED => 26

    /**
     * @type {Integer (UInt32)}
     */
    static EC_STREAM_CONTROL_STARTED => 27

    /**
     * @type {Integer (UInt32)}
     */
    static EC_END_OF_SEGMENT => 28

    /**
     * @type {Integer (UInt32)}
     */
    static EC_SEGMENT_STARTED => 29

    /**
     * @type {Integer (UInt32)}
     */
    static EC_LENGTH_CHANGED => 30

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DEVICE_LOST => 31

    /**
     * @type {Integer (UInt32)}
     */
    static EC_SAMPLE_NEEDED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static EC_PROCESSING_LATENCY => 33

    /**
     * @type {Integer (UInt32)}
     */
    static EC_SAMPLE_LATENCY => 34

    /**
     * @type {Integer (UInt32)}
     */
    static EC_SCRUB_TIME => 35

    /**
     * @type {Integer (UInt32)}
     */
    static EC_STEP_COMPLETE => 36

    /**
     * @type {Integer (UInt32)}
     */
    static EC_TIMECODE_AVAILABLE => 48

    /**
     * @type {Integer (UInt32)}
     */
    static EC_EXTDEVICE_MODE_CHANGE => 49

    /**
     * @type {Integer (UInt32)}
     */
    static EC_STATE_CHANGE => 50

    /**
     * @type {Integer (UInt32)}
     */
    static EC_GRAPH_CHANGED => 80

    /**
     * @type {Integer (UInt32)}
     */
    static EC_CLOCK_UNSET => 81

    /**
     * @type {Integer (UInt32)}
     */
    static EC_VMR_RENDERDEVICE_SET => 83

    /**
     * @type {Integer (UInt32)}
     */
    static VMR_RENDER_DEVICE_OVERLAY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VMR_RENDER_DEVICE_VIDMEM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VMR_RENDER_DEVICE_SYSMEM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EC_VMR_SURFACE_FLIPPED => 84

    /**
     * @type {Integer (UInt32)}
     */
    static EC_VMR_RECONNECTION_FAILED => 85

    /**
     * @type {Integer (UInt32)}
     */
    static EC_PREPROCESS_COMPLETE => 86

    /**
     * @type {Integer (UInt32)}
     */
    static EC_CODECAPI_EVENT => 87

    /**
     * @type {Integer (UInt32)}
     */
    static EC_WMT_EVENT_BASE => 593

    /**
     * @type {Integer (UInt32)}
     */
    static EC_WMT_INDEX_EVENT => 593

    /**
     * @type {Integer (UInt32)}
     */
    static EC_WMT_EVENT => 594

    /**
     * @type {Integer (UInt32)}
     */
    static EC_BUILT => 768

    /**
     * @type {Integer (UInt32)}
     */
    static EC_UNBUILT => 769

    /**
     * @type {Integer (UInt32)}
     */
    static EC_SKIP_FRAMES => 37

    /**
     * @type {Integer (UInt32)}
     */
    static EC_PLEASE_REOPEN => 64

    /**
     * @type {Integer (UInt32)}
     */
    static EC_STATUS => 65

    /**
     * @type {Integer (UInt32)}
     */
    static EC_MARKER_HIT => 66

    /**
     * @type {Integer (UInt32)}
     */
    static EC_LOADSTATUS => 67

    /**
     * @type {Integer (UInt32)}
     */
    static EC_FILE_CLOSED => 68

    /**
     * @type {Integer (UInt32)}
     */
    static EC_ERRORABORTEX => 69

    /**
     * @type {Integer (UInt32)}
     */
    static AM_LOADSTATUS_CLOSED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static AM_LOADSTATUS_LOADINGDESCR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AM_LOADSTATUS_LOADINGMCAST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AM_LOADSTATUS_LOCATING => 3

    /**
     * @type {Integer (UInt32)}
     */
    static AM_LOADSTATUS_CONNECTING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static AM_LOADSTATUS_OPENING => 5

    /**
     * @type {Integer (UInt32)}
     */
    static AM_LOADSTATUS_OPEN => 6

    /**
     * @type {Integer (UInt32)}
     */
    static EC_NEW_PIN => 32

    /**
     * @type {Integer (UInt32)}
     */
    static EC_RENDER_FINISHED => 33

    /**
     * @type {Integer (UInt32)}
     */
    static EC_EOS_SOON => 70

    /**
     * @type {Integer (UInt32)}
     */
    static EC_CONTENTPROPERTY_CHANGED => 71

    /**
     * @type {Integer (UInt32)}
     */
    static AM_CONTENTPROPERTY_TITLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AM_CONTENTPROPERTY_AUTHOR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AM_CONTENTPROPERTY_COPYRIGHT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static AM_CONTENTPROPERTY_DESCRIPTION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static EC_BANDWIDTHCHANGE => 72

    /**
     * @type {Integer (UInt32)}
     */
    static EC_VIDEOFRAMEREADY => 73

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DVDBASE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DVD_DOMAIN_CHANGE => 257

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DVD_TITLE_CHANGE => 258

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DVD_CHAPTER_START => 259

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DVD_AUDIO_STREAM_CHANGE => 260

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DVD_SUBPICTURE_STREAM_CHANGE => 261

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DVD_ANGLE_CHANGE => 262

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DVD_BUTTON_CHANGE => 263

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DVD_VALID_UOPS_CHANGE => 264

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DVD_STILL_ON => 265

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DVD_STILL_OFF => 266

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DVD_CURRENT_TIME => 267

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DVD_ERROR => 268

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DVD_WARNING => 269

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DVD_CHAPTER_AUTOSTOP => 270

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DVD_NO_FP_PGC => 271

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DVD_PLAYBACK_RATE_CHANGE => 272

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DVD_PARENTAL_LEVEL_CHANGE => 273

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DVD_PLAYBACK_STOPPED => 274

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DVD_ANGLES_AVAILABLE => 275

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DVD_PLAYPERIOD_AUTOSTOP => 276

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DVD_BUTTON_AUTO_ACTIVATED => 277

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DVD_CMD_START => 278

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DVD_CMD_END => 279

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DVD_DISC_EJECTED => 280

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DVD_DISC_INSERTED => 281

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DVD_CURRENT_HMSF_TIME => 282

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DVD_KARAOKE_MODE => 283

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DVD_PROGRAM_CELL_CHANGE => 284

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DVD_TITLE_SET_CHANGE => 285

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DVD_PROGRAM_CHAIN_CHANGE => 286

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DVD_VOBU_Offset => 287

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DVD_VOBU_Timestamp => 288

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DVD_GPRM_Change => 289

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DVD_SPRM_Change => 290

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DVD_BeginNavigationCommands => 291

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DVD_NavigationCommand => 292

    /**
     * @type {Integer (UInt32)}
     */
    static AM_AC3_ALTERNATE_AUDIO_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AM_AC3_ALTERNATE_AUDIO_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AM_AC3_ALTERNATE_AUDIO_BOTH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static AM_AC3_SERVICE_MAIN_AUDIO => 0

    /**
     * @type {Integer (UInt32)}
     */
    static AM_AC3_SERVICE_NO_DIALOG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AM_AC3_SERVICE_VISUALLY_IMPAIRED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AM_AC3_SERVICE_HEARING_IMPAIRED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static AM_AC3_SERVICE_DIALOG_ONLY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static AM_AC3_SERVICE_COMMENTARY => 5

    /**
     * @type {Integer (UInt32)}
     */
    static AM_AC3_SERVICE_EMERGENCY_FLASH => 6

    /**
     * @type {Integer (UInt32)}
     */
    static AM_AC3_SERVICE_VOICE_OVER => 7

    /**
     * @type {Integer (UInt32)}
     */
    static AM_UseNewCSSKey => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AM_ReverseBlockStart => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AM_ReverseBlockEnd => 4

    /**
     * @type {Integer (UInt32)}
     */
    static AM_DVD_CGMS_RESERVED_MASK => 120

    /**
     * @type {Integer (UInt32)}
     */
    static AM_DVD_CGMS_COPY_PROTECT_MASK => 24

    /**
     * @type {Integer (UInt32)}
     */
    static AM_DVD_CGMS_COPY_PERMITTED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static AM_DVD_CGMS_COPY_ONCE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static AM_DVD_CGMS_NO_COPY => 24

    /**
     * @type {Integer (UInt32)}
     */
    static AM_DVD_COPYRIGHT_MASK => 64

    /**
     * @type {Integer (UInt32)}
     */
    static AM_DVD_NOT_COPYRIGHTED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static AM_DVD_COPYRIGHTED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static AM_DVD_SECTOR_PROTECT_MASK => 32

    /**
     * @type {Integer (UInt32)}
     */
    static AM_DVD_SECTOR_NOT_PROTECTED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static AM_DVD_SECTOR_PROTECTED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static AMINTERLACE_IsInterlaced => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AMINTERLACE_1FieldPerSample => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AMINTERLACE_Field1First => 4

    /**
     * @type {Integer (UInt32)}
     */
    static AMINTERLACE_UNUSED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static AMINTERLACE_FieldPatternMask => 48

    /**
     * @type {Integer (UInt32)}
     */
    static AMINTERLACE_FieldPatField1Only => 0

    /**
     * @type {Integer (UInt32)}
     */
    static AMINTERLACE_FieldPatField2Only => 16

    /**
     * @type {Integer (UInt32)}
     */
    static AMINTERLACE_FieldPatBothRegular => 32

    /**
     * @type {Integer (UInt32)}
     */
    static AMINTERLACE_FieldPatBothIrregular => 48

    /**
     * @type {Integer (UInt32)}
     */
    static AMINTERLACE_DisplayModeMask => 192

    /**
     * @type {Integer (UInt32)}
     */
    static AMINTERLACE_DisplayModeBobOnly => 0

    /**
     * @type {Integer (UInt32)}
     */
    static AMINTERLACE_DisplayModeWeaveOnly => 64

    /**
     * @type {Integer (UInt32)}
     */
    static AMINTERLACE_DisplayModeBobOrWeave => 128

    /**
     * @type {Integer (UInt32)}
     */
    static AMCOPYPROTECT_RestrictDuplication => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AMCONTROL_USED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AMCONTROL_PAD_TO_4x3 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AMCONTROL_PAD_TO_16x9 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static AMCONTROL_COLORINFO_PRESENT => 128

    /**
     * @type {Integer (Int32)}
     */
    static AM_VIDEO_FLAG_FIELD_MASK => 3

    /**
     * @type {Integer (Int32)}
     */
    static AM_VIDEO_FLAG_INTERLEAVED_FRAME => 0

    /**
     * @type {Integer (Int32)}
     */
    static AM_VIDEO_FLAG_FIELD1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static AM_VIDEO_FLAG_FIELD2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static AM_VIDEO_FLAG_FIELD1FIRST => 4

    /**
     * @type {Integer (Int32)}
     */
    static AM_VIDEO_FLAG_WEAVE => 8

    /**
     * @type {Integer (Int32)}
     */
    static AM_VIDEO_FLAG_IPB_MASK => 48

    /**
     * @type {Integer (Int32)}
     */
    static AM_VIDEO_FLAG_I_SAMPLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static AM_VIDEO_FLAG_P_SAMPLE => 16

    /**
     * @type {Integer (Int32)}
     */
    static AM_VIDEO_FLAG_B_SAMPLE => 32

    /**
     * @type {Integer (Int32)}
     */
    static AM_VIDEO_FLAG_REPEAT_FIELD => 64

    /**
     * @type {Integer (UInt32)}
     */
    static AVIF_HASINDEX => 16

    /**
     * @type {Integer (UInt32)}
     */
    static AVIF_MUSTUSEINDEX => 32

    /**
     * @type {Integer (UInt32)}
     */
    static AVIF_ISINTERLEAVED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static AVIF_TRUSTCKTYPE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static AVIF_WASCAPTUREFILE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static AVIF_COPYRIGHTED => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static AVI_HEADERSIZE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static AVISF_DISABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AVISF_VIDEO_PALCHANGES => 65536

    /**
     * @type {Integer (Int32)}
     */
    static AVIIF_LIST => 1

    /**
     * @type {Integer (Int32)}
     */
    static AVIIF_KEYFRAME => 16

    /**
     * @type {Integer (Int32)}
     */
    static AVIIF_FIRSTPART => 32

    /**
     * @type {Integer (Int32)}
     */
    static AVIIF_LASTPART => 64

    /**
     * @type {Integer (Int32)}
     */
    static AVIIF_NOTIME => 256

    /**
     * @type {Integer (Int32)}
     */
    static AVIIF_COMPUSE => 268369920

    /**
     * @type {Integer (UInt32)}
     */
    static AVIIF_NO_TIME => 256

    /**
     * @type {Integer (UInt32)}
     */
    static AVIIF_COMPRESSOR => 268369920

    /**
     * @type {Integer (UInt32)}
     */
    static TIMECODE_RATE_30DROP => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TIMECODE_SMPTE_BINARY_GROUP => 7

    /**
     * @type {Integer (UInt32)}
     */
    static TIMECODE_SMPTE_COLOR_FRAME => 8

    /**
     * @type {Integer (UInt32)}
     */
    static AVI_INDEX_OF_INDEXES => 0

    /**
     * @type {Integer (UInt32)}
     */
    static AVI_INDEX_OF_CHUNKS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AVI_INDEX_OF_TIMED_CHUNKS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AVI_INDEX_OF_SUB_2FIELD => 3

    /**
     * @type {Integer (UInt32)}
     */
    static AVI_INDEX_IS_DATA => 128

    /**
     * @type {Integer (UInt32)}
     */
    static AVI_INDEX_SUB_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static AVI_INDEX_SUB_2FIELD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STDINDEXSIZE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static AVISTDINDEX_DELTAFRAME => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static AMVA_TYPEINDEX_OUTPUTFRAME => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static AMVA_QUERYRENDERSTATUSF_READ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MIN_DIMENSION => 1

    /**
     * @type {Integer (Int32)}
     */
    static BDA_PLP_ID_NOT_SET => -1

    /**
     * @type {Integer (UInt32)}
     */
    static CDEF_CLASS_DEFAULT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CDEF_BYPASS_CLASS_MANAGER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CDEF_MERIT_ABOVE_DO_NOT_USE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CDEF_DEVMON_CMGR_DEVICE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CDEF_DEVMON_DMO => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CDEF_DEVMON_PNP_DEVICE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CDEF_DEVMON_FILTER => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CDEF_DEVMON_SELECTIVE_MASK => 240

    /**
     * @type {Integer (UInt32)}
     */
    static CHARS_IN_GUID => 39

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_PIN_NAME => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_FILTER_NAME => 128

    /**
     * @type {Integer (UInt32)}
     */
    static AM_GBF_PREVFRAMESKIPPED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AM_GBF_NOTASYNCPOINT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AM_GBF_NOWAIT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static AM_GBF_NODDSURFACELOCK => 8

    /**
     * @type {Integer (Double)}
     */
    static AMF_AUTOMATICGAIN => -1

    /**
     * @type {Integer (UInt32)}
     */
    static AnalogVideo_NTSC_Mask => 7

    /**
     * @type {Integer (UInt32)}
     */
    static AnalogVideo_PAL_Mask => 1052656

    /**
     * @type {Integer (UInt32)}
     */
    static AnalogVideo_SECAM_Mask => 1044480

    /**
     * @type {Integer (UInt32)}
     */
    static MPEG2_PROGRAM_STREAM_MAP => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MPEG2_PROGRAM_ELEMENTARY_STREAM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MPEG2_PROGRAM_DIRECTORY_PES_PACKET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MPEG2_PROGRAM_PACK_HEADER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MPEG2_PROGRAM_PES_STREAM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MPEG2_PROGRAM_SYSTEM_HEADER => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SUBSTREAM_FILTER_VAL_NONE => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static AM_GETDECODERCAP_QUERY_VMR_SUPPORT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VMR_NOTSUPPORTED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static VMR_SUPPORTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AM_QUERY_DECODER_VMR_SUPPORT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AM_QUERY_DECODER_DXVA_1_SUPPORT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AM_QUERY_DECODER_DVD_SUPPORT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static AM_QUERY_DECODER_ATSC_SD_SUPPORT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static AM_QUERY_DECODER_ATSC_HD_SUPPORT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static AM_GETDECODERCAP_QUERY_VMR9_SUPPORT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static AM_GETDECODERCAP_QUERY_EVR_SUPPORT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DECODER_CAP_NOTSUPPORTED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DECODER_CAP_SUPPORTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VMRBITMAP_DISABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VMRBITMAP_HDC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VMRBITMAP_ENTIREDDS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static VMRBITMAP_SRCCOLORKEY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static VMRBITMAP_SRCRECT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DVD_TITLE_MENU => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DVD_STREAM_DATA_CURRENT => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static DVD_STREAM_DATA_VMGM => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DVD_STREAM_DATA_VTSM => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static DVD_DEFAULT_AUDIO_STREAM => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DVD_AUDIO_CAPS_AC3 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DVD_AUDIO_CAPS_MPEG2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DVD_AUDIO_CAPS_LPCM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DVD_AUDIO_CAPS_DTS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DVD_AUDIO_CAPS_SDDS => 16

    /**
     * @type {String}
     */
    static MEDIATYPE_MPEG2_PACK => "{36523b13-8ee5-11d1-8ca3-0060b057664a}"

    /**
     * @type {String}
     */
    static MEDIATYPE_MPEG2_PES => "{e06d8020-db46-11cf-b4d1-00805f6cbbea}"

    /**
     * @type {String}
     */
    static MEDIATYPE_CONTROL => "{e06d8021-db46-11cf-b4d1-00805f6cbbea}"

    /**
     * @type {String}
     */
    static MEDIATYPE_MPEG2_SECTIONS => "{455f176c-4b06-47ce-9aef-8caef73df7b5}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_MPEG2_VERSIONED_TABLES => "{1ed988b0-3ffc-4523-8725-347beec1a8a0}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_ATSC_SI => "{b3c7397c-d303-414d-b33c-4ed2c9d29733}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_DVB_SI => "{e9dd31a3-221d-4adb-8532-9af309c1a408}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_ISDB_SI => "{e89ad298-3601-4b06-aaec-9ddeedcc5bd0}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_TIF_SI => "{ec232eb2-cb96-4191-b226-0ea129f38250}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_MPEG2DATA => "{c892e55b-252d-42b5-a316-d997e7a5d995}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_MPEG2_WMDRM_TRANSPORT => "{18bec4ea-4676-450e-b478-0cd84c54b327}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_MPEG2_VIDEO => "{e06d8026-db46-11cf-b4d1-00805f6cbbea}"

    /**
     * @type {String}
     */
    static FORMAT_MPEG2_VIDEO => "{e06d80e3-db46-11cf-b4d1-00805f6cbbea}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_MPEG2_PROGRAM => "{e06d8022-db46-11cf-b4d1-00805f6cbbea}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_MPEG2_TRANSPORT => "{e06d8023-db46-11cf-b4d1-00805f6cbbea}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_MPEG2_TRANSPORT_STRIDE => "{138aa9a4-1ee2-4c5b-988e-19abfdbc8a11}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_MPEG2_UDCR_TRANSPORT => "{18bec4ea-4676-450e-b478-0cd84c54b327}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_MPEG2_PBDA_TRANSPORT_RAW => "{0d7aed42-cb9a-11db-9705-005056c00008}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_MPEG2_PBDA_TRANSPORT_PROCESSED => "{af748dd4-0d80-11db-9705-005056c00008}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_MPEG2_AUDIO => "{e06d802b-db46-11cf-b4d1-00805f6cbbea}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_DOLBY_AC3 => "{e06d802c-db46-11cf-b4d1-00805f6cbbea}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_DVD_SUBPICTURE => "{e06d802d-db46-11cf-b4d1-00805f6cbbea}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_DVD_LPCM_AUDIO => "{e06d8032-db46-11cf-b4d1-00805f6cbbea}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_DTS => "{e06d8033-db46-11cf-b4d1-00805f6cbbea}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_SDDS => "{e06d8034-db46-11cf-b4d1-00805f6cbbea}"

    /**
     * @type {String}
     */
    static MEDIATYPE_DVD_ENCRYPTED_PACK => "{ed0b916a-044d-11d1-aa78-00c04fc31d60}"

    /**
     * @type {String}
     */
    static MEDIATYPE_DVD_NAVIGATION => "{e06d802e-db46-11cf-b4d1-00805f6cbbea}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_DVD_NAVIGATION_PCI => "{e06d802f-db46-11cf-b4d1-00805f6cbbea}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_DVD_NAVIGATION_DSI => "{e06d8030-db46-11cf-b4d1-00805f6cbbea}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_DVD_NAVIGATION_PROVIDER => "{e06d8031-db46-11cf-b4d1-00805f6cbbea}"

    /**
     * @type {String}
     */
    static FORMAT_MPEG2Video => "{e06d80e3-db46-11cf-b4d1-00805f6cbbea}"

    /**
     * @type {String}
     */
    static FORMAT_DolbyAC3 => "{e06d80e4-db46-11cf-b4d1-00805f6cbbea}"

    /**
     * @type {String}
     */
    static FORMAT_MPEG2Audio => "{e06d80e5-db46-11cf-b4d1-00805f6cbbea}"

    /**
     * @type {String}
     */
    static FORMAT_DVD_LPCMAudio => "{e06d80e6-db46-11cf-b4d1-00805f6cbbea}"

    /**
     * @type {String}
     */
    static FORMAT_UVCH264Video => "{2017be05-6629-4248-aaed-7e1a47bc9b9c}"

    /**
     * @type {String}
     */
    static FORMAT_JPEGImage => "{692fa379-d3e8-4651-b5b4-0b94b013eeaf}"

    /**
     * @type {String}
     */
    static FORMAT_Image => "{692fa379-d3e8-4651-b5b4-0b94b013eeaf}"

    /**
     * @type {String}
     */
    static AM_KSPROPSETID_AC3 => "{bfabe720-6e1f-11d0-bcf2-444553540000}"

    /**
     * @type {String}
     */
    static AM_KSPROPSETID_DvdSubPic => "{ac390460-43af-11d0-bd6a-003505c103a9}"

    /**
     * @type {String}
     */
    static AM_KSPROPSETID_CopyProt => "{0e8a0a40-6aef-11d0-9ed0-00a024ca19b3}"

    /**
     * @type {String}
     */
    static AM_KSPROPSETID_TSRateChange => "{a503c5c0-1d1d-11d1-ad80-444553540000}"

    /**
     * @type {String}
     */
    static AM_KSPROPSETID_DVD_RateChange => "{3577eb09-9582-477f-b29c-b0c452a4ff9a}"

    /**
     * @type {String}
     */
    static AM_KSPROPSETID_DvdKaraoke => "{ae4720ae-aa71-42d8-b82a-fffdf58b76fd}"

    /**
     * @type {String}
     */
    static AM_KSPROPSETID_FrameStep => "{c830acbd-ab07-492f-8852-45b6987c2979}"

    /**
     * @type {String}
     */
    static AM_KSPROPSETID_MPEG4_MediaType_Attributes => "{ff6c4bfa-07a9-4c7b-a237-672f9d68065f}"

    /**
     * @type {String}
     */
    static AM_KSCATEGORY_CAPTURE => "{65e8773d-8f56-11d0-a3b9-00a0c9223196}"

    /**
     * @type {String}
     */
    static AM_KSCATEGORY_RENDER => "{65e8773e-8f56-11d0-a3b9-00a0c9223196}"

    /**
     * @type {String}
     */
    static AM_KSCATEGORY_DATACOMPRESSOR => "{1e84c900-7e70-11d0-a5d6-28db04c10000}"

    /**
     * @type {String}
     */
    static AM_KSCATEGORY_AUDIO => "{6994ad04-93ef-11d0-a3cc-00a0c9223196}"

    /**
     * @type {String}
     */
    static AM_KSCATEGORY_VIDEO => "{6994ad05-93ef-11d0-a3cc-00a0c9223196}"

    /**
     * @type {String}
     */
    static AM_KSCATEGORY_TVTUNER => "{a799a800-a46d-11d0-a18c-00a02401dcd4}"

    /**
     * @type {String}
     */
    static AM_KSCATEGORY_CROSSBAR => "{a799a801-a46d-11d0-a18c-00a02401dcd4}"

    /**
     * @type {String}
     */
    static AM_KSCATEGORY_TVAUDIO => "{a799a802-a46d-11d0-a18c-00a02401dcd4}"

    /**
     * @type {String}
     */
    static AM_KSCATEGORY_VBICODEC => "{07dad660-22f1-11d1-a9f4-00c04fbbde8f}"

    /**
     * @type {String}
     */
    static AM_KSCATEGORY_VBICODEC_MI => "{9c24a977-0951-451a-8006-0e49bd28cd5f}"

    /**
     * @type {String}
     */
    static AM_KSCATEGORY_SPLITTER => "{0a4252a0-7e70-11d0-a5d6-28db04c10000}"

    /**
     * @type {String}
     */
    static AM_INTERFACESETID_Standard => "{1a8766a0-62ce-11cf-a5d6-28db04c10000}"

    /**
     * @type {String}
     */
    static PBDA_AUX_CONNECTOR_TYPE_SVideo => "{a0e905f4-24c9-4a54-b761-213355efc13a}"

    /**
     * @type {String}
     */
    static PBDA_AUX_CONNECTOR_TYPE_Composite => "{f6298b4c-c725-4d42-849b-410bbb14ea62}"

    /**
     * @type {String}
     */
    static CLSID_PBDA_AUX_DATA_TYPE => "{fd456373-3323-4090-adca-8ed45f55cf10}"

    /**
     * @type {String}
     */
    static CLSID_PBDA_Encoder_DATA_TYPE => "{728fd6bc-5546-4716-b103-f899f5a1fa68}"

    /**
     * @type {Integer (UInt32)}
     */
    static PBDA_Encoder_Audio_AlgorithmType_MPEG1LayerII => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PBDA_Encoder_Audio_AlgorithmType_AC3 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PBDA_Encoder_Video_MPEG2PartII => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PBDA_Encoder_Video_MPEG4Part10 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PBDA_Encoder_Video_AVC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PBDA_Encoder_Video_H264 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PBDA_Encoder_BitrateMode_Constant => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PBDA_Encoder_BitrateMode_Variable => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PBDA_Encoder_BitrateMode_Average => 3

    /**
     * @type {String}
     */
    static CLSID_PBDA_FDC_DATA_TYPE => "{e7dbf9a0-22ab-4047-8e67-ef9ad504e729}"

    /**
     * @type {String}
     */
    static CLSID_PBDA_GDDS_DATA_TYPE => "{c80c0df3-6052-4c16-9f56-c44c21f73c45}"

    /**
     * @type {String}
     */
    static LIBID_QuartzNetTypeLib => "{56a868b1-0ad4-11ce-b03a-0020af0ba770}"

    /**
     * @type {String}
     */
    static LIBID_QuartzTypeLib => "{56a868b0-0ad4-11ce-b03a-0020af0ba770}"

    /**
     * @type {String}
     */
    static CLSID_AMMultiMediaStream => "{49c47ce5-9ba4-11d0-8212-00c04fc32c45}"

    /**
     * @type {String}
     */
    static CLSID_AMDirectDrawStream => "{49c47ce4-9ba4-11d0-8212-00c04fc32c45}"

    /**
     * @type {String}
     */
    static CLSID_AMAudioStream => "{8496e040-af4c-11d0-8212-00c04fc32c45}"

    /**
     * @type {String}
     */
    static CLSID_AMAudioData => "{f2468580-af8a-11d0-8212-00c04fc32c45}"

    /**
     * @type {String}
     */
    static CLSID_AMMediaTypeStream => "{cf0f2f7c-f7bf-11d0-900d-00c04fd9189d}"

    /**
     * @type {Integer (UInt32)}
     */
    static AMDDS_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static AMDDS_DCIPS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AMDDS_PS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AMDDS_RGBOVR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static AMDDS_YUVOVR => 8

    /**
     * @type {Integer (UInt32)}
     */
    static AMDDS_RGBOFF => 16

    /**
     * @type {Integer (UInt32)}
     */
    static AMDDS_YUVOFF => 32

    /**
     * @type {Integer (UInt32)}
     */
    static AMDDS_RGBFLP => 64

    /**
     * @type {Integer (UInt32)}
     */
    static AMDDS_YUVFLP => 128

    /**
     * @type {Integer (UInt32)}
     */
    static AMDDS_ALL => 255

    /**
     * @type {Integer (UInt32)}
     */
    static AMDDS_DEFAULT => 255

    /**
     * @type {Integer (UInt32)}
     */
    static iPALETTE_COLORS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static iEGA_COLORS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static iMASK_COLORS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static iTRUECOLOR => 16

    /**
     * @type {Integer (UInt32)}
     */
    static iRED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static iGREEN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static iBLUE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static iPALETTE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static iMAXBITS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_SIZE_MPEG1_SEQUENCE_INFO => 140

    /**
     * @type {String}
     */
    static CLSID_DMOWrapperFilter => "{94297043-bd82-4dfd-b0de-8177739c6d20}"

    /**
     * @type {String}
     */
    static CLSID_DMOFilterCategory => "{bcd5796c-bd52-4d30-ab76-70f975b89199}"

    /**
     * @type {Integer (UInt32)}
     */
    static AM_MPEG_AUDIO_DUAL_MERGE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static AM_MPEG_AUDIO_DUAL_LEFT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AM_MPEG_AUDIO_DUAL_RIGHT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VFW_FIRST_CODE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_ERROR_TEXT_LEN => 160

    /**
     * @type {Integer (UInt32)}
     */
    static MPBOOL_TRUE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MPBOOL_FALSE => 0

    /**
     * @type {Integer (Int32)}
     */
    static DWORD_ALLPARAMS => -1

    /**
     * @type {String}
     */
    static GUID_TIME_REFERENCE => "{93ad712b-daa0-4ffe-bc81-b0ce500fcdd9}"

    /**
     * @type {String}
     */
    static GUID_TIME_MUSIC => "{0574c49d-5b04-4b15-a542-ae282030117b}"

    /**
     * @type {String}
     */
    static GUID_TIME_SAMPLES => "{a8593d05-0c43-4984-9a63-97af9e02c4c0}"

    /**
     * @type {Integer (UInt32)}
     */
    static MPF_ENVLP_STANDARD => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MPF_ENVLP_BEGIN_CURRENTVAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MPF_ENVLP_BEGIN_NEUTRALVAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MPF_PUNCHIN_REFTIME => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MPF_PUNCHIN_NOW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MPF_PUNCHIN_STOPPED => 2

    /**
     * @type {String}
     */
    static MSPID_PrimaryVideo => "{a35ff56a-9fda-11d0-8fdf-00c04fd9189d}"

    /**
     * @type {String}
     */
    static MSPID_PrimaryAudio => "{a35ff56b-9fda-11d0-8fdf-00c04fd9189d}"

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_INVALIDMEDIATYPE => -2147220992

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_INVALIDSUBTYPE => -2147220991

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_NEED_OWNER => -2147220990

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_ENUM_OUT_OF_SYNC => -2147220989

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_ALREADY_CONNECTED => -2147220988

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_FILTER_ACTIVE => -2147220987

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_NO_TYPES => -2147220986

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_NO_ACCEPTABLE_TYPES => -2147220985

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_INVALID_DIRECTION => -2147220984

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_NOT_CONNECTED => -2147220983

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_NO_ALLOCATOR => -2147220982

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_RUNTIME_ERROR => -2147220981

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_BUFFER_NOTSET => -2147220980

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_BUFFER_OVERFLOW => -2147220979

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_BADALIGN => -2147220978

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_ALREADY_COMMITTED => -2147220977

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_BUFFERS_OUTSTANDING => -2147220976

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_NOT_COMMITTED => -2147220975

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_SIZENOTSET => -2147220974

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_NO_CLOCK => -2147220973

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_NO_SINK => -2147220972

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_NO_INTERFACE => -2147220971

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_NOT_FOUND => -2147220970

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_CANNOT_CONNECT => -2147220969

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_CANNOT_RENDER => -2147220968

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_CHANGING_FORMAT => -2147220967

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_NO_COLOR_KEY_SET => -2147220966

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_NOT_OVERLAY_CONNECTION => -2147220965

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_NOT_SAMPLE_CONNECTION => -2147220964

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_PALETTE_SET => -2147220963

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_COLOR_KEY_SET => -2147220962

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_NO_COLOR_KEY_FOUND => -2147220961

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_NO_PALETTE_AVAILABLE => -2147220960

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_NO_DISPLAY_PALETTE => -2147220959

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_TOO_MANY_COLORS => -2147220958

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_STATE_CHANGED => -2147220957

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_NOT_STOPPED => -2147220956

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_NOT_PAUSED => -2147220955

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_NOT_RUNNING => -2147220954

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_WRONG_STATE => -2147220953

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_START_TIME_AFTER_END => -2147220952

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_INVALID_RECT => -2147220951

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_TYPE_NOT_ACCEPTED => -2147220950

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_SAMPLE_REJECTED => -2147220949

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_SAMPLE_REJECTED_EOS => -2147220948

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_DUPLICATE_NAME => -2147220947

    /**
     * @type {Integer (Int32)}
     */
    static VFW_S_DUPLICATE_NAME => 262701

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_TIMEOUT => -2147220946

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_INVALID_FILE_FORMAT => -2147220945

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_ENUM_OUT_OF_RANGE => -2147220944

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_CIRCULAR_GRAPH => -2147220943

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_NOT_ALLOWED_TO_SAVE => -2147220942

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_TIME_ALREADY_PASSED => -2147220941

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_ALREADY_CANCELLED => -2147220940

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_CORRUPT_GRAPH_FILE => -2147220939

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_ADVISE_ALREADY_SET => -2147220938

    /**
     * @type {Integer (Int32)}
     */
    static VFW_S_STATE_INTERMEDIATE => 262711

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_NO_MODEX_AVAILABLE => -2147220936

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_NO_ADVISE_SET => -2147220935

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_NO_FULLSCREEN => -2147220934

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_IN_FULLSCREEN_MODE => -2147220933

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_UNKNOWN_FILE_TYPE => -2147220928

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_CANNOT_LOAD_SOURCE_FILTER => -2147220927

    /**
     * @type {Integer (Int32)}
     */
    static VFW_S_PARTIAL_RENDER => 262722

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_FILE_TOO_SHORT => -2147220925

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_INVALID_FILE_VERSION => -2147220924

    /**
     * @type {Integer (Int32)}
     */
    static VFW_S_SOME_DATA_IGNORED => 262725

    /**
     * @type {Integer (Int32)}
     */
    static VFW_S_CONNECTIONS_DEFERRED => 262726

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_INVALID_CLSID => -2147220921

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_INVALID_MEDIA_TYPE => -2147220920

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_BAD_KEY => -2147220494

    /**
     * @type {Integer (Int32)}
     */
    static VFW_S_NO_MORE_ITEMS => 262403

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_SAMPLE_TIME_NOT_SET => -2147220919

    /**
     * @type {Integer (Int32)}
     */
    static VFW_S_RESOURCE_NOT_NEEDED => 262736

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_MEDIA_TIME_NOT_SET => -2147220911

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_NO_TIME_FORMAT_SET => -2147220910

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_MONO_AUDIO_HW => -2147220909

    /**
     * @type {Integer (Int32)}
     */
    static VFW_S_MEDIA_TYPE_IGNORED => 262740

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_NO_DECOMPRESSOR => -2147220907

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_NO_AUDIO_HARDWARE => -2147220906

    /**
     * @type {Integer (Int32)}
     */
    static VFW_S_VIDEO_NOT_RENDERED => 262743

    /**
     * @type {Integer (Int32)}
     */
    static VFW_S_AUDIO_NOT_RENDERED => 262744

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_RPZA => -2147220903

    /**
     * @type {Integer (Int32)}
     */
    static VFW_S_RPZA => 262746

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_PROCESSOR_NOT_SUITABLE => -2147220901

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_UNSUPPORTED_AUDIO => -2147220900

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_UNSUPPORTED_VIDEO => -2147220899

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_MPEG_NOT_CONSTRAINED => -2147220898

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_NOT_IN_GRAPH => -2147220897

    /**
     * @type {Integer (Int32)}
     */
    static VFW_S_ESTIMATED => 262752

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_NO_TIME_FORMAT => -2147220895

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_READ_ONLY => -2147220894

    /**
     * @type {Integer (Int32)}
     */
    static VFW_S_RESERVED => 262755

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_BUFFER_UNDERFLOW => -2147220892

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_UNSUPPORTED_STREAM => -2147220891

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_NO_TRANSPORT => -2147220890

    /**
     * @type {Integer (Int32)}
     */
    static VFW_S_STREAM_OFF => 262759

    /**
     * @type {Integer (Int32)}
     */
    static VFW_S_CANT_CUE => 262760

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_BAD_VIDEOCD => -2147220887

    /**
     * @type {Integer (Int32)}
     */
    static VFW_S_NO_STOP_TIME => 262768

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_OUT_OF_VIDEO_MEMORY => -2147220879

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_VP_NEGOTIATION_FAILED => -2147220878

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_DDRAW_CAPS_NOT_SUITABLE => -2147220877

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_NO_VP_HARDWARE => -2147220876

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_NO_CAPTURE_HARDWARE => -2147220875

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_DVD_OPERATION_INHIBITED => -2147220874

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_DVD_INVALIDDOMAIN => -2147220873

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_DVD_NO_BUTTON => -2147220872

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_DVD_GRAPHNOTREADY => -2147220871

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_DVD_RENDERFAIL => -2147220870

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_DVD_DECNOTENOUGH => -2147220869

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_DDRAW_VERSION_NOT_SUITABLE => -2147220868

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_COPYPROT_FAILED => -2147220867

    /**
     * @type {Integer (Int32)}
     */
    static VFW_S_NOPREVIEWPIN => 262782

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_TIME_EXPIRED => -2147220865

    /**
     * @type {Integer (Int32)}
     */
    static VFW_S_DVD_NON_ONE_SEQUENTIAL => 262784

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_DVD_WRONG_SPEED => -2147220863

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_DVD_MENU_DOES_NOT_EXIST => -2147220862

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_DVD_CMD_CANCELLED => -2147220861

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_DVD_STATE_WRONG_VERSION => -2147220860

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_DVD_STATE_CORRUPT => -2147220859

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_DVD_STATE_WRONG_DISC => -2147220858

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_DVD_INCOMPATIBLE_REGION => -2147220857

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_DVD_NO_ATTRIBUTES => -2147220856

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_DVD_NO_GOUP_PGC => -2147220855

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_DVD_LOW_PARENTAL_LEVEL => -2147220854

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_DVD_NOT_IN_KARAOKE_MODE => -2147220853

    /**
     * @type {Integer (Int32)}
     */
    static VFW_S_DVD_CHANNEL_CONTENTS_NOT_AVAILABLE => 262796

    /**
     * @type {Integer (Int32)}
     */
    static VFW_S_DVD_NOT_ACCURATE => 262797

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_FRAME_STEP_UNSUPPORTED => -2147220850

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_DVD_STREAM_DISABLED => -2147220849

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_DVD_TITLE_UNKNOWN => -2147220848

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_DVD_INVALID_DISC => -2147220847

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_DVD_NO_RESUME_INFORMATION => -2147220846

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_PIN_ALREADY_BLOCKED_ON_THIS_THREAD => -2147220845

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_PIN_ALREADY_BLOCKED => -2147220844

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_CERTIFICATION_FAILURE => -2147220843

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_VMR_NOT_IN_MIXER_MODE => -2147220842

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_VMR_NO_AP_SUPPLIED => -2147220841

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_VMR_NO_DEINTERLACE_HW => -2147220840

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_VMR_NO_PROCAMP_HW => -2147220839

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_DVD_VMR9_INCOMPATIBLEDEC => -2147220838

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_NO_COPP_HW => -2147220837

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_DVD_NONBLOCKING => -2147220836

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_DVD_TOO_MANY_RENDERERS_IN_FILTER_GRAPH => -2147220835

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_DVD_NON_EVR_RENDERER_IN_FILTER_GRAPH => -2147220834

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_DVD_RESOLUTION_ERROR => -2147220833

    /**
     * @type {Integer (Int32)}
     */
    static E_PROP_SET_UNSUPPORTED => -2147023726

    /**
     * @type {Integer (Int32)}
     */
    static E_PROP_ID_UNSUPPORTED => -2147023728

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_CODECAPI_LINEAR_RANGE => -2147220720

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_CODECAPI_ENUMERATED => -2147220719

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_CODECAPI_NO_DEFAULT => -2147220717

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_CODECAPI_NO_CURRENT_VALUE => -2147220716

    /**
     * @type {Integer (Int32)}
     */
    static VFW_E_DVD_CHAPTER_DOES_NOT_EXIST => -2147220715

    /**
     * @type {Integer (Int32)}
     */
    static VFW_S_DVD_RENDER_STATUS => 262944

    /**
     * @type {String}
     */
    static CFSTR_VFW_FILTERLIST => "Video for Windows 4 Filters"

    /**
     * @type {String}
     */
    static DXVA_ModeNone => "{1b81be00-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA_ModeH261_A => "{1b81be01-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA_ModeH261_B => "{1b81be02-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA_ModeH263_A => "{1b81be03-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA_ModeH263_B => "{1b81be04-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA_ModeH263_C => "{1b81be05-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA_ModeH263_D => "{1b81be06-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA_ModeH263_E => "{1b81be07-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA_ModeH263_F => "{1b81be08-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA_ModeMPEG1_A => "{1b81be09-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA_ModeMPEG1_VLD => "{6f3ec719-3735-42cc-8063-65cc3cb36616}"

    /**
     * @type {String}
     */
    static DXVA_ModeMPEG2_A => "{1b81be0a-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA_ModeMPEG2_B => "{1b81be0b-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA_ModeMPEG2_C => "{1b81be0c-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA_ModeMPEG2_D => "{1b81be0d-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA_ModeMPEG2and1_VLD => "{86695f12-340e-4f04-9fd3-9253dd327460}"

    /**
     * @type {String}
     */
    static DXVA_ModeH264_A => "{1b81be64-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA_ModeH264_B => "{1b81be65-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA_ModeH264_C => "{1b81be66-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA_ModeH264_D => "{1b81be67-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA_ModeH264_E => "{1b81be68-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA_ModeH264_F => "{1b81be69-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA_ModeH264_VLD_WithFMOASO_NoFGT => "{d5f04ff9-3418-45d8-9561-32a76aae2ddd}"

    /**
     * @type {String}
     */
    static DXVA_ModeH264_VLD_Stereo_Progressive_NoFGT => "{d79be8da-0cf1-4c81-b82a-69a4e236f43d}"

    /**
     * @type {String}
     */
    static DXVA_ModeH264_VLD_Stereo_NoFGT => "{f9aaccbb-c2b6-4cfc-8779-5707b1760552}"

    /**
     * @type {String}
     */
    static DXVA_ModeH264_VLD_Multiview_NoFGT => "{705b9d82-76cf-49d6-b7e6-ac8872db013c}"

    /**
     * @type {String}
     */
    static DXVA_ModeWMV8_A => "{1b81be80-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA_ModeWMV8_B => "{1b81be81-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA_ModeWMV9_A => "{1b81be90-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA_ModeWMV9_B => "{1b81be91-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA_ModeWMV9_C => "{1b81be94-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA_ModeVC1_A => "{1b81bea0-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA_ModeVC1_B => "{1b81bea1-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA_ModeVC1_C => "{1b81bea2-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA_ModeVC1_D => "{1b81bea3-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA_ModeVC1_D2010 => "{1b81bea4-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA_ModeMPEG4pt2_VLD_Simple => "{efd64d74-c9e8-41d7-a5e9-e9b0e39fa319}"

    /**
     * @type {String}
     */
    static DXVA_ModeMPEG4pt2_VLD_AdvSimple_NoGMC => "{ed418a9f-010d-4eda-9ae3-9a65358d8d2e}"

    /**
     * @type {String}
     */
    static DXVA_ModeMPEG4pt2_VLD_AdvSimple_GMC => "{ab998b5b-4258-44a9-9feb-94e597a6baae}"

    /**
     * @type {String}
     */
    static DXVA_ModeHEVC_VLD_Main => "{5b11d51b-2f4c-4452-bcc3-09f2a1160cc0}"

    /**
     * @type {String}
     */
    static DXVA_ModeHEVC_VLD_Main10 => "{107af0e0-ef1a-4d19-aba8-67a163073d13}"

    /**
     * @type {String}
     */
    static DXVA_ModeHEVC_VLD_Monochrome => "{0685b993-3d8c-43a0-8b28-d74c2d6899a4}"

    /**
     * @type {String}
     */
    static DXVA_ModeHEVC_VLD_Monochrome10 => "{142a1d0f-69dd-4ec9-8591-b12ffcb91a29}"

    /**
     * @type {String}
     */
    static DXVA_ModeHEVC_VLD_Main12 => "{1a72925f-0c2c-4f15-96fb-b17d1473603f}"

    /**
     * @type {String}
     */
    static DXVA_ModeHEVC_VLD_Main10_422 => "{0bac4fe5-1532-4429-a854-f84de04953db}"

    /**
     * @type {String}
     */
    static DXVA_ModeHEVC_VLD_Main12_422 => "{55bcac81-f311-4093-a7d0-1cbc0b849bee}"

    /**
     * @type {String}
     */
    static DXVA_ModeHEVC_VLD_Main_444 => "{4008018f-f537-4b36-98cf-61af8a2c1a33}"

    /**
     * @type {String}
     */
    static DXVA_ModeHEVC_VLD_Main10_Ext => "{9cc55490-e37c-4932-8684-4920f9f6409c}"

    /**
     * @type {String}
     */
    static DXVA_ModeHEVC_VLD_Main10_444 => "{0dabeffa-4458-4602-bc03-0795659d617c}"

    /**
     * @type {String}
     */
    static DXVA_ModeHEVC_VLD_Main12_444 => "{9798634d-fe9d-48e5-b4da-dbec45b3df01}"

    /**
     * @type {String}
     */
    static DXVA_ModeHEVC_VLD_Main16 => "{a4fbdbb0-a113-482b-a232-635cc0697f6d}"

    /**
     * @type {String}
     */
    static DXVA_ModeVP9_VLD_Profile0 => "{463707f8-a1d0-4585-876d-83aa6d60b89e}"

    /**
     * @type {String}
     */
    static DXVA_ModeVP9_VLD_10bit_Profile2 => "{a4c749ef-6ecf-48aa-8448-50a7a1165ff7}"

    /**
     * @type {String}
     */
    static DXVA_ModeVP8_VLD => "{90b899ea-3a62-4705-88b3-8df04b2744e7}"

    /**
     * @type {String}
     */
    static DXVA_ModeAV1_VLD_Profile0 => "{b8be4ccb-cf53-46ba-8d59-d6b8a6da5d2a}"

    /**
     * @type {String}
     */
    static DXVA_ModeAV1_VLD_Profile1 => "{6936ff0f-45b1-4163-9cc1-646ef6946108}"

    /**
     * @type {String}
     */
    static DXVA_ModeAV1_VLD_Profile2 => "{0c5f2aa1-e541-4089-bb7b-98110a19d7c8}"

    /**
     * @type {String}
     */
    static DXVA_ModeAV1_VLD_12bit_Profile2 => "{17127009-a00f-4ce1-994e-bf4081f6f3f0}"

    /**
     * @type {String}
     */
    static DXVA_ModeAV1_VLD_12bit_Profile2_420 => "{2d80bed6-9cac-4835-9e91-327bbc4f9ee8}"

    /**
     * @type {String}
     */
    static DXVA_ModeMJPEG_VLD_420 => "{725cb506-0c29-43c4-9440-8e9397903a04}"

    /**
     * @type {String}
     */
    static DXVA_ModeMJPEG_VLD_422 => "{5b77b9cd-1a35-4c30-9fd8-ef4b60c035dd}"

    /**
     * @type {String}
     */
    static DXVA_ModeMJPEG_VLD_444 => "{d95161f9-0d44-47e6-bcf5-1bfbfb268f97}"

    /**
     * @type {String}
     */
    static DXVA_ModeMJPEG_VLD_4444 => "{c91748d5-fd18-4aca-9db3-3a6634ab547d}"

    /**
     * @type {String}
     */
    static DXVA_ModeJPEG_VLD_420 => "{cf782c83-bef5-4a2c-87cb-6019e7b175ac}"

    /**
     * @type {String}
     */
    static DXVA_ModeJPEG_VLD_422 => "{f04df417-eee2-4067-a778-f35c15ab9721}"

    /**
     * @type {String}
     */
    static DXVA_ModeJPEG_VLD_444 => "{4cd00e17-89ba-48ef-b9f9-edcb82713f65}"

    /**
     * @type {String}
     */
    static DXVA_NoEncrypt => "{1b81bed0-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_UNRESTRICTED => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_H261_A => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_H261_B => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_H263_A => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_H263_B => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_H263_C => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_H263_D => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_H263_E => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_H263_F => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_MPEG1_A => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_MPEG2_A => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_MPEG2_B => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_MPEG2_C => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_MPEG2_D => 13

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_MPEG1_VLD => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_MPEG2and1_VLD => 17

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_H264_A => 100

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_H264_B => 101

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_H264_C => 102

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_H264_D => 103

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_H264_E => 104

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_H264_F => 105

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_H264_VLD_WITHFMOASO_NOFGT => 112

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_H264_VLD_STEREO_PROGRESSIVE_NOFGT => 113

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_H264_VLD_STEREO_NOFGT => 114

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_H264_VLD_MULTIVIEW_NOFGT => 115

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_WMV8_A => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_WMV8_B => 129

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_WMV9_A => 144

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_WMV9_B => 145

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_WMV9_C => 148

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_VC1_A => 160

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_VC1_B => 161

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_VC1_C => 162

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_VC1_D => 163

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_VC1_D2010 => 164

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_MPEG4PT2_VLD_SIMPLE => 176

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_MPEG4PT2_VLD_ADV_SIMPLE_NOGMC => 177

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_MPEG4PT2_VLD_ADV_SIMPLE_GMC => 178

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_WMV8_POSTPROC => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_WMV8_MOCOMP => 129

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_WMV9_POSTPROC => 144

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_WMV9_MOCOMP => 145

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_WMV9_IDCT => 148

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_VC1_POSTPROC => 160

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_VC1_MOCOMP => 161

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_VC1_IDCT => 162

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_VC1_VLD => 163

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_H264_MOCOMP_NOFGT => 100

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_H264_MOCOMP_FGT => 101

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_H264_IDCT_NOFGT => 102

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_H264_IDCT_FGT => 103

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_H264_VLD_NOFGT => 104

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESTRICTED_MODE_H264_VLD_FGT => 105

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_COMPBUFFER_TYPE_THAT_IS_NOT_USED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_PICTURE_DECODE_BUFFER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_MACROBLOCK_CONTROL_BUFFER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_RESIDUAL_DIFFERENCE_BUFFER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_DEBLOCKING_CONTROL_BUFFER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_INVERSE_QUANTIZATION_MATRIX_BUFFER => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_SLICE_CONTROL_BUFFER => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_BITSTREAM_DATA_BUFFER => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_AYUV_BUFFER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_IA44_SURFACE_BUFFER => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_DPXD_SURFACE_BUFFER => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_HIGHLIGHT_BUFFER => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_DCCMD_SURFACE_BUFFER => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_ALPHA_BLEND_COMBINATION_BUFFER => 13

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_PICTURE_RESAMPLE_BUFFER => 14

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_READ_BACK_BUFFER => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_MOTION_VECTOR_BUFFER => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_FILM_GRAIN_BUFFER => 17

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_NUM_TYPES_COMP_BUFFERS => 18

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_PICTURE_DECODING_FUNCTION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_ALPHA_BLEND_DATA_LOAD_FUNCTION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_ALPHA_BLEND_COMBINATION_FUNCTION => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_PICTURE_RESAMPLE_FUNCTION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_DEBLOCKING_FILTER_FUNCTION => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_FILM_GRAIN_SYNTHESIS_FUNCTION => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_STATUS_REPORTING_FUNCTION => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_EXECUTE_RETURN_OK => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_EXECUTE_RETURN_DATA_ERROR_MINOR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_EXECUTE_RETURN_DATA_ERROR_SIGNIF => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_EXECUTE_RETURN_DATA_ERROR_SEVERE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_EXECUTE_RETURN_OTHER_ERROR_SEVERE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_QUERYORREPLYFUNCFLAG_DECODER_PROBE_QUERY => 16777201

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_QUERYORREPLYFUNCFLAG_DECODER_LOCK_QUERY => 16777205

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_QUERYORREPLYFUNCFLAG_ACCEL_PROBE_OK_COPY => 16777208

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_QUERYORREPLYFUNCFLAG_ACCEL_PROBE_OK_PLUS => 16777209

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_QUERYORREPLYFUNCFLAG_ACCEL_LOCK_OK_COPY => 16777212

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_QUERYORREPLYFUNCFLAG_ACCEL_PROBE_FALSE_PLUS => 16777211

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_QUERYORREPLYFUNCFLAG_ACCEL_LOCK_FALSE_PLUS => 16777215

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_ENCRYPTPROTOCOLFUNCFLAG_HOST => 16776960

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_ENCRYPTPROTOCOLFUNCFLAG_ACCEL => 16776968

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_CHROMA_FORMAT_420 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_CHROMA_FORMAT_422 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_CHROMA_FORMAT_444 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_PICTURE_STRUCTURE_TOP_FIELD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_PICTURE_STRUCTURE_BOTTOM_FIELD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_PICTURE_STRUCTURE_FRAME => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_BIDIRECTIONAL_AVERAGING_MPEG2_ROUND => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_BIDIRECTIONAL_AVERAGING_H263_TRUNC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_MV_PRECISION_AND_CHROMA_RELATION_MPEG2 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_MV_PRECISION_AND_CHROMA_RELATION_H263 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_MV_PRECISION_AND_CHROMA_RELATION_H261 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_SCAN_METHOD_ZIG_ZAG => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_SCAN_METHOD_ALTERNATE_VERTICAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_SCAN_METHOD_ALTERNATE_HORIZONTAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_SCAN_METHOD_ARBITRARY => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_BITSTREAM_CONCEALMENT_NEED_UNLIKELY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_BITSTREAM_CONCEALMENT_NEED_MILD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_BITSTREAM_CONCEALMENT_NEED_LIKELY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_BITSTREAM_CONCEALMENT_NEED_SEVERE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_BITSTREAM_CONCEALMENT_METHOD_UNSPECIFIED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_BITSTREAM_CONCEALMENT_METHOD_INTRA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_BITSTREAM_CONCEALMENT_METHOD_FORWARD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_BITSTREAM_CONCEALMENT_METHOD_BACKWARD => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_USUAL_BLOCK_WIDTH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_USUAL_BLOCK_HEIGHT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_NumMV_OBMC_off_BinPBwith4MV_off => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_NumMV_OBMC_off_BinPBwith4MV_on => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_NumMV_OBMC_on__BinPB_off => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_NumMV_OBMC_on__BinPB_on => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_CONFIG_DATA_TYPE_IA44 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_CONFIG_DATA_TYPE_AI44 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_CONFIG_DATA_TYPE_DPXD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_CONFIG_DATA_TYPE_AYUV => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_CONFIG_BLEND_TYPE_FRONT_BUFFER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_CONFIG_BLEND_TYPE_BACK_HARDWARE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_ExtColorData_ShiftBase => 8

    /**
     * @type {String}
     */
    static DXVA_DeinterlaceBobDevice => "{335aa36e-7884-43a4-9c91-7f87faf3e37e}"

    /**
     * @type {String}
     */
    static DXVA_DeinterlaceContainerDevice => "{0e85cb93-3046-4ff0-aecc-d58cb5f035fd}"

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_DEINTERLACE_SURFACES => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_DeinterlaceBltFnCode => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_DeinterlaceBltExFnCode => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_DEINTERLACE_DEVICE_GUIDS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_DeinterlaceQueryAvailableModesFnCode => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_DeinterlaceQueryModeCapsFnCode => 2

    /**
     * @type {String}
     */
    static DXVA_ProcAmpControlDevice => "{9f200913-2ffd-4056-9f1e-e1b508f22dcf}"

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_ProcAmpControlQueryCapsFnCode => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_ProcAmpControlQueryRangeFnCode => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_ProcAmpControlBltFnCode => 1

    /**
     * @type {String}
     */
    static DXVA_COPPDevice => "{d2457add-8999-45ed-8a8a-d1aa047ba4d5}"

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_COPPGetCertificateLengthFnCode => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_COPPKeyExchangeFnCode => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_COPPSequenceStartFnCode => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_COPPCommandFnCode => 4

    /**
     * @type {String}
     */
    static DXVA_COPPSetProtectionLevel => "{9bb9327c-4eb5-4727-9f00-b42b0919c0da}"

    /**
     * @type {Integer (Int32)}
     */
    static COPP_NoProtectionLevelAvailable => -1

    /**
     * @type {Integer (UInt32)}
     */
    static COPP_DefaultProtectionLevel => 0

    /**
     * @type {String}
     */
    static DXVA_COPPSetSignaling => "{09a631a5-d684-4c60-8e4d-d3bb0f0be3ee}"

    /**
     * @type {Integer (UInt32)}
     */
    static COPP_ImageAspectRatio_EN300294_Mask => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA_COPPQueryStatusFnCode => 5

    /**
     * @type {String}
     */
    static DXVA_COPPQueryConnectorType => "{81d0bfd5-6afe-48c2-99c0-95a08f97c5da}"

    /**
     * @type {String}
     */
    static DXVA_COPPQueryProtectionType => "{38f2a801-9a6c-48bb-9107-b6696e6f1797}"

    /**
     * @type {String}
     */
    static DXVA_COPPQueryLocalProtectionLevel => "{b2075857-3eda-4d5d-88db-748f8c1a0549}"

    /**
     * @type {String}
     */
    static DXVA_COPPQueryGlobalProtectionLevel => "{1957210a-7766-452a-b99a-d27aed54f03a}"

    /**
     * @type {String}
     */
    static DXVA_COPPQueryDisplayData => "{d7bf1ba3-ad13-4f8e-af98-0dcb3ca204cc}"

    /**
     * @type {String}
     */
    static DXVA_COPPQueryHDCPKeyData => "{0db59d74-a992-492e-a0bd-c23fda564e00}"

    /**
     * @type {String}
     */
    static DXVA_COPPQueryBusData => "{c6f4d673-6174-4184-8e35-f6db5200bcba}"

    /**
     * @type {String}
     */
    static DXVA_COPPQuerySignaling => "{6629a591-3b79-4cf3-924a-11e8e7811671}"

    /**
     * @type {String}
     */
    static DXVA2Trace_Control => "{a0386e75-f70c-464c-a9ce-33c44e091623}"

    /**
     * @type {String}
     */
    static DXVA2Trace_DecodeDevCreated => "{b4de17a1-c5b2-44fe-86d5-d97a648114ff}"

    /**
     * @type {String}
     */
    static DXVA2Trace_DecodeDevDestroyed => "{853ebdf2-4160-421d-8893-63dcea4f18bb}"

    /**
     * @type {String}
     */
    static DXVA2Trace_DecodeDevBeginFrame => "{9fd1acf6-44cb-4637-bc62-2c11a9608f90}"

    /**
     * @type {String}
     */
    static DXVA2Trace_DecodeDevExecute => "{850aeb4c-d19a-4609-b3b4-bcbf0e22121e}"

    /**
     * @type {String}
     */
    static DXVA2Trace_DecodeDevGetBuffer => "{57b128fb-72cb-4137-a575-d91fa3160897}"

    /**
     * @type {String}
     */
    static DXVA2Trace_DecodeDevEndFrame => "{9fb3cb33-47dc-4899-98c8-c0c6cd7cd3cb}"

    /**
     * @type {String}
     */
    static DXVA2Trace_VideoProcessDevCreated => "{895508c6-540d-4c87-98f8-8dcbf2dabb2a}"

    /**
     * @type {String}
     */
    static DXVA2Trace_VideoProcessDevDestroyed => "{f97f30b1-fb49-42c7-8ee8-88bdfa92d4e2}"

    /**
     * @type {String}
     */
    static DXVA2Trace_VideoProcessBlt => "{69089cc0-71ab-42d0-953a-2887bf05a8af}"

    /**
     * @type {String}
     */
    static MSTapeDeviceGUID => "{8c0f6af2-0edb-44c1-8aeb-59040bd830ed}"

    /**
     * @type {String}
     */
    static g_wszExcludeScriptStreamDeliverySynchronization => "ExcludeScriptStreamDeliverySynchronization"

    /**
     * @type {Integer (UInt32)}
     */
    static MPEG2_BASE => 512

    /**
     * @type {Integer (Int32)}
     */
    static MPEG2_S_MORE_DATA_AVAILABLE => 262656

    /**
     * @type {Integer (Int32)}
     */
    static MPEG2_S_NO_MORE_DATA_AVAILABLE => 262657

    /**
     * @type {Integer (Int32)}
     */
    static MPEG2_S_SG_INFO_FOUND => 262658

    /**
     * @type {Integer (Int32)}
     */
    static MPEG2_S_SG_INFO_NOT_FOUND => 262659

    /**
     * @type {Integer (Int32)}
     */
    static MPEG2_S_MPE_INFO_FOUND => 262660

    /**
     * @type {Integer (Int32)}
     */
    static MPEG2_S_MPE_INFO_NOT_FOUND => 262661

    /**
     * @type {Integer (Int32)}
     */
    static MPEG2_S_NEW_MODULE_VERSION => 262662

    /**
     * @type {Integer (Int32)}
     */
    static MPEG2_E_UNINITIALIZED => -2147220992

    /**
     * @type {Integer (Int32)}
     */
    static MPEG2_E_ALREADY_INITIALIZED => -2147220991

    /**
     * @type {Integer (Int32)}
     */
    static MPEG2_E_OUT_OF_BOUNDS => -2147220990

    /**
     * @type {Integer (Int32)}
     */
    static MPEG2_E_MALFORMED_TABLE => -2147220989

    /**
     * @type {Integer (Int32)}
     */
    static MPEG2_E_UNDEFINED => -2147220988

    /**
     * @type {Integer (Int32)}
     */
    static MPEG2_E_NOT_PRESENT => -2147220987

    /**
     * @type {Integer (Int32)}
     */
    static MPEG2_E_SECTION_NOT_FOUND => -2147220986

    /**
     * @type {Integer (Int32)}
     */
    static MPEG2_E_TX_STREAM_UNAVAILABLE => -2147220985

    /**
     * @type {Integer (Int32)}
     */
    static MPEG2_E_SERVICE_ID_NOT_FOUND => -2147220984

    /**
     * @type {Integer (Int32)}
     */
    static MPEG2_E_SERVICE_PMT_NOT_FOUND => -2147220983

    /**
     * @type {Integer (Int32)}
     */
    static MPEG2_E_DSI_NOT_FOUND => -2147220982

    /**
     * @type {Integer (Int32)}
     */
    static MPEG2_E_SERVER_UNAVAILABLE => -2147220981

    /**
     * @type {Integer (Int32)}
     */
    static MPEG2_E_INVALID_CAROUSEL_ID => -2147220980

    /**
     * @type {Integer (Int32)}
     */
    static MPEG2_E_MALFORMED_DSMCC_MESSAGE => -2147220979

    /**
     * @type {Integer (Int32)}
     */
    static MPEG2_E_INVALID_SG_OBJECT_KIND => -2147220978

    /**
     * @type {Integer (Int32)}
     */
    static MPEG2_E_OBJECT_NOT_FOUND => -2147220977

    /**
     * @type {Integer (Int32)}
     */
    static MPEG2_E_OBJECT_KIND_NOT_A_DIRECTORY => -2147220976

    /**
     * @type {Integer (Int32)}
     */
    static MPEG2_E_OBJECT_KIND_NOT_A_FILE => -2147220975

    /**
     * @type {Integer (Int32)}
     */
    static MPEG2_E_FILE_OFFSET_TOO_BIG => -2147220974

    /**
     * @type {Integer (Int32)}
     */
    static MPEG2_E_STREAM_STOPPED => -2147220973

    /**
     * @type {Integer (Int32)}
     */
    static MPEG2_E_REGISTRY_ACCESS_FAILED => -2147220972

    /**
     * @type {Integer (Int32)}
     */
    static MPEG2_E_INVALID_UDP_PORT => -2147220971

    /**
     * @type {Integer (Int32)}
     */
    static MPEG2_E_DATA_SOURCE_FAILED => -2147220970

    /**
     * @type {Integer (Int32)}
     */
    static MPEG2_E_DII_NOT_FOUND => -2147220969

    /**
     * @type {Integer (Int32)}
     */
    static MPEG2_E_DSHOW_PIN_NOT_FOUND => -2147220968

    /**
     * @type {Integer (Int32)}
     */
    static MPEG2_E_BUFFER_TOO_SMALL => -2147220967

    /**
     * @type {Integer (Int32)}
     */
    static MPEG2_E_MISSING_SECTIONS => -2147220966

    /**
     * @type {Integer (Int32)}
     */
    static MPEG2_E_TOO_MANY_SECTIONS => -2147220965

    /**
     * @type {Integer (Int32)}
     */
    static MPEG2_E_NEXT_TABLE_OPS_NOT_AVAILABLE => -2147220964

    /**
     * @type {Integer (Int32)}
     */
    static MPEG2_E_INCORRECT_DESCRIPTOR_TAG => -2147220963

    /**
     * @type {Integer (Int32)}
     */
    static MSDRI_S_MMI_PENDING => 2

    /**
     * @type {Integer (Int32)}
     */
    static MSDRI_S_PENDING => 1

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_FAILURE => -1073479679

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_NOT_IMPLEMENTED => -1073479678

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_NO_SUCH_COMMAND => -1073479677

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_OUT_OF_BOUNDS => -1073479676

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_INVALID_SCHEMA => -1073479675

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_INVALID_HANDLE => -1073479674

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_INVALID_TYPE => -1073479673

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_READ_ONLY => -1073479672

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_ACCESS_DENIED => -1073479671

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_NOT_FOUND => -1073479670

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_BUFFER_TOO_SMALL => -1073479669

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_OUT_OF_RESOURCES => -1073479668

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_OUT_OF_MEMORY => -1073479667

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_DISABLED => -1073479666

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_NO_HANDLER => -1073479665

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_INVALID_LANGUAGE => -1073479664

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_TIMEOUT_ELAPSED => -1073479663

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_NO_MORE_EVENTS => -1073475583

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_NO_MORE_DATA => -1073475582

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_TUNER_INITIALIZING => -1073467391

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_TUNER_REQUIRED => -1073467390

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_TUNER_CONFLICT => -1073467389

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_INVALID_TUNE_REQUEST => -1073467388

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_INVALID_ENTITLEMENT_TOKEN => -1073463295

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_INVALID_CAPTURE_TOKEN => -1073463294

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_WOULD_DISRUPT_STREAMING => -1073463293

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_INVALID_PURCHASE_TOKEN => -1073463292

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_IPNETWORK_ERROR => -1073459199

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_IPNETWORK_ADDRESS_NOT_FOUND => -1073459198

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_IPNETWORK_TIMEOUT => -1073459197

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_IPNETWORK_UNAVAILABLE => -1073459196

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_TUNE_FAILED_SDV01 => -1073455103

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_TUNE_FAILED_SDV02 => -1073455102

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_TUNE_FAILED_SDV03 => -1073455101

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_TUNE_FAILED_SDV04 => -1073455100

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_TUNE_FAILED_SDV05 => -1073455099

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_TUNE_FAILED_SDV06 => -1073455098

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_TUNE_FAILED_SDV07 => -1073455097

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_TUNE_FAILED_SDV08 => -1073455096

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_TUNE_FAILED_SDVFF => -1073454849

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_WMDRM_INVALID_SIGNATURE => -1073418239

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_WMDRM_INVALID_CERTIFICATE => -1073418238

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_WMDRM_INVALID_VERSION => -1073418236

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_WMDRM_INVALID_DATE => -1073418235

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_WMDRM_INVALID_PROXIMITY => -1073418234

    /**
     * @type {Integer (Int32)}
     */
    static BDA_E_WMDRM_KEY_ID_NOT_FOUND => -1073418232

    /**
     * @type {String}
     */
    static SPECIFYPAGES_STATISTICS => "{4c437b92-6e9e-11d1-a704-006097c4e476}"
;@endregion Constants

;@region Methods
    /**
     * The AMGetErrorText function retrieves the error message for a given return code, using the current language setting. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The errors.h header defines AMGetErrorText as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {HRESULT} hr <b>HRESULT</b> value.
     * @param {Pointer<Byte>} pbuffer Pointer to a character buffer that receives the error message.
     * @param {Integer} MaxLen Number of characters in <i>pBuffer</i>.
     * @returns {Integer} Returns the number of characters returned in the buffer, or zero if an error occurred.
     * @see https://learn.microsoft.com/windows/win32/api/errors/nf-errors-amgeterrortexta
     */
    static AMGetErrorTextA(hr, pbuffer, MaxLen) {
        pbuffer := pbuffer is String? StrPtr(pbuffer) : pbuffer

        result := DllCall("QUARTZ.dll\AMGetErrorTextA", "int", hr, "ptr", pbuffer, "uint", MaxLen, "uint")
        return result
    }

    /**
     * The AMGetErrorText function retrieves the error message for a given return code, using the current language setting. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The errors.h header defines AMGetErrorText as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {HRESULT} hr <b>HRESULT</b> value.
     * @param {Pointer<Char>} pbuffer Pointer to a character buffer that receives the error message.
     * @param {Integer} MaxLen Number of characters in <i>pBuffer</i>.
     * @returns {Integer} Returns the number of characters returned in the buffer, or zero if an error occurred.
     * @see https://learn.microsoft.com/windows/win32/api/errors/nf-errors-amgeterrortextw
     */
    static AMGetErrorTextW(hr, pbuffer, MaxLen) {
        pbuffer := pbuffer is String? StrPtr(pbuffer) : pbuffer

        result := DllCall("QUARTZ.dll\AMGetErrorTextW", "int", hr, "ptr", pbuffer, "uint", MaxLen, "uint")
        return result
    }

;@endregion Methods
}
