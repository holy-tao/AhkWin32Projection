#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\Foundation\HTASK.ahk
#Include .\HDRVR.ahk
#Include ..\..\Foundation\HMODULE.ahk
#Include .\HMMIO.ahk
#Include .\HIC.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\Graphics\Gdi\HPALETTE.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class Multimedia {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_START => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static MODM_USER => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static MIDM_USER => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static MODM_MAPPER => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static MIDM_MAPPER => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static MODM_INIT => 100

    /**
     * @type {Integer (UInt32)}
     */
    static MIDM_INIT => 100

    /**
     * @type {Integer (UInt32)}
     */
    static MODM_INIT_EX => 104

    /**
     * @type {Integer (UInt32)}
     */
    static MIDM_INIT_EX => 104

    /**
     * @type {Integer (UInt32)}
     */
    static DRV_MCI_FIRST => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static ACMDM_BASE => 24576

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_RESERVED => 20480

    /**
     * @type {Integer (Int32)}
     */
    static MCI_TEST => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_CAPTURE => 2160

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_MONITOR => 2161

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_RESERVE => 2162

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_SETAUDIO => 2163

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_SIGNAL => 2165

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_SETVIDEO => 2166

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_QUALITY => 2167

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_LIST => 2168

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_UNDO => 2169

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_CONFIGURE => 2170

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_RESTORE => 2171

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_ON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_OFF => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_DGV_FILE_MODE_SAVING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_DGV_FILE_MODE_LOADING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_DGV_FILE_MODE_EDITING => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_DGV_FILE_MODE_IDLE => 4

    /**
     * @type {Integer (Int32)}
     */
    static MCI_ON_S => 32768

    /**
     * @type {Integer (Int32)}
     */
    static MCI_OFF_S => 32769

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_FILE_S => 32770

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_INPUT_S => 32771

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_FILE_MODE_SAVING_S => 32772

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_FILE_MODE_LOADING_S => 32773

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_FILE_MODE_EDITING_S => 32774

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_FILE_MODE_IDLE_S => 32775

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETVIDEO_SRC_NTSC_S => 32784

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETVIDEO_SRC_RGB_S => 32785

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETVIDEO_SRC_SVIDEO_S => 32786

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETVIDEO_SRC_PAL_S => 32787

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETVIDEO_SRC_SECAM_S => 32788

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETVIDEO_SRC_GENERIC_S => 32789

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETAUDIO_SRC_LEFT_S => 32800

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETAUDIO_SRC_RIGHT_S => 32801

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETAUDIO_SRC_AVERAGE_S => 32802

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETAUDIO_SRC_STEREO_S => 32803

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_DGV_DEVICE_LIMIT => 512

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_DGV_IOERR => 513

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_DGV_WORKSPACE_EMPTY => 514

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_DGV_DISK_FULL => 515

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_DGV_DEVICE_MEMORY_FULL => 516

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_DGV_BAD_CLIPBOARD_RANGE => 517

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_METHOD_PRE => 40960

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_METHOD_POST => 40961

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_METHOD_DIRECT => 40962

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_FF_AVSS => 16384

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_FF_AVI => 16385

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_FF_DIB => 16386

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_FF_RDIB => 16387

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_FF_JPEG => 16388

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_FF_RJPEG => 16389

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_FF_JFIF => 16390

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_FF_MPEG => 16391

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_GETDEVCAPS_CAN_LOCK => 16384

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_GETDEVCAPS_CAN_STRETCH => 16385

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_GETDEVCAPS_CAN_FREEZE => 16386

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_GETDEVCAPS_MAX_WINDOWS => 16387

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_GETDEVCAPS_CAN_REVERSE => 16388

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_GETDEVCAPS_HAS_STILL => 16389

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_GETDEVCAPS_PALETTES => 16390

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_GETDEVCAPS_CAN_STR_IN => 16392

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_GETDEVCAPS_CAN_TEST => 16393

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_GETDEVCAPS_MAXIMUM_RATE => 16394

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_GETDEVCAPS_MINIMUM_RATE => 16395

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_CAPTURE_AS => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_CAPTURE_AT => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_COPY_AT => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_COPY_AUDIO_STREAM => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_COPY_VIDEO_STREAM => 262144

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_CUE_INPUT => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_CUE_OUTPUT => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_CUE_NOSHOW => 262144

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_CUT_AT => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_CUT_AUDIO_STREAM => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_CUT_VIDEO_STREAM => 262144

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_DELETE_AT => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_DELETE_AUDIO_STREAM => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_DELETE_VIDEO_STREAM => 262144

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_FREEZE_AT => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_FREEZE_OUTSIDE => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_INFO_TEXT => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_INFO_ITEM => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_INFO_VERSION => 1024

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_INFO_USAGE => 16384

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_INFO_AUDIO_QUALITY => 16385

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_INFO_STILL_QUALITY => 16386

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_INFO_VIDEO_QUALITY => 16387

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_INFO_AUDIO_ALG => 16388

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_INFO_STILL_ALG => 16389

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_INFO_VIDEO_ALG => 16390

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_LIST_ITEM => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_LIST_COUNT => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_LIST_NUMBER => 262144

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_LIST_ALG => 524288

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_LIST_AUDIO_ALG => 16384

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_LIST_AUDIO_QUALITY => 16385

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_LIST_AUDIO_STREAM => 16386

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_LIST_STILL_ALG => 16387

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_LIST_STILL_QUALITY => 16388

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_LIST_VIDEO_ALG => 16389

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_LIST_VIDEO_QUALITY => 16390

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_LIST_VIDEO_STREAM => 16391

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_LIST_VIDEO_SOURCE => 16392

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_MONITOR_METHOD => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_MONITOR_SOURCE => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_MONITOR_INPUT => 16384

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_MONITOR_FILE => 16385

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_OPEN_WS => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_OPEN_PARENT => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_OPEN_NOSTATIC => 262144

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_OPEN_16BIT => 524288

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_OPEN_32BIT => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_PASTE_AT => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_PASTE_AUDIO_STREAM => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_PASTE_VIDEO_STREAM => 262144

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_PASTE_INSERT => 524288

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_PASTE_OVERWRITE => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_PLAY_REPEAT => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_PLAY_REVERSE => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_RECT => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_PUT_SOURCE => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_PUT_DESTINATION => 262144

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_PUT_FRAME => 524288

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_PUT_VIDEO => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_PUT_WINDOW => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_PUT_CLIENT => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static MCI_QUALITY_ITEM => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_QUALITY_NAME => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_QUALITY_ALG => 262144

    /**
     * @type {Integer (Int32)}
     */
    static MCI_QUALITY_DIALOG => 524288

    /**
     * @type {Integer (Int32)}
     */
    static MCI_QUALITY_HANDLE => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static MCI_QUALITY_ITEM_AUDIO => 16384

    /**
     * @type {Integer (Int32)}
     */
    static MCI_QUALITY_ITEM_STILL => 16385

    /**
     * @type {Integer (Int32)}
     */
    static MCI_QUALITY_ITEM_VIDEO => 16386

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_REALIZE_NORM => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_REALIZE_BKGD => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_RECORD_HOLD => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_RECORD_AUDIO_STREAM => 262144

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_RECORD_VIDEO_STREAM => 524288

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_RESERVE_IN => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_RESERVE_SIZE => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_RESTORE_FROM => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_RESTORE_AT => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SAVE_ABORT => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SAVE_KEEPRESERVE => 262144

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SET_SEEK_EXACTLY => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SET_SPEED => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SET_STILL => 262144

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SET_FILEFORMAT => 524288

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETAUDIO_OVER => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETAUDIO_CLOCKTIME => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETAUDIO_ALG => 262144

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETAUDIO_QUALITY => 524288

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETAUDIO_RECORD => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETAUDIO_LEFT => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETAUDIO_RIGHT => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETAUDIO_ITEM => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETAUDIO_VALUE => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETAUDIO_INPUT => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETAUDIO_OUTPUT => 67108864

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETAUDIO_TREBLE => 16384

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETAUDIO_BASS => 16385

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETAUDIO_VOLUME => 16386

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETAUDIO_STREAM => 16387

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETAUDIO_SOURCE => 16388

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETAUDIO_SAMPLESPERSEC => 16389

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETAUDIO_AVGBYTESPERSEC => 16390

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETAUDIO_BLOCKALIGN => 16391

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETAUDIO_BITSPERSAMPLE => 16392

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETAUDIO_SOURCE_STEREO => 0

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETAUDIO_SOURCE_LEFT => 1

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETAUDIO_SOURCE_RIGHT => 2

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETAUDIO_SOURCE_AVERAGE => 16384

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETVIDEO_QUALITY => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETVIDEO_ALG => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETVIDEO_CLOCKTIME => 262144

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETVIDEO_SRC_NUMBER => 524288

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETVIDEO_ITEM => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETVIDEO_OVER => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETVIDEO_RECORD => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETVIDEO_STILL => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETVIDEO_VALUE => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETVIDEO_INPUT => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETVIDEO_OUTPUT => 67108864

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETVIDEO_SRC_NTSC => 16384

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETVIDEO_SRC_RGB => 16385

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETVIDEO_SRC_SVIDEO => 16386

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETVIDEO_SRC_PAL => 16387

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETVIDEO_SRC_SECAM => 16388

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETVIDEO_SRC_GENERIC => 16389

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETVIDEO_BRIGHTNESS => 16384

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETVIDEO_COLOR => 16385

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETVIDEO_CONTRAST => 16386

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETVIDEO_TINT => 16387

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETVIDEO_SHARPNESS => 16388

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETVIDEO_GAMMA => 16389

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETVIDEO_STREAM => 16390

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETVIDEO_PALHANDLE => 16391

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETVIDEO_FRAME_RATE => 16392

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETVIDEO_SOURCE => 16393

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETVIDEO_KEY_INDEX => 16394

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETVIDEO_KEY_COLOR => 16395

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SETVIDEO_BITSPERPEL => 16396

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SIGNAL_AT => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SIGNAL_EVERY => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SIGNAL_USERVAL => 262144

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SIGNAL_CANCEL => 524288

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_SIGNAL_POSITION => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_NOMINAL => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_REFERENCE => 262144

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_LEFT => 524288

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_RIGHT => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_DISKSPACE => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_INPUT => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_OUTPUT => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_RECORD => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_AUDIO_INPUT => 16384

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_HWND => 16385

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_SPEED => 16387

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_HPAL => 16388

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_BRIGHTNESS => 16389

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_COLOR => 16390

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_CONTRAST => 16391

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_FILEFORMAT => 16392

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_AUDIO_SOURCE => 16393

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_GAMMA => 16394

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_MONITOR => 16395

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_MONITOR_METHOD => 16396

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_FRAME_RATE => 16398

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_BASS => 16399

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_SIZE => 16400

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_SEEK_EXACTLY => 16401

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_SHARPNESS => 16402

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_SMPTE => 16403

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_AUDIO => 16404

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_TINT => 16405

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_TREBLE => 16406

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_UNSAVED => 16407

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_VIDEO => 16408

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_VOLUME => 16409

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_AUDIO_RECORD => 16410

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_VIDEO_SOURCE => 16411

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_VIDEO_RECORD => 16412

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_STILL_FILEFORMAT => 16413

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_VIDEO_SRC_NUM => 16414

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_FILE_MODE => 16415

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_FILE_COMPLETION => 16416

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_WINDOW_VISIBLE => 16417

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_WINDOW_MINIMIZED => 16418

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_WINDOW_MAXIMIZED => 16419

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_KEY_INDEX => 16420

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_KEY_COLOR => 16421

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_PAUSE_MODE => 16422

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_SAMPLESPERSEC => 16423

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_AVGBYTESPERSEC => 16424

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_BLOCKALIGN => 16425

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_BITSPERSAMPLE => 16426

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_BITSPERPEL => 16427

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_FORWARD => 16428

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_AUDIO_STREAM => 16429

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STATUS_VIDEO_STREAM => 16430

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STEP_REVERSE => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STEP_FRAMES => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_STOP_HOLD => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_UPDATE_HDC => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_UPDATE_PAINT => 262144

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_WHERE_SOURCE => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_WHERE_DESTINATION => 262144

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_WHERE_FRAME => 524288

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_WHERE_VIDEO => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_WHERE_WINDOW => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_WHERE_MAX => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_WINDOW_HWND => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_WINDOW_STATE => 262144

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_WINDOW_TEXT => 524288

    /**
     * @type {Integer (Int32)}
     */
    static MCI_DGV_WINDOW_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CREATIVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MEDIAVISION => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_FUJITSU => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_PRAGMATRAX => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CYRIX => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_PHILIPS_SPEECH_PROCESSING => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NETXL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ZYXEL => 9

    /**
     * @type {Integer (UInt32)}
     */
    static MM_BECUBED => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AARDVARK => 11

    /**
     * @type {Integer (UInt32)}
     */
    static MM_BINTEC => 12

    /**
     * @type {Integer (UInt32)}
     */
    static MM_HEWLETT_PACKARD => 13

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ACULAB => 14

    /**
     * @type {Integer (UInt32)}
     */
    static MM_FAITH => 15

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MITEL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MM_QUANTUM3D => 17

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SNI => 18

    /**
     * @type {Integer (UInt32)}
     */
    static MM_EMU => 19

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ARTISOFT => 20

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TURTLE_BEACH => 21

    /**
     * @type {Integer (UInt32)}
     */
    static MM_IBM => 22

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VOCALTEC => 23

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ROLAND => 24

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DSP_SOLUTIONS => 25

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NEC => 26

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ATI => 27

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WANGLABS => 28

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TANDY => 29

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VOYETRA => 30

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ANTEX => 31

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ICL_PS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MM_INTEL => 33

    /**
     * @type {Integer (UInt32)}
     */
    static MM_GRAVIS => 34

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VAL => 35

    /**
     * @type {Integer (UInt32)}
     */
    static MM_INTERACTIVE => 36

    /**
     * @type {Integer (UInt32)}
     */
    static MM_YAMAHA => 37

    /**
     * @type {Integer (UInt32)}
     */
    static MM_EVEREX => 38

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ECHO => 39

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SIERRA => 40

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CAT => 41

    /**
     * @type {Integer (UInt32)}
     */
    static MM_APPS => 42

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DSP_GROUP => 43

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MELABS => 44

    /**
     * @type {Integer (UInt32)}
     */
    static MM_COMPUTER_FRIENDS => 45

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ESS => 46

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AUDIOFILE => 47

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTOROLA => 48

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CANOPUS => 49

    /**
     * @type {Integer (UInt32)}
     */
    static MM_EPSON => 50

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TRUEVISION => 51

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AZTECH => 52

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VIDEOLOGIC => 53

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SCALACS => 54

    /**
     * @type {Integer (UInt32)}
     */
    static MM_KORG => 55

    /**
     * @type {Integer (UInt32)}
     */
    static MM_APT => 56

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ICS => 57

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ITERATEDSYS => 58

    /**
     * @type {Integer (UInt32)}
     */
    static MM_METHEUS => 59

    /**
     * @type {Integer (UInt32)}
     */
    static MM_LOGITECH => 60

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WINNOV => 61

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NCR => 62

    /**
     * @type {Integer (UInt32)}
     */
    static MM_EXAN => 63

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AST => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WILLOWPOND => 65

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SONICFOUNDRY => 66

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VITEC => 67

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOSCOM => 68

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SILICONSOFT => 69

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TERRATEC => 70

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MEDIASONIC => 71

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SANYO => 72

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SUPERMAC => 73

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AUDIOPT => 74

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NOGATECH => 75

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SPEECHCOMP => 76

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AHEAD => 77

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DOLBY => 78

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OKI => 79

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AURAVISION => 80

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OLIVETTI => 81

    /**
     * @type {Integer (UInt32)}
     */
    static MM_IOMAGIC => 82

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MATSUSHITA => 83

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CONTROLRES => 84

    /**
     * @type {Integer (UInt32)}
     */
    static MM_XEBEC => 85

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NEWMEDIA => 86

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NMS => 87

    /**
     * @type {Integer (UInt32)}
     */
    static MM_LYRRUS => 88

    /**
     * @type {Integer (UInt32)}
     */
    static MM_COMPUSIC => 89

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OPTI => 90

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ADLACC => 91

    /**
     * @type {Integer (UInt32)}
     */
    static MM_COMPAQ => 92

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DIALOGIC => 93

    /**
     * @type {Integer (UInt32)}
     */
    static MM_INSOFT => 94

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MPTUS => 95

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WEITEK => 96

    /**
     * @type {Integer (UInt32)}
     */
    static MM_LERNOUT_AND_HAUSPIE => 97

    /**
     * @type {Integer (UInt32)}
     */
    static MM_QCIAR => 98

    /**
     * @type {Integer (UInt32)}
     */
    static MM_APPLE => 99

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DIGITAL => 100

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU => 101

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WORKBIT => 102

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OSITECH => 103

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MIRO => 104

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CIRRUSLOGIC => 105

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ISOLUTION => 106

    /**
     * @type {Integer (UInt32)}
     */
    static MM_HORIZONS => 107

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CONCEPTS => 108

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VTG => 109

    /**
     * @type {Integer (UInt32)}
     */
    static MM_RADIUS => 110

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ROCKWELL => 111

    /**
     * @type {Integer (UInt32)}
     */
    static MM_XYZ => 112

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OPCODE => 113

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VOXWARE => 114

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NORTHERN_TELECOM => 115

    /**
     * @type {Integer (UInt32)}
     */
    static MM_APICOM => 116

    /**
     * @type {Integer (UInt32)}
     */
    static MM_GRANDE => 117

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ADDX => 118

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WILDCAT => 119

    /**
     * @type {Integer (UInt32)}
     */
    static MM_RHETOREX => 120

    /**
     * @type {Integer (UInt32)}
     */
    static MM_BROOKTREE => 121

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ENSONIQ => 125

    /**
     * @type {Integer (UInt32)}
     */
    static MM_FAST => 126

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NVIDIA => 127

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OKSORI => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DIACOUSTICS => 129

    /**
     * @type {Integer (UInt32)}
     */
    static MM_GULBRANSEN => 130

    /**
     * @type {Integer (UInt32)}
     */
    static MM_KAY_ELEMETRICS => 131

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CRYSTAL => 132

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SPLASH_STUDIOS => 133

    /**
     * @type {Integer (UInt32)}
     */
    static MM_QUARTERDECK => 134

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TDK => 135

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DIGITAL_AUDIO_LABS => 136

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SEERSYS => 137

    /**
     * @type {Integer (UInt32)}
     */
    static MM_PICTURETEL => 138

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ATT_MICROELECTRONICS => 139

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OSPREY => 140

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MEDIATRIX => 141

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SOUNDESIGNS => 142

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ALDIGITAL => 143

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SPECTRUM_SIGNAL_PROCESSING => 144

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ECS => 145

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AMD => 146

    /**
     * @type {Integer (UInt32)}
     */
    static MM_COREDYNAMICS => 147

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CANAM => 148

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SOFTSOUND => 149

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NORRIS => 150

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DDD => 151

    /**
     * @type {Integer (UInt32)}
     */
    static MM_EUPHONICS => 152

    /**
     * @type {Integer (UInt32)}
     */
    static MM_PRECEPT => 153

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CRYSTAL_NET => 154

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CHROMATIC => 155

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VOICEINFO => 156

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VIENNASYS => 157

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CONNECTIX => 158

    /**
     * @type {Integer (UInt32)}
     */
    static MM_GADGETLABS => 159

    /**
     * @type {Integer (UInt32)}
     */
    static MM_FRONTIER => 160

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VIONA => 161

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CASIO => 162

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DIAMONDMM => 163

    /**
     * @type {Integer (UInt32)}
     */
    static MM_S3 => 164

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DVISION => 165

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NETSCAPE => 166

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SOUNDSPACE => 167

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VANKOEVERING => 168

    /**
     * @type {Integer (UInt32)}
     */
    static MM_QTEAM => 169

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ZEFIRO => 170

    /**
     * @type {Integer (UInt32)}
     */
    static MM_STUDER => 171

    /**
     * @type {Integer (UInt32)}
     */
    static MM_FRAUNHOFER_IIS => 172

    /**
     * @type {Integer (UInt32)}
     */
    static MM_QUICKNET => 173

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ALARIS => 174

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SICRESOURCE => 175

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NEOMAGIC => 176

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MERGING_TECHNOLOGIES => 177

    /**
     * @type {Integer (UInt32)}
     */
    static MM_XIRLINK => 178

    /**
     * @type {Integer (UInt32)}
     */
    static MM_COLORGRAPH => 179

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OTI => 180

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AUREAL => 181

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VIVO => 182

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SHARP => 183

    /**
     * @type {Integer (UInt32)}
     */
    static MM_LUCENT => 184

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ATT => 185

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SUNCOM => 186

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SORVIS => 187

    /**
     * @type {Integer (UInt32)}
     */
    static MM_INVISION => 188

    /**
     * @type {Integer (UInt32)}
     */
    static MM_BERKOM => 189

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MARIAN => 190

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DPSINC => 191

    /**
     * @type {Integer (UInt32)}
     */
    static MM_BCB => 192

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTIONPIXELS => 193

    /**
     * @type {Integer (UInt32)}
     */
    static MM_QDESIGN => 194

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NMP => 195

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DATAFUSION => 196

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DUCK => 197

    /**
     * @type {Integer (UInt32)}
     */
    static MM_FTR => 198

    /**
     * @type {Integer (UInt32)}
     */
    static MM_BERCOS => 199

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ONLIVE => 200

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SIEMENS_SBC => 201

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TERALOGIC => 202

    /**
     * @type {Integer (UInt32)}
     */
    static MM_PHONET => 203

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WINBOND => 204

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VIRTUALMUSIC => 205

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ENET => 206

    /**
     * @type {Integer (UInt32)}
     */
    static MM_GUILLEMOT => 207

    /**
     * @type {Integer (UInt32)}
     */
    static MM_EMAGIC => 208

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MWM => 209

    /**
     * @type {Integer (UInt32)}
     */
    static MM_PACIFICRESEARCH => 210

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SIPROLAB => 211

    /**
     * @type {Integer (UInt32)}
     */
    static MM_LYNX => 212

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SPECTRUM_PRODUCTIONS => 213

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DICTAPHONE => 214

    /**
     * @type {Integer (UInt32)}
     */
    static MM_QUALCOMM => 215

    /**
     * @type {Integer (UInt32)}
     */
    static MM_RZS => 216

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AUDIOSCIENCE => 217

    /**
     * @type {Integer (UInt32)}
     */
    static MM_PINNACLE => 218

    /**
     * @type {Integer (UInt32)}
     */
    static MM_EES => 219

    /**
     * @type {Integer (UInt32)}
     */
    static MM_HAFTMANN => 220

    /**
     * @type {Integer (UInt32)}
     */
    static MM_LUCID => 221

    /**
     * @type {Integer (UInt32)}
     */
    static MM_HEADSPACE => 222

    /**
     * @type {Integer (UInt32)}
     */
    static MM_UNISYS => 223

    /**
     * @type {Integer (UInt32)}
     */
    static MM_LUMINOSITI => 224

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ACTIVEVOICE => 225

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DTS => 226

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DIGIGRAM => 227

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SOFTLAB_NSK => 228

    /**
     * @type {Integer (UInt32)}
     */
    static MM_FORTEMEDIA => 229

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SONORUS => 230

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ARRAY => 231

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DATARAN => 232

    /**
     * @type {Integer (UInt32)}
     */
    static MM_I_LINK => 233

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SELSIUS_SYSTEMS => 234

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ADMOS => 235

    /**
     * @type {Integer (UInt32)}
     */
    static MM_LEXICON => 236

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SGI => 237

    /**
     * @type {Integer (UInt32)}
     */
    static MM_IPI => 238

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ICE => 239

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VQST => 240

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ETEK => 241

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CS => 242

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ALESIS => 243

    /**
     * @type {Integer (UInt32)}
     */
    static MM_INTERNET => 244

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SONY => 245

    /**
     * @type {Integer (UInt32)}
     */
    static MM_HYPERACTIVE => 246

    /**
     * @type {Integer (UInt32)}
     */
    static MM_UHER_INFORMATIC => 247

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SYDEC_NV => 248

    /**
     * @type {Integer (UInt32)}
     */
    static MM_FLEXION => 249

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VIA => 250

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MICRONAS => 251

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ANALOGDEVICES => 252

    /**
     * @type {Integer (UInt32)}
     */
    static MM_HP => 253

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MATROX_DIV => 254

    /**
     * @type {Integer (UInt32)}
     */
    static MM_QUICKAUDIO => 255

    /**
     * @type {Integer (UInt32)}
     */
    static MM_YOUCOM => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MM_RICHMOND => 257

    /**
     * @type {Integer (UInt32)}
     */
    static MM_IODD => 258

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ICCC => 259

    /**
     * @type {Integer (UInt32)}
     */
    static MM_3COM => 260

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MALDEN => 261

    /**
     * @type {Integer (UInt32)}
     */
    static MM_3DFX => 262

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MINDMAKER => 263

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TELEKOL => 264

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ST_MICROELECTRONICS => 265

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ALGOVISION => 266

    /**
     * @type {Integer (UInt32)}
     */
    static MM_UNMAPPED => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static MM_PID_UNMAPPED => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static MM_PCSPEAKER_WAVEOUT => 13

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_WSS_WAVEIN => 14

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_WSS_WAVEOUT => 15

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_WSS_FMSYNTH_STEREO => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_WSS_MIXER => 17

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_WSS_OEM_WAVEIN => 18

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_WSS_OEM_WAVEOUT => 19

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_WSS_OEM_FMSYNTH_STEREO => 20

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_WSS_AUX => 21

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_WSS_OEM_AUX => 22

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_GENERIC_WAVEIN => 23

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_GENERIC_WAVEOUT => 24

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_GENERIC_MIDIIN => 25

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_GENERIC_MIDIOUT => 26

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_GENERIC_MIDISYNTH => 27

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_GENERIC_AUX_LINE => 28

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_GENERIC_AUX_MIC => 29

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_GENERIC_AUX_CD => 30

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_WSS_OEM_MIXER => 31

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_MSACM => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_ACM_MSADPCM => 33

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_ACM_IMAADPCM => 34

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_ACM_MSFILTER => 35

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_ACM_GSM610 => 36

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_ACM_G711 => 37

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_ACM_PCM => 38

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WSS_SB16_WAVEIN => 39

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WSS_SB16_WAVEOUT => 40

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WSS_SB16_MIDIIN => 41

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WSS_SB16_MIDIOUT => 42

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WSS_SB16_SYNTH => 43

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WSS_SB16_AUX_LINE => 44

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WSS_SB16_AUX_CD => 45

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WSS_SB16_MIXER => 46

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WSS_SBPRO_WAVEIN => 47

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WSS_SBPRO_WAVEOUT => 48

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WSS_SBPRO_MIDIIN => 49

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WSS_SBPRO_MIDIOUT => 50

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WSS_SBPRO_SYNTH => 51

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WSS_SBPRO_AUX_LINE => 52

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WSS_SBPRO_AUX_CD => 53

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WSS_SBPRO_MIXER => 54

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_WSS_NT_WAVEIN => 55

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_WSS_NT_WAVEOUT => 56

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_WSS_NT_FMSYNTH_STEREO => 57

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_WSS_NT_MIXER => 58

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_WSS_NT_AUX => 59

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_SB16_WAVEIN => 60

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_SB16_WAVEOUT => 61

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_SB16_MIDIIN => 62

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_SB16_MIDIOUT => 63

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_SB16_SYNTH => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_SB16_AUX_LINE => 65

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_SB16_AUX_CD => 66

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_SB16_MIXER => 67

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_SBPRO_WAVEIN => 68

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_SBPRO_WAVEOUT => 69

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_SBPRO_MIDIIN => 70

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_SBPRO_MIDIOUT => 71

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_SBPRO_SYNTH => 72

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_SBPRO_AUX_LINE => 73

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_SBPRO_AUX_CD => 74

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_SBPRO_MIXER => 75

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_MSOPL_SYNTH => 76

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_VMDMS_LINE_WAVEIN => 80

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_VMDMS_LINE_WAVEOUT => 81

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_VMDMS_HANDSET_WAVEIN => 82

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_VMDMS_HANDSET_WAVEOUT => 83

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_VMDMW_LINE_WAVEIN => 84

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_VMDMW_LINE_WAVEOUT => 85

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_VMDMW_HANDSET_WAVEIN => 86

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_VMDMW_HANDSET_WAVEOUT => 87

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_VMDMW_MIXER => 88

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_VMDM_GAME_WAVEOUT => 89

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_VMDM_GAME_WAVEIN => 90

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_ACM_MSNAUDIO => 91

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_ACM_MSG723 => 92

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_ACM_MSRT24 => 93

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_WDMAUDIO_WAVEOUT => 100

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_WDMAUDIO_WAVEIN => 101

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_WDMAUDIO_MIDIOUT => 102

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_WDMAUDIO_MIDIIN => 103

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_WDMAUDIO_MIXER => 104

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_WDMAUDIO_AUX => 105

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CREATIVE_SB15_WAVEIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CREATIVE_SB20_WAVEIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CREATIVE_SBPRO_WAVEIN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CREATIVE_SBP16_WAVEIN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CREATIVE_PHNBLST_WAVEIN => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CREATIVE_SB15_WAVEOUT => 101

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CREATIVE_SB20_WAVEOUT => 102

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CREATIVE_SBPRO_WAVEOUT => 103

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CREATIVE_SBP16_WAVEOUT => 104

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CREATIVE_PHNBLST_WAVEOUT => 105

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CREATIVE_MIDIOUT => 201

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CREATIVE_MIDIIN => 202

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CREATIVE_FMSYNTH_MONO => 301

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CREATIVE_FMSYNTH_STEREO => 302

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CREATIVE_MIDI_AWE32 => 303

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CREATIVE_AUX_CD => 401

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CREATIVE_AUX_LINE => 402

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CREATIVE_AUX_MIC => 403

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CREATIVE_AUX_MASTER => 404

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CREATIVE_AUX_PCSPK => 405

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CREATIVE_AUX_WAVE => 406

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CREATIVE_AUX_MIDI => 407

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CREATIVE_SBPRO_MIXER => 408

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CREATIVE_SB16_MIXER => 409

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MEDIAVISION_PROAUDIO => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MM_PROAUD_MIDIOUT => 17

    /**
     * @type {Integer (UInt32)}
     */
    static MM_PROAUD_MIDIIN => 18

    /**
     * @type {Integer (UInt32)}
     */
    static MM_PROAUD_SYNTH => 19

    /**
     * @type {Integer (UInt32)}
     */
    static MM_PROAUD_WAVEOUT => 20

    /**
     * @type {Integer (UInt32)}
     */
    static MM_PROAUD_WAVEIN => 21

    /**
     * @type {Integer (UInt32)}
     */
    static MM_PROAUD_MIXER => 22

    /**
     * @type {Integer (UInt32)}
     */
    static MM_PROAUD_AUX => 23

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MEDIAVISION_THUNDER => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MM_THUNDER_SYNTH => 35

    /**
     * @type {Integer (UInt32)}
     */
    static MM_THUNDER_WAVEOUT => 36

    /**
     * @type {Integer (UInt32)}
     */
    static MM_THUNDER_WAVEIN => 37

    /**
     * @type {Integer (UInt32)}
     */
    static MM_THUNDER_AUX => 39

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MEDIAVISION_TPORT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TPORT_WAVEOUT => 65

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TPORT_WAVEIN => 66

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TPORT_SYNTH => 67

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MEDIAVISION_PROAUDIO_PLUS => 80

    /**
     * @type {Integer (UInt32)}
     */
    static MM_PROAUD_PLUS_MIDIOUT => 81

    /**
     * @type {Integer (UInt32)}
     */
    static MM_PROAUD_PLUS_MIDIIN => 82

    /**
     * @type {Integer (UInt32)}
     */
    static MM_PROAUD_PLUS_SYNTH => 83

    /**
     * @type {Integer (UInt32)}
     */
    static MM_PROAUD_PLUS_WAVEOUT => 84

    /**
     * @type {Integer (UInt32)}
     */
    static MM_PROAUD_PLUS_WAVEIN => 85

    /**
     * @type {Integer (UInt32)}
     */
    static MM_PROAUD_PLUS_MIXER => 86

    /**
     * @type {Integer (UInt32)}
     */
    static MM_PROAUD_PLUS_AUX => 87

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MEDIAVISION_PROAUDIO_16 => 96

    /**
     * @type {Integer (UInt32)}
     */
    static MM_PROAUD_16_MIDIOUT => 97

    /**
     * @type {Integer (UInt32)}
     */
    static MM_PROAUD_16_MIDIIN => 98

    /**
     * @type {Integer (UInt32)}
     */
    static MM_PROAUD_16_SYNTH => 99

    /**
     * @type {Integer (UInt32)}
     */
    static MM_PROAUD_16_WAVEOUT => 100

    /**
     * @type {Integer (UInt32)}
     */
    static MM_PROAUD_16_WAVEIN => 101

    /**
     * @type {Integer (UInt32)}
     */
    static MM_PROAUD_16_MIXER => 102

    /**
     * @type {Integer (UInt32)}
     */
    static MM_PROAUD_16_AUX => 103

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MEDIAVISION_PROSTUDIO_16 => 96

    /**
     * @type {Integer (UInt32)}
     */
    static MM_STUDIO_16_MIDIOUT => 97

    /**
     * @type {Integer (UInt32)}
     */
    static MM_STUDIO_16_MIDIIN => 98

    /**
     * @type {Integer (UInt32)}
     */
    static MM_STUDIO_16_SYNTH => 99

    /**
     * @type {Integer (UInt32)}
     */
    static MM_STUDIO_16_WAVEOUT => 100

    /**
     * @type {Integer (UInt32)}
     */
    static MM_STUDIO_16_WAVEIN => 101

    /**
     * @type {Integer (UInt32)}
     */
    static MM_STUDIO_16_MIXER => 102

    /**
     * @type {Integer (UInt32)}
     */
    static MM_STUDIO_16_AUX => 103

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MEDIAVISION_CDPC => 112

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CDPC_MIDIOUT => 113

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CDPC_MIDIIN => 114

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CDPC_SYNTH => 115

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CDPC_WAVEOUT => 116

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CDPC_WAVEIN => 117

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CDPC_MIXER => 118

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CDPC_AUX => 119

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MEDIAVISION_OPUS1208 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OPUS401_MIDIOUT => 129

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OPUS401_MIDIIN => 130

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OPUS1208_SYNTH => 131

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OPUS1208_WAVEOUT => 132

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OPUS1208_WAVEIN => 133

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OPUS1208_MIXER => 134

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OPUS1208_AUX => 135

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MEDIAVISION_OPUS1216 => 144

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OPUS1216_MIDIOUT => 145

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OPUS1216_MIDIIN => 146

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OPUS1216_SYNTH => 147

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OPUS1216_WAVEOUT => 148

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OPUS1216_WAVEIN => 149

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OPUS1216_MIXER => 150

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OPUS1216_AUX => 151

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CYRIX_XASYNTH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CYRIX_XAMIDIIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CYRIX_XAMIDIOUT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CYRIX_XAWAVEIN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CYRIX_XAWAVEOUT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CYRIX_XAAUX => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CYRIX_XAMIXER => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MM_PHILIPS_ACM_LPCBB => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NETXL_XLVIDEO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ZYXEL_ACM_ADPCM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AARDVARK_STUDIO12_WAVEOUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AARDVARK_STUDIO12_WAVEIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AARDVARK_STUDIO88_WAVEOUT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AARDVARK_STUDIO88_WAVEIN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_BINTEC_TAPI_WAVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_HEWLETT_PACKARD_CU_CODEC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MITEL_TALKTO_LINE_WAVEOUT => 100

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MITEL_TALKTO_LINE_WAVEIN => 101

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MITEL_TALKTO_HANDSET_WAVEOUT => 102

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MITEL_TALKTO_HANDSET_WAVEIN => 103

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MITEL_TALKTO_BRIDGED_WAVEOUT => 104

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MITEL_TALKTO_BRIDGED_WAVEIN => 105

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MITEL_MPA_HANDSET_WAVEOUT => 200

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MITEL_MPA_HANDSET_WAVEIN => 201

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MITEL_MPA_HANDSFREE_WAVEOUT => 202

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MITEL_MPA_HANDSFREE_WAVEIN => 203

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MITEL_MPA_LINE1_WAVEOUT => 204

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MITEL_MPA_LINE1_WAVEIN => 205

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MITEL_MPA_LINE2_WAVEOUT => 206

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MITEL_MPA_LINE2_WAVEIN => 207

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MITEL_MEDIAPATH_WAVEOUT => 300

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MITEL_MEDIAPATH_WAVEIN => 301

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SNI_ACM_G721 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_EMU_APSSYNTH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_EMU_APSMIDIIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_EMU_APSMIDIOUT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_EMU_APSWAVEIN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_EMU_APSWAVEOUT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ARTISOFT_SBWAVEIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ARTISOFT_SBWAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TBS_TROPEZ_WAVEIN => 37

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TBS_TROPEZ_WAVEOUT => 38

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TBS_TROPEZ_AUX1 => 39

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TBS_TROPEZ_AUX2 => 40

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TBS_TROPEZ_LINE => 41

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MMOTION_WAVEAUX => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MMOTION_WAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MMOTION_WAVEIN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_IBM_PCMCIA_WAVEIN => 11

    /**
     * @type {Integer (UInt32)}
     */
    static MM_IBM_PCMCIA_WAVEOUT => 12

    /**
     * @type {Integer (UInt32)}
     */
    static MM_IBM_PCMCIA_SYNTH => 13

    /**
     * @type {Integer (UInt32)}
     */
    static MM_IBM_PCMCIA_MIDIIN => 14

    /**
     * @type {Integer (UInt32)}
     */
    static MM_IBM_PCMCIA_MIDIOUT => 15

    /**
     * @type {Integer (UInt32)}
     */
    static MM_IBM_PCMCIA_AUX => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MM_IBM_THINKPAD200 => 17

    /**
     * @type {Integer (UInt32)}
     */
    static MM_IBM_MWAVE_WAVEIN => 18

    /**
     * @type {Integer (UInt32)}
     */
    static MM_IBM_MWAVE_WAVEOUT => 19

    /**
     * @type {Integer (UInt32)}
     */
    static MM_IBM_MWAVE_MIXER => 20

    /**
     * @type {Integer (UInt32)}
     */
    static MM_IBM_MWAVE_MIDIIN => 21

    /**
     * @type {Integer (UInt32)}
     */
    static MM_IBM_MWAVE_MIDIOUT => 22

    /**
     * @type {Integer (UInt32)}
     */
    static MM_IBM_MWAVE_AUX => 23

    /**
     * @type {Integer (UInt32)}
     */
    static MM_IBM_WC_MIDIOUT => 30

    /**
     * @type {Integer (UInt32)}
     */
    static MM_IBM_WC_WAVEOUT => 31

    /**
     * @type {Integer (UInt32)}
     */
    static MM_IBM_WC_MIXEROUT => 33

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VOCALTEC_WAVEOUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VOCALTEC_WAVEIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ROLAND_RAP10_MIDIOUT => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ROLAND_RAP10_MIDIIN => 11

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ROLAND_RAP10_SYNTH => 12

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ROLAND_RAP10_WAVEOUT => 13

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ROLAND_RAP10_WAVEIN => 14

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ROLAND_MPU401_MIDIOUT => 15

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ROLAND_MPU401_MIDIIN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ROLAND_SMPU_MIDIOUTA => 17

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ROLAND_SMPU_MIDIOUTB => 18

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ROLAND_SMPU_MIDIINA => 19

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ROLAND_SMPU_MIDIINB => 20

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ROLAND_SC7_MIDIOUT => 21

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ROLAND_SC7_MIDIIN => 22

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ROLAND_SERIAL_MIDIOUT => 23

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ROLAND_SERIAL_MIDIIN => 24

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ROLAND_SCP_MIDIOUT => 38

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ROLAND_SCP_MIDIIN => 39

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ROLAND_SCP_WAVEOUT => 40

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ROLAND_SCP_WAVEIN => 41

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ROLAND_SCP_MIXER => 42

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ROLAND_SCP_AUX => 48

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DSP_SOLUTIONS_WAVEOUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DSP_SOLUTIONS_WAVEIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DSP_SOLUTIONS_SYNTH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DSP_SOLUTIONS_AUX => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NEC_73_86_SYNTH => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NEC_73_86_WAVEOUT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NEC_73_86_WAVEIN => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NEC_26_SYNTH => 9

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NEC_MPU401_MIDIOUT => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NEC_MPU401_MIDIIN => 11

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NEC_JOYSTICK => 12

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WANGLABS_WAVEIN1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WANGLABS_WAVEOUT1 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TANDY_VISWAVEIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TANDY_VISWAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TANDY_VISBIOSSYNTH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TANDY_SENS_MMAWAVEIN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TANDY_SENS_MMAWAVEOUT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TANDY_SENS_MMAMIDIIN => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TANDY_SENS_MMAMIDIOUT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TANDY_SENS_VISWAVEOUT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TANDY_PSSJWAVEIN => 9

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TANDY_PSSJWAVEOUT => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ANTEX_SX12_WAVEIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ANTEX_SX12_WAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ANTEX_SX15_WAVEIN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ANTEX_SX15_WAVEOUT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ANTEX_VP625_WAVEIN => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ANTEX_VP625_WAVEOUT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ANTEX_AUDIOPORT22_WAVEIN => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ANTEX_AUDIOPORT22_WAVEOUT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ANTEX_AUDIOPORT22_FEEDTHRU => 9

    /**
     * @type {Integer (UInt32)}
     */
    static MM_INTELOPD_WAVEIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_INTELOPD_WAVEOUT => 101

    /**
     * @type {Integer (UInt32)}
     */
    static MM_INTELOPD_AUX => 401

    /**
     * @type {Integer (UInt32)}
     */
    static MM_INTEL_NSPMODEMLINEIN => 501

    /**
     * @type {Integer (UInt32)}
     */
    static MM_INTEL_NSPMODEMLINEOUT => 502

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VAL_MICROKEY_AP_WAVEIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VAL_MICROKEY_AP_WAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_INTERACTIVE_WAVEIN => 69

    /**
     * @type {Integer (UInt32)}
     */
    static MM_INTERACTIVE_WAVEOUT => 69

    /**
     * @type {Integer (UInt32)}
     */
    static MM_YAMAHA_GSS_SYNTH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_YAMAHA_GSS_WAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_YAMAHA_GSS_WAVEIN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_YAMAHA_GSS_MIDIOUT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_YAMAHA_GSS_MIDIIN => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_YAMAHA_GSS_AUX => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_YAMAHA_SERIAL_MIDIOUT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MM_YAMAHA_SERIAL_MIDIIN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MM_YAMAHA_OPL3SA_WAVEOUT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MM_YAMAHA_OPL3SA_WAVEIN => 17

    /**
     * @type {Integer (UInt32)}
     */
    static MM_YAMAHA_OPL3SA_FMSYNTH => 18

    /**
     * @type {Integer (UInt32)}
     */
    static MM_YAMAHA_OPL3SA_YSYNTH => 19

    /**
     * @type {Integer (UInt32)}
     */
    static MM_YAMAHA_OPL3SA_MIDIOUT => 20

    /**
     * @type {Integer (UInt32)}
     */
    static MM_YAMAHA_OPL3SA_MIDIIN => 21

    /**
     * @type {Integer (UInt32)}
     */
    static MM_YAMAHA_OPL3SA_MIXER => 23

    /**
     * @type {Integer (UInt32)}
     */
    static MM_YAMAHA_OPL3SA_JOYSTICK => 24

    /**
     * @type {Integer (UInt32)}
     */
    static MM_YAMAHA_YMF724LEG_MIDIOUT => 25

    /**
     * @type {Integer (UInt32)}
     */
    static MM_YAMAHA_YMF724LEG_MIDIIN => 26

    /**
     * @type {Integer (UInt32)}
     */
    static MM_YAMAHA_YMF724_WAVEOUT => 27

    /**
     * @type {Integer (UInt32)}
     */
    static MM_YAMAHA_YMF724_WAVEIN => 28

    /**
     * @type {Integer (UInt32)}
     */
    static MM_YAMAHA_YMF724_MIDIOUT => 29

    /**
     * @type {Integer (UInt32)}
     */
    static MM_YAMAHA_YMF724_AUX => 30

    /**
     * @type {Integer (UInt32)}
     */
    static MM_YAMAHA_YMF724_MIXER => 31

    /**
     * @type {Integer (UInt32)}
     */
    static MM_YAMAHA_YMF724LEG_FMSYNTH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MM_YAMAHA_YMF724LEG_MIXER => 33

    /**
     * @type {Integer (UInt32)}
     */
    static MM_YAMAHA_SXG_MIDIOUT => 34

    /**
     * @type {Integer (UInt32)}
     */
    static MM_YAMAHA_SXG_WAVEOUT => 35

    /**
     * @type {Integer (UInt32)}
     */
    static MM_YAMAHA_SXG_MIXER => 36

    /**
     * @type {Integer (UInt32)}
     */
    static MM_YAMAHA_ACXG_WAVEIN => 37

    /**
     * @type {Integer (UInt32)}
     */
    static MM_YAMAHA_ACXG_WAVEOUT => 38

    /**
     * @type {Integer (UInt32)}
     */
    static MM_YAMAHA_ACXG_MIDIOUT => 39

    /**
     * @type {Integer (UInt32)}
     */
    static MM_YAMAHA_ACXG_MIXER => 40

    /**
     * @type {Integer (UInt32)}
     */
    static MM_YAMAHA_ACXG_AUX => 41

    /**
     * @type {Integer (UInt32)}
     */
    static MM_EVEREX_CARRIER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ECHO_SYNTH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ECHO_WAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ECHO_WAVEIN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ECHO_MIDIOUT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ECHO_MIDIIN => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ECHO_AUX => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SIERRA_ARIA_MIDIOUT => 20

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SIERRA_ARIA_MIDIIN => 21

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SIERRA_ARIA_SYNTH => 22

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SIERRA_ARIA_WAVEOUT => 23

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SIERRA_ARIA_WAVEIN => 24

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SIERRA_ARIA_AUX => 25

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SIERRA_ARIA_AUX2 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SIERRA_QUARTET_WAVEIN => 80

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SIERRA_QUARTET_WAVEOUT => 81

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SIERRA_QUARTET_MIDIIN => 82

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SIERRA_QUARTET_MIDIOUT => 83

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SIERRA_QUARTET_SYNTH => 84

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SIERRA_QUARTET_AUX_CD => 85

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SIERRA_QUARTET_AUX_LINE => 86

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SIERRA_QUARTET_AUX_MODEM => 87

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SIERRA_QUARTET_MIXER => 88

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CAT_WAVEOUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DSP_GROUP_TRUESPEECH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MELABS_MIDI2GO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ESS_AMWAVEOUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ESS_AMWAVEIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ESS_AMAUX => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ESS_AMSYNTH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ESS_AMMIDIOUT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ESS_AMMIDIIN => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ESS_MIXER => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ESS_AUX_CD => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ESS_MPU401_MIDIOUT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ESS_MPU401_MIDIIN => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ESS_ES488_WAVEOUT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ESS_ES488_WAVEIN => 17

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ESS_ES488_MIXER => 18

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ESS_ES688_WAVEOUT => 19

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ESS_ES688_WAVEIN => 20

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ESS_ES688_MIXER => 21

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ESS_ES1488_WAVEOUT => 22

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ESS_ES1488_WAVEIN => 23

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ESS_ES1488_MIXER => 24

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ESS_ES1688_WAVEOUT => 25

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ESS_ES1688_WAVEIN => 26

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ESS_ES1688_MIXER => 27

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ESS_ES1788_WAVEOUT => 28

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ESS_ES1788_WAVEIN => 29

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ESS_ES1788_MIXER => 30

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ESS_ES1888_WAVEOUT => 31

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ESS_ES1888_WAVEIN => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ESS_ES1888_MIXER => 33

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ESS_ES1868_WAVEOUT => 34

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ESS_ES1868_WAVEIN => 35

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ESS_ES1868_MIXER => 36

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ESS_ES1878_WAVEOUT => 37

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ESS_ES1878_WAVEIN => 38

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ESS_ES1878_MIXER => 39

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CANOPUS_ACM_DVREX => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_EPS_FMSND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TRUEVISION_WAVEIN1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TRUEVISION_WAVEOUT1 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AZTECH_MIDIOUT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AZTECH_MIDIIN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AZTECH_WAVEIN => 17

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AZTECH_WAVEOUT => 18

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AZTECH_FMSYNTH => 20

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AZTECH_MIXER => 21

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AZTECH_PRO16_WAVEIN => 33

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AZTECH_PRO16_WAVEOUT => 34

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AZTECH_PRO16_FMSYNTH => 38

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AZTECH_DSP16_WAVEIN => 65

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AZTECH_DSP16_WAVEOUT => 66

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AZTECH_DSP16_FMSYNTH => 68

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AZTECH_DSP16_WAVESYNTH => 70

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AZTECH_NOVA16_WAVEIN => 71

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AZTECH_NOVA16_WAVEOUT => 72

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AZTECH_NOVA16_MIXER => 73

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AZTECH_WASH16_WAVEIN => 74

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AZTECH_WASH16_WAVEOUT => 75

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AZTECH_WASH16_MIXER => 76

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AZTECH_AUX_CD => 401

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AZTECH_AUX_LINE => 402

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AZTECH_AUX_MIC => 403

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AZTECH_AUX => 404

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VIDEOLOGIC_MSWAVEIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VIDEOLOGIC_MSWAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_KORG_PCIF_MIDIOUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_KORG_PCIF_MIDIIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_KORG_1212IO_MSWAVEIN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_KORG_1212IO_MSWAVEOUT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_APT_ACE100CD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ICS_WAVEDECK_WAVEOUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ICS_WAVEDECK_WAVEIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ICS_WAVEDECK_MIXER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ICS_WAVEDECK_AUX => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ICS_WAVEDECK_SYNTH => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ICS_WAVEDEC_SB_WAVEOUT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ICS_WAVEDEC_SB_WAVEIN => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ICS_WAVEDEC_SB_FM_MIDIOUT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ICS_WAVEDEC_SB_MPU401_MIDIOUT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ICS_WAVEDEC_SB_MPU401_MIDIIN => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ICS_WAVEDEC_SB_MIXER => 11

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ICS_WAVEDEC_SB_AUX => 12

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ICS_2115_LITE_MIDIOUT => 13

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ICS_2120_LITE_MIDIOUT => 14

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ITERATEDSYS_FUFCODEC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_METHEUS_ZIPPER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WINNOV_CAVIAR_WAVEIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WINNOV_CAVIAR_WAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WINNOV_CAVIAR_VIDC => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WINNOV_CAVIAR_CHAMPAGNE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WINNOV_CAVIAR_YUV8 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NCR_BA_WAVEIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NCR_BA_WAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NCR_BA_SYNTH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NCR_BA_AUX => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NCR_BA_MIXER => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AST_MODEMWAVE_WAVEIN => 13

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AST_MODEMWAVE_WAVEOUT => 14

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WILLOWPOND_FMSYNTH_STEREO => 20

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WILLOWPOND_MPU401 => 21

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WILLOWPOND_SNDPORT_WAVEIN => 100

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WILLOWPOND_SNDPORT_WAVEOUT => 101

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WILLOWPOND_SNDPORT_MIXER => 102

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WILLOWPOND_SNDPORT_AUX => 103

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WILLOWPOND_PH_WAVEIN => 104

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WILLOWPOND_PH_WAVEOUT => 105

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WILLOWPOND_PH_MIXER => 106

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WILLOWPOND_PH_AUX => 107

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WILLOPOND_SNDCOMM_WAVEIN => 108

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WILLOWPOND_SNDCOMM_WAVEOUT => 109

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WILLOWPOND_SNDCOMM_MIXER => 110

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WILLOWPOND_SNDCOMM_AUX => 111

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WILLOWPOND_GENERIC_WAVEIN => 112

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WILLOWPOND_GENERIC_WAVEOUT => 113

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WILLOWPOND_GENERIC_MIXER => 114

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WILLOWPOND_GENERIC_AUX => 115

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VITEC_VMAKER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VITEC_VMPRO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOSCOM_VPC2400_IN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOSCOM_VPC2400_OUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SILICONSOFT_SC1_WAVEIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SILICONSOFT_SC1_WAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SILICONSOFT_SC2_WAVEIN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SILICONSOFT_SC2_WAVEOUT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SILICONSOFT_SOUNDJR2_WAVEOUT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SILICONSOFT_SOUNDJR2PR_WAVEIN => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SILICONSOFT_SOUNDJR2PR_WAVEOUT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SILICONSOFT_SOUNDJR3_WAVEOUT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TTEWS_WAVEIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TTEWS_WAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TTEWS_MIDIIN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TTEWS_MIDIOUT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TTEWS_MIDISYNTH => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TTEWS_MIDIMONITOR => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TTEWS_VMIDIIN => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TTEWS_VMIDIOUT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TTEWS_AUX => 9

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TTEWS_MIXER => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MEDIASONIC_ACM_G723 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MEDIASONIC_ICOM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ICOM_WAVEIN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ICOM_WAVEOUT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ICOM_MIXER => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ICOM_AUX => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ICOM_LINE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SANYO_ACM_LD_ADPCM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AHEAD_MULTISOUND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AHEAD_SOUNDBLASTER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AHEAD_PROAUDIO => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AHEAD_GENERIC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OLIVETTI_WAVEIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OLIVETTI_WAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OLIVETTI_MIXER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OLIVETTI_AUX => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OLIVETTI_MIDIIN => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OLIVETTI_MIDIOUT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OLIVETTI_SYNTH => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OLIVETTI_JOYSTICK => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OLIVETTI_ACM_GSM => 9

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OLIVETTI_ACM_ADPCM => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OLIVETTI_ACM_CELP => 11

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OLIVETTI_ACM_SBC => 12

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OLIVETTI_ACM_OPR => 13

    /**
     * @type {Integer (UInt32)}
     */
    static MM_IOMAGIC_TEMPO_WAVEOUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_IOMAGIC_TEMPO_WAVEIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_IOMAGIC_TEMPO_SYNTH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_IOMAGIC_TEMPO_MIDIOUT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_IOMAGIC_TEMPO_MXDOUT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_IOMAGIC_TEMPO_AUXOUT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MATSUSHITA_WAVEIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MATSUSHITA_WAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MATSUSHITA_FMSYNTH_STEREO => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MATSUSHITA_MIXER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MATSUSHITA_AUX => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NEWMEDIA_WAVJAMMER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_LYRRUS_BRIDGE_GUITAR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OPTI_M16_FMSYNTH_STEREO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OPTI_M16_MIDIIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OPTI_M16_MIDIOUT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OPTI_M16_WAVEIN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OPTI_M16_WAVEOUT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OPTI_M16_MIXER => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OPTI_M16_AUX => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OPTI_P16_FMSYNTH_STEREO => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OPTI_P16_MIDIIN => 17

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OPTI_P16_MIDIOUT => 18

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OPTI_P16_WAVEIN => 19

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OPTI_P16_WAVEOUT => 20

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OPTI_P16_MIXER => 21

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OPTI_P16_AUX => 22

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OPTI_M32_WAVEIN => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OPTI_M32_WAVEOUT => 33

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OPTI_M32_MIDIIN => 34

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OPTI_M32_MIDIOUT => 35

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OPTI_M32_SYNTH_STEREO => 36

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OPTI_M32_MIXER => 37

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OPTI_M32_AUX => 38

    /**
     * @type {Integer (UInt32)}
     */
    static MM_COMPAQ_BB_WAVEIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_COMPAQ_BB_WAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_COMPAQ_BB_WAVEAUX => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MPTUS_SPWAVEOUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_LERNOUT_ANDHAUSPIE_LHCODECACM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DIGITAL_AV320_WAVEIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DIGITAL_AV320_WAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DIGITAL_ACM_G723 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DIGITAL_ICM_H263 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DIGITAL_ICM_H261 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTP_MIDIOUT_ALL => 100

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTP_MIDIIN_1 => 101

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTP_MIDIOUT_1 => 101

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTP_MIDIIN_2 => 102

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTP_MIDIOUT_2 => 102

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTP_MIDIIN_3 => 103

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTP_MIDIOUT_3 => 103

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTP_MIDIIN_4 => 104

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTP_MIDIOUT_4 => 104

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTP_MIDIIN_5 => 105

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTP_MIDIOUT_5 => 105

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTP_MIDIIN_6 => 106

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTP_MIDIOUT_6 => 106

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTP_MIDIIN_7 => 107

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTP_MIDIOUT_7 => 107

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTP_MIDIIN_8 => 108

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTP_MIDIOUT_8 => 108

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPII_MIDIOUT_ALL => 200

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPII_MIDIIN_SYNC => 200

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPII_MIDIIN_1 => 201

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPII_MIDIOUT_1 => 201

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPII_MIDIIN_2 => 202

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPII_MIDIOUT_2 => 202

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPII_MIDIIN_3 => 203

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPII_MIDIOUT_3 => 203

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPII_MIDIIN_4 => 204

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPII_MIDIOUT_4 => 204

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPII_MIDIIN_5 => 205

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPII_MIDIOUT_5 => 205

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPII_MIDIIN_6 => 206

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPII_MIDIOUT_6 => 206

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPII_MIDIIN_7 => 207

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPII_MIDIOUT_7 => 207

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPII_MIDIIN_8 => 208

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPII_MIDIOUT_8 => 208

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPII_NET_MIDIIN_1 => 209

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPII_NET_MIDIOUT_1 => 209

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPII_NET_MIDIIN_2 => 210

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPII_NET_MIDIOUT_2 => 210

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPII_NET_MIDIIN_3 => 211

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPII_NET_MIDIOUT_3 => 211

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPII_NET_MIDIIN_4 => 212

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPII_NET_MIDIOUT_4 => 212

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPII_NET_MIDIIN_5 => 213

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPII_NET_MIDIOUT_5 => 213

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPII_NET_MIDIIN_6 => 214

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPII_NET_MIDIOUT_6 => 214

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPII_NET_MIDIIN_7 => 215

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPII_NET_MIDIOUT_7 => 215

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPII_NET_MIDIIN_8 => 216

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPII_NET_MIDIOUT_8 => 216

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXP_MIDIIN_MIDIOUT_ALL => 300

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXP_MIDIIN_SYNC => 300

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXP_MIDIIN_MIDIIN_1 => 301

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXP_MIDIIN_MIDIOUT_1 => 301

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXP_MIDIIN_MIDIIN_2 => 302

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXP_MIDIIN_MIDIOUT_2 => 302

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXP_MIDIIN_MIDIIN_3 => 303

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXP_MIDIIN_MIDIOUT_3 => 303

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXP_MIDIIN_MIDIIN_4 => 304

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXP_MIDIIN_MIDIOUT_4 => 304

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXP_MIDIIN_MIDIIN_5 => 305

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXP_MIDIIN_MIDIOUT_5 => 305

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXP_MIDIIN_MIDIIN_6 => 306

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXP_MIDIIN_MIDIOUT_6 => 306

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXPMPU_MIDIOUT_ALL => 400

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXPMPU_MIDIIN_SYNC => 400

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXPMPU_MIDIIN_1 => 401

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXPMPU_MIDIOUT_1 => 401

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXPMPU_MIDIIN_2 => 402

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXPMPU_MIDIOUT_2 => 402

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXPMPU_MIDIIN_3 => 403

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXPMPU_MIDIOUT_3 => 403

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXPMPU_MIDIIN_4 => 404

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXPMPU_MIDIOUT_4 => 404

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXPMPU_MIDIIN_5 => 405

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXPMPU_MIDIOUT_5 => 405

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXPMPU_MIDIIN_6 => 406

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXPMPU_MIDIOUT_6 => 406

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXN_MIDIOUT_ALL => 500

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXN_MIDIIN_SYNC => 500

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXN_MIDIIN_1 => 501

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXN_MIDIOUT_1 => 501

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXN_MIDIIN_2 => 502

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXN_MIDIOUT_2 => 502

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXN_MIDIIN_3 => 503

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXN_MIDIOUT_3 => 503

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXN_MIDIIN_4 => 504

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXN_MIDIOUT_4 => 504

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_FLYER_MIDI_IN_SYNC => 600

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_FLYER_MIDI_IN_A => 601

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_FLYER_MIDI_OUT_A => 601

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_FLYER_MIDI_IN_B => 602

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_FLYER_MIDI_OUT_B => 602

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_PKX_MIDI_IN_SYNC => 700

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_PKX_MIDI_IN_A => 701

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_PKX_MIDI_OUT_A => 701

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_PKX_MIDI_IN_B => 702

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_PKX_MIDI_OUT_B => 702

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_DTX_MIDI_IN_SYNC => 800

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_DTX_MIDI_IN_A => 801

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_DTX_MIDI_OUT_A => 801

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_DTX_MIDI_IN_B => 802

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_DTX_MIDI_OUT_B => 802

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPAV_MIDIOUT_ALL => 900

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPAV_MIDIIN_SYNC => 900

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPAV_MIDIIN_1 => 901

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPAV_MIDIOUT_1 => 901

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPAV_MIDIIN_2 => 902

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPAV_MIDIOUT_2 => 902

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPAV_MIDIIN_3 => 903

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPAV_MIDIOUT_3 => 903

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPAV_MIDIIN_4 => 904

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPAV_MIDIOUT_4 => 904

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPAV_MIDIIN_5 => 905

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPAV_MIDIOUT_5 => 905

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPAV_MIDIIN_6 => 906

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPAV_MIDIOUT_6 => 906

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPAV_MIDIIN_7 => 907

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPAV_MIDIOUT_7 => 907

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPAV_MIDIIN_8 => 908

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPAV_MIDIOUT_8 => 908

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPAV_NET_MIDIIN_1 => 909

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPAV_NET_MIDIOUT_1 => 909

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPAV_NET_MIDIIN_2 => 910

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPAV_NET_MIDIOUT_2 => 910

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPAV_NET_MIDIIN_3 => 911

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPAV_NET_MIDIOUT_3 => 911

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPAV_NET_MIDIIN_4 => 912

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPAV_NET_MIDIOUT_4 => 912

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPAV_NET_MIDIIN_5 => 913

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPAV_NET_MIDIOUT_5 => 913

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPAV_NET_MIDIIN_6 => 914

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPAV_NET_MIDIOUT_6 => 914

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPAV_NET_MIDIIN_7 => 915

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPAV_NET_MIDIOUT_7 => 915

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPAV_NET_MIDIIN_8 => 916

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPAV_NET_MIDIOUT_8 => 916

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPAV_MIDIIN_ADAT => 917

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MTPAV_MIDIOUT_ADAT => 917

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXPXT_MIDIIN_SYNC => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXPXT_MIDIOUT_ALL => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXPXT_MIDIIN_1 => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXPXT_MIDIOUT_1 => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXPXT_MIDIOUT_2 => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXPXT_MIDIIN_2 => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXPXT_MIDIIN_3 => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXPXT_MIDIOUT_3 => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXPXT_MIDIIN_4 => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXPXT_MIDIOUT_4 => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXPXT_MIDIIN_5 => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXPXT_MIDIOUT_5 => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXPXT_MIDIOUT_6 => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXPXT_MIDIIN_6 => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXPXT_MIDIOUT_7 => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXPXT_MIDIIN_7 => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXPXT_MIDIOUT_8 => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTU_MXPXT_MIDIIN_8 => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WORKBIT_MIXER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WORKBIT_WAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WORKBIT_WAVEIN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WORKBIT_MIDIIN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WORKBIT_MIDIOUT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WORKBIT_FMSYNTH => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WORKBIT_AUX => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WORKBIT_JOYSTICK => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OSITECH_TRUMPCARD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MIRO_MOVIEPRO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MIRO_VIDEOD1 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MIRO_VIDEODC1TV => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MIRO_VIDEOTD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MIRO_DC30_WAVEOUT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MIRO_DC30_WAVEIN => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MIRO_DC30_MIX => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ISOLUTION_PASCAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VOICEMIXER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ROCKWELL_WA1_WAVEIN => 100

    /**
     * @type {Integer (UInt32)}
     */
    static ROCKWELL_WA1_WAVEOUT => 101

    /**
     * @type {Integer (UInt32)}
     */
    static ROCKWELL_WA1_SYNTH => 102

    /**
     * @type {Integer (UInt32)}
     */
    static ROCKWELL_WA1_MIXER => 103

    /**
     * @type {Integer (UInt32)}
     */
    static ROCKWELL_WA1_MPU401_IN => 104

    /**
     * @type {Integer (UInt32)}
     */
    static ROCKWELL_WA1_MPU401_OUT => 105

    /**
     * @type {Integer (UInt32)}
     */
    static ROCKWELL_WA2_WAVEIN => 200

    /**
     * @type {Integer (UInt32)}
     */
    static ROCKWELL_WA2_WAVEOUT => 201

    /**
     * @type {Integer (UInt32)}
     */
    static ROCKWELL_WA2_SYNTH => 202

    /**
     * @type {Integer (UInt32)}
     */
    static ROCKWELL_WA2_MIXER => 203

    /**
     * @type {Integer (UInt32)}
     */
    static ROCKWELL_WA2_MPU401_IN => 204

    /**
     * @type {Integer (UInt32)}
     */
    static ROCKWELL_WA2_MPU401_OUT => 205

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VOXWARE_CODEC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NORTEL_MPXAC_WAVEIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NORTEL_MPXAC_WAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ADDX_PCTV_DIGITALMIX => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ADDX_PCTV_WAVEIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ADDX_PCTV_WAVEOUT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ADDX_PCTV_MIXER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ADDX_PCTV_AUX_CD => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ADDX_PCTV_AUX_LINE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_WILDCAT_AUTOSCOREMIDIIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_RHETOREX_WAVEIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_RHETOREX_WAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_BTV_WAVEIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_BTV_WAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_BTV_MIDIIN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_BTV_MIDIOUT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_BTV_MIDISYNTH => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_BTV_AUX_LINE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_BTV_AUX_MIC => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MM_BTV_AUX_CD => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MM_BTV_DIGITALIN => 9

    /**
     * @type {Integer (UInt32)}
     */
    static MM_BTV_DIGITALOUT => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MM_BTV_MIDIWAVESTREAM => 11

    /**
     * @type {Integer (UInt32)}
     */
    static MM_BTV_MIXER => 12

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ENSONIQ_SOUNDSCAPE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SOUNDSCAPE_WAVEOUT => 17

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SOUNDSCAPE_WAVEOUT_AUX => 18

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SOUNDSCAPE_WAVEIN => 19

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SOUNDSCAPE_MIDIOUT => 20

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SOUNDSCAPE_MIDIIN => 21

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SOUNDSCAPE_SYNTH => 22

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SOUNDSCAPE_MIXER => 23

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SOUNDSCAPE_AUX => 24

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NVIDIA_WAVEOUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NVIDIA_WAVEIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NVIDIA_MIDIOUT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NVIDIA_MIDIIN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NVIDIA_GAMEPORT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NVIDIA_MIXER => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NVIDIA_AUX => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OKSORI_BASE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OKSORI_OSR8_WAVEOUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OKSORI_OSR8_WAVEIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OKSORI_OSR16_WAVEOUT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OKSORI_OSR16_WAVEIN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OKSORI_FM_OPL4 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OKSORI_MIX_MASTER => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OKSORI_MIX_WAVE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OKSORI_MIX_FM => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OKSORI_MIX_LINE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OKSORI_MIX_CD => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OKSORI_MIX_MIC => 11

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OKSORI_MIX_ECHO => 12

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OKSORI_MIX_AUX1 => 13

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OKSORI_MIX_LINE1 => 14

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OKSORI_EXT_MIC1 => 15

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OKSORI_EXT_MIC2 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OKSORI_MIDIOUT => 17

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OKSORI_MIDIIN => 18

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OKSORI_MPEG_CDVISION => 19

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DIACOUSTICS_DRUM_ACTION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_KAY_ELEMETRICS_CSL => 17152

    /**
     * @type {Integer (UInt32)}
     */
    static MM_KAY_ELEMETRICS_CSL_DAT => 17160

    /**
     * @type {Integer (UInt32)}
     */
    static MM_KAY_ELEMETRICS_CSL_4CHANNEL => 17161

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CRYSTAL_CS4232_WAVEIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CRYSTAL_CS4232_WAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CRYSTAL_CS4232_WAVEMIXER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CRYSTAL_CS4232_WAVEAUX_AUX1 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CRYSTAL_CS4232_WAVEAUX_AUX2 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CRYSTAL_CS4232_WAVEAUX_LINE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CRYSTAL_CS4232_WAVEAUX_MONO => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CRYSTAL_CS4232_WAVEAUX_MASTER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CRYSTAL_CS4232_MIDIIN => 9

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CRYSTAL_CS4232_MIDIOUT => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CRYSTAL_CS4232_INPUTGAIN_AUX1 => 13

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CRYSTAL_CS4232_INPUTGAIN_LOOP => 14

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CRYSTAL_SOUND_FUSION_WAVEIN => 21

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CRYSTAL_SOUND_FUSION_WAVEOUT => 22

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CRYSTAL_SOUND_FUSION_MIXER => 23

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CRYSTAL_SOUND_FUSION_MIDIIN => 24

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CRYSTAL_SOUND_FUSION_MIDIOUT => 25

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CRYSTAL_SOUND_FUSION_JOYSTICK => 26

    /**
     * @type {Integer (UInt32)}
     */
    static MM_QUARTERDECK_LHWAVEIN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MM_QUARTERDECK_LHWAVEOUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TDK_MW_MIDI_SYNTH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TDK_MW_MIDI_IN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TDK_MW_MIDI_OUT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TDK_MW_WAVE_IN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TDK_MW_WAVE_OUT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TDK_MW_AUX => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TDK_MW_MIXER => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TDK_MW_AUX_MASTER => 100

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TDK_MW_AUX_BASS => 101

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TDK_MW_AUX_TREBLE => 102

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TDK_MW_AUX_MIDI_VOL => 103

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TDK_MW_AUX_WAVE_VOL => 104

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TDK_MW_AUX_WAVE_RVB => 105

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TDK_MW_AUX_WAVE_CHR => 106

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TDK_MW_AUX_VOL => 107

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TDK_MW_AUX_RVB => 108

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TDK_MW_AUX_CHR => 109

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DIGITAL_AUDIO_LABS_TC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DIGITAL_AUDIO_LABS_DOC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DIGITAL_AUDIO_LABS_V8 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DIGITAL_AUDIO_LABS_CPRO => 17

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DIGITAL_AUDIO_LABS_VP => 18

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DIGITAL_AUDIO_LABS_CDLX => 19

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DIGITAL_AUDIO_LABS_CTDIF => 20

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SEERSYS_SEERSYNTH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SEERSYS_SEERWAVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SEERSYS_SEERMIX => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SEERSYS_WAVESYNTH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SEERSYS_WAVESYNTH_WG => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SEERSYS_REALITY => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OSPREY_1000WAVEIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OSPREY_1000WAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SOUNDESIGNS_WAVEIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SOUNDESIGNS_WAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SSP_SNDFESWAVEIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SSP_SNDFESWAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SSP_SNDFESMIDIIN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SSP_SNDFESMIDIOUT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SSP_SNDFESSYNTH => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SSP_SNDFESMIX => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SSP_SNDFESAUX => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ECS_AADF_MIDI_IN => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ECS_AADF_MIDI_OUT => 11

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ECS_AADF_WAVE2MIDI_IN => 12

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AMD_INTERWAVE_WAVEIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AMD_INTERWAVE_WAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AMD_INTERWAVE_SYNTH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AMD_INTERWAVE_MIXER1 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AMD_INTERWAVE_MIXER2 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AMD_INTERWAVE_JOYSTICK => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AMD_INTERWAVE_EX_CD => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AMD_INTERWAVE_MIDIIN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AMD_INTERWAVE_MIDIOUT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AMD_INTERWAVE_AUX1 => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AMD_INTERWAVE_AUX2 => 11

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AMD_INTERWAVE_AUX_MIC => 12

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AMD_INTERWAVE_AUX_CD => 13

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AMD_INTERWAVE_MONO_IN => 14

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AMD_INTERWAVE_MONO_OUT => 15

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AMD_INTERWAVE_EX_TELEPHONY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AMD_INTERWAVE_WAVEOUT_BASE => 17

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AMD_INTERWAVE_WAVEOUT_TREBLE => 18

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AMD_INTERWAVE_STEREO_ENHANCED => 19

    /**
     * @type {Integer (UInt32)}
     */
    static MM_COREDYNAMICS_DYNAMIXHR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_COREDYNAMICS_DYNASONIX_SYNTH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_COREDYNAMICS_DYNASONIX_MIDI_IN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_COREDYNAMICS_DYNASONIX_MIDI_OUT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_COREDYNAMICS_DYNASONIX_WAVE_IN => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_COREDYNAMICS_DYNASONIX_WAVE_OUT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_COREDYNAMICS_DYNASONIX_AUDIO_IN => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MM_COREDYNAMICS_DYNASONIX_AUDIO_OUT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MM_COREDYNAMICS_DYNAGRAFX_VGA => 9

    /**
     * @type {Integer (UInt32)}
     */
    static MM_COREDYNAMICS_DYNAGRAFX_WAVE_IN => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MM_COREDYNAMICS_DYNAGRAFX_WAVE_OUT => 11

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CANAM_CBXWAVEOUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CANAM_CBXWAVEIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SOFTSOUND_CODEC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NORRIS_VOICELINK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DDD_MIDILINK_MIDIIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DDD_MIDILINK_MIDIOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_EUPHONICS_AUX_CD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_EUPHONICS_AUX_LINE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_EUPHONICS_AUX_MASTER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_EUPHONICS_AUX_MIC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_EUPHONICS_AUX_MIDI => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_EUPHONICS_AUX_WAVE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_EUPHONICS_FMSYNTH_MONO => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MM_EUPHONICS_FMSYNTH_STEREO => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MM_EUPHONICS_MIDIIN => 9

    /**
     * @type {Integer (UInt32)}
     */
    static MM_EUPHONICS_MIDIOUT => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MM_EUPHONICS_MIXER => 11

    /**
     * @type {Integer (UInt32)}
     */
    static MM_EUPHONICS_WAVEIN => 12

    /**
     * @type {Integer (UInt32)}
     */
    static MM_EUPHONICS_WAVEOUT => 13

    /**
     * @type {Integer (UInt32)}
     */
    static MM_EUPHONICS_EUSYNTH => 14

    /**
     * @type {Integer (UInt32)}
     */
    static CRYSTAL_NET_SFM_CODEC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CHROMATIC_M1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CHROMATIC_M1_WAVEIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CHROMATIC_M1_WAVEOUT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CHROMATIC_M1_FMSYNTH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CHROMATIC_M1_MIXER => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CHROMATIC_M1_AUX => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CHROMATIC_M1_AUX_CD => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CHROMATIC_M1_MIDIIN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CHROMATIC_M1_MIDIOUT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CHROMATIC_M1_WTSYNTH => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CHROMATIC_M1_MPEGWAVEIN => 17

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CHROMATIC_M1_MPEGWAVEOUT => 18

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CHROMATIC_M2 => 19

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CHROMATIC_M2_WAVEIN => 20

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CHROMATIC_M2_WAVEOUT => 21

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CHROMATIC_M2_FMSYNTH => 22

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CHROMATIC_M2_MIXER => 23

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CHROMATIC_M2_AUX => 24

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CHROMATIC_M2_AUX_CD => 25

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CHROMATIC_M2_MIDIIN => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CHROMATIC_M2_MIDIOUT => 33

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CHROMATIC_M2_WTSYNTH => 34

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CHROMATIC_M2_MPEGWAVEIN => 35

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CHROMATIC_M2_MPEGWAVEOUT => 36

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VIENNASYS_TSP_WAVE_DRIVER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CONNECTIX_VIDEC_CODEC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_GADGETLABS_WAVE44_WAVEIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_GADGETLABS_WAVE44_WAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_GADGETLABS_WAVE42_WAVEIN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_GADGETLABS_WAVE42_WAVEOUT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_GADGETLABS_WAVE4_MIDIIN => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_GADGETLABS_WAVE4_MIDIOUT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_FRONTIER_WAVECENTER_MIDIIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_FRONTIER_WAVECENTER_MIDIOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_FRONTIER_WAVECENTER_WAVEIN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_FRONTIER_WAVECENTER_WAVEOUT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VIONA_QVINPCI_MIXER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VIONA_QVINPCI_WAVEIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VIONAQVINPCI_WAVEOUT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VIONA_BUSTER_MIXER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VIONA_CINEMASTER_MIXER => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VIONA_CONCERTO_MIXER => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CASIO_WP150_MIDIOUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CASIO_WP150_MIDIIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_CASIO_LSG_MIDIOUT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DIMD_PLATFORM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DIMD_DIRSOUND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DIMD_VIRTMPU => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DIMD_VIRTSB => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DIMD_VIRTJOY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DIMD_WAVEIN => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DIMD_WAVEOUT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DIMD_MIDIIN => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DIMD_MIDIOUT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DIMD_AUX_LINE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DIMD_MIXER => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DIMD_WSS_WAVEIN => 14

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DIMD_WSS_WAVEOUT => 15

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DIMD_WSS_MIXER => 17

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DIMD_WSS_AUX => 21

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DIMD_WSS_SYNTH => 76

    /**
     * @type {Integer (UInt32)}
     */
    static MM_S3_WAVEOUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_S3_WAVEIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_S3_MIDIOUT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_S3_MIDIIN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_S3_FMSYNTH => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_S3_MIXER => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_S3_AUX => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VKC_MPU401_MIDIIN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VKC_SERIAL_MIDIIN => 257

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VKC_MPU401_MIDIOUT => 512

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VKC_SERIAL_MIDIOUT => 513

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ZEFIRO_ZA2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_FHGIIS_MPEGLAYER3_DECODE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static MM_FHGIIS_MPEGLAYER3 => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MM_FHGIIS_MPEGLAYER3_LITE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MM_FHGIIS_MPEGLAYER3_BASIC => 11

    /**
     * @type {Integer (UInt32)}
     */
    static MM_FHGIIS_MPEGLAYER3_ADVANCED => 12

    /**
     * @type {Integer (UInt32)}
     */
    static MM_FHGIIS_MPEGLAYER3_PROFESSIONAL => 13

    /**
     * @type {Integer (UInt32)}
     */
    static MM_FHGIIS_MPEGLAYER3_ADVANCEDPLUS => 14

    /**
     * @type {Integer (UInt32)}
     */
    static MM_QUICKNET_PJWAVEIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_QUICKNET_PJWAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SICRESOURCE_SSO3D => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SICRESOURCE_SSOW3DI => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NEOMAGIC_SYNTH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NEOMAGIC_WAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NEOMAGIC_WAVEIN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NEOMAGIC_MIDIOUT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NEOMAGIC_MIDIIN => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NEOMAGIC_AUX => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NEOMAGIC_MW3DX_WAVEOUT => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NEOMAGIC_MW3DX_WAVEIN => 11

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NEOMAGIC_MW3DX_MIDIOUT => 12

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NEOMAGIC_MW3DX_MIDIIN => 13

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NEOMAGIC_MW3DX_FMSYNTH => 14

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NEOMAGIC_MW3DX_GMSYNTH => 15

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NEOMAGIC_MW3DX_MIXER => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NEOMAGIC_MW3DX_AUX => 17

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NEOMAGIC_MWAVE_WAVEOUT => 20

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NEOMAGIC_MWAVE_WAVEIN => 21

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NEOMAGIC_MWAVE_MIDIOUT => 22

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NEOMAGIC_MWAVE_MIDIIN => 23

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NEOMAGIC_MWAVE_MIXER => 24

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NEOMAGIC_MWAVE_AUX => 25

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MERGING_MPEGL3 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_XIRLINK_VISIONLINK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OTI_611WAVEIN => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OTI_611WAVEOUT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OTI_611MIXER => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OTI_611MIDIN => 18

    /**
     * @type {Integer (UInt32)}
     */
    static MM_OTI_611MIDIOUT => 19

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AUREAL_AU8820 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AU8820_SYNTH => 17

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AU8820_WAVEOUT => 18

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AU8820_WAVEIN => 19

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AU8820_MIXER => 20

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AU8820_AUX => 21

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AU8820_MIDIOUT => 22

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AU8820_MIDIIN => 23

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AUREAL_AU8830 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AU8830_SYNTH => 33

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AU8830_WAVEOUT => 34

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AU8830_WAVEIN => 35

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AU8830_MIXER => 36

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AU8830_AUX => 37

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AU8830_MIDIOUT => 38

    /**
     * @type {Integer (UInt32)}
     */
    static MM_AU8830_MIDIIN => 39

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VIVO_AUDIO_CODEC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SHARP_MDC_MIDI_SYNTH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SHARP_MDC_MIDI_IN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SHARP_MDC_MIDI_OUT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SHARP_MDC_WAVE_IN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SHARP_MDC_WAVE_OUT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SHARP_MDC_AUX => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SHARP_MDC_MIXER => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SHARP_MDC_AUX_MASTER => 100

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SHARP_MDC_AUX_BASS => 101

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SHARP_MDC_AUX_TREBLE => 102

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SHARP_MDC_AUX_MIDI_VOL => 103

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SHARP_MDC_AUX_WAVE_VOL => 104

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SHARP_MDC_AUX_WAVE_RVB => 105

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SHARP_MDC_AUX_WAVE_CHR => 106

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SHARP_MDC_AUX_VOL => 107

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SHARP_MDC_AUX_RVB => 108

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SHARP_MDC_AUX_CHR => 109

    /**
     * @type {Integer (UInt32)}
     */
    static MM_LUCENT_ACM_G723 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ATT_G729A => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MARIAN_ARC44WAVEIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MARIAN_ARC44WAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MARIAN_PRODIF24WAVEIN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MARIAN_PRODIF24WAVEOUT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MARIAN_ARC88WAVEIN => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MARIAN_ARC88WAVEOUT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_BCB_NETBOARD_10 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_BCB_TT75_10 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MOTIONPIXELS_MVI2 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_QDESIGN_ACM_MPEG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_QDESIGN_ACM_QDESIGN_MUSIC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NMP_CCP_WAVEIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NMP_CCP_WAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_NMP_ACM_AMR => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DF_ACM_G726 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DF_ACM_GSM610 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_BERCOS_WAVEIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_BERCOS_MIXER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_BERCOS_WAVEOUT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ONLIVE_MPCODEC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_PHONET_PP_WAVEOUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_PHONET_PP_WAVEIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_PHONET_PP_MIXER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_FTR_ENCODER_WAVEIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_FTR_ACM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ENET_T2000_LINEIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ENET_T2000_LINEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ENET_T2000_HANDSETIN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ENET_T2000_HANDSETOUT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_EMAGIC_UNITOR8 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SIPROLAB_ACELPNET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DICTAPHONE_G726 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_RZS_ACM_TUBGSM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_EES_PCMIDI14 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_EES_PCMIDI14_IN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_EES_PCMIDI14_OUT1 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_EES_PCMIDI14_OUT2 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_EES_PCMIDI14_OUT3 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_EES_PCMIDI14_OUT4 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_HAFTMANN_LPTDAC2 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_LUCID_PCI24WAVEIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_LUCID_PCI24WAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_HEADSPACE_HAESYNTH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_HEADSPACE_HAEWAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_HEADSPACE_HAEWAVEIN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_HEADSPACE_HAEMIXER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_UNISYS_ACM_NAP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_LUMINOSITI_SCWAVEIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_LUMINOSITI_SCWAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_LUMINOSITI_SCWAVEMIX => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ACTIVEVOICE_ACM_VOXADPCM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DTS_DS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SOFTLAB_NSK_FRW_WAVEIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SOFTLAB_NSK_FRW_WAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SOFTLAB_NSK_FRW_MIXER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SOFTLAB_NSK_FRW_AUX => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_FORTEMEDIA_WAVEIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_FORTEMEDIA_WAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_FORTEMEDIA_FMSYNC => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_FORTEMEDIA_MIXER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_FORTEMEDIA_AUX => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SONORUS_STUDIO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_I_LINK_VOICE_CODER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SELSIUS_SYSTEMS_RTPWAVEOUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SELSIUS_SYSTEMS_RTPWAVEIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ADMOS_FM_SYNTH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ADMOS_QS3AMIDIOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ADMOS_QS3AMIDIIN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ADMOS_QS3AWAVEOUT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ADMOS_QS3AWAVEIN => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_LEXICON_STUDIO_WAVE_OUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_LEXICON_STUDIO_WAVE_IN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SGI_320_WAVEIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SGI_320_WAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SGI_320_MIXER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SGI_540_WAVEIN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SGI_540_WAVEOUT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SGI_540_MIXER => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SGI_RAD_ADATMONO1_WAVEIN => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SGI_RAD_ADATMONO2_WAVEIN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SGI_RAD_ADATMONO3_WAVEIN => 9

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SGI_RAD_ADATMONO4_WAVEIN => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SGI_RAD_ADATMONO5_WAVEIN => 11

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SGI_RAD_ADATMONO6_WAVEIN => 12

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SGI_RAD_ADATMONO7_WAVEIN => 13

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SGI_RAD_ADATMONO8_WAVEIN => 14

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SGI_RAD_ADATSTEREO12_WAVEIN => 15

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SGI_RAD_ADATSTEREO34_WAVEIN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SGI_RAD_ADATSTEREO56_WAVEIN => 17

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SGI_RAD_ADATSTEREO78_WAVEIN => 18

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SGI_RAD_ADAT8CHAN_WAVEIN => 19

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SGI_RAD_ADATMONO1_WAVEOUT => 20

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SGI_RAD_ADATMONO2_WAVEOUT => 21

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SGI_RAD_ADATMONO3_WAVEOUT => 22

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SGI_RAD_ADATMONO4_WAVEOUT => 23

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SGI_RAD_ADATMONO5_WAVEOUT => 24

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SGI_RAD_ADATMONO6_WAVEOUT => 25

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SGI_RAD_ADATMONO7_WAVEOUT => 26

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SGI_RAD_ADATMONO8_WAVEOUT => 27

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SGI_RAD_ADATSTEREO12_WAVEOUT => 28

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SGI_RAD_ADATSTEREO32_WAVEOUT => 29

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SGI_RAD_ADATSTEREO56_WAVEOUT => 30

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SGI_RAD_ADATSTEREO78_WAVEOUT => 31

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SGI_RAD_ADAT8CHAN_WAVEOUT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SGI_RAD_AESMONO1_WAVEIN => 33

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SGI_RAD_AESMONO2_WAVEIN => 34

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SGI_RAD_AESSTEREO_WAVEIN => 35

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SGI_RAD_AESMONO1_WAVEOUT => 36

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SGI_RAD_AESMONO2_WAVEOUT => 37

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SGI_RAD_AESSTEREO_WAVEOUT => 38

    /**
     * @type {Integer (UInt32)}
     */
    static MM_IPI_ACM_HSX => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_IPI_ACM_RPELP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_IPI_WF_ASSS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_IPI_AT_WAVEOUT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_IPI_AT_WAVEIN => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_IPI_AT_MIXER => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ICE_WAVEOUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ICE_WAVEIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ICE_MTWAVEOUT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ICE_MTWAVEIN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ICE_MIDIOUT1 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ICE_MIDIIN1 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ICE_MIDIOUT2 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ICE_MIDIIN2 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ICE_SYNTH => 9

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ICE_MIXER => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ICE_AUX => 11

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VQST_VQC1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VQST_VQC2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ETEK_KWIKMIDI_MIDIIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ETEK_KWIKMIDI_MIDIOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_INTERNET_SSW_MIDIOUT => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MM_INTERNET_SSW_MIDIIN => 11

    /**
     * @type {Integer (UInt32)}
     */
    static MM_INTERNET_SSW_WAVEOUT => 12

    /**
     * @type {Integer (UInt32)}
     */
    static MM_INTERNET_SSW_WAVEIN => 13

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SONY_ACM_SCX => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_UH_ACM_ADPCM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SYDEC_NV_WAVEIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SYDEC_NV_WAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_FLEXION_X300_WAVEIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_FLEXION_X300_WAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VIA_WAVEOUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VIA_WAVEIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VIA_MIXER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VIA_AUX => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VIA_MPU401_MIDIOUT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VIA_MPU401_MIDIIN => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VIA_SWFM_SYNTH => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VIA_WDM_WAVEOUT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VIA_WDM_WAVEIN => 9

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VIA_WDM_MIXER => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VIA_WDM_MPU401_MIDIOUT => 11

    /**
     * @type {Integer (UInt32)}
     */
    static MM_VIA_WDM_MPU401_MIDIIN => 12

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MICRONAS_SC4 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MICRONAS_CLP833 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_HP_WAVEOUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_HP_WAVEIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_QUICKAUDIO_MINIMIDI => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_QUICKAUDIO_MAXIMIDI => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ICCC_UNA3_WAVEIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ICCC_UNA3_WAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ICCC_UNA3_AUX => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ICCC_UNA3_MIXER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_3COM_CB_MIXER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_3COM_CB_WAVEIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_3COM_CB_WAVEOUT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MINDMAKER_GC_WAVEIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MINDMAKER_GC_WAVEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MINDMAKER_GC_MIXER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TELEKOL_WAVEOUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_TELEKOL_WAVEIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ALGOVISION_VB80WAVEOUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ALGOVISION_VB80WAVEIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ALGOVISION_VB80MIXER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ALGOVISION_VB80AUX => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ALGOVISION_VB80AUX2 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_ADPCM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_IEEE_FLOAT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_VSELP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_IBM_CVSD => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_ALAW => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_MULAW => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_DTS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_DRM => 9

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_WMAVOICE9 => 10

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_WMAVOICE10 => 11

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_OKI_ADPCM => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_DVI_ADPCM => 17

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_IMA_ADPCM => 17

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_MEDIASPACE_ADPCM => 18

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_SIERRA_ADPCM => 19

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_G723_ADPCM => 20

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_DIGISTD => 21

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_DIGIFIX => 22

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_DIALOGIC_OKI_ADPCM => 23

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_MEDIAVISION_ADPCM => 24

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_CU_CODEC => 25

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_HP_DYN_VOICE => 26

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_YAMAHA_ADPCM => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_SONARC => 33

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_DSPGROUP_TRUESPEECH => 34

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_ECHOSC1 => 35

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_AUDIOFILE_AF36 => 36

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_APTX => 37

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_AUDIOFILE_AF10 => 38

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_PROSODY_1612 => 39

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_LRC => 40

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_DOLBY_AC2 => 48

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_GSM610 => 49

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_MSNAUDIO => 50

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_ANTEX_ADPCME => 51

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_CONTROL_RES_VQLPC => 52

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_DIGIREAL => 53

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_DIGIADPCM => 54

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_CONTROL_RES_CR10 => 55

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_NMS_VBXADPCM => 56

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_CS_IMAADPCM => 57

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_ECHOSC3 => 58

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_ROCKWELL_ADPCM => 59

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_ROCKWELL_DIGITALK => 60

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_XEBEC => 61

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_G721_ADPCM => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_G728_CELP => 65

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_MSG723 => 66

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_INTEL_G723_1 => 67

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_INTEL_G729 => 68

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_SHARP_G726 => 69

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_MPEG => 80

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_RT24 => 82

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_PAC => 83

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_MPEGLAYER3 => 85

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_LUCENT_G723 => 89

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_CIRRUS => 96

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_ESPCM => 97

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_VOXWARE => 98

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_CANOPUS_ATRAC => 99

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_G726_ADPCM => 100

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_G722_ADPCM => 101

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_DSAT => 102

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_DSAT_DISPLAY => 103

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_VOXWARE_BYTE_ALIGNED => 105

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_VOXWARE_AC8 => 112

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_VOXWARE_AC10 => 113

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_VOXWARE_AC16 => 114

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_VOXWARE_AC20 => 115

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_VOXWARE_RT24 => 116

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_VOXWARE_RT29 => 117

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_VOXWARE_RT29HW => 118

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_VOXWARE_VR12 => 119

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_VOXWARE_VR18 => 120

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_VOXWARE_TQ40 => 121

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_VOXWARE_SC3 => 122

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_VOXWARE_SC3_1 => 123

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_SOFTSOUND => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_VOXWARE_TQ60 => 129

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_MSRT24 => 130

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_G729A => 131

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_MVI_MVI2 => 132

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_DF_G726 => 133

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_DF_GSM610 => 134

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_ISIAUDIO => 136

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_ONLIVE => 137

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_MULTITUDE_FT_SX20 => 138

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_INFOCOM_ITS_G721_ADPCM => 139

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_CONVEDIA_G729 => 140

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_CONGRUENCY => 141

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_SBC24 => 145

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_DOLBY_AC3_SPDIF => 146

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_MEDIASONIC_G723 => 147

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_PROSODY_8KBPS => 148

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_ZYXEL_ADPCM => 151

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_PHILIPS_LPCBB => 152

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_PACKED => 153

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_MALDEN_PHONYTALK => 160

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_RACAL_RECORDER_GSM => 161

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_RACAL_RECORDER_G720_A => 162

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_RACAL_RECORDER_G723_1 => 163

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_RACAL_RECORDER_TETRA_ACELP => 164

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_NEC_AAC => 176

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_RAW_AAC1 => 255

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_RHETOREX_ADPCM => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_IRAT => 257

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_VIVO_G723 => 273

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_VIVO_SIREN => 274

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_PHILIPS_CELP => 288

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_PHILIPS_GRUNDIG => 289

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_DIGITAL_G723 => 291

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_SANYO_LD_ADPCM => 293

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_SIPROLAB_ACEPLNET => 304

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_SIPROLAB_ACELP4800 => 305

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_SIPROLAB_ACELP8V3 => 306

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_SIPROLAB_G729 => 307

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_SIPROLAB_G729A => 308

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_SIPROLAB_KELVIN => 309

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_VOICEAGE_AMR => 310

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_G726ADPCM => 320

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_DICTAPHONE_CELP68 => 321

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_DICTAPHONE_CELP54 => 322

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_QUALCOMM_PUREVOICE => 336

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_QUALCOMM_HALFRATE => 337

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_TUBGSM => 341

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_MSAUDIO1 => 352

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_WMAUDIO2 => 353

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_WMAUDIO3 => 354

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_WMAUDIO_LOSSLESS => 355

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_WMASPDIF => 356

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_UNISYS_NAP_ADPCM => 368

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_UNISYS_NAP_ULAW => 369

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_UNISYS_NAP_ALAW => 370

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_UNISYS_NAP_16K => 371

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_SYCOM_ACM_SYC008 => 372

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_SYCOM_ACM_SYC701_G726L => 373

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_SYCOM_ACM_SYC701_CELP54 => 374

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_SYCOM_ACM_SYC701_CELP68 => 375

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_KNOWLEDGE_ADVENTURE_ADPCM => 376

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_FRAUNHOFER_IIS_MPEG2_AAC => 384

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_DTS_DS => 400

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_CREATIVE_ADPCM => 512

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_CREATIVE_FASTSPEECH8 => 514

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_CREATIVE_FASTSPEECH10 => 515

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_UHER_ADPCM => 528

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_ULEAD_DV_AUDIO => 533

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_ULEAD_DV_AUDIO_1 => 534

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_QUARTERDECK => 544

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_ILINK_VC => 560

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_RAW_SPORT => 576

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_ESST_AC3 => 577

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_GENERIC_PASSTHRU => 585

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_IPI_HSX => 592

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_IPI_RPELP => 593

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_CS2 => 608

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_SONY_SCX => 624

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_SONY_SCY => 625

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_SONY_ATRAC3 => 626

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_SONY_SPC => 627

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_TELUM_AUDIO => 640

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_TELUM_IA_AUDIO => 641

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_NORCOM_VOICE_SYSTEMS_ADPCM => 645

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_FM_TOWNS_SND => 768

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_MICRONAS => 848

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_MICRONAS_CELP833 => 849

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_BTV_DIGITAL => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_INTEL_MUSIC_CODER => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_INDEO_AUDIO => 1026

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_QDESIGN_MUSIC => 1104

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_ON2_VP7_AUDIO => 1280

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_ON2_VP6_AUDIO => 1281

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_VME_VMPCM => 1664

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_TPC => 1665

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_LIGHTWAVE_LOSSLESS => 2222

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_OLIGSM => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_OLIADPCM => 4097

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_OLICELP => 4098

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_OLISBC => 4099

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_OLIOPR => 4100

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_LH_CODEC => 4352

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_LH_CODEC_CELP => 4353

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_LH_CODEC_SBC8 => 4354

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_LH_CODEC_SBC12 => 4355

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_LH_CODEC_SBC16 => 4356

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_NORRIS => 5120

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_ISIAUDIO_2 => 5121

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_SOUNDSPACE_MUSICOMPRESS => 5376

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_MPEG_ADTS_AAC => 5632

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_MPEG_RAW_AAC => 5633

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_MPEG_LOAS => 5634

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_NOKIA_MPEG_ADTS_AAC => 5640

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_NOKIA_MPEG_RAW_AAC => 5641

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_VODAFONE_MPEG_ADTS_AAC => 5642

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_VODAFONE_MPEG_RAW_AAC => 5643

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_MPEG_HEAAC => 5648

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_VOXWARE_RT24_SPEECH => 6172

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_SONICFOUNDRY_LOSSLESS => 6513

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_INNINGS_TELECOM_ADPCM => 6521

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_LUCENT_SX8300P => 7175

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_LUCENT_SX5363S => 7180

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_CUSEEME => 7939

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_NTCSOFT_ALF2CM_ACM => 8132

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_DVM => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_DTS2 => 8193

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_MAKEAVIS => 13075

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_DIVIO_MPEG4_AAC => 16707

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_NOKIA_ADAPTIVE_MULTIRATE => 16897

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_DIVIO_G726 => 16963

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_LEAD_SPEECH => 17228

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_LEAD_VORBIS => 22092

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_WAVPACK_AUDIO => 22358

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_ALAC => 27745

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_OGG_VORBIS_MODE_1 => 26447

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_OGG_VORBIS_MODE_2 => 26448

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_OGG_VORBIS_MODE_3 => 26449

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_OGG_VORBIS_MODE_1_PLUS => 26479

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_OGG_VORBIS_MODE_2_PLUS => 26480

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_OGG_VORBIS_MODE_3_PLUS => 26481

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_3COM_NBX => 28672

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_OPUS => 28751

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_FAAD_AAC => 28781

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_AMR_NB => 29537

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_AMR_WB => 29538

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_AMR_WP => 29539

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_GSM_AMR_CBR => 31265

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_GSM_AMR_VBR_SID => 31266

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_COMVERSE_INFOSYS_G723_1 => 41216

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_COMVERSE_INFOSYS_AVQSBC => 41217

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_COMVERSE_INFOSYS_SBC => 41218

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_SYMBOL_G729_A => 41219

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_VOICEAGE_AMR_WB => 41220

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_INGENIENT_G726 => 41221

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_MPEG4_AAC => 41222

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_ENCORE_G726 => 41223

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_ZOLL_ASAO => 41224

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_SPEEX_VOICE => 41225

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_VIANIX_MASC => 41226

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_WM9_SPECTRUM_ANALYZER => 41227

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_WMF_SPECTRUM_ANAYZER => 41228

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_GSM_610 => 41229

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_GSM_620 => 41230

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_GSM_660 => 41231

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_GSM_690 => 41232

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_GSM_ADAPTIVE_MULTIRATE_WB => 41233

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_POLYCOM_G722 => 41234

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_POLYCOM_G728 => 41235

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_POLYCOM_G729_A => 41236

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_POLYCOM_SIREN => 41237

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_GLOBAL_IP_ILBC => 41238

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_RADIOTIME_TIME_SHIFT_RADIO => 41239

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_NICE_ACA => 41240

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_NICE_ADPCM => 41241

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_VOCORD_G721 => 41242

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_VOCORD_G726 => 41243

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_VOCORD_G722_1 => 41244

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_VOCORD_G728 => 41245

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_VOCORD_G729 => 41246

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_VOCORD_G729_A => 41247

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_VOCORD_G723_1 => 41248

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_VOCORD_LBC => 41249

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_NICE_G728 => 41250

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_FRACE_TELECOM_G729 => 41251

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_CODIAN => 41252

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_DOLBY_AC4 => 44096

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_FLAC => 61868

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_DEVELOPMENT => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static ACM_MPEG_LAYER1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ACM_MPEG_LAYER2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ACM_MPEG_LAYER3 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ACM_MPEG_STEREO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ACM_MPEG_JOINTSTEREO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ACM_MPEG_DUALCHANNEL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ACM_MPEG_SINGLECHANNEL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ACM_MPEG_PRIVATEBIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ACM_MPEG_COPYRIGHT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ACM_MPEG_ORIGINALHOME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ACM_MPEG_PROTECTIONBIT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ACM_MPEG_ID_MPEG1 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MPEGLAYER3_WFX_EXTRA_BYTES => 12

    /**
     * @type {Integer (UInt32)}
     */
    static MPEGLAYER3_ID_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MPEGLAYER3_ID_MPEG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MPEGLAYER3_ID_CONSTANTFRAMESIZE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_ACM_WMAUDIO => 39

    /**
     * @type {Integer (UInt32)}
     */
    static WMAUDIO_BITS_PER_SAMPLE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WMAUDIO_MAX_CHANNELS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_ACM_MSAUDIO1 => 39

    /**
     * @type {Integer (UInt32)}
     */
    static MSAUDIO1_BITS_PER_SAMPLE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MSAUDIO1_MAX_CHANNELS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MSFT_ACM_WMAUDIO2 => 101

    /**
     * @type {Integer (UInt32)}
     */
    static WMAUDIO2_BITS_PER_SAMPLE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WMAUDIO2_MAX_CHANNELS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FILTER_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FILTER_DEVELOPMENT => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FILTER_VOLUME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FILTER_ECHO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JPEG_PROCESS_BASELINE => 0

    /**
     * @type {Integer (Int32)}
     */
    static AVIIF_CONTROLFRAME => 512

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_SOF0 => 65472

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_SOF1 => 65473

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_SOF2 => 65474

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_SOF3 => 65475

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_SOF5 => 65477

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_SOF6 => 65478

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_SOF7 => 65479

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_JPG => 65480

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_SOF9 => 65481

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_SOF10 => 65482

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_SOF11 => 65483

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_SOF13 => 65485

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_SOF14 => 65486

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_SOF15 => 65487

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_DHT => 65476

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_DAC => 65484

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_RST0 => 65488

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_RST1 => 65489

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_RST2 => 65490

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_RST3 => 65491

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_RST4 => 65492

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_RST5 => 65493

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_RST6 => 65494

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_RST7 => 65495

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_SOI => 65496

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_EOI => 65497

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_SOS => 65498

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_DQT => 65499

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_DNL => 65500

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_DRI => 65501

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_DHP => 65502

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_EXP => 65503

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_APP0 => 65504

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_APP1 => 65505

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_APP2 => 65506

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_APP3 => 65507

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_APP4 => 65508

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_APP5 => 65509

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_APP6 => 65510

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_APP7 => 65511

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_JPG0 => 65520

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_JPG1 => 65521

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_JPG2 => 65522

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_JPG3 => 65523

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_JPG4 => 65524

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_JPG5 => 65525

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_JPG6 => 65526

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_JPG7 => 65527

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_JPG8 => 65528

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_JPG9 => 65529

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_JPG10 => 65530

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_JPG11 => 65531

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_JPG12 => 65532

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_JPG13 => 65533

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_COM => 65534

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_TEM => 65281

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_RES => 65282

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_00 => 65280

    /**
     * @type {Integer (UInt32)}
     */
    static JIFMK_FF => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static JPEG_Y => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JPEG_YCbCr => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JPEG_RGB => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERCONTROL_CONTROLTYPE_SRS_MTS => 536936454

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERCONTROL_CONTROLTYPE_SRS_ONOFF => 536936455

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERCONTROL_CONTROLTYPE_SRS_SYNTHSELECT => 536936456

    /**
     * @type {Integer (UInt32)}
     */
    static VP_COMMAND_GET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VP_COMMAND_SET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VP_FLAGS_TV_MODE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VP_FLAGS_TV_STANDARD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VP_FLAGS_FLICKER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static VP_FLAGS_OVERSCAN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static VP_FLAGS_MAX_UNSCALED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static VP_FLAGS_POSITION => 32

    /**
     * @type {Integer (UInt32)}
     */
    static VP_FLAGS_BRIGHTNESS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static VP_FLAGS_CONTRAST => 128

    /**
     * @type {Integer (UInt32)}
     */
    static VP_FLAGS_COPYPROTECT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static VP_MODE_WIN_GRAPHICS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VP_MODE_TV_PLAYBACK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VP_TV_STANDARD_NTSC_M => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VP_TV_STANDARD_NTSC_M_J => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VP_TV_STANDARD_PAL_B => 4

    /**
     * @type {Integer (UInt32)}
     */
    static VP_TV_STANDARD_PAL_D => 8

    /**
     * @type {Integer (UInt32)}
     */
    static VP_TV_STANDARD_PAL_H => 16

    /**
     * @type {Integer (UInt32)}
     */
    static VP_TV_STANDARD_PAL_I => 32

    /**
     * @type {Integer (UInt32)}
     */
    static VP_TV_STANDARD_PAL_M => 64

    /**
     * @type {Integer (UInt32)}
     */
    static VP_TV_STANDARD_PAL_N => 128

    /**
     * @type {Integer (UInt32)}
     */
    static VP_TV_STANDARD_SECAM_B => 256

    /**
     * @type {Integer (UInt32)}
     */
    static VP_TV_STANDARD_SECAM_D => 512

    /**
     * @type {Integer (UInt32)}
     */
    static VP_TV_STANDARD_SECAM_G => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static VP_TV_STANDARD_SECAM_H => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static VP_TV_STANDARD_SECAM_K => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static VP_TV_STANDARD_SECAM_K1 => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static VP_TV_STANDARD_SECAM_L => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static VP_TV_STANDARD_WIN_VGA => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static VP_TV_STANDARD_NTSC_433 => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static VP_TV_STANDARD_PAL_G => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static VP_TV_STANDARD_PAL_60 => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static VP_TV_STANDARD_SECAM_L1 => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static VP_CP_TYPE_APS_TRIGGER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VP_CP_TYPE_MACROVISION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VP_CP_CMD_ACTIVATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VP_CP_CMD_DEACTIVATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VP_CP_CMD_CHANGE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ICVERSION => 260

    /**
     * @type {Integer (UInt32)}
     */
    static BI_1632 => 842217009

    /**
     * @type {Integer (Int32)}
     */
    static ICERR_OK => 0

    /**
     * @type {Integer (Int32)}
     */
    static ICERR_DONTDRAW => 1

    /**
     * @type {Integer (Int32)}
     */
    static ICERR_NEWPALETTE => 2

    /**
     * @type {Integer (Int32)}
     */
    static ICERR_GOTOKEYFRAME => 3

    /**
     * @type {Integer (Int32)}
     */
    static ICERR_STOPDRAWING => 4

    /**
     * @type {Integer (Int32)}
     */
    static ICERR_UNSUPPORTED => -1

    /**
     * @type {Integer (Int32)}
     */
    static ICERR_BADFORMAT => -2

    /**
     * @type {Integer (Int32)}
     */
    static ICERR_MEMORY => -3

    /**
     * @type {Integer (Int32)}
     */
    static ICERR_INTERNAL => -4

    /**
     * @type {Integer (Int32)}
     */
    static ICERR_BADFLAGS => -5

    /**
     * @type {Integer (Int32)}
     */
    static ICERR_BADPARAM => -6

    /**
     * @type {Integer (Int32)}
     */
    static ICERR_BADSIZE => -7

    /**
     * @type {Integer (Int32)}
     */
    static ICERR_BADHANDLE => -8

    /**
     * @type {Integer (Int32)}
     */
    static ICERR_CANTUPDATE => -9

    /**
     * @type {Integer (Int32)}
     */
    static ICERR_ABORT => -10

    /**
     * @type {Integer (Int32)}
     */
    static ICERR_ERROR => -100

    /**
     * @type {Integer (Int32)}
     */
    static ICERR_BADBITDEPTH => -200

    /**
     * @type {Integer (Int32)}
     */
    static ICERR_BADIMAGESIZE => -201

    /**
     * @type {Integer (Int32)}
     */
    static ICERR_CUSTOM => -400

    /**
     * @type {Integer (UInt32)}
     */
    static ICMODE_COMPRESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ICMODE_DECOMPRESS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ICMODE_FASTDECOMPRESS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ICMODE_QUERY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ICMODE_FASTCOMPRESS => 5

    /**
     * @type {Integer (UInt32)}
     */
    static ICMODE_DRAW => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ICMODE_INTERNALF_FUNCTION32 => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static ICMODE_INTERNALF_MASK => 32768

    /**
     * @type {Integer (Int32)}
     */
    static AVIIF_TWOCC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ICQUALITY_LOW => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ICQUALITY_HIGH => 10000

    /**
     * @type {Integer (Int32)}
     */
    static ICQUALITY_DEFAULT => -1

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_USER => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_RESERVED_LOW => 20480

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_RESERVED_HIGH => 24576

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_GETSTATE => 20480

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_SETSTATE => 20481

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_GETINFO => 20482

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_CONFIGURE => 20490

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_ABOUT => 20491

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_GETERRORTEXT => 20492

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_GETFORMATNAME => 20500

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_ENUMFORMATS => 20501

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_GETDEFAULTQUALITY => 20510

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_GETQUALITY => 20511

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_SETQUALITY => 20512

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_SET => 20520

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_GET => 20521

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_COMPRESS_GET_FORMAT => 16388

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_COMPRESS_GET_SIZE => 16389

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_COMPRESS_QUERY => 16390

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_COMPRESS_BEGIN => 16391

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_COMPRESS => 16392

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_COMPRESS_END => 16393

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_DECOMPRESS_GET_FORMAT => 16394

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_DECOMPRESS_QUERY => 16395

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_DECOMPRESS_BEGIN => 16396

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_DECOMPRESS => 16397

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_DECOMPRESS_END => 16398

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_DECOMPRESS_SET_PALETTE => 16413

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_DECOMPRESS_GET_PALETTE => 16414

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_DRAW_QUERY => 16415

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_DRAW_BEGIN => 16399

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_DRAW_GET_PALETTE => 16400

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_DRAW_UPDATE => 16401

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_DRAW_START => 16402

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_DRAW_STOP => 16403

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_DRAW_BITS => 16404

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_DRAW_END => 16405

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_DRAW_GETTIME => 16416

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_DRAW => 16417

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_DRAW_WINDOW => 16418

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_DRAW_SETTIME => 16419

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_DRAW_REALIZE => 16420

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_DRAW_FLUSH => 16421

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_DRAW_RENDERBUFFER => 16422

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_DRAW_START_PLAY => 16423

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_DRAW_STOP_PLAY => 16424

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_DRAW_SUGGESTFORMAT => 16434

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_DRAW_CHANGEPALETTE => 16435

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_DRAW_IDLE => 16436

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_GETBUFFERSWANTED => 16425

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_GETDEFAULTKEYFRAMERATE => 16426

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_DECOMPRESSEX_BEGIN => 16444

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_DECOMPRESSEX_QUERY => 16445

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_DECOMPRESSEX => 16446

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_DECOMPRESSEX_END => 16447

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_COMPRESS_FRAMES_INFO => 16454

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_COMPRESS_FRAMES => 16455

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_SET_STATUS_PROC => 16456

    /**
     * @type {Integer (UInt32)}
     */
    static VIDCF_QUALITY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VIDCF_CRUNCH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VIDCF_TEMPORAL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static VIDCF_COMPRESSFRAMES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static VIDCF_DRAW => 16

    /**
     * @type {Integer (UInt32)}
     */
    static VIDCF_FASTTEMPORALC => 32

    /**
     * @type {Integer (UInt32)}
     */
    static VIDCF_FASTTEMPORALD => 128

    /**
     * @type {Integer (Int32)}
     */
    static ICCOMPRESS_KEYFRAME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ICCOMPRESSFRAMES_PADDING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ICSTATUS_START => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ICSTATUS_STATUS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ICSTATUS_END => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ICSTATUS_ERROR => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ICSTATUS_YIELD => 4

    /**
     * @type {Integer (Int32)}
     */
    static ICDECOMPRESS_HURRYUP => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static ICDECOMPRESS_UPDATE => 1073741824

    /**
     * @type {Integer (Int32)}
     */
    static ICDECOMPRESS_PREROLL => 536870912

    /**
     * @type {Integer (Int32)}
     */
    static ICDECOMPRESS_NULLFRAME => 268435456

    /**
     * @type {Integer (Int32)}
     */
    static ICDECOMPRESS_NOTKEYFRAME => 134217728

    /**
     * @type {Integer (Int32)}
     */
    static ICDRAW_QUERY => 1

    /**
     * @type {Integer (Int32)}
     */
    static ICDRAW_FULLSCREEN => 2

    /**
     * @type {Integer (Int32)}
     */
    static ICDRAW_HDC => 4

    /**
     * @type {Integer (Int32)}
     */
    static ICDRAW_ANIMATE => 8

    /**
     * @type {Integer (Int32)}
     */
    static ICDRAW_CONTINUE => 16

    /**
     * @type {Integer (Int32)}
     */
    static ICDRAW_MEMORYDC => 32

    /**
     * @type {Integer (Int32)}
     */
    static ICDRAW_UPDATING => 64

    /**
     * @type {Integer (Int32)}
     */
    static ICDRAW_RENDER => 128

    /**
     * @type {Integer (Int32)}
     */
    static ICDRAW_BUFFER => 256

    /**
     * @type {Integer (Int32)}
     */
    static ICDRAW_HURRYUP => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static ICDRAW_UPDATE => 1073741824

    /**
     * @type {Integer (Int32)}
     */
    static ICDRAW_PREROLL => 536870912

    /**
     * @type {Integer (Int32)}
     */
    static ICDRAW_NULLFRAME => 268435456

    /**
     * @type {Integer (Int32)}
     */
    static ICDRAW_NOTKEYFRAME => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static ICINSTALL_UNICODE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static ICINSTALL_FUNCTION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ICINSTALL_DRIVER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ICINSTALL_HDRV => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ICINSTALL_DRIVERW => 32770

    /**
     * @type {Integer (UInt32)}
     */
    static ICMF_CONFIGURE_QUERY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ICMF_ABOUT_QUERY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ICMF_COMPVARS_VALID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ICMF_CHOOSE_KEYFRAME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ICMF_CHOOSE_DATARATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ICMF_CHOOSE_PREVIEW => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ICMF_CHOOSE_ALLCOMPRESSORS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DDF_0001 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DDF_UPDATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DDF_SAME_HDC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DDF_SAME_DRAW => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DDF_DONTDRAW => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DDF_ANIMATE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DDF_BUFFER => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DDF_JUSTDRAWIT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DDF_FULLSCREEN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DDF_BACKGROUNDPAL => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DDF_NOTKEYFRAME => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DDF_HURRYUP => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static DDF_HALFTONE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DDF_2000 => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static DDF_PREROLL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DDF_SAME_DIB => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DDF_SAME_SIZE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PD_CAN_DRAW_DIB => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PD_CAN_STRETCHDIB => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PD_STRETCHDIB_1_1_OK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PD_STRETCHDIB_1_2_OK => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PD_STRETCHDIB_1_N_OK => 16

    /**
     * @type {Integer (UInt32)}
     */
    static AVIGETFRAMEF_BESTDISPLAYFMT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AVISTREAMINFO_DISABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AVISTREAMINFO_FORMATCHANGES => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static AVIFILEINFO_HASINDEX => 16

    /**
     * @type {Integer (UInt32)}
     */
    static AVIFILEINFO_MUSTUSEINDEX => 32

    /**
     * @type {Integer (UInt32)}
     */
    static AVIFILEINFO_ISINTERLEAVED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static AVIFILEINFO_WASCAPTUREFILE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static AVIFILEINFO_COPYRIGHTED => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static AVIFILECAPS_CANREAD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AVIFILECAPS_CANWRITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AVIFILECAPS_ALLKEYFRAMES => 16

    /**
     * @type {Integer (UInt32)}
     */
    static AVIFILECAPS_NOCOMPRESSION => 32

    /**
     * @type {Integer (UInt32)}
     */
    static AVICOMPRESSF_INTERLEAVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AVICOMPRESSF_DATARATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AVICOMPRESSF_KEYFRAMES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static AVICOMPRESSF_VALID => 8

    /**
     * @type {String}
     */
    static CLSID_AVISimpleUnMarshal => "{00020009-0000-0000-c000-000000000046}"

    /**
     * @type {String}
     */
    static CLSID_AVIFile => "{00020000-0000-0000-c000-000000000046}"

    /**
     * @type {Integer (UInt32)}
     */
    static AVIFILEHANDLER_CANREAD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AVIFILEHANDLER_CANWRITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AVIFILEHANDLER_CANACCEPTNONRGB => 4

    /**
     * @type {Integer (Int32)}
     */
    static AVISTREAMREAD_CONVENIENT => -1

    /**
     * @type {Integer (Int32)}
     */
    static FIND_DIR => 15

    /**
     * @type {Integer (Int32)}
     */
    static FIND_NEXT => 1

    /**
     * @type {Integer (Int32)}
     */
    static FIND_PREV => 4

    /**
     * @type {Integer (Int32)}
     */
    static FIND_FROM_START => 8

    /**
     * @type {Integer (Int32)}
     */
    static FIND_TYPE => 240

    /**
     * @type {Integer (Int32)}
     */
    static FIND_KEY => 16

    /**
     * @type {Integer (Int32)}
     */
    static FIND_ANY => 32

    /**
     * @type {Integer (Int32)}
     */
    static FIND_FORMAT => 64

    /**
     * @type {Integer (Int32)}
     */
    static FIND_RET => 61440

    /**
     * @type {Integer (Int32)}
     */
    static FIND_POS => 0

    /**
     * @type {Integer (Int32)}
     */
    static FIND_LENGTH => 4096

    /**
     * @type {Integer (Int32)}
     */
    static FIND_OFFSET => 8192

    /**
     * @type {Integer (Int32)}
     */
    static FIND_SIZE => 12288

    /**
     * @type {Integer (Int32)}
     */
    static FIND_INDEX => 16384

    /**
     * @type {Integer (Int32)}
     */
    static SEARCH_NEAREST => 4

    /**
     * @type {Integer (Int32)}
     */
    static SEARCH_BACKWARD => 4

    /**
     * @type {Integer (Int32)}
     */
    static SEARCH_FORWARD => 1

    /**
     * @type {Integer (Int32)}
     */
    static SEARCH_KEY => 16

    /**
     * @type {Integer (Int32)}
     */
    static SEARCH_ANY => 32

    /**
     * @type {Integer (Int32)}
     */
    static AVIERR_OK => 0

    /**
     * @type {String}
     */
    static MCIWND_WINDOW_CLASS => "MCIWndClass"

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDOPENF_NEW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDF_NOAUTOSIZEWINDOW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDF_NOPLAYBAR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDF_NOAUTOSIZEMOVIE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDF_NOMENU => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDF_SHOWNAME => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDF_SHOWPOS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDF_SHOWMODE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDF_SHOWALL => 112

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDF_NOTIFYMODE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDF_NOTIFYPOS => 512

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDF_NOTIFYSIZE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDF_NOTIFYERROR => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDF_NOTIFYALL => 7936

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDF_NOTIFYANSI => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDF_NOTIFYMEDIAA => 2176

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDF_NOTIFYMEDIAW => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDF_NOTIFYMEDIA => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDF_RECORD => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDF_NOERRORDLG => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDF_NOOPEN => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_GETDEVICEID => 1124

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_GETSTART => 1127

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_GETLENGTH => 1128

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_GETEND => 1129

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_EJECT => 1131

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_SETZOOM => 1132

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_GETZOOM => 1133

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_SETVOLUME => 1134

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_GETVOLUME => 1135

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_SETSPEED => 1136

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_GETSPEED => 1137

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_SETREPEAT => 1138

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_GETREPEAT => 1139

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_REALIZE => 1142

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_VALIDATEMEDIA => 1145

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_PLAYFROM => 1146

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_PLAYTO => 1147

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_GETPALETTE => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_SETPALETTE => 1151

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_SETTIMERS => 1153

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_SETACTIVETIMER => 1154

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_SETINACTIVETIMER => 1155

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_GETACTIVETIMER => 1156

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_GETINACTIVETIMER => 1157

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_CHANGESTYLES => 1159

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_GETSTYLES => 1160

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_GETALIAS => 1161

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_PLAYREVERSE => 1163

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_GET_SOURCE => 1164

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_PUT_SOURCE => 1165

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_GET_DEST => 1166

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_PUT_DEST => 1167

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_CAN_PLAY => 1168

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_CAN_WINDOW => 1169

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_CAN_RECORD => 1170

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_CAN_SAVE => 1171

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_CAN_EJECT => 1172

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_CAN_CONFIG => 1173

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_PALETTEKICK => 1174

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_OPENINTERFACE => 1175

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_SETOWNER => 1176

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_SENDSTRINGA => 1125

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_GETPOSITIONA => 1126

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_GETMODEA => 1130

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_SETTIMEFORMATA => 1143

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_GETTIMEFORMATA => 1144

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_GETFILENAMEA => 1148

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_GETDEVICEA => 1149

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_GETERRORA => 1152

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_NEWA => 1158

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_RETURNSTRINGA => 1162

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_OPENA => 1177

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_SENDSTRINGW => 1225

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_GETPOSITIONW => 1226

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_GETMODEW => 1230

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_SETTIMEFORMATW => 1243

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_GETTIMEFORMATW => 1244

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_GETFILENAMEW => 1248

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_GETDEVICEW => 1249

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_GETERRORW => 1252

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_NEWW => 1258

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_RETURNSTRINGW => 1262

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_OPENW => 1276

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_SENDSTRING => 1225

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_GETPOSITION => 1226

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_GETMODE => 1230

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_SETTIMEFORMAT => 1243

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_GETTIMEFORMAT => 1244

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_GETFILENAME => 1248

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_GETDEVICE => 1249

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_GETERROR => 1252

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_NEW => 1258

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_RETURNSTRING => 1262

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_OPEN => 1276

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_NOTIFYMODE => 1224

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_NOTIFYPOS => 1225

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_NOTIFYSIZE => 1226

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_NOTIFYMEDIA => 1227

    /**
     * @type {Integer (UInt32)}
     */
    static MCIWNDM_NOTIFYERROR => 1229

    /**
     * @type {Integer (Int32)}
     */
    static MCIWND_START => -1

    /**
     * @type {Integer (Int32)}
     */
    static MCIWND_END => -2

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_OPEN => 2051

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_CLOSE => 2052

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_PLAY => 2054

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_SEEK => 2055

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_STOP => 2056

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_PAUSE => 2057

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_STEP => 2062

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_RECORD => 2063

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_SAVE => 2067

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_CUT => 2129

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_COPY => 2130

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_PASTE => 2131

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_RESUME => 2133

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_DELETE => 2134

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_MODE_NOT_READY => 524

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_MODE_STOP => 525

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_MODE_PLAY => 526

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_MODE_RECORD => 527

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_MODE_SEEK => 528

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_MODE_PAUSE => 529

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_MODE_OPEN => 530

    /**
     * @type {Integer (UInt32)}
     */
    static DV_ERR_OK => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DV_ERR_BASE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DV_ERR_NONSPECIFIC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DV_ERR_BADFORMAT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DV_ERR_STILLPLAYING => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DV_ERR_UNPREPARED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DV_ERR_SYNC => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DV_ERR_TOOMANYCHANNELS => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DV_ERR_NOTDETECTED => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DV_ERR_BADINSTALL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DV_ERR_CREATEPALETTE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DV_ERR_SIZEFIELD => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DV_ERR_PARAM1 => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DV_ERR_PARAM2 => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DV_ERR_CONFIG1 => 13

    /**
     * @type {Integer (UInt32)}
     */
    static DV_ERR_CONFIG2 => 14

    /**
     * @type {Integer (UInt32)}
     */
    static DV_ERR_FLAGS => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DV_ERR_13 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DV_ERR_NOTSUPPORTED => 17

    /**
     * @type {Integer (UInt32)}
     */
    static DV_ERR_NOMEM => 18

    /**
     * @type {Integer (UInt32)}
     */
    static DV_ERR_ALLOCATED => 19

    /**
     * @type {Integer (UInt32)}
     */
    static DV_ERR_BADDEVICEID => 20

    /**
     * @type {Integer (UInt32)}
     */
    static DV_ERR_INVALHANDLE => 21

    /**
     * @type {Integer (UInt32)}
     */
    static DV_ERR_BADERRNUM => 22

    /**
     * @type {Integer (UInt32)}
     */
    static DV_ERR_NO_BUFFERS => 23

    /**
     * @type {Integer (UInt32)}
     */
    static DV_ERR_MEM_CONFLICT => 24

    /**
     * @type {Integer (UInt32)}
     */
    static DV_ERR_IO_CONFLICT => 25

    /**
     * @type {Integer (UInt32)}
     */
    static DV_ERR_DMA_CONFLICT => 26

    /**
     * @type {Integer (UInt32)}
     */
    static DV_ERR_INT_CONFLICT => 27

    /**
     * @type {Integer (UInt32)}
     */
    static DV_ERR_PROTECT_ONLY => 28

    /**
     * @type {Integer (UInt32)}
     */
    static DV_ERR_LASTERROR => 28

    /**
     * @type {Integer (UInt32)}
     */
    static DV_ERR_USER_MSG => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DV_VM_OPEN => 976

    /**
     * @type {Integer (UInt32)}
     */
    static DV_VM_CLOSE => 977

    /**
     * @type {Integer (UInt32)}
     */
    static DV_VM_DATA => 978

    /**
     * @type {Integer (UInt32)}
     */
    static DV_VM_ERROR => 979

    /**
     * @type {Integer (UInt32)}
     */
    static VHDR_DONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VHDR_PREPARED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VHDR_INQUEUE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static VHDR_KEYFRAME => 8

    /**
     * @type {Integer (UInt32)}
     */
    static VHDR_VALID => 15

    /**
     * @type {Integer (UInt32)}
     */
    static VCAPS_OVERLAY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VCAPS_SRC_CAN_CLIP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VCAPS_DST_CAN_CLIP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static VCAPS_CAN_SCALE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static VIDEO_EXTERNALIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VIDEO_EXTERNALOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VIDEO_IN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static VIDEO_OUT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static VIDEO_DLG_QUERY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static VIDEO_CONFIGURE_QUERY => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static VIDEO_CONFIGURE_SET => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static VIDEO_CONFIGURE_GET => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static VIDEO_CONFIGURE_QUERYSIZE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VIDEO_CONFIGURE_CURRENT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static VIDEO_CONFIGURE_NOMINAL => 32

    /**
     * @type {Integer (UInt32)}
     */
    static VIDEO_CONFIGURE_MIN => 64

    /**
     * @type {Integer (UInt32)}
     */
    static VIDEO_CONFIGURE_MAX => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DVM_USER => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static DVM_CONFIGURE_START => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DVM_CONFIGURE_END => 8191

    /**
     * @type {Integer (UInt32)}
     */
    static DVM_PALETTE => 4097

    /**
     * @type {Integer (UInt32)}
     */
    static DVM_FORMAT => 4098

    /**
     * @type {Integer (UInt32)}
     */
    static DVM_PALETTERGB555 => 4099

    /**
     * @type {Integer (UInt32)}
     */
    static DVM_SRC_RECT => 4100

    /**
     * @type {Integer (UInt32)}
     */
    static DVM_DST_RECT => 4101

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_UNICODE_START => 1124

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_GET_CAPSTREAMPTR => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_SET_CALLBACK_ERRORW => 1126

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_SET_CALLBACK_STATUSW => 1127

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_SET_CALLBACK_ERRORA => 1026

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_SET_CALLBACK_STATUSA => 1027

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_SET_CALLBACK_ERROR => 1126

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_SET_CALLBACK_STATUS => 1127

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_SET_CALLBACK_YIELD => 1028

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_SET_CALLBACK_FRAME => 1029

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_SET_CALLBACK_VIDEOSTREAM => 1030

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_SET_CALLBACK_WAVESTREAM => 1031

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_GET_USER_DATA => 1032

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_SET_USER_DATA => 1033

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_DRIVER_CONNECT => 1034

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_DRIVER_DISCONNECT => 1035

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_DRIVER_GET_NAMEA => 1036

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_DRIVER_GET_VERSIONA => 1037

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_DRIVER_GET_NAMEW => 1136

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_DRIVER_GET_VERSIONW => 1137

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_DRIVER_GET_NAME => 1136

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_DRIVER_GET_VERSION => 1137

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_DRIVER_GET_CAPS => 1038

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_FILE_SET_CAPTURE_FILEA => 1044

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_FILE_GET_CAPTURE_FILEA => 1045

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_FILE_SAVEASA => 1047

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_FILE_SAVEDIBA => 1049

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_FILE_SET_CAPTURE_FILEW => 1144

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_FILE_GET_CAPTURE_FILEW => 1145

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_FILE_SAVEASW => 1147

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_FILE_SAVEDIBW => 1149

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_FILE_SET_CAPTURE_FILE => 1144

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_FILE_GET_CAPTURE_FILE => 1145

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_FILE_SAVEAS => 1147

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_FILE_SAVEDIB => 1149

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_FILE_ALLOCATE => 1046

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_FILE_SET_INFOCHUNK => 1048

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_EDIT_COPY => 1054

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_SET_AUDIOFORMAT => 1059

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_GET_AUDIOFORMAT => 1060

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_DLG_VIDEOFORMAT => 1065

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_DLG_VIDEOSOURCE => 1066

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_DLG_VIDEODISPLAY => 1067

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_GET_VIDEOFORMAT => 1068

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_SET_VIDEOFORMAT => 1069

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_DLG_VIDEOCOMPRESSION => 1070

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_SET_PREVIEW => 1074

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_SET_OVERLAY => 1075

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_SET_PREVIEWRATE => 1076

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_SET_SCALE => 1077

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_GET_STATUS => 1078

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_SET_SCROLL => 1079

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_GRAB_FRAME => 1084

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_GRAB_FRAME_NOSTOP => 1085

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_SEQUENCE => 1086

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_SEQUENCE_NOFILE => 1087

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_SET_SEQUENCE_SETUP => 1088

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_GET_SEQUENCE_SETUP => 1089

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_SET_MCI_DEVICEA => 1090

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_GET_MCI_DEVICEA => 1091

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_SET_MCI_DEVICEW => 1190

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_GET_MCI_DEVICEW => 1191

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_SET_MCI_DEVICE => 1190

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_GET_MCI_DEVICE => 1191

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_STOP => 1092

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_ABORT => 1093

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_SINGLE_FRAME_OPEN => 1094

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_SINGLE_FRAME_CLOSE => 1095

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_SINGLE_FRAME => 1096

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_PAL_OPENA => 1104

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_PAL_SAVEA => 1105

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_PAL_OPENW => 1204

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_PAL_SAVEW => 1205

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_PAL_OPEN => 1204

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_PAL_SAVE => 1205

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_PAL_PASTE => 1106

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_PAL_AUTOCREATE => 1107

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_PAL_MANUALCREATE => 1108

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_SET_CALLBACK_CAPCONTROL => 1109

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_UNICODE_END => 1205

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CAP_END => 1205

    /**
     * @type {Integer (UInt32)}
     */
    static AVSTREAMMASTER_AUDIO => 0

    /**
     * @type {Integer (UInt32)}
     */
    static AVSTREAMMASTER_NONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CONTROLCALLBACK_PREROLL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CONTROLCALLBACK_CAPTURING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_BEGIN => 300

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_END => 301

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_INFO => 401

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_OUTOFMEM => 402

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_FILEEXISTS => 403

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_ERRORPALOPEN => 404

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_ERRORPALSAVE => 405

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_ERRORDIBSAVE => 406

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_DEFAVIEXT => 407

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_DEFPALEXT => 408

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_CANTOPEN => 409

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_SEQ_MSGSTART => 410

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_SEQ_MSGSTOP => 411

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_VIDEDITERR => 412

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_READONLYFILE => 413

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_WRITEERROR => 414

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_NODISKSPACE => 415

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_SETFILESIZE => 416

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_SAVEASPERCENT => 417

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_DRIVER_ERROR => 418

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_WAVE_OPEN_ERROR => 419

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_WAVE_ALLOC_ERROR => 420

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_WAVE_PREPARE_ERROR => 421

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_WAVE_ADD_ERROR => 422

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_WAVE_SIZE_ERROR => 423

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_VIDEO_OPEN_ERROR => 424

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_VIDEO_ALLOC_ERROR => 425

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_VIDEO_PREPARE_ERROR => 426

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_VIDEO_ADD_ERROR => 427

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_VIDEO_SIZE_ERROR => 428

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_FILE_OPEN_ERROR => 429

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_FILE_WRITE_ERROR => 430

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_RECORDING_ERROR => 431

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_RECORDING_ERROR2 => 432

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_AVI_INIT_ERROR => 433

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_NO_FRAME_CAP_ERROR => 434

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_NO_PALETTE_WARN => 435

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_MCI_CONTROL_ERROR => 436

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_MCI_CANT_STEP_ERROR => 437

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_NO_AUDIO_CAP_ERROR => 438

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_AVI_DRAWDIB_ERROR => 439

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_COMPRESSOR_ERROR => 440

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_AUDIO_DROP_ERROR => 441

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_AUDIO_DROP_COMPERROR => 442

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_STAT_LIVE_MODE => 500

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_STAT_OVERLAY_MODE => 501

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_STAT_CAP_INIT => 502

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_STAT_CAP_FINI => 503

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_STAT_PALETTE_BUILD => 504

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_STAT_OPTPAL_BUILD => 505

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_STAT_I_FRAMES => 506

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_STAT_L_FRAMES => 507

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_STAT_CAP_L_FRAMES => 508

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_STAT_CAP_AUDIO => 509

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_STAT_VIDEOCURRENT => 510

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_STAT_VIDEOAUDIO => 511

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_STAT_VIDEOONLY => 512

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CAP_STAT_FRAMESDROPPED => 513

    /**
     * @type {Integer (UInt32)}
     */
    static JOYERR_NOERROR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static JOYERR_PARMS => 165

    /**
     * @type {Integer (UInt32)}
     */
    static JOYERR_NOCANDO => 166

    /**
     * @type {Integer (UInt32)}
     */
    static JOYERR_UNPLUGGED => 167

    /**
     * @type {Integer (UInt32)}
     */
    static JOY_BUTTON1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JOY_BUTTON2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JOY_BUTTON3 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JOY_BUTTON4 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JOY_BUTTON1CHG => 256

    /**
     * @type {Integer (UInt32)}
     */
    static JOY_BUTTON2CHG => 512

    /**
     * @type {Integer (UInt32)}
     */
    static JOY_BUTTON3CHG => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static JOY_BUTTON4CHG => 2048

    /**
     * @type {Integer (Int32)}
     */
    static JOY_BUTTON5 => 16

    /**
     * @type {Integer (Int32)}
     */
    static JOY_BUTTON6 => 32

    /**
     * @type {Integer (Int32)}
     */
    static JOY_BUTTON7 => 64

    /**
     * @type {Integer (Int32)}
     */
    static JOY_BUTTON8 => 128

    /**
     * @type {Integer (Int32)}
     */
    static JOY_BUTTON9 => 256

    /**
     * @type {Integer (Int32)}
     */
    static JOY_BUTTON10 => 512

    /**
     * @type {Integer (Int32)}
     */
    static JOY_BUTTON11 => 1024

    /**
     * @type {Integer (Int32)}
     */
    static JOY_BUTTON12 => 2048

    /**
     * @type {Integer (Int32)}
     */
    static JOY_BUTTON13 => 4096

    /**
     * @type {Integer (Int32)}
     */
    static JOY_BUTTON14 => 8192

    /**
     * @type {Integer (Int32)}
     */
    static JOY_BUTTON15 => 16384

    /**
     * @type {Integer (Int32)}
     */
    static JOY_BUTTON16 => 32768

    /**
     * @type {Integer (Int32)}
     */
    static JOY_BUTTON17 => 65536

    /**
     * @type {Integer (Int32)}
     */
    static JOY_BUTTON18 => 131072

    /**
     * @type {Integer (Int32)}
     */
    static JOY_BUTTON19 => 262144

    /**
     * @type {Integer (Int32)}
     */
    static JOY_BUTTON20 => 524288

    /**
     * @type {Integer (Int32)}
     */
    static JOY_BUTTON21 => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static JOY_BUTTON22 => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static JOY_BUTTON23 => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static JOY_BUTTON24 => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static JOY_BUTTON25 => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static JOY_BUTTON26 => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static JOY_BUTTON27 => 67108864

    /**
     * @type {Integer (Int32)}
     */
    static JOY_BUTTON28 => 134217728

    /**
     * @type {Integer (Int32)}
     */
    static JOY_BUTTON29 => 268435456

    /**
     * @type {Integer (Int32)}
     */
    static JOY_BUTTON30 => 536870912

    /**
     * @type {Integer (Int32)}
     */
    static JOY_BUTTON31 => 1073741824

    /**
     * @type {Integer (Int32)}
     */
    static JOY_BUTTON32 => -2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static JOY_POVFORWARD => 0

    /**
     * @type {Integer (UInt32)}
     */
    static JOY_POVRIGHT => 9000

    /**
     * @type {Integer (UInt32)}
     */
    static JOY_POVBACKWARD => 18000

    /**
     * @type {Integer (UInt32)}
     */
    static JOY_POVLEFT => 27000

    /**
     * @type {Integer (Int32)}
     */
    static JOY_RETURNX => 1

    /**
     * @type {Integer (Int32)}
     */
    static JOY_RETURNY => 2

    /**
     * @type {Integer (Int32)}
     */
    static JOY_RETURNZ => 4

    /**
     * @type {Integer (Int32)}
     */
    static JOY_RETURNR => 8

    /**
     * @type {Integer (Int32)}
     */
    static JOY_RETURNU => 16

    /**
     * @type {Integer (Int32)}
     */
    static JOY_RETURNV => 32

    /**
     * @type {Integer (Int32)}
     */
    static JOY_RETURNPOV => 64

    /**
     * @type {Integer (Int32)}
     */
    static JOY_RETURNBUTTONS => 128

    /**
     * @type {Integer (Int32)}
     */
    static JOY_RETURNRAWDATA => 256

    /**
     * @type {Integer (Int32)}
     */
    static JOY_RETURNPOVCTS => 512

    /**
     * @type {Integer (Int32)}
     */
    static JOY_RETURNCENTERED => 1024

    /**
     * @type {Integer (Int32)}
     */
    static JOY_USEDEADZONE => 2048

    /**
     * @type {Integer (Int32)}
     */
    static JOY_CAL_READALWAYS => 65536

    /**
     * @type {Integer (Int32)}
     */
    static JOY_CAL_READXYONLY => 131072

    /**
     * @type {Integer (Int32)}
     */
    static JOY_CAL_READ3 => 262144

    /**
     * @type {Integer (Int32)}
     */
    static JOY_CAL_READ4 => 524288

    /**
     * @type {Integer (Int32)}
     */
    static JOY_CAL_READXONLY => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static JOY_CAL_READYONLY => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static JOY_CAL_READ5 => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static JOY_CAL_READ6 => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static JOY_CAL_READZONLY => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static JOY_CAL_READRONLY => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static JOY_CAL_READUONLY => 67108864

    /**
     * @type {Integer (Int32)}
     */
    static JOY_CAL_READVONLY => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static JOYSTICKID1 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static JOYSTICKID2 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JOYCAPS_HASZ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JOYCAPS_HASR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JOYCAPS_HASU => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JOYCAPS_HASV => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JOYCAPS_HASPOV => 16

    /**
     * @type {Integer (UInt32)}
     */
    static JOYCAPS_POV4DIR => 32

    /**
     * @type {Integer (UInt32)}
     */
    static JOYCAPS_POVCTS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DRV_LOAD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DRV_ENABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DRV_OPEN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DRV_CLOSE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DRV_DISABLE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DRV_FREE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DRV_CONFIGURE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DRV_QUERYCONFIGURE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DRV_INSTALL => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DRV_REMOVE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DRV_RESERVED => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static DRV_USER => 16384

    /**
     * @type {String}
     */
    static DRIVERS_SECTION => "DRIVERS32"

    /**
     * @type {String}
     */
    static MCI_SECTION => "MCI32"

    /**
     * @type {Integer (UInt32)}
     */
    static DCB_NOSWITCH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DCB_TYPEMASK => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DCB_NULL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DCB_WINDOW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DCB_TASK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DCB_FUNCTION => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DCB_EVENT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DRVM_INIT => 100

    /**
     * @type {Integer (UInt32)}
     */
    static DRVM_EXIT => 101

    /**
     * @type {Integer (UInt32)}
     */
    static DRVM_DISABLE => 102

    /**
     * @type {Integer (UInt32)}
     */
    static DRVM_ENABLE => 103

    /**
     * @type {Integer (UInt32)}
     */
    static DRVM_INIT_EX => 104

    /**
     * @type {Integer (UInt32)}
     */
    static DRVM_USER => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static DRVM_MAPPER_RECONFIGURE => 8193

    /**
     * @type {Integer (UInt32)}
     */
    static DRVM_MAPPER_PREFERRED_GET => 8213

    /**
     * @type {Integer (UInt32)}
     */
    static DRVM_MAPPER_CONSOLEVOICECOM_GET => 8215

    /**
     * @type {Integer (UInt32)}
     */
    static DRV_QUERYDEVNODE => 2050

    /**
     * @type {Integer (UInt32)}
     */
    static DRV_QUERYMAPPABLE => 2053

    /**
     * @type {Integer (UInt32)}
     */
    static DRV_QUERYMODULE => 2057

    /**
     * @type {Integer (UInt32)}
     */
    static DRV_PNPINSTALL => 2059

    /**
     * @type {Integer (UInt32)}
     */
    static DRV_QUERYDEVICEINTERFACE => 2060

    /**
     * @type {Integer (UInt32)}
     */
    static DRV_QUERYDEVICEINTERFACESIZE => 2061

    /**
     * @type {Integer (UInt32)}
     */
    static DRV_QUERYSTRINGID => 2062

    /**
     * @type {Integer (UInt32)}
     */
    static DRV_QUERYSTRINGIDSIZE => 2063

    /**
     * @type {Integer (UInt32)}
     */
    static DRV_QUERYIDFROMSTRINGID => 2064

    /**
     * @type {Integer (UInt32)}
     */
    static DRV_QUERYFUNCTIONINSTANCEID => 2065

    /**
     * @type {Integer (UInt32)}
     */
    static DRV_QUERYFUNCTIONINSTANCEIDSIZE => 2066

    /**
     * @type {Integer (UInt32)}
     */
    static DRVM_MAPPER_PREFERRED_FLAGS_PREFERREDONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DRVM_IOCTL => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DRVM_ADD_THRU => 257

    /**
     * @type {Integer (UInt32)}
     */
    static DRVM_REMOVE_THRU => 258

    /**
     * @type {Integer (UInt32)}
     */
    static DRVM_IOCTL_LAST => 261

    /**
     * @type {Integer (Int32)}
     */
    static DRVM_IOCTL_CMD_USER => 0

    /**
     * @type {Integer (Int32)}
     */
    static DRVM_IOCTL_CMD_SYSTEM => -2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static VADMAD_Device_ID => 1092

    /**
     * @type {Integer (UInt32)}
     */
    static WODM_INIT => 100

    /**
     * @type {Integer (UInt32)}
     */
    static WIDM_INIT => 100

    /**
     * @type {Integer (UInt32)}
     */
    static WODM_INIT_EX => 104

    /**
     * @type {Integer (UInt32)}
     */
    static WIDM_INIT_EX => 104

    /**
     * @type {Integer (UInt32)}
     */
    static WODM_GETNUMDEVS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WODM_GETDEVCAPS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WODM_OPEN => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WODM_CLOSE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WODM_PREPARE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WODM_UNPREPARE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WODM_WRITE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static WODM_PAUSE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static WODM_RESTART => 11

    /**
     * @type {Integer (UInt32)}
     */
    static WODM_RESET => 12

    /**
     * @type {Integer (UInt32)}
     */
    static WODM_GETPOS => 13

    /**
     * @type {Integer (UInt32)}
     */
    static WODM_GETPITCH => 14

    /**
     * @type {Integer (UInt32)}
     */
    static WODM_SETPITCH => 15

    /**
     * @type {Integer (UInt32)}
     */
    static WODM_GETVOLUME => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WODM_SETVOLUME => 17

    /**
     * @type {Integer (UInt32)}
     */
    static WODM_GETPLAYBACKRATE => 18

    /**
     * @type {Integer (UInt32)}
     */
    static WODM_SETPLAYBACKRATE => 19

    /**
     * @type {Integer (UInt32)}
     */
    static WODM_BREAKLOOP => 20

    /**
     * @type {Integer (UInt32)}
     */
    static WODM_PREFERRED => 21

    /**
     * @type {Integer (UInt32)}
     */
    static WODM_BUSY => 21

    /**
     * @type {Integer (UInt32)}
     */
    static WIDM_GETNUMDEVS => 50

    /**
     * @type {Integer (UInt32)}
     */
    static WIDM_GETDEVCAPS => 51

    /**
     * @type {Integer (UInt32)}
     */
    static WIDM_OPEN => 52

    /**
     * @type {Integer (UInt32)}
     */
    static WIDM_CLOSE => 53

    /**
     * @type {Integer (UInt32)}
     */
    static WIDM_PREPARE => 54

    /**
     * @type {Integer (UInt32)}
     */
    static WIDM_UNPREPARE => 55

    /**
     * @type {Integer (UInt32)}
     */
    static WIDM_ADDBUFFER => 56

    /**
     * @type {Integer (UInt32)}
     */
    static WIDM_START => 57

    /**
     * @type {Integer (UInt32)}
     */
    static WIDM_STOP => 58

    /**
     * @type {Integer (UInt32)}
     */
    static WIDM_RESET => 59

    /**
     * @type {Integer (UInt32)}
     */
    static WIDM_GETPOS => 60

    /**
     * @type {Integer (UInt32)}
     */
    static WIDM_PREFERRED => 61

    /**
     * @type {Integer (Int32)}
     */
    static MIDI_IO_PACKED => 0

    /**
     * @type {Integer (Int32)}
     */
    static MIDI_IO_COOKED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MODM_GETNUMDEVS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MODM_GETDEVCAPS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MODM_OPEN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MODM_CLOSE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MODM_PREPARE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MODM_UNPREPARE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MODM_DATA => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MODM_LONGDATA => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MODM_RESET => 9

    /**
     * @type {Integer (UInt32)}
     */
    static MODM_GETVOLUME => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MODM_SETVOLUME => 11

    /**
     * @type {Integer (UInt32)}
     */
    static MODM_CACHEPATCHES => 12

    /**
     * @type {Integer (UInt32)}
     */
    static MODM_CACHEDRUMPATCHES => 13

    /**
     * @type {Integer (UInt32)}
     */
    static MODM_STRMDATA => 14

    /**
     * @type {Integer (UInt32)}
     */
    static MODM_GETPOS => 17

    /**
     * @type {Integer (UInt32)}
     */
    static MODM_PAUSE => 18

    /**
     * @type {Integer (UInt32)}
     */
    static MODM_RESTART => 19

    /**
     * @type {Integer (UInt32)}
     */
    static MODM_STOP => 20

    /**
     * @type {Integer (UInt32)}
     */
    static MODM_PROPERTIES => 21

    /**
     * @type {Integer (UInt32)}
     */
    static MODM_PREFERRED => 22

    /**
     * @type {Integer (UInt32)}
     */
    static MODM_RECONFIGURE => 18280

    /**
     * @type {Integer (UInt32)}
     */
    static MIDM_GETNUMDEVS => 53

    /**
     * @type {Integer (UInt32)}
     */
    static MIDM_GETDEVCAPS => 54

    /**
     * @type {Integer (UInt32)}
     */
    static MIDM_OPEN => 55

    /**
     * @type {Integer (UInt32)}
     */
    static MIDM_CLOSE => 56

    /**
     * @type {Integer (UInt32)}
     */
    static MIDM_PREPARE => 57

    /**
     * @type {Integer (UInt32)}
     */
    static MIDM_UNPREPARE => 58

    /**
     * @type {Integer (UInt32)}
     */
    static MIDM_ADDBUFFER => 59

    /**
     * @type {Integer (UInt32)}
     */
    static MIDM_START => 60

    /**
     * @type {Integer (UInt32)}
     */
    static MIDM_STOP => 61

    /**
     * @type {Integer (UInt32)}
     */
    static MIDM_RESET => 62

    /**
     * @type {Integer (UInt32)}
     */
    static AUXM_INIT => 100

    /**
     * @type {Integer (UInt32)}
     */
    static AUXM_INIT_EX => 104

    /**
     * @type {Integer (UInt32)}
     */
    static AUXDM_GETNUMDEVS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static AUXDM_GETDEVCAPS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static AUXDM_GETVOLUME => 5

    /**
     * @type {Integer (UInt32)}
     */
    static AUXDM_SETVOLUME => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MXDM_INIT => 100

    /**
     * @type {Integer (UInt32)}
     */
    static MXDM_INIT_EX => 104

    /**
     * @type {Integer (UInt32)}
     */
    static MXDM_USER => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static MXDM_BASE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MXDM_GETNUMDEVS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MXDM_GETDEVCAPS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MXDM_OPEN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MXDM_CLOSE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MXDM_GETLINEINFO => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MXDM_GETLINECONTROLS => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MXDM_GETCONTROLDETAILS => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MXDM_SETCONTROLDETAILS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TDD_KILLTIMEREVENT => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static TDD_SETTIMEREVENT => 2052

    /**
     * @type {Integer (UInt32)}
     */
    static TDD_GETSYSTEMTIME => 2056

    /**
     * @type {Integer (UInt32)}
     */
    static TDD_GETDEVCAPS => 2060

    /**
     * @type {Integer (UInt32)}
     */
    static TDD_BEGINMINPERIOD => 2064

    /**
     * @type {Integer (UInt32)}
     */
    static TDD_ENDMINPERIOD => 2068

    /**
     * @type {String}
     */
    static JOY_CONFIGCHANGED_MSGSTRING => "MSJSTICK_VJOYD_MSGSTR"

    /**
     * @type {Integer (UInt32)}
     */
    static JDD_GETNUMDEVS => 2049

    /**
     * @type {Integer (UInt32)}
     */
    static JDD_GETDEVCAPS => 2050

    /**
     * @type {Integer (UInt32)}
     */
    static JDD_GETPOS => 2305

    /**
     * @type {Integer (UInt32)}
     */
    static JDD_SETCALIBRATION => 2306

    /**
     * @type {Integer (UInt32)}
     */
    static JDD_CONFIGCHANGED => 2307

    /**
     * @type {Integer (UInt32)}
     */
    static JDD_GETPOSEX => 2308

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_OPEN_DRIVER => 2049

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_CLOSE_DRIVER => 2050

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_FALSE => 531

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_TRUE => 532

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_FORMAT_MILLISECONDS_S => 533

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_FORMAT_HMS_S => 534

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_FORMAT_MSF_S => 535

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_FORMAT_FRAMES_S => 536

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_FORMAT_SMPTE_24_S => 537

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_FORMAT_SMPTE_25_S => 538

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_FORMAT_SMPTE_30_S => 539

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_FORMAT_SMPTE_30DROP_S => 540

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_FORMAT_BYTES_S => 541

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_FORMAT_SAMPLES_S => 542

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_FORMAT_TMSF_S => 543

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_VD_FORMAT_TRACK_S => 1029

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_PCM_S => 1152

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_MAPPER_S => 1153

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_SEQ_MAPPER_S => 1221

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_SEQ_FILE_S => 1222

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_SEQ_MIDI_S => 1223

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_SEQ_SMPTE_S => 1224

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_SEQ_FORMAT_SONGPTR_S => 1225

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_SEQ_NONE_S => 1226

    /**
     * @type {Integer (UInt32)}
     */
    static MIDIMAPPER_S => 1227

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_MAX_DEVICE_TYPE_LENGTH => 80

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_RESOURCE_RETURNED => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_COLONIZED3_RETURN => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_COLONIZED4_RETURN => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_INTEGER_RETURNED => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_RESOURCE_DRIVER => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_COMMAND_HEAD => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_STRING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_INTEGER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_END_COMMAND => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_RETURN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_FLAG => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_END_COMMAND_LIST => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_RECT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_CONSTANT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_END_CONSTANT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_HWND => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_HPAL => 11

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_HDC => 12

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_INTEGER64 => 13

    /**
     * @type {Integer (UInt32)}
     */
    static TASKERR_NOTASKSUPPORT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TASKERR_OUTOFMEMORY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DRV_EXITSESSION => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DRV_POWER => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DRVCNF_CANCEL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DRVCNF_OK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DRVCNF_RESTART => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DRV_CANCEL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DRV_OK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DRV_RESTART => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DRV_MCI_LAST => 6143

    /**
     * @type {Integer (UInt32)}
     */
    static MMIOERR_BASE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MMIOERR_FILENOTFOUND => 257

    /**
     * @type {Integer (UInt32)}
     */
    static MMIOERR_OUTOFMEMORY => 258

    /**
     * @type {Integer (UInt32)}
     */
    static MMIOERR_CANNOTOPEN => 259

    /**
     * @type {Integer (UInt32)}
     */
    static MMIOERR_CANNOTCLOSE => 260

    /**
     * @type {Integer (UInt32)}
     */
    static MMIOERR_CANNOTREAD => 261

    /**
     * @type {Integer (UInt32)}
     */
    static MMIOERR_CANNOTWRITE => 262

    /**
     * @type {Integer (UInt32)}
     */
    static MMIOERR_CANNOTSEEK => 263

    /**
     * @type {Integer (UInt32)}
     */
    static MMIOERR_CANNOTEXPAND => 264

    /**
     * @type {Integer (UInt32)}
     */
    static MMIOERR_CHUNKNOTFOUND => 265

    /**
     * @type {Integer (UInt32)}
     */
    static MMIOERR_UNBUFFERED => 266

    /**
     * @type {Integer (UInt32)}
     */
    static MMIOERR_PATHNOTFOUND => 267

    /**
     * @type {Integer (UInt32)}
     */
    static MMIOERR_ACCESSDENIED => 268

    /**
     * @type {Integer (UInt32)}
     */
    static MMIOERR_SHARINGVIOLATION => 269

    /**
     * @type {Integer (UInt32)}
     */
    static MMIOERR_NETWORKERROR => 270

    /**
     * @type {Integer (UInt32)}
     */
    static MMIOERR_TOOMANYOPENFILES => 271

    /**
     * @type {Integer (UInt32)}
     */
    static MMIOERR_INVALIDFILE => 272

    /**
     * @type {Integer (UInt32)}
     */
    static MMIO_RWMODE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MMIO_SHAREMODE => 112

    /**
     * @type {Integer (UInt32)}
     */
    static MMIO_CREATE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static MMIO_PARSE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MMIO_DELETE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static MMIO_EXIST => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static MMIO_ALLOCBUF => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static MMIO_GETTEMP => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static MMIO_DIRTY => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static MMIO_READ => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MMIO_WRITE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MMIO_READWRITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MMIO_COMPAT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MMIO_EXCLUSIVE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MMIO_DENYWRITE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MMIO_DENYREAD => 48

    /**
     * @type {Integer (UInt32)}
     */
    static MMIO_DENYNONE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MMIO_FHOPEN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MMIO_EMPTYBUF => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MMIO_TOUPPER => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MMIO_INSTALLPROC => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static MMIO_GLOBALPROC => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static MMIO_REMOVEPROC => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static MMIO_UNICODEPROC => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static MMIO_FINDPROC => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static MMIO_FINDCHUNK => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MMIO_FINDRIFF => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MMIO_FINDLIST => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MMIO_CREATERIFF => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MMIO_CREATELIST => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MMIOM_READ => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MMIOM_WRITE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MMIOM_SEEK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MMIOM_OPEN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MMIOM_CLOSE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MMIOM_WRITEFLUSH => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MMIOM_RENAME => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MMIOM_USER => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static SEEK_SET => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SEEK_CUR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SEEK_END => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MMIO_DEFAULTBUFFER => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_NS => 13

    /**
     * @type {Integer (Int32)}
     */
    static MCI_MCIAVI_PLAY_WINDOW => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static MCI_MCIAVI_PLAY_FULLSCREEN => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static MCI_MCIAVI_PLAY_FULLBY2 => 67108864

    /**
     * @type {Integer (Int32)}
     */
    static MCI_AVI_STATUS_FRAMES_SKIPPED => 32769

    /**
     * @type {Integer (Int32)}
     */
    static MCI_AVI_STATUS_LAST_PLAY_SPEED => 32770

    /**
     * @type {Integer (Int32)}
     */
    static MCI_AVI_STATUS_AUDIO_BREAKS => 32771

    /**
     * @type {Integer (Int32)}
     */
    static MCI_AVI_SETVIDEO_DRAW_PROCEDURE => 32768

    /**
     * @type {Integer (Int32)}
     */
    static MCI_AVI_SETVIDEO_PALETTE_COLOR => 33024

    /**
     * @type {Integer (Int32)}
     */
    static MCI_AVI_SETVIDEO_PALETTE_HALFTONE => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_AVI_OLDAVIFORMAT => 612

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_AVI_NOTINTERLEAVED => 613

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_AVI_NODISPDIB => 614

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_AVI_CANTPLAYFULLSCREEN => 615

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_AVI_TOOBIGFORVGA => 616

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_AVI_NOCOMPRESSOR => 617

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_AVI_DISPLAYERROR => 618

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_AVI_AUDIOERROR => 619

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_AVI_BADPALETTE => 620

    /**
     * @type {Integer (UInt32)}
     */
    static DLG_ACMFORMATCHOOSE_ID => 70

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_ACMFORMATCHOOSE_BTN_HELP => 9

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_ACMFORMATCHOOSE_CMB_CUSTOM => 100

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_ACMFORMATCHOOSE_CMB_FORMATTAG => 101

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_ACMFORMATCHOOSE_CMB_FORMAT => 102

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_ACMFORMATCHOOSE_BTN_SETNAME => 103

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_ACMFORMATCHOOSE_BTN_DELNAME => 104

    /**
     * @type {Integer (UInt32)}
     */
    static DLG_ACMFILTERCHOOSE_ID => 71

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_ACMFILTERCHOOSE_BTN_HELP => 9

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_ACMFILTERCHOOSE_CMB_CUSTOM => 100

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_ACMFILTERCHOOSE_CMB_FILTERTAG => 101

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_ACMFILTERCHOOSE_CMB_FILTER => 102

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_ACMFILTERCHOOSE_BTN_SETNAME => 103

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_ACMFILTERCHOOSE_BTN_DELNAME => 104

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_NS_WIN32 => 7

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_CALLPENDING => 851968

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_CALLABORTED => 851969

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_STREAM_TRUNCATED => 851970

    /**
     * @type {Integer (Int32)}
     */
    static NS_W_SERVER_BANDWIDTH_LIMIT => -2146631677

    /**
     * @type {Integer (Int32)}
     */
    static NS_W_FILE_BANDWIDTH_LIMIT => -2146631676

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NOCONNECTION => -1072889851

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CANNOTCONNECT => -1072889850

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CANNOTDESTROYTITLE => -1072889849

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CANNOTRENAMETITLE => -1072889848

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CANNOTOFFLINEDISK => -1072889847

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CANNOTONLINEDISK => -1072889846

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NOREGISTEREDWALKER => -1072889845

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NOFUNNEL => -1072889844

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_LOCALPLAY => -1072889843

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NETWORK_BUSY => -1072889842

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_TOO_MANY_SESS => -1072889841

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_ALREADY_CONNECTED => -1072889840

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_INDEX => -1072889839

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PROTOCOL_MISMATCH => -1072889838

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_TIMEOUT => -1072889837

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NET_WRITE => -1072889836

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NET_READ => -1072889835

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DISK_WRITE => -1072889834

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DISK_READ => -1072889833

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_FILE_WRITE => -1072889832

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_FILE_READ => -1072889831

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_FILE_NOT_FOUND => -1072889830

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_FILE_EXISTS => -1072889829

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_NAME => -1072889828

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_FILE_OPEN_FAILED => -1072889827

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_FILE_ALLOCATION_FAILED => -1072889826

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_FILE_INIT_FAILED => -1072889825

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_FILE_PLAY_FAILED => -1072889824

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_SET_DISK_UID_FAILED => -1072889823

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INDUCED => -1072889822

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CCLINK_DOWN => -1072889821

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INTERNAL => -1072889820

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_BUSY => -1072889819

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_UNRECOGNIZED_STREAM_TYPE => -1072889818

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NETWORK_SERVICE_FAILURE => -1072889817

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NETWORK_RESOURCE_FAILURE => -1072889816

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CONNECTION_FAILURE => -1072889815

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_SHUTDOWN => -1072889814

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_REQUEST => -1072889813

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INSUFFICIENT_BANDWIDTH => -1072889812

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NOT_REBUILDING => -1072889811

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_LATE_OPERATION => -1072889810

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_DATA => -1072889809

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_FILE_BANDWIDTH_LIMIT => -1072889808

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_OPEN_FILE_LIMIT => -1072889807

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_BAD_CONTROL_DATA => -1072889806

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_STREAM => -1072889805

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_STREAM_END => -1072889804

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_SERVER_NOT_FOUND => -1072889803

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DUPLICATE_NAME => -1072889802

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DUPLICATE_ADDRESS => -1072889801

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_BAD_MULTICAST_ADDRESS => -1072889800

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_BAD_ADAPTER_ADDRESS => -1072889799

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_BAD_DELIVERY_MODE => -1072889798

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_CHANNEL => -1072889797

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_STREAM => -1072889796

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_ARCHIVE => -1072889795

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NOTITLES => -1072889794

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_CLIENT => -1072889793

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_BLACKHOLE_ADDRESS => -1072889792

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INCOMPATIBLE_FORMAT => -1072889791

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_KEY => -1072889790

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_PORT => -1072889789

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_TTL => -1072889788

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_STRIDE_REFUSED => -1072889787

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_MMSAUTOSERVER_CANTFINDWALKER => -1072889786

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_MAX_BITRATE => -1072889785

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_LOGFILEPERIOD => -1072889784

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_MAX_CLIENTS => -1072889783

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_LOG_FILE_SIZE => -1072889782

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_MAX_FILERATE => -1072889781

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WALKER_UNKNOWN => -1072889780

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WALKER_SERVER => -1072889779

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WALKER_USAGE => -1072889778

    /**
     * @type {Integer (Int32)}
     */
    static NS_I_TIGER_START => 1074593871

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_TIGER_FAIL => -1072889776

    /**
     * @type {Integer (Int32)}
     */
    static NS_I_CUB_START => 1074593873

    /**
     * @type {Integer (Int32)}
     */
    static NS_I_CUB_RUNNING => 1074593874

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CUB_FAIL => -1072889773

    /**
     * @type {Integer (Int32)}
     */
    static NS_I_DISK_START => 1074593876

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DISK_FAIL => -1072889771

    /**
     * @type {Integer (Int32)}
     */
    static NS_I_DISK_REBUILD_STARTED => 1074593878

    /**
     * @type {Integer (Int32)}
     */
    static NS_I_DISK_REBUILD_FINISHED => 1074593879

    /**
     * @type {Integer (Int32)}
     */
    static NS_I_DISK_REBUILD_ABORTED => 1074593880

    /**
     * @type {Integer (Int32)}
     */
    static NS_I_LIMIT_FUNNELS => 1074593881

    /**
     * @type {Integer (Int32)}
     */
    static NS_I_START_DISK => 1074593882

    /**
     * @type {Integer (Int32)}
     */
    static NS_I_STOP_DISK => 1074593883

    /**
     * @type {Integer (Int32)}
     */
    static NS_I_STOP_CUB => 1074593884

    /**
     * @type {Integer (Int32)}
     */
    static NS_I_KILL_USERSESSION => 1074593885

    /**
     * @type {Integer (Int32)}
     */
    static NS_I_KILL_CONNECTION => 1074593886

    /**
     * @type {Integer (Int32)}
     */
    static NS_I_REBUILD_DISK => 1074593887

    /**
     * @type {Integer (Int32)}
     */
    static NS_W_UNKNOWN_EVENT => -2146631584

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_MAX_FUNNELS_ALERT => -1072889760

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_ALLOCATE_FILE_FAIL => -1072889759

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PAGING_ERROR => -1072889758

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_BAD_BLOCK0_VERSION => -1072889757

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_BAD_DISK_UID => -1072889756

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_BAD_FSMAJOR_VERSION => -1072889755

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_BAD_STAMPNUMBER => -1072889754

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PARTIALLY_REBUILT_DISK => -1072889753

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_ENACTPLAN_GIVEUP => -1072889752

    /**
     * @type {Integer (Int32)}
     */
    static MCMADM_I_NO_EVENTS => 1074593897

    /**
     * @type {Integer (Int32)}
     */
    static MCMADM_E_REGKEY_NOT_FOUND => -1072889750

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_FORMATS => -1072889749

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_REFERENCES => -1072889748

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WAVE_OPEN => -1072889747

    /**
     * @type {Integer (Int32)}
     */
    static NS_I_LOGGING_FAILED => 1074593902

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CANNOTCONNECTEVENTS => -1072889745

    /**
     * @type {Integer (Int32)}
     */
    static NS_I_LIMIT_BANDWIDTH => 1074593904

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_DEVICE => -1072889743

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_SPECIFIED_DEVICE => -1072889742

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NOTHING_TO_DO => -1072887823

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_MULTICAST => -1072887822

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_MONITOR_GIVEUP => -1072889656

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_REMIRRORED_DISK => -1072889655

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INSUFFICIENT_DATA => -1072889654

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_ASSERT => -1072889653

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_BAD_ADAPTER_NAME => -1072889652

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NOT_LICENSED => -1072889651

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_SERVER_CONTACT => -1072889650

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_TOO_MANY_TITLES => -1072889649

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_TITLE_SIZE_EXCEEDED => -1072889648

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_UDP_DISABLED => -1072889647

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_TCP_DISABLED => -1072889646

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_HTTP_DISABLED => -1072889645

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_LICENSE_EXPIRED => -1072889644

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_TITLE_BITRATE => -1072889643

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_EMPTY_PROGRAM_NAME => -1072889642

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_MISSING_CHANNEL => -1072889641

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_CHANNELS => -1072889640

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_INDEX2 => -1072889639

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CUB_FAIL_LINK => -1072889456

    /**
     * @type {Integer (Int32)}
     */
    static NS_I_CUB_UNFAIL_LINK => 1074594193

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_BAD_CUB_UID => -1072889454

    /**
     * @type {Integer (Int32)}
     */
    static NS_I_RESTRIPE_START => 1074594195

    /**
     * @type {Integer (Int32)}
     */
    static NS_I_RESTRIPE_DONE => 1074594196

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_GLITCH_MODE => -1072889451

    /**
     * @type {Integer (Int32)}
     */
    static NS_I_RESTRIPE_DISK_OUT => 1074594198

    /**
     * @type {Integer (Int32)}
     */
    static NS_I_RESTRIPE_CUB_OUT => 1074594199

    /**
     * @type {Integer (Int32)}
     */
    static NS_I_DISK_STOP => 1074594200

    /**
     * @type {Integer (Int32)}
     */
    static NS_I_CATATONIC_FAILURE => -2146631271

    /**
     * @type {Integer (Int32)}
     */
    static NS_I_CATATONIC_AUTO_UNFAIL => -2146631270

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_MEDIA_PROTOCOL => -1072889445

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_INPUT_FORMAT => -1072886856

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_MSAUDIO_NOT_INSTALLED => -1072886855

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_UNEXPECTED_MSAUDIO_ERROR => -1072886854

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_OUTPUT_FORMAT => -1072886853

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NOT_CONFIGURED => -1072886852

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PROTECTED_CONTENT => -1072886851

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_LICENSE_REQUIRED => -1072886850

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_TAMPERED_CONTENT => -1072886849

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_LICENSE_OUTOFDATE => -1072886848

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_LICENSE_INCORRECT_RIGHTS => -1072886847

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_AUDIO_CODEC_NOT_INSTALLED => -1072886846

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_AUDIO_CODEC_ERROR => -1072886845

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_VIDEO_CODEC_NOT_INSTALLED => -1072886844

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_VIDEO_CODEC_ERROR => -1072886843

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALIDPROFILE => -1072886842

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INCOMPATIBLE_VERSION => -1072886841

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_REBUFFERING => 854984

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_DEGRADING_QUALITY => 854985

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_OFFLINE_MODE => -1072886838

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NOT_CONNECTED => -1072886837

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_TOO_MUCH_DATA => -1072886836

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_UNSUPPORTED_PROPERTY => -1072886835

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_8BIT_WAVE_UNSUPPORTED => -1072886834

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_MORE_SAMPLES => -1072886833

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_SAMPLING_RATE => -1072886832

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_MAX_PACKET_SIZE_TOO_SMALL => -1072886831

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_LATE_PACKET => -1072886830

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DUPLICATE_PACKET => -1072886829

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_SDK_BUFFERTOOSMALL => -1072886828

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_NUM_PASSES => -1072886827

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_ATTRIBUTE_READ_ONLY => -1072886826

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_ATTRIBUTE_NOT_ALLOWED => -1072886825

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_EDL => -1072886824

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DATA_UNIT_EXTENSION_TOO_LARGE => -1072886823

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CODEC_DMO_ERROR => -1072886822

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_TRANSCRYPTOR_EOF => 855003

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_FEATURE_DISABLED_BY_GROUP_POLICY => -1072886820

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_FEATURE_DISABLED_IN_SKU => -1072886819

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMDRM_DEPRECATED => -1072886818

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_CD => -1072885856

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CANT_READ_DIGITAL => -1072885855

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DEVICE_DISCONNECTED => -1072885854

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DEVICE_NOT_SUPPORT_FORMAT => -1072885853

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_SLOW_READ_DIGITAL => -1072885852

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_MIXER_INVALID_LINE => -1072885851

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_MIXER_INVALID_CONTROL => -1072885850

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_MIXER_INVALID_VALUE => -1072885849

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_MIXER_UNKNOWN_MMRESULT => -1072885848

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_USER_STOP => -1072885847

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_MP3_FORMAT_NOT_FOUND => -1072885846

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CD_READ_ERROR_NO_CORRECTION => -1072885845

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CD_READ_ERROR => -1072885844

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CD_SLOW_COPY => -1072885843

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CD_COPYTO_CD => -1072885842

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_MIXER_NODRIVER => -1072885841

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_REDBOOK_ENABLED_WHILE_COPYING => -1072885840

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CD_REFRESH => -1072885839

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CD_DRIVER_PROBLEM => -1072885838

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WONT_DO_DIGITAL => -1072885837

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPXML_NOERROR => -1072885836

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPXML_ENDOFDATA => -1072885835

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPXML_PARSEERROR => -1072885834

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPXML_ATTRIBUTENOTFOUND => -1072885833

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPXML_PINOTFOUND => -1072885832

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPXML_EMPTYDOC => -1072885831

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_PATH_ALREADY_IN_LIBRARY => -1072885830

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_FILESCANALREADYSTARTED => -1072885826

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_HME_INVALIDOBJECTID => -1072885825

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_MF_CODE_EXPIRED => -1072885824

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_HME_NOTSEARCHABLEFORITEMS => -1072885823

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_HME_STALEREQUEST => -1072885822

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_ADDTOLIBRARY_FAILED => -1072885817

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_WINDOWSAPIFAILURE => -1072885816

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_RECORDING_NOT_ALLOWED => -1072885815

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DEVICE_NOT_READY => -1072885814

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DAMAGED_FILE => -1072885813

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_MPDB_GENERIC => -1072885812

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_FILE_FAILED_CHECKS => -1072885811

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_MEDIA_LIBRARY_FAILED => -1072885810

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_SHARING_VIOLATION => -1072885809

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_ERROR_STRING_FOUND => -1072885808

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPOCX_NO_REMOTE_CORE => -1072885807

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPOCX_NO_ACTIVE_CORE => -1072885806

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPOCX_NOT_RUNNING_REMOTELY => -1072885805

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPOCX_NO_REMOTE_WINDOW => -1072885804

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPOCX_ERRORMANAGERNOTAVAILABLE => -1072885803

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PLUGIN_NOTSHUTDOWN => -1072885802

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_CANNOT_FIND_FOLDER => -1072885801

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_STREAMING_RECORDING_NOT_ALLOWED => -1072885800

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_PLUGINDLL_NOTFOUND => -1072885799

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NEED_TO_ASK_USER => -1072885798

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPOCX_PLAYER_NOT_DOCKED => -1072885797

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_EXTERNAL_NOTREADY => -1072885796

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_MLS_STALE_DATA => -1072885795

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_UI_SUBCONTROLSNOTSUPPORTED => -1072885794

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_UI_VERSIONMISMATCH => -1072885793

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_UI_NOTATHEMEFILE => -1072885792

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_UI_SUBELEMENTNOTFOUND => -1072885791

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_UI_VERSIONPARSE => -1072885790

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_UI_VIEWIDNOTFOUND => -1072885789

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_UI_PASSTHROUGH => -1072885788

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_UI_OBJECTNOTFOUND => -1072885787

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_UI_SECONDHANDLER => -1072885786

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_UI_NOSKININZIP => -1072885785

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_WMP_UI_VERSIONMISMATCH => 856040

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_WMP_EXCEPTION => 856041

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_URLDOWNLOADFAILED => -1072885782

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPOCX_UNABLE_TO_LOAD_SKIN => -1072885781

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_INVALID_SKIN => -1072885780

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_SENDMAILFAILED => -1072885779

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_LOCKEDINSKINMODE => -1072885778

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_FAILED_TO_SAVE_FILE => -1072885777

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_SAVEAS_READONLY => -1072885776

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_FAILED_TO_SAVE_PLAYLIST => -1072885775

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_FAILED_TO_OPEN_WMD => -1072885774

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_CANT_PLAY_PROTECTED => -1072885773

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_SHARING_STATE_OUT_OF_SYNC => -1072885772

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPOCX_REMOTE_PLAYER_ALREADY_RUNNING => -1072885766

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_RBC_JPGMAPPINGIMAGE => -1072885756

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_JPGTRANSPARENCY => -1072885755

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_INVALID_MAX_VAL => -1072885751

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_INVALID_MIN_VAL => -1072885750

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_CS_JPGPOSITIONIMAGE => -1072885746

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_CS_NOTEVENLYDIVISIBLE => -1072885745

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPZIP_NOTAZIPFILE => -1072885736

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPZIP_CORRUPT => -1072885735

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPZIP_FILENOTFOUND => -1072885734

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_IMAGE_FILETYPE_UNSUPPORTED => -1072885726

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_IMAGE_INVALID_FORMAT => -1072885725

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_GIF_UNEXPECTED_ENDOFFILE => -1072885724

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_GIF_INVALID_FORMAT => -1072885723

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_GIF_BAD_VERSION_NUMBER => -1072885722

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_GIF_NO_IMAGE_IN_FILE => -1072885721

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_PNG_INVALIDFORMAT => -1072885720

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_PNG_UNSUPPORTED_BITDEPTH => -1072885719

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_PNG_UNSUPPORTED_COMPRESSION => -1072885718

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_PNG_UNSUPPORTED_FILTER => -1072885717

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_PNG_UNSUPPORTED_INTERLACE => -1072885716

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_PNG_UNSUPPORTED_BAD_CRC => -1072885715

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_BMP_INVALID_BITMASK => -1072885714

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_BMP_TOPDOWN_DIB_UNSUPPORTED => -1072885713

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_BMP_BITMAP_NOT_CREATED => -1072885712

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_BMP_COMPRESSION_UNSUPPORTED => -1072885711

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_BMP_INVALID_FORMAT => -1072885710

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_JPG_JERR_ARITHCODING_NOTIMPL => -1072885709

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_JPG_INVALID_FORMAT => -1072885708

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_JPG_BAD_DCTSIZE => -1072885707

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_JPG_BAD_VERSION_NUMBER => -1072885706

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_JPG_BAD_PRECISION => -1072885705

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_JPG_CCIR601_NOTIMPL => -1072885704

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_JPG_NO_IMAGE_IN_FILE => -1072885703

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_JPG_READ_ERROR => -1072885702

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_JPG_FRACT_SAMPLE_NOTIMPL => -1072885701

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_JPG_IMAGE_TOO_BIG => -1072885700

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_JPG_UNEXPECTED_ENDOFFILE => -1072885699

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_JPG_SOF_UNSUPPORTED => -1072885698

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_JPG_UNKNOWN_MARKER => -1072885697

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_WMP_LOADED_GIF_IMAGE => 856128

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_WMP_LOADED_PNG_IMAGE => 856129

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_WMP_LOADED_BMP_IMAGE => 856130

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_WMP_LOADED_JPG_IMAGE => 856131

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_FAILED_TO_OPEN_IMAGE => -1072885692

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_DAI_SONGTOOSHORT => -1072885687

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMG_RATEUNAVAILABLE => -1072885686

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMG_PLUGINUNAVAILABLE => -1072885685

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMG_CANNOTQUEUE => -1072885684

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMG_PREROLLLICENSEACQUISITIONNOTALLOWED => -1072885683

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMG_UNEXPECTEDPREROLLSTATUS => -1072885682

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_WMG_FORCE_DROP_FRAME => 856143

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMG_INVALID_COPP_CERTIFICATE => -1072885679

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMG_COPP_SECURITY_INVALID => -1072885678

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMG_COPP_UNSUPPORTED => -1072885677

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMG_INVALIDSTATE => -1072885676

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMG_SINKALREADYEXISTS => -1072885675

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMG_NOSDKINTERFACE => -1072885674

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMG_NOTALLOUTPUTSRENDERED => -1072885673

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMG_FILETRANSFERNOTALLOWED => -1072885672

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMR_UNSUPPORTEDSTREAM => -1072885671

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMR_PINNOTFOUND => -1072885670

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMR_WAITINGONFORMATSWITCH => -1072885669

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMR_NOSOURCEFILTER => -1072885668

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMR_PINTYPENOMATCH => -1072885667

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMR_NOCALLBACKAVAILABLE => -1072885666

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_WMR_ALREADYRENDERED => 856159

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_WMR_PINTYPEPARTIALMATCH => 856160

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_WMR_PINTYPEFULLMATCH => 856161

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMR_SAMPLEPROPERTYNOTSET => -1072885662

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMR_CANNOT_RENDER_BINARY_STREAM => -1072885661

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMG_LICENSE_TAMPERED => -1072885660

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMR_WILLNOT_RENDER_BINARY_STREAM => -1072885659

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_WMG_ADVISE_DROP_FRAME => 856166

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_WMG_ADVISE_DROP_TO_KEYFRAME => 856167

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMX_UNRECOGNIZED_PLAYLIST_FORMAT => -1072885656

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_ASX_INVALIDFORMAT => -1072885655

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_ASX_INVALIDVERSION => -1072885654

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_ASX_INVALID_REPEAT_BLOCK => -1072885653

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_ASX_NOTHING_TO_WRITE => -1072885652

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_URLLIST_INVALIDFORMAT => -1072885651

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMX_ATTRIBUTE_DOES_NOT_EXIST => -1072885650

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMX_ATTRIBUTE_ALREADY_EXISTS => -1072885649

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMX_ATTRIBUTE_UNRETRIEVABLE => -1072885648

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMX_ITEM_DOES_NOT_EXIST => -1072885647

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMX_ITEM_TYPE_ILLEGAL => -1072885646

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMX_ITEM_UNSETTABLE => -1072885645

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMX_PLAYLIST_EMPTY => -1072885644

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_MLS_SMARTPLAYLIST_FILTER_NOT_REGISTERED => -1072885643

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMX_INVALID_FORMAT_OVER_NESTING => -1072885642

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_NOSOURCEURLSTRING => -1072885636

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_COCREATEFAILEDFORGITOBJECT => -1072885635

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_FAILEDTOGETMARSHALLEDEVENTHANDLERINTERFACE => -1072885634

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_BUFFERTOOSMALL => -1072885633

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_UNAVAILABLE => -1072885632

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_INVALIDPLAYLISTMODE => -1072885631

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_ITEMNOTINPLAYLIST => -1072885626

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_PLAYLISTEMPTY => -1072885625

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_NOBROWSER => -1072885624

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_UNRECOGNIZED_MEDIA_URL => -1072885623

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_GRAPH_NOT_IN_LIST => -1072885622

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_PLAYLIST_EMPTY_OR_SINGLE_MEDIA => -1072885621

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_ERRORSINKNOTREGISTERED => -1072885620

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_ERRORMANAGERNOTAVAILABLE => -1072885619

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_WEBHELPFAILED => -1072885618

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_MEDIA_ERROR_RESUME_FAILED => -1072885617

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_NO_REF_IN_ENTRY => -1072885616

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_WMX_LIST_ATTRIBUTE_NAME_EMPTY => -1072885615

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_WMX_LIST_ATTRIBUTE_NAME_ILLEGAL => -1072885614

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_WMX_LIST_ATTRIBUTE_VALUE_EMPTY => -1072885613

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_WMX_LIST_ATTRIBUTE_VALUE_ILLEGAL => -1072885612

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_WMX_LIST_ITEM_ATTRIBUTE_NAME_EMPTY => -1072885611

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_WMX_LIST_ITEM_ATTRIBUTE_NAME_ILLEGAL => -1072885610

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_WMX_LIST_ITEM_ATTRIBUTE_VALUE_EMPTY => -1072885609

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_LIST_ENTRY_NO_REF => -1072885608

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_MISNAMED_FILE => -1072885607

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_CODEC_NOT_TRUSTED => -1072885606

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_CODEC_NOT_FOUND => -1072885605

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_CODEC_DOWNLOAD_NOT_ALLOWED => -1072885604

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_ERROR_DOWNLOADING_PLAYLIST => -1072885603

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_FAILED_TO_BUILD_PLAYLIST => -1072885602

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_PLAYLIST_ITEM_ALTERNATE_NONE => -1072885601

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_PLAYLIST_ITEM_ALTERNATE_EXHAUSTED => -1072885600

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_PLAYLIST_ITEM_ALTERNATE_NAME_NOT_FOUND => -1072885599

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_PLAYLIST_ITEM_ALTERNATE_MORPH_FAILED => -1072885598

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_PLAYLIST_ITEM_ALTERNATE_INIT_FAILED => -1072885597

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_MEDIA_ALTERNATE_REF_EMPTY => -1072885596

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_PLAYLIST_NO_EVENT_NAME => -1072885595

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_PLAYLIST_EVENT_ATTRIBUTE_ABSENT => -1072885594

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_PLAYLIST_EVENT_EMPTY => -1072885593

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_PLAYLIST_STACK_EMPTY => -1072885592

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_CURRENT_MEDIA_NOT_ACTIVE => -1072885591

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_USER_CANCEL => -1072885589

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_PLAYLIST_REPEAT_EMPTY => -1072885588

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_PLAYLIST_REPEAT_START_MEDIA_NONE => -1072885587

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_PLAYLIST_REPEAT_END_MEDIA_NONE => -1072885586

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_INVALID_PLAYLIST_URL => -1072885585

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_MISMATCHED_RUNTIME => -1072885584

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_PLAYLIST_IMPORT_FAILED_NO_ITEMS => -1072885583

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_VIDEO_TRANSFORM_FILTER_INSERTION => -1072885582

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_MEDIA_UNAVAILABLE => -1072885581

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_WMX_ENTRYREF_NO_REF => -1072885580

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_NO_PLAYABLE_MEDIA_IN_PLAYLIST => -1072885579

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_PLAYLIST_EMPTY_NESTED_PLAYLIST_SKIPPED_ITEMS => -1072885578

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_BUSY => -1072885577

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_MEDIA_CHILD_PLAYLIST_UNAVAILABLE => -1072885576

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_MEDIA_NO_CHILD_PLAYLIST => -1072885575

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_FILE_NOT_FOUND => -1072885574

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_TEMP_FILE_NOT_FOUND => -1072885573

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMDM_REVOKED => -1072885572

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DDRAW_GENERIC => -1072885571

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DISPLAY_MODE_CHANGE_FAILED => -1072885570

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PLAYLIST_CONTAINS_ERRORS => -1072885569

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CHANGING_PROXY_NAME => -1072885568

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CHANGING_PROXY_PORT => -1072885567

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CHANGING_PROXY_EXCEPTIONLIST => -1072885566

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CHANGING_PROXYBYPASS => -1072885565

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CHANGING_PROXY_PROTOCOL_NOT_FOUND => -1072885564

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_GRAPH_NOAUDIOLANGUAGE => -1072885563

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_GRAPH_NOAUDIOLANGUAGESELECTED => -1072885562

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CORECD_NOTAMEDIACD => -1072885561

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_MEDIA_URL_TOO_LONG => -1072885560

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPFLASH_CANT_FIND_COM_SERVER => -1072885559

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPFLASH_INCOMPATIBLEVERSION => -1072885558

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPOCXGRAPH_IE_DISALLOWS_ACTIVEX_CONTROLS => -1072885557

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NEED_CORE_REFERENCE => -1072885556

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_MEDIACD_READ_ERROR => -1072885555

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_IE_DISALLOWS_ACTIVEX_CONTROLS => -1072885554

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_FLASH_PLAYBACK_NOT_ALLOWED => -1072885553

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_UNABLE_TO_CREATE_RIP_LOCATION => -1072885552

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_SOME_CODECS_MISSING => -1072885551

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_RIP_FAILED => -1072885550

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_FAILED_TO_RIP_TRACK => -1072885549

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_ERASE_FAILED => -1072885548

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_FORMAT_FAILED => -1072885547

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_CANNOT_BURN_NON_LOCAL_FILE => -1072885546

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_FILE_TYPE_CANNOT_BURN_TO_AUDIO_CD => -1072885545

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_FILE_DOES_NOT_FIT_ON_CD => -1072885544

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_FILE_NO_DURATION => -1072885543

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_FAILED_TO_BURN => -1072885542

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_NEED_TO_BUY_BURN_RIGHTS => 856283

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_FAILED_DOWNLOAD_ABORT_BURN => -1072885540

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPCORE_DEVICE_DRIVERS_MISSING => -1072885539

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_WMPCORE_PLAYLISTCLEARABORT => 856318

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_WMPCORE_PLAYLISTREMOVEITEMABORT => 856319

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_WMPCORE_PLAYLIST_CREATION_PENDING => 856322

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_WMPCORE_MEDIA_VALIDATION_PENDING => 856323

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_WMPCORE_PLAYLIST_REPEAT_SECONDARY_SEGMENTS_IGNORED => 856324

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_WMPCORE_COMMAND_NOT_AVAILABLE => 856325

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_WMPCORE_PLAYLIST_NAME_AUTO_GENERATED => 856326

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_WMPCORE_PLAYLIST_IMPORT_MISSING_ITEMS => 856327

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_WMPCORE_PLAYLIST_COLLAPSED_TO_SINGLE_MEDIA => 856328

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_WMPCORE_MEDIA_CHILD_PLAYLIST_OPEN_PENDING => 856329

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_WMPCORE_MORE_NODES_AVAIABLE => 856330

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPIM_USEROFFLINE => -1072885466

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPIM_USERCANCELED => -1072885465

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPIM_DIALUPFAILED => -1072885464

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WINSOCK_ERROR_STRING => -1072885463

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPBR_NOLISTENER => -1072885456

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPBR_BACKUPCANCEL => -1072885455

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPBR_RESTORECANCEL => -1072885454

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPBR_ERRORWITHURL => -1072885453

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPBR_NAMECOLLISION => -1072885452

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_WMPBR_SUCCESS => 856373

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_WMPBR_PARTIALSUCCESS => 856374

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPBR_DRIVE_INVALID => -1072885449

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMPBR_BACKUPRESTOREFAILED => -1072885448

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_WMPEFFECT_TRANSPARENT => 856388

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_WMPEFFECT_OPAQUE => 856389

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_OPERATION_PENDING => 856398

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_CONVERT_FILE_FAILED => -1072885416

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_CONVERT_NO_RIGHTS_ERRORURL => -1072885415

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_CONVERT_NO_RIGHTS_NOERRORURL => -1072885414

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_CONVERT_FILE_CORRUPT => -1072885413

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_CONVERT_PLUGIN_UNAVAILABLE_ERRORURL => -1072885412

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_CONVERT_PLUGIN_UNAVAILABLE_NOERRORURL => -1072885411

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_CONVERT_PLUGIN_UNKNOWN_FILE_OWNER => -1072885410

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DVD_DISC_COPY_PROTECT_OUTPUT_NS => -1072885408

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DVD_DISC_COPY_PROTECT_OUTPUT_FAILED => -1072885407

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DVD_NO_SUBPICTURE_STREAM => -1072885406

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DVD_COPY_PROTECT => -1072885405

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DVD_AUTHORING_PROBLEM => -1072885404

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DVD_INVALID_DISC_REGION => -1072885403

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DVD_COMPATIBLE_VIDEO_CARD => -1072885402

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DVD_MACROVISION => -1072885401

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DVD_SYSTEM_DECODER_REGION => -1072885400

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DVD_DISC_DECODER_REGION => -1072885399

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DVD_NO_VIDEO_STREAM => -1072885398

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DVD_NO_AUDIO_STREAM => -1072885397

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DVD_GRAPH_BUILDING => -1072885396

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DVD_NO_DECODER => -1072885395

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DVD_PARENTAL => -1072885394

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DVD_CANNOT_JUMP => -1072885393

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DVD_DEVICE_CONTENTION => -1072885392

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DVD_NO_VIDEO_MEMORY => -1072885391

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DVD_CANNOT_COPY_PROTECTED => -1072885390

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DVD_REQUIRED_PROPERTY_NOT_SET => -1072885389

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DVD_INVALID_TITLE_CHAPTER => -1072885388

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_CD_BURNER => -1072885386

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DEVICE_IS_NOT_READY => -1072885385

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_UNSUPPORTED_FORMAT => -1072885384

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_PDA => -1072885383

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_UNSPECIFIED_ERROR => -1072885382

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_MEMSTORAGE_BAD_DATA => -1072885381

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_FAIL_SELECT_DEVICE => -1072885380

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_FAIL_READ_WAVE_FILE => -1072885379

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_IMAPI_LOSSOFSTREAMING => -1072885378

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_DEVICE_FULL => -1072885377

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_FAIL_LAUNCH_ROXIO_PLUGIN => -1072885376

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_DEVICE_FULL_IN_SESSION => -1072885375

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_IMAPI_MEDIUM_INVALIDTYPE => -1072885374

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_MANUALDEVICE => -1072885373

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_PARTNERSHIPNOTEXIST => -1072885372

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_CANNOT_CREATE_ADDITIONAL_SYNC_RELATIONSHIP => -1072885371

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_NO_TRANSCODE_OF_DRM => -1072885370

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_TRANSCODECACHEFULL => -1072885369

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_TOO_MANY_FILE_COLLISIONS => -1072885368

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_CANNOT_TRANSCODE => -1072885367

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_TOO_MANY_FILES_IN_DIRECTORY => -1072885366

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PROCESSINGSHOWSYNCWIZARD => -1072885365

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_TRANSCODE_NOT_PERMITTED => -1072885364

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_INITIALIZINGDEVICES => -1072885363

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_OBSOLETE_SP => -1072885362

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_TITLE_COLLISION => -1072885361

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_DEVICESUPPORTDISABLED => -1072885360

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_NO_LONGER_AVAILABLE => -1072885359

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_ENCODER_NOT_RESPONDING => -1072885358

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_CANNOT_SYNC_FROM_LOCATION => -1072885357

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_PROTOCOL_PROBLEM => -1072885356

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_NO_DISK_SPACE => -1072885355

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_LOGON_FAILURE => -1072885354

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_CANNOT_FIND_FILE => -1072885353

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_SERVER_INACCESSIBLE => -1072885352

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_UNSUPPORTED_FORMAT => -1072885351

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_DSHOW_UNSUPPORTED_FORMAT => -1072885350

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_PLAYLIST_EXISTS => -1072885349

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_NONMEDIA_FILES => -1072885348

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_INVALID_ASX => -1072885347

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_ALREADY_IN_USE => -1072885346

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_IMAPI_FAILURE => -1072885345

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_WMDM_FAILURE => -1072885344

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_CODEC_NEEDED_WITH_4CC => -1072885343

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_CODEC_NEEDED_WITH_FORMATTAG => -1072885342

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_MSSAP_NOT_AVAILABLE => -1072885341

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_WMDM_INTERFACEDEAD => -1072885340

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_WMDM_NOTCERTIFIED => -1072885339

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_WMDM_LICENSE_NOTEXIST => -1072885338

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_WMDM_LICENSE_EXPIRED => -1072885337

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_WMDM_BUSY => -1072885336

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_WMDM_NORIGHTS => -1072885335

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_WMDM_INCORRECT_RIGHTS => -1072885334

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_IMAPI_GENERIC => -1072885333

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_IMAPI_DEVICE_NOTPRESENT => -1072885331

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_IMAPI_DEVICE_BUSY => -1072885330

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_IMAPI_LOSS_OF_STREAMING => -1072885329

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_SERVER_UNAVAILABLE => -1072885328

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_FILE_OPEN_FAILED => -1072885327

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_VERIFY_ONLINE => -1072885326

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_SERVER_NOT_RESPONDING => -1072885325

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_DRM_CORRUPT_BACKUP => -1072885324

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_DRM_LICENSE_SERVER_UNAVAILABLE => -1072885323

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_NETWORK_FIREWALL => -1072885322

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_NO_REMOVABLE_MEDIA => -1072885321

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_PROXY_CONNECT_TIMEOUT => -1072885320

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_NEED_UPGRADE => -1072885319

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_AUDIO_HW_PROBLEM => -1072885318

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_INVALID_PROTOCOL => -1072885317

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_INVALID_LIBRARY_ADD => -1072885316

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_MMS_NOT_SUPPORTED => -1072885315

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_NO_PROTOCOLS_SELECTED => -1072885314

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_GOFULLSCREEN_FAILED => -1072885313

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_NETWORK_ERROR => -1072885312

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_CONNECT_TIMEOUT => -1072885311

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_MULTICAST_DISABLED => -1072885310

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_SERVER_DNS_TIMEOUT => -1072885309

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_PROXY_NOT_FOUND => -1072885308

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_TAMPERED_CONTENT => -1072885307

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_OUTOFMEMORY => -1072885306

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_AUDIO_CODEC_NOT_INSTALLED => -1072885305

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_VIDEO_CODEC_NOT_INSTALLED => -1072885304

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_IMAPI_DEVICE_INVALIDTYPE => -1072885303

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_DRM_DRIVER_AUTH_FAILURE => -1072885302

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_NETWORK_RESOURCE_FAILURE => -1072885301

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_UPGRADE_APPLICATION => -1072885300

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_UNKNOWN_ERROR => -1072885299

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_INVALID_KEY => -1072885298

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_CD_ANOTHER_USER => -1072885297

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_DRM_NEEDS_AUTHORIZATION => -1072885296

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_BAD_DRIVER => -1072885295

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_ACCESS_DENIED => -1072885294

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_LICENSE_RESTRICTS => -1072885293

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_INVALID_REQUEST => -1072885292

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_CD_STASH_NO_SPACE => -1072885291

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_DRM_NEW_HARDWARE => -1072885290

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_DRM_INVALID_SIG => -1072885289

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_DRM_CANNOT_RESTORE => -1072885288

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_BURN_DISC_OVERFLOW => -1072885287

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_DRM_GENERIC_LICENSE_FAILURE => -1072885286

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_DRM_NO_SECURE_CLOCK => -1072885285

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_DRM_NO_RIGHTS => -1072885284

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_DRM_INDIV_FAILED => -1072885283

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_SERVER_NONEWCONNECTIONS => -1072885282

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_MULTIPLE_ERROR_IN_PLAYLIST => -1072885281

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_IMAPI2_ERASE_FAIL => -1072885280

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_IMAPI2_ERASE_DEVICE_BUSY => -1072885279

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_DRM_COMPONENT_FAILURE => -1072885278

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_DRM_NO_DEVICE_CERT => -1072885277

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_SERVER_SECURITY_ERROR => -1072885276

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_AUDIO_DEVICE_LOST => -1072885275

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_IMAPI_MEDIA_INCOMPATIBLE => -1072885274

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_SYNCWIZ_DEVICE_FULL => -1072885266

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_SYNCWIZ_CANNOT_CHANGE_SETTINGS => -1072885265

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_TRANSCODE_DELETECACHEERROR => -1072885264

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CD_NO_BUFFERS_READ => -1072885256

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CD_EMPTY_TRACK_QUEUE => -1072885255

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CD_NO_READER => -1072885254

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CD_ISRC_INVALID => -1072885253

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CD_MEDIA_CATALOG_NUMBER_INVALID => -1072885252

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_SLOW_READ_DIGITAL_WITH_ERRORCORRECTION => -1072885251

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CD_SPEEDDETECT_NOT_ENOUGH_READS => -1072885250

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CD_QUEUEING_DISABLED => -1072885249

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_DRM_ACQUIRING_LICENSE => -1072885246

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_DRM_LICENSE_EXPIRED => -1072885245

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_DRM_LICENSE_NOTACQUIRED => -1072885244

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_DRM_LICENSE_NOTENABLED => -1072885243

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_DRM_LICENSE_UNUSABLE => -1072885242

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_DRM_LICENSE_CONTENT_REVOKED => -1072885241

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_DRM_LICENSE_NOSAP => -1072885240

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_DRM_UNABLE_TO_ACQUIRE_LICENSE => -1072885239

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_LICENSE_REQUIRED => -1072885238

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_PROTECTED_CONTENT => -1072885237

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_POLICY_VALUE_NOT_CONFIGURED => -1072885206

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_CANNOT_SYNC_FROM_INTERNET => -1072885196

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_CANNOT_SYNC_INVALID_PLAYLIST => -1072885195

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_FAILED_TO_SYNCHRONIZE_FILE => -1072885194

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_SYNC_FAILED => -1072885193

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_DELETE_FAILED => -1072885192

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_FAILED_TO_RETRIEVE_FILE => -1072885191

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_DEVICE_NOT_RESPONDING => -1072885190

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_FAILED_TO_TRANSCODE_PHOTO => -1072885189

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_FAILED_TO_ENCRYPT_TRANSCODED_FILE => -1072885188

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_CANNOT_TRANSCODE_TO_AUDIO => -1072885187

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_CANNOT_TRANSCODE_TO_VIDEO => -1072885186

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_CANNOT_TRANSCODE_TO_IMAGE => -1072885185

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_RETRIEVED_FILE_FILENAME_TOO_LONG => -1072885184

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_CEWMDM_DRM_ERROR => -1072885183

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INCOMPLETE_PLAYLIST => -1072885182

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_SYNC_RUNNING => -1072885181

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_SYNC_LOGIN_ERROR => -1072885180

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PDA_TRANSCODE_CODEC_NOT_FOUND => -1072885179

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CANNOT_SYNC_DRM_TO_NON_JANUS_DEVICE => -1072885178

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CANNOT_SYNC_PREVIOUS_SYNC_RUNNING => -1072885177

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_HWND_NOTFOUND => -1072885156

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_BKGDOWNLOAD_WRONG_NO_FILES => -1072885155

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_BKGDOWNLOAD_COMPLETECANCELLEDJOB => -1072885154

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_BKGDOWNLOAD_CANCELCOMPLETEDJOB => -1072885153

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_BKGDOWNLOAD_NOJOBPOINTER => -1072885152

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_BKGDOWNLOAD_INVALIDJOBSIGNATURE => -1072885151

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_BKGDOWNLOAD_FAILED_TO_CREATE_TEMPFILE => -1072885150

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_BKGDOWNLOAD_PLUGIN_FAILEDINITIALIZE => -1072885149

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_BKGDOWNLOAD_PLUGIN_FAILEDTOMOVEFILE => -1072885148

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_BKGDOWNLOAD_CALLFUNCFAILED => -1072885147

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_BKGDOWNLOAD_CALLFUNCTIMEOUT => -1072885146

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_BKGDOWNLOAD_CALLFUNCENDED => -1072885145

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_BKGDOWNLOAD_WMDUNPACKFAILED => -1072885144

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_BKGDOWNLOAD_FAILEDINITIALIZE => -1072885143

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INTERFACE_NOT_REGISTERED_IN_GIT => -1072885142

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_BKGDOWNLOAD_INVALID_FILE_NAME => -1072885141

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_IMAGE_DOWNLOAD_FAILED => -1072885106

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_UDRM_NOUSERLIST => -1072885056

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_DRM_NOT_ACQUIRING => -1072885055

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_BSTR_TOO_LONG => -1072885006

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_AUTOPLAY_INVALID_STATE => -1072884996

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WMP_COMPONENT_REVOKED => -1072884986

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CURL_NOTSAFE => -1072884956

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CURL_INVALIDCHAR => -1072884955

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CURL_INVALIDHOSTNAME => -1072884954

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CURL_INVALIDPATH => -1072884953

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CURL_INVALIDSCHEME => -1072884952

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CURL_INVALIDURL => -1072884951

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CURL_CANTWALK => -1072884949

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CURL_INVALIDPORT => -1072884948

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CURLHELPER_NOTADIRECTORY => -1072884947

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CURLHELPER_NOTAFILE => -1072884946

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CURL_CANTDECODE => -1072884945

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CURLHELPER_NOTRELATIVE => -1072884944

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CURL_INVALIDBUFFERSIZE => -1072884943

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_SUBSCRIPTIONSERVICE_PLAYBACK_DISALLOWED => -1072884906

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CANNOT_BUY_OR_DOWNLOAD_FROM_MULTIPLE_SERVICES => -1072884905

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CANNOT_BUY_OR_DOWNLOAD_CONTENT => -1072884904

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_TRACK_BUY_REQUIRES_ALBUM_PURCHASE => 856921

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NOT_CONTENT_PARTNER_TRACK => -1072884902

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_TRACK_DOWNLOAD_REQUIRES_ALBUM_PURCHASE => -1072884901

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_TRACK_DOWNLOAD_REQUIRES_PURCHASE => -1072884900

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_TRACK_PURCHASE_MAXIMUM_EXCEEDED => -1072884899

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_NAVIGATION_COMPLETE_WITH_ERRORS => 856926

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_SUBSCRIPTIONSERVICE_LOGIN_FAILED => -1072884897

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_SUBSCRIPTIONSERVICE_DOWNLOAD_TIMEOUT => -1072884896

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_TRACK_ALREADY_DOWNLOADED => 856929

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CONTENT_PARTNER_STILL_INITIALIZING => -1072884894

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_OPEN_CONTAINING_FOLDER_FAILED => -1072884893

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_ADVANCEDEDIT_TOO_MANY_PICTURES => -1072884886

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_REDIRECT => -1072884856

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_STALE_PRESENTATION => -1072884855

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NAMESPACE_WRONG_PERSIST => -1072884854

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NAMESPACE_WRONG_TYPE => -1072884853

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NAMESPACE_NODE_CONFLICT => -1072884852

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NAMESPACE_NODE_NOT_FOUND => -1072884851

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NAMESPACE_BUFFER_TOO_SMALL => -1072884850

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NAMESPACE_TOO_MANY_CALLBACKS => -1072884849

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NAMESPACE_DUPLICATE_CALLBACK => -1072884848

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NAMESPACE_CALLBACK_NOT_FOUND => -1072884847

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NAMESPACE_NAME_TOO_LONG => -1072884846

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NAMESPACE_DUPLICATE_NAME => -1072884845

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NAMESPACE_EMPTY_NAME => -1072884844

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NAMESPACE_INDEX_TOO_LARGE => -1072884843

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NAMESPACE_BAD_NAME => -1072884842

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NAMESPACE_WRONG_SECURITY => -1072884841

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CACHE_ARCHIVE_CONFLICT => -1072884756

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CACHE_ORIGIN_SERVER_NOT_FOUND => -1072884755

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CACHE_ORIGIN_SERVER_TIMEOUT => -1072884754

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CACHE_NOT_BROADCAST => -1072884753

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CACHE_CANNOT_BE_CACHED => -1072884752

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CACHE_NOT_MODIFIED => -1072884751

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CANNOT_REMOVE_PUBLISHING_POINT => -1072884656

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CANNOT_REMOVE_PLUGIN => -1072884655

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WRONG_PUBLISHING_POINT_TYPE => -1072884654

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_UNSUPPORTED_LOAD_TYPE => -1072884653

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_PLUGIN_LOAD_TYPE_CONFIGURATION => -1072884652

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_PUBLISHING_POINT_NAME => -1072884651

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_TOO_MANY_MULTICAST_SINKS => -1072884650

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PUBLISHING_POINT_INVALID_REQUEST_WHILE_STARTED => -1072884649

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_MULTICAST_PLUGIN_NOT_ENABLED => -1072884648

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_OPERATING_SYSTEM_VERSION => -1072884647

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PUBLISHING_POINT_REMOVED => -1072884646

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_PUSH_PUBLISHING_POINT_START_REQUEST => -1072884645

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_UNSUPPORTED_LANGUAGE => -1072884644

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WRONG_OS_VERSION => -1072884643

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PUBLISHING_POINT_STOPPED => -1072884642

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PLAYLIST_ENTRY_ALREADY_PLAYING => -1072884556

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_EMPTY_PLAYLIST => -1072884555

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PLAYLIST_PARSE_FAILURE => -1072884554

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PLAYLIST_UNSUPPORTED_ENTRY => -1072884553

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PLAYLIST_ENTRY_NOT_IN_PLAYLIST => -1072884552

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PLAYLIST_ENTRY_SEEK => -1072884551

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PLAYLIST_RECURSIVE_PLAYLISTS => -1072884550

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PLAYLIST_TOO_MANY_NESTED_PLAYLISTS => -1072884549

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PLAYLIST_SHUTDOWN => -1072884548

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PLAYLIST_END_RECEDING => -1072884547

    /**
     * @type {Integer (Int32)}
     */
    static NS_I_PLAYLIST_CHANGE_RECEDING => 1074599102

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DATAPATH_NO_SINK => -1072884456

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_PUBLISHING_POINT_STARTED_WITH_FAILED_SINKS => 857369

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_PUSH_TEMPLATE => -1072884454

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_PUSH_PUBLISHING_POINT => -1072884453

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CRITICAL_ERROR => -1072884452

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_NEW_CONNECTIONS => -1072884451

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WSX_INVALID_VERSION => -1072884450

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_HEADER_MISMATCH => -1072884449

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PUSH_DUPLICATE_PUBLISHING_POINT_NAME => -1072884448

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_SCRIPT_ENGINE => -1072884356

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PLUGIN_ERROR_REPORTED => -1072884355

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_SOURCE_PLUGIN_NOT_FOUND => -1072884354

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PLAYLIST_PLUGIN_NOT_FOUND => -1072884353

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DATA_SOURCE_ENUMERATION_NOT_SUPPORTED => -1072884352

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_MEDIA_PARSER_INVALID_FORMAT => -1072884351

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_SCRIPT_DEBUGGER_NOT_INSTALLED => -1072884350

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_FEATURE_REQUIRES_ENTERPRISE_SERVER => -1072884349

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WIZARD_RUNNING => -1072884348

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_LOG_URL => -1072884347

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_MTU_RANGE => -1072884346

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_PLAY_STATISTICS => -1072884345

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_LOG_NEED_TO_BE_SKIPPED => -1072884344

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_HTTP_TEXT_DATACONTAINER_SIZE_LIMIT_EXCEEDED => -1072884343

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PORT_IN_USE => -1072884342

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PORT_IN_USE_HTTP => -1072884341

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_HTTP_TEXT_DATACONTAINER_INVALID_SERVER_RESPONSE => -1072884340

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_ARCHIVE_REACH_QUOTA => -1072884339

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_ARCHIVE_ABORT_DUE_TO_BCAST => -1072884338

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_ARCHIVE_GAP_DETECTED => -1072884337

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_AUTHORIZATION_FILE_NOT_FOUND => -1072884336

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_BAD_MARKIN => -1072882856

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_BAD_MARKOUT => -1072882855

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NOMATCHING_MEDIASOURCE => -1072882854

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_UNSUPPORTED_SOURCETYPE => -1072882853

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_TOO_MANY_AUDIO => -1072882852

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_TOO_MANY_VIDEO => -1072882851

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NOMATCHING_ELEMENT => -1072882850

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_MISMATCHED_MEDIACONTENT => -1072882849

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CANNOT_DELETE_ACTIVE_SOURCEGROUP => -1072882848

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_AUDIODEVICE_BUSY => -1072882847

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_AUDIODEVICE_UNEXPECTED => -1072882846

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_AUDIODEVICE_BADFORMAT => -1072882845

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_VIDEODEVICE_BUSY => -1072882844

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_VIDEODEVICE_UNEXPECTED => -1072882843

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALIDCALL_WHILE_ENCODER_RUNNING => -1072882842

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_PROFILE_IN_SOURCEGROUP => -1072882841

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_VIDEODRIVER_UNSTABLE => -1072882840

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_VIDCAPSTARTFAILED => -1072882839

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_VIDSOURCECOMPRESSION => -1072882838

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_VIDSOURCESIZE => -1072882837

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_ICMQUERYFORMAT => -1072882836

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_VIDCAPCREATEWINDOW => -1072882835

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_VIDCAPDRVINUSE => -1072882834

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_MEDIAFORMAT_IN_SOURCE => -1072882833

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_VALID_OUTPUT_STREAM => -1072882832

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_VALID_SOURCE_PLUGIN => -1072882831

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_ACTIVE_SOURCEGROUP => -1072882830

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_SCRIPT_STREAM => -1072882829

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALIDCALL_WHILE_ARCHIVAL_RUNNING => -1072882828

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALIDPACKETSIZE => -1072882827

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PLUGIN_CLSID_INVALID => -1072882826

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_UNSUPPORTED_ARCHIVETYPE => -1072882825

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_UNSUPPORTED_ARCHIVEOPERATION => -1072882824

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_ARCHIVE_FILENAME_NOTSET => -1072882823

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_SOURCEGROUP_NOTPREPARED => -1072882822

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PROFILE_MISMATCH => -1072882821

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INCORRECTCLIPSETTINGS => -1072882820

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NOSTATSAVAILABLE => -1072882819

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NOTARCHIVING => -1072882818

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALIDCALL_WHILE_ENCODER_STOPPED => -1072882817

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NOSOURCEGROUPS => -1072882816

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALIDINPUTFPS => -1072882815

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_DATAVIEW_SUPPORT => -1072882814

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CODEC_UNAVAILABLE => -1072882813

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_ARCHIVE_SAME_AS_INPUT => -1072882812

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_SOURCE_NOTSPECIFIED => -1072882811

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_REALTIME_TIMECOMPRESSION => -1072882810

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_UNSUPPORTED_ENCODER_DEVICE => -1072882809

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_UNEXPECTED_DISPLAY_SETTINGS => -1072882808

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_AUDIODATA => -1072882807

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INPUTSOURCE_PROBLEM => -1072882806

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_WME_VERSION_MISMATCH => -1072882805

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_REALTIME_PREPROCESS => -1072882804

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_REPEAT_PREPROCESS => -1072882803

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CANNOT_PAUSE_LIVEBROADCAST => -1072882802

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_PROFILE_NOT_SET => -1072882801

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DUPLICATE_DRMPROFILE => -1072882800

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_DEVICE => -1072882799

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_SPEECHEDL_ON_NON_MIXEDMODE => -1072882798

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_PASSWORD_TOO_LONG => -1072882797

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DEVCONTROL_FAILED_SEEK => -1072882796

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INTERLACE_REQUIRE_SAMESIZE => -1072882795

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_TOO_MANY_DEVICECONTROL => -1072882794

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_MULTIPASS_FOR_LIVEDEVICE => -1072882793

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_MISSING_AUDIENCE => -1072882792

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_AUDIENCE_CONTENTTYPE_MISMATCH => -1072882791

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_MISSING_SOURCE_INDEX => -1072882790

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NUM_LANGUAGE_MISMATCH => -1072882789

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_LANGUAGE_MISMATCH => -1072882788

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_VBRMODE_MISMATCH => -1072882787

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_INPUT_AUDIENCE_INDEX => -1072882786

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_INPUT_LANGUAGE => -1072882785

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_INPUT_STREAM => -1072882784

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_EXPECT_MONO_WAV_INPUT => -1072882783

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INPUT_WAVFORMAT_MISMATCH => -1072882782

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_RECORDQ_DISK_FULL => -1072882781

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_PAL_INVERSE_TELECINE => -1072882780

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_ACTIVE_SG_DEVICE_DISCONNECTED => -1072882779

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_ACTIVE_SG_DEVICE_CONTROL_DISCONNECTED => -1072882778

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_FRAMES_SUBMITTED_TO_ANALYZER => -1072882777

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INPUT_DOESNOT_SUPPORT_SMPTE => -1072882776

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_SMPTE_WITH_MULTIPLE_SOURCEGROUPS => -1072882775

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_BAD_CONTENTEDL => -1072882774

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INTERLACEMODE_MISMATCH => -1072882773

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NONSQUAREPIXELMODE_MISMATCH => -1072882772

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_SMPTEMODE_MISMATCH => -1072882771

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_END_OF_TAPE => -1072882770

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_MEDIA_IN_AUDIENCE => -1072882769

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_AUDIENCES => -1072882768

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_AUDIO_COMPAT => -1072882767

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_VBR_COMPAT => -1072882766

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_PROFILE_NAME => -1072882765

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_VBR_WITH_UNCOMP => -1072882764

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_MULTIPLE_VBR_AUDIENCES => -1072882763

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_UNCOMP_COMP_COMBINATION => -1072882762

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_MULTIPLE_AUDIO_CODECS => -1072882761

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_MULTIPLE_AUDIO_FORMATS => -1072882760

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_AUDIO_BITRATE_STEPDOWN => -1072882759

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_AUDIO_PEAKRATE => -1072882758

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_AUDIO_PEAKRATE_2 => -1072882757

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_AUDIO_BUFFERMAX => -1072882756

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_MULTIPLE_VIDEO_CODECS => -1072882755

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_MULTIPLE_VIDEO_SIZES => -1072882754

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_VIDEO_BITRATE => -1072882753

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_VIDEO_BITRATE_STEPDOWN => -1072882752

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_VIDEO_PEAKRATE => -1072882751

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_VIDEO_PEAKRATE_2 => -1072882750

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_VIDEO_WIDTH => -1072882749

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_VIDEO_HEIGHT => -1072882748

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_VIDEO_FPS => -1072882747

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_VIDEO_KEYFRAME => -1072882746

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_VIDEO_IQUALITY => -1072882745

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_VIDEO_CQUALITY => -1072882744

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_VIDEO_BUFFER => -1072882743

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_VIDEO_BUFFERMAX => -1072882742

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_VIDEO_BUFFERMAX_2 => -1072882741

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_VIDEO_WIDTH_ALIGN => -1072882740

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_VIDEO_HEIGHT_ALIGN => -1072882739

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_MULTIPLE_SCRIPT_BITRATES => -1072882738

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_SCRIPT_BITRATE => -1072882737

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_MULTIPLE_FILE_BITRATES => -1072882736

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_FILE_BITRATE => -1072882735

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_SAME_AS_INPUT_COMBINATION => -1072882734

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_SOURCE_CANNOT_LOOP => -1072882733

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_FOLDDOWN_COEFFICIENTS => -1072882732

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRMPROFILE_NOTFOUND => -1072882731

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_TIMECODE => -1072882730

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_AUDIO_TIMECOMPRESSION => -1072882729

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_TWOPASS_TIMECOMPRESSION => -1072882728

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_TIMECODE_REQUIRES_VIDEOSTREAM => -1072882727

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_MBR_WITH_TIMECODE => -1072882726

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_INTERLACEMODE => -1072882725

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_INTERLACE_COMPAT => -1072882724

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_NONSQUAREPIXEL_COMPAT => -1072882723

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_SOURCE_WITH_DEVICE_CONTROL => -1072882722

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CANNOT_GENERATE_BROADCAST_INFO_FOR_QUALITYVBR => -1072882721

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_EXCEED_MAX_DRM_PROFILE_LIMIT => -1072882720

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DEVICECONTROL_UNSTABLE => -1072882719

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_PIXEL_ASPECT_RATIO => -1072882718

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_AUDIENCE__LANGUAGE_CONTENTTYPE_MISMATCH => -1072882717

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_PROFILE_CONTENTTYPE => -1072882716

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_TRANSFORM_PLUGIN_NOT_FOUND => -1072882715

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_TRANSFORM_PLUGIN_INVALID => -1072882714

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_EDL_REQUIRED_FOR_DEVICE_MULTIPASS => -1072882713

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_VIDEO_WIDTH_FOR_INTERLACED_ENCODING => -1072882712

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_MARKIN_UNSUPPORTED => -1072882711

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_INVALID_APPLICATION => -1072879855

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_LICENSE_STORE_ERROR => -1072879854

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_SECURE_STORE_ERROR => -1072879853

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_LICENSE_STORE_SAVE_ERROR => -1072879852

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_SECURE_STORE_UNLOCK_ERROR => -1072879851

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_INVALID_CONTENT => -1072879850

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_UNABLE_TO_OPEN_LICENSE => -1072879849

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_INVALID_LICENSE => -1072879848

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_INVALID_MACHINE => -1072879847

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_ENUM_LICENSE_FAILED => -1072879845

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_INVALID_LICENSE_REQUEST => -1072879844

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_UNABLE_TO_INITIALIZE => -1072879843

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_UNABLE_TO_ACQUIRE_LICENSE => -1072879842

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_INVALID_LICENSE_ACQUIRED => -1072879841

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_NO_RIGHTS => -1072879840

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_KEY_ERROR => -1072879839

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_ENCRYPT_ERROR => -1072879838

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_DECRYPT_ERROR => -1072879837

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_LICENSE_INVALID_XML => -1072879835

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_DRM_LICENSE_ACQUIRED => 861990

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_DRM_INDIVIDUALIZED => 861991

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_NEEDS_INDIVIDUALIZATION => -1072879832

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_ALREADY_INDIVIDUALIZED => -1072879831

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_ACTION_NOT_QUERIED => -1072879830

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_ACQUIRING_LICENSE => -1072879829

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_INDIVIDUALIZING => -1072879828

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_BACKUP_RESTORE_FAILURE => -1072879827

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_BACKUP_RESTORE_BAD_REQUEST_ID => -1072879826

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_PARAMETERS_MISMATCHED => -1072879825

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_UNABLE_TO_CREATE_LICENSE_OBJECT => -1072879824

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_UNABLE_TO_CREATE_INDI_OBJECT => -1072879823

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_UNABLE_TO_CREATE_ENCRYPT_OBJECT => -1072879822

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_UNABLE_TO_CREATE_DECRYPT_OBJECT => -1072879821

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_UNABLE_TO_CREATE_PROPERTIES_OBJECT => -1072879820

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_UNABLE_TO_CREATE_BACKUP_OBJECT => -1072879819

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_INDIVIDUALIZE_ERROR => -1072879818

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_LICENSE_OPEN_ERROR => -1072879817

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_LICENSE_CLOSE_ERROR => -1072879816

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_GET_LICENSE_ERROR => -1072879815

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_QUERY_ERROR => -1072879814

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_REPORT_ERROR => -1072879813

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_GET_LICENSESTRING_ERROR => -1072879812

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_GET_CONTENTSTRING_ERROR => -1072879811

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_MONITOR_ERROR => -1072879810

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_UNABLE_TO_SET_PARAMETER => -1072879809

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_INVALID_APPDATA => -1072879808

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_INVALID_APPDATA_VERSION => -1072879807

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_BACKUP_EXISTS => -1072879806

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_BACKUP_CORRUPT => -1072879805

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_BACKUPRESTORE_BUSY => -1072879804

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_BACKUP_RESTORE_BAD_DATA => -1072879803

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_DRM_MONITOR_CANCELLED => 862022

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_DRM_ACQUIRE_CANCELLED => 862023

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_LICENSE_UNUSABLE => -1072879800

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_INVALID_PROPERTY => -1072879799

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_SECURE_STORE_NOT_FOUND => -1072879798

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_CACHED_CONTENT_ERROR => -1072879797

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_INDIVIDUALIZATION_INCOMPLETE => -1072879796

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_DRIVER_AUTH_FAILURE => -1072879795

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_NEED_UPGRADE_MSSAP => -1072879794

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_REOPEN_CONTENT => -1072879793

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_DRIVER_DIGIOUT_FAILURE => -1072879792

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_INVALID_SECURESTORE_PASSWORD => -1072879791

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_APPCERT_REVOKED => -1072879790

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_RESTORE_FRAUD => -1072879789

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_HARDWARE_INCONSISTENT => -1072879788

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_SDMI_TRIGGER => -1072879787

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_SDMI_NOMORECOPIES => -1072879786

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_UNABLE_TO_CREATE_HEADER_OBJECT => -1072879785

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_UNABLE_TO_CREATE_KEYS_OBJECT => -1072879784

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_LICENSE_NOTACQUIRED => -1072879783

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_UNABLE_TO_CREATE_CODING_OBJECT => -1072879782

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_UNABLE_TO_CREATE_STATE_DATA_OBJECT => -1072879781

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_BUFFER_TOO_SMALL => -1072879780

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_UNSUPPORTED_PROPERTY => -1072879779

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_ERROR_BAD_NET_RESP => -1072879778

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_STORE_NOTALLSTORED => -1072879777

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_SECURITY_COMPONENT_SIGNATURE_INVALID => -1072879776

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_INVALID_DATA => -1072879775

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_POLICY_DISABLE_ONLINE => -1072879774

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_UNABLE_TO_CREATE_AUTHENTICATION_OBJECT => -1072879773

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_NOT_CONFIGURED => -1072879772

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_DEVICE_ACTIVATION_CANCELED => -1072879771

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_BACKUP_RESTORE_TOO_MANY_RESETS => -1072879770

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_DEBUGGING_NOT_ALLOWED => -1072879769

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_OPERATION_CANCELED => -1072879768

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_RESTRICTIONS_NOT_RETRIEVED => -1072879767

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_UNABLE_TO_CREATE_PLAYLIST_OBJECT => -1072879766

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_UNABLE_TO_CREATE_PLAYLIST_BURN_OBJECT => -1072879765

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_UNABLE_TO_CREATE_DEVICE_REGISTRATION_OBJECT => -1072879764

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_UNABLE_TO_CREATE_METERING_OBJECT => -1072879763

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_DRM_BURNABLE_TRACK => 862062

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_DRM_BURNABLE_TRACK_WITH_PLAYLIST_RESTRICTION => 862063

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_TRACK_EXCEEDED_PLAYLIST_RESTICTION => -1072879760

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_TRACK_EXCEEDED_TRACKBURN_RESTRICTION => -1072879759

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_UNABLE_TO_GET_DEVICE_CERT => -1072879758

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_UNABLE_TO_GET_SECURE_CLOCK => -1072879757

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_UNABLE_TO_SET_SECURE_CLOCK => -1072879756

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_UNABLE_TO_GET_SECURE_CLOCK_FROM_SERVER => -1072879755

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_POLICY_METERING_DISABLED => -1072879754

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_TRANSFER_CHAINED_LICENSES_UNSUPPORTED => -1072879753

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_SDK_VERSIONMISMATCH => -1072879752

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_LIC_NEEDS_DEVICE_CLOCK_SET => -1072879751

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_LICENSE_HEADER_MISSING_URL => -1072879750

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DEVICE_NOT_WMDRM_DEVICE => -1072879749

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_INVALID_APPCERT => -1072879748

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_PROTOCOL_FORCEFUL_TERMINATION_ON_PETITION => -1072879747

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_PROTOCOL_FORCEFUL_TERMINATION_ON_CHALLENGE => -1072879746

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_CHECKPOINT_FAILED => -1072879745

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_BB_UNABLE_TO_INITIALIZE => -1072879744

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_UNABLE_TO_LOAD_HARDWARE_ID => -1072879743

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_UNABLE_TO_OPEN_DATA_STORE => -1072879742

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_DATASTORE_CORRUPT => -1072879741

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_UNABLE_TO_CREATE_INMEMORYSTORE_OBJECT => -1072879740

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_STUBLIB_REQUIRED => -1072879739

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_UNABLE_TO_CREATE_CERTIFICATE_OBJECT => -1072879738

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_MIGRATION_TARGET_NOT_ONLINE => -1072879737

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_INVALID_MIGRATION_IMAGE => -1072879736

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_MIGRATION_TARGET_STATES_CORRUPTED => -1072879735

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_MIGRATION_IMPORTER_NOT_AVAILABLE => -1072879734

    /**
     * @type {Integer (Int32)}
     */
    static NS_DRM_E_MIGRATION_UPGRADE_WITH_DIFF_SID => -1072879733

    /**
     * @type {Integer (Int32)}
     */
    static NS_DRM_E_MIGRATION_SOURCE_MACHINE_IN_USE => -1072879732

    /**
     * @type {Integer (Int32)}
     */
    static NS_DRM_E_MIGRATION_TARGET_MACHINE_LESS_THAN_LH => -1072879731

    /**
     * @type {Integer (Int32)}
     */
    static NS_DRM_E_MIGRATION_IMAGE_ALREADY_EXISTS => -1072879730

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_HARDWAREID_MISMATCH => -1072879729

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_DRMV2CLT_STUBLIB => -1072879728

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_MIGRATION_INVALID_LEGACYV2_DATA => -1072879727

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_MIGRATION_LICENSE_ALREADY_EXISTS => -1072879726

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_MIGRATION_INVALID_LEGACYV2_SST_PASSWORD => -1072879725

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_MIGRATION_NOT_SUPPORTED => -1072879724

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_UNABLE_TO_CREATE_MIGRATION_IMPORTER_OBJECT => -1072879723

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_CHECKPOINT_MISMATCH => -1072879722

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_CHECKPOINT_CORRUPT => -1072879721

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_REG_FLUSH_FAILURE => -1072879720

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_HDS_KEY_MISMATCH => -1072879719

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_MIGRATION_OPERATION_CANCELLED => -1072879718

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_MIGRATION_OBJECT_IN_USE => -1072879717

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_MALFORMED_CONTENT_HEADER => -1072879716

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_LICENSE_EXPIRED => -1072879656

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_LICENSE_NOTENABLED => -1072879655

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_LICENSE_APPSECLOW => -1072879654

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_STORE_NEEDINDI => -1072879653

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_STORE_NOTALLOWED => -1072879652

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_LICENSE_APP_NOTALLOWED => -1072879651

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_DRM_NEEDS_INDIVIDUALIZATION => 862174

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_LICENSE_CERT_EXPIRED => -1072879649

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_LICENSE_SECLOW => -1072879648

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_LICENSE_CONTENT_REVOKED => -1072879647

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_DEVICE_NOT_REGISTERED => -1072879646

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_LICENSE_NOSAP => -1072879606

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_LICENSE_NOSVP => -1072879605

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_LICENSE_NOWDM => -1072879604

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_LICENSE_NOTRUSTEDCODEC => -1072879603

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_SOURCEID_NOT_SUPPORTED => -1072879602

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_NEEDS_UPGRADE_TEMPFILE => -1072879555

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_NEED_UPGRADE_PD => -1072879554

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_SIGNATURE_FAILURE => -1072879553

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_LICENSE_SERVER_INFO_MISSING => -1072879552

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_BUSY => -1072879551

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_PD_TOO_MANY_DEVICES => -1072879550

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_INDIV_FRAUD => -1072879549

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_INDIV_NO_CABS => -1072879548

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_INDIV_SERVICE_UNAVAILABLE => -1072879547

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_RESTORE_SERVICE_UNAVAILABLE => -1072879546

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_CLIENT_CODE_EXPIRED => -1072879545

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_NO_UPLINK_LICENSE => -1072879544

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_INVALID_KID => -1072879543

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_LICENSE_INITIALIZATION_ERROR => -1072879542

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_CHAIN_TOO_LONG => -1072879540

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_UNSUPPORTED_ALGORITHM => -1072879539

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_LICENSE_DELETION_ERROR => -1072879538

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_INVALID_CERTIFICATE => -1072879456

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_CERTIFICATE_REVOKED => -1072879455

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_LICENSE_UNAVAILABLE => -1072879454

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_DEVICE_LIMIT_REACHED => -1072879453

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_UNABLE_TO_VERIFY_PROXIMITY => -1072879452

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_MUST_REGISTER => -1072879451

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_MUST_APPROVE => -1072879450

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_MUST_REVALIDATE => -1072879449

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_INVALID_PROXIMITY_RESPONSE => -1072879448

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_INVALID_SESSION => -1072879447

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_DEVICE_NOT_OPEN => -1072879446

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_DEVICE_ALREADY_REGISTERED => -1072879445

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_UNSUPPORTED_PROTOCOL_VERSION => -1072879444

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_UNSUPPORTED_ACTION => -1072879443

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_CERTIFICATE_SECURITY_LEVEL_INADEQUATE => -1072879442

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_UNABLE_TO_OPEN_PORT => -1072879441

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_BAD_REQUEST => -1072879440

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_INVALID_CRL => -1072879439

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_ATTRIBUTE_TOO_LONG => -1072879438

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_EXPIRED_LICENSEBLOB => -1072879437

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_INVALID_LICENSEBLOB => -1072879436

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_INCLUSION_LIST_REQUIRED => -1072879435

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_DRMV2CLT_REVOKED => -1072879434

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_DRM_RIV_TOO_SMALL => -1072879433

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_OUTPUT_PROTECTION_LEVEL_UNSUPPORTED => -1072879356

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_COMPRESSED_DIGITAL_VIDEO_PROTECTION_LEVEL_UNSUPPORTED => -1072879355

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_UNCOMPRESSED_DIGITAL_VIDEO_PROTECTION_LEVEL_UNSUPPORTED => -1072879354

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_ANALOG_VIDEO_PROTECTION_LEVEL_UNSUPPORTED => -1072879353

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_COMPRESSED_DIGITAL_AUDIO_PROTECTION_LEVEL_UNSUPPORTED => -1072879352

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_UNCOMPRESSED_DIGITAL_AUDIO_PROTECTION_LEVEL_UNSUPPORTED => -1072879351

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_OUTPUT_PROTECTION_SCHEME_UNSUPPORTED => -1072879350

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_REBOOT_RECOMMENDED => 862968

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_REBOOT_REQUIRED => 862969

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_REBOOT_RECOMMENDED => -1072878854

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_REBOOT_REQUIRED => -1072878853

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_SETUP_INCOMPLETE => -1072878852

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_SETUP_DRM_MIGRATION_FAILED => -1072878851

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_SETUP_IGNORABLE_FAILURE => -1072878850

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_SETUP_DRM_MIGRATION_FAILED_AND_IGNORABLE_FAILURE => -1072878849

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_SETUP_BLOCKED => -1072878848

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_UNKNOWN_PROTOCOL => -1072877856

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_REDIRECT_TO_PROXY => -1072877855

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INTERNAL_SERVER_ERROR => -1072877854

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_BAD_REQUEST => -1072877853

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_ERROR_FROM_PROXY => -1072877852

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PROXY_TIMEOUT => -1072877851

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_SERVER_UNAVAILABLE => -1072877850

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_REFUSED_BY_SERVER => -1072877849

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INCOMPATIBLE_SERVER => -1072877848

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_MULTICAST_DISABLED => -1072877847

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_REDIRECT => -1072877846

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_ALL_PROTOCOLS_DISABLED => -1072877845

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_MSBD_NO_LONGER_SUPPORTED => -1072877844

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PROXY_NOT_FOUND => -1072877843

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CANNOT_CONNECT_TO_PROXY => -1072877842

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_SERVER_DNS_TIMEOUT => -1072877841

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PROXY_DNS_TIMEOUT => -1072877840

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CLOSED_ON_SUSPEND => -1072877839

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CANNOT_READ_PLAYLIST_FROM_MEDIASERVER => -1072877838

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_SESSION_NOT_FOUND => -1072877837

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_REQUIRE_STREAMING_CLIENT => -1072877836

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PLAYLIST_ENTRY_HAS_CHANGED => -1072877835

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PROXY_ACCESSDENIED => -1072877834

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PROXY_SOURCE_ACCESSDENIED => -1072877833

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NETWORK_SINK_WRITE => -1072877832

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_FIREWALL => -1072877831

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_MMS_NOT_SUPPORTED => -1072877830

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_SERVER_ACCESSDENIED => -1072877829

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_RESOURCE_GONE => -1072877828

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_NO_EXISTING_PACKETIZER => -1072877827

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_BAD_SYNTAX_IN_SERVER_RESPONSE => -1072877826

    /**
     * @type {Integer (Int32)}
     */
    static NS_I_RECONNECTED => 1074605823

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_RESET_SOCKET_CONNECTION => -1072877824

    /**
     * @type {Integer (Int32)}
     */
    static NS_I_NOLOG_STOP => 1074605825

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_TOO_MANY_HOPS => -1072877822

    /**
     * @type {Integer (Int32)}
     */
    static NS_I_EXISTING_PACKETIZER => 1074605827

    /**
     * @type {Integer (Int32)}
     */
    static NS_I_MANUAL_PROXY => 1074605828

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_TOO_MUCH_DATA_FROM_SERVER => -1072877819

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_CONNECT_TIMEOUT => -1072877818

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PROXY_CONNECT_TIMEOUT => -1072877817

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_SESSION_INVALID => -1072877816

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_EOSRECEDING => 864009

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PACKETSINK_UNKNOWN_FEC_STREAM => -1072877814

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PUSH_CANNOTCONNECT => -1072877813

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INCOMPATIBLE_PUSH_SERVER => -1072877812

    /**
     * @type {Integer (Int32)}
     */
    static NS_S_CHANGENOTICE => 864013

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_END_OF_PLAYLIST => -1072876856

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_USE_FILE_SOURCE => -1072876855

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PROPERTY_NOT_FOUND => -1072876854

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PROPERTY_READ_ONLY => -1072876852

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_TABLE_KEY_NOT_FOUND => -1072876851

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_QUERY_OPERATOR => -1072876849

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_INVALID_QUERY_PROPERTY => -1072876848

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_PROPERTY_NOT_SUPPORTED => -1072876846

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_SCHEMA_CLASSIFY_FAILURE => -1072876844

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_METADATA_FORMAT_NOT_SUPPORTED => -1072876843

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_METADATA_NO_EDITING_CAPABILITY => -1072876842

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_METADATA_CANNOT_SET_LOCALE => -1072876841

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_METADATA_LANGUAGE_NOT_SUPORTED => -1072876840

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_METADATA_NO_RFC1766_NAME_FOR_LOCALE => -1072876839

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_METADATA_NOT_AVAILABLE => -1072876838

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_METADATA_CACHE_DATA_NOT_AVAILABLE => -1072876837

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_METADATA_INVALID_DOCUMENT_TYPE => -1072876836

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_METADATA_IDENTIFIER_NOT_AVAILABLE => -1072876835

    /**
     * @type {Integer (Int32)}
     */
    static NS_E_METADATA_CANNOT_RETRIEVE_FROM_OFFLINE_CACHE => -1072876834

    /**
     * @type {Integer (UInt32)}
     */
    static VFW_HIDE_SETTINGS_PAGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VFW_HIDE_VIDEOSRC_PAGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VFW_HIDE_CAMERACONTROL_PAGE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static VFW_OEM_ADD_PAGE => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static VFW_USE_DEVICE_HANDLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VFW_USE_STREAM_HANDLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VFW_QUERY_DEV_CHANGED => 256

    /**
     * @type {String}
     */
    static TARGET_DEVICE_FRIENDLY_NAME => "TargetDeviceFriendlyName"

    /**
     * @type {String}
     */
    static TARGET_DEVICE_OPEN_EXCLUSIVELY => "TargetDeviceOpenExclusively"

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_INVALID_DEVICE_ID => 257

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_UNRECOGNIZED_KEYWORD => 259

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_UNRECOGNIZED_COMMAND => 261

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_HARDWARE => 262

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_INVALID_DEVICE_NAME => 263

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_OUT_OF_MEMORY => 264

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_DEVICE_OPEN => 265

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_CANNOT_LOAD_DRIVER => 266

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_MISSING_COMMAND_STRING => 267

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_PARAM_OVERFLOW => 268

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_MISSING_STRING_ARGUMENT => 269

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_BAD_INTEGER => 270

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_PARSER_INTERNAL => 271

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_DRIVER_INTERNAL => 272

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_MISSING_PARAMETER => 273

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_UNSUPPORTED_FUNCTION => 274

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_FILE_NOT_FOUND => 275

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_DEVICE_NOT_READY => 276

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_INTERNAL => 277

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_DRIVER => 278

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_CANNOT_USE_ALL => 279

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_MULTIPLE => 280

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_EXTENSION_NOT_FOUND => 281

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_OUTOFRANGE => 282

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_FLAGS_NOT_COMPATIBLE => 284

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_FILE_NOT_SAVED => 286

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_DEVICE_TYPE_REQUIRED => 287

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_DEVICE_LOCKED => 288

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_DUPLICATE_ALIAS => 289

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_BAD_CONSTANT => 290

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_MUST_USE_SHAREABLE => 291

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_MISSING_DEVICE_NAME => 292

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_BAD_TIME_FORMAT => 293

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_NO_CLOSING_QUOTE => 294

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_DUPLICATE_FLAGS => 295

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_INVALID_FILE => 296

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_NULL_PARAMETER_BLOCK => 297

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_UNNAMED_RESOURCE => 298

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_NEW_REQUIRES_ALIAS => 299

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_NOTIFY_ON_AUTO_OPEN => 300

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_NO_ELEMENT_ALLOWED => 301

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_NONAPPLICABLE_FUNCTION => 302

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_ILLEGAL_FOR_AUTO_OPEN => 303

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_FILENAME_REQUIRED => 304

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_EXTRA_CHARACTERS => 305

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_DEVICE_NOT_INSTALLED => 306

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_GET_CD => 307

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_SET_CD => 308

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_SET_DRIVE => 309

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_DEVICE_LENGTH => 310

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_DEVICE_ORD_LENGTH => 311

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_NO_INTEGER => 312

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_WAVE_OUTPUTSINUSE => 320

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_WAVE_SETOUTPUTINUSE => 321

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_WAVE_INPUTSINUSE => 322

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_WAVE_SETINPUTINUSE => 323

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_WAVE_OUTPUTUNSPECIFIED => 324

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_WAVE_INPUTUNSPECIFIED => 325

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_WAVE_OUTPUTSUNSUITABLE => 326

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_WAVE_SETOUTPUTUNSUITABLE => 327

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_WAVE_INPUTSUNSUITABLE => 328

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_WAVE_SETINPUTUNSUITABLE => 329

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_SEQ_DIV_INCOMPATIBLE => 336

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_SEQ_PORT_INUSE => 337

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_SEQ_PORT_NONEXISTENT => 338

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_SEQ_PORT_MAPNODEVICE => 339

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_SEQ_PORT_MISCERROR => 340

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_SEQ_TIMER => 341

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_SEQ_PORTUNSPECIFIED => 342

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_SEQ_NOMIDIPRESENT => 343

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_NO_WINDOW => 346

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_CREATEWINDOW => 347

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_FILE_READ => 348

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_FILE_WRITE => 349

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_NO_IDENTITY => 350

    /**
     * @type {Integer (UInt32)}
     */
    static MCIERR_CUSTOM_DRIVER_BASE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_FIRST => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_ESCAPE => 2053

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_INFO => 2058

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_GETDEVCAPS => 2059

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_SPIN => 2060

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_SET => 2061

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_SYSINFO => 2064

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_BREAK => 2065

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_STATUS => 2068

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_CUE => 2096

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_REALIZE => 2112

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_WINDOW => 2113

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_PUT => 2114

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_WHERE => 2115

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_FREEZE => 2116

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_UNFREEZE => 2117

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_LOAD => 2128

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_UPDATE => 2132

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_USER_MESSAGES => 3072

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_LAST => 4095

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_DEVTYPE_VCR => 513

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_DEVTYPE_VIDEODISC => 514

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_DEVTYPE_OVERLAY => 515

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_DEVTYPE_CD_AUDIO => 516

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_DEVTYPE_DAT => 517

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_DEVTYPE_SCANNER => 518

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_DEVTYPE_ANIMATION => 519

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_DEVTYPE_DIGITAL_VIDEO => 520

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_DEVTYPE_OTHER => 521

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_DEVTYPE_WAVEFORM_AUDIO => 522

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_DEVTYPE_SEQUENCER => 523

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_DEVTYPE_FIRST => 513

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_DEVTYPE_LAST => 523

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_DEVTYPE_FIRST_USER => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_FORMAT_MILLISECONDS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_FORMAT_HMS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_FORMAT_MSF => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_FORMAT_FRAMES => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_FORMAT_SMPTE_24 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_FORMAT_SMPTE_25 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_FORMAT_SMPTE_30 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_FORMAT_SMPTE_30DROP => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_FORMAT_BYTES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_FORMAT_SAMPLES => 9

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_FORMAT_TMSF => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_NOTIFY_SUCCESSFUL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_NOTIFY_SUPERSEDED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_NOTIFY_ABORTED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_NOTIFY_FAILURE => 8

    /**
     * @type {Integer (Int32)}
     */
    static MCI_NOTIFY => 1

    /**
     * @type {Integer (Int32)}
     */
    static MCI_WAIT => 2

    /**
     * @type {Integer (Int32)}
     */
    static MCI_FROM => 4

    /**
     * @type {Integer (Int32)}
     */
    static MCI_TO => 8

    /**
     * @type {Integer (Int32)}
     */
    static MCI_TRACK => 16

    /**
     * @type {Integer (Int32)}
     */
    static MCI_OPEN_SHAREABLE => 256

    /**
     * @type {Integer (Int32)}
     */
    static MCI_OPEN_ELEMENT => 512

    /**
     * @type {Integer (Int32)}
     */
    static MCI_OPEN_ALIAS => 1024

    /**
     * @type {Integer (Int32)}
     */
    static MCI_OPEN_ELEMENT_ID => 2048

    /**
     * @type {Integer (Int32)}
     */
    static MCI_OPEN_TYPE_ID => 4096

    /**
     * @type {Integer (Int32)}
     */
    static MCI_OPEN_TYPE => 8192

    /**
     * @type {Integer (Int32)}
     */
    static MCI_SEEK_TO_START => 256

    /**
     * @type {Integer (Int32)}
     */
    static MCI_SEEK_TO_END => 512

    /**
     * @type {Integer (Int32)}
     */
    static MCI_STATUS_ITEM => 256

    /**
     * @type {Integer (Int32)}
     */
    static MCI_STATUS_START => 512

    /**
     * @type {Integer (Int32)}
     */
    static MCI_STATUS_LENGTH => 1

    /**
     * @type {Integer (Int32)}
     */
    static MCI_STATUS_POSITION => 2

    /**
     * @type {Integer (Int32)}
     */
    static MCI_STATUS_NUMBER_OF_TRACKS => 3

    /**
     * @type {Integer (Int32)}
     */
    static MCI_STATUS_MODE => 4

    /**
     * @type {Integer (Int32)}
     */
    static MCI_STATUS_MEDIA_PRESENT => 5

    /**
     * @type {Integer (Int32)}
     */
    static MCI_STATUS_TIME_FORMAT => 6

    /**
     * @type {Integer (Int32)}
     */
    static MCI_STATUS_READY => 7

    /**
     * @type {Integer (Int32)}
     */
    static MCI_STATUS_CURRENT_TRACK => 8

    /**
     * @type {Integer (Int32)}
     */
    static MCI_INFO_PRODUCT => 256

    /**
     * @type {Integer (Int32)}
     */
    static MCI_INFO_FILE => 512

    /**
     * @type {Integer (Int32)}
     */
    static MCI_INFO_MEDIA_UPC => 1024

    /**
     * @type {Integer (Int32)}
     */
    static MCI_INFO_MEDIA_IDENTITY => 2048

    /**
     * @type {Integer (Int32)}
     */
    static MCI_INFO_NAME => 4096

    /**
     * @type {Integer (Int32)}
     */
    static MCI_INFO_COPYRIGHT => 8192

    /**
     * @type {Integer (Int32)}
     */
    static MCI_GETDEVCAPS_ITEM => 256

    /**
     * @type {Integer (Int32)}
     */
    static MCI_GETDEVCAPS_CAN_RECORD => 1

    /**
     * @type {Integer (Int32)}
     */
    static MCI_GETDEVCAPS_HAS_AUDIO => 2

    /**
     * @type {Integer (Int32)}
     */
    static MCI_GETDEVCAPS_HAS_VIDEO => 3

    /**
     * @type {Integer (Int32)}
     */
    static MCI_GETDEVCAPS_DEVICE_TYPE => 4

    /**
     * @type {Integer (Int32)}
     */
    static MCI_GETDEVCAPS_USES_FILES => 5

    /**
     * @type {Integer (Int32)}
     */
    static MCI_GETDEVCAPS_COMPOUND_DEVICE => 6

    /**
     * @type {Integer (Int32)}
     */
    static MCI_GETDEVCAPS_CAN_EJECT => 7

    /**
     * @type {Integer (Int32)}
     */
    static MCI_GETDEVCAPS_CAN_PLAY => 8

    /**
     * @type {Integer (Int32)}
     */
    static MCI_GETDEVCAPS_CAN_SAVE => 9

    /**
     * @type {Integer (Int32)}
     */
    static MCI_SYSINFO_QUANTITY => 256

    /**
     * @type {Integer (Int32)}
     */
    static MCI_SYSINFO_OPEN => 512

    /**
     * @type {Integer (Int32)}
     */
    static MCI_SYSINFO_NAME => 1024

    /**
     * @type {Integer (Int32)}
     */
    static MCI_SYSINFO_INSTALLNAME => 2048

    /**
     * @type {Integer (Int32)}
     */
    static MCI_SET_DOOR_OPEN => 256

    /**
     * @type {Integer (Int32)}
     */
    static MCI_SET_DOOR_CLOSED => 512

    /**
     * @type {Integer (Int32)}
     */
    static MCI_SET_TIME_FORMAT => 1024

    /**
     * @type {Integer (Int32)}
     */
    static MCI_SET_AUDIO => 2048

    /**
     * @type {Integer (Int32)}
     */
    static MCI_SET_VIDEO => 4096

    /**
     * @type {Integer (Int32)}
     */
    static MCI_SET_ON => 8192

    /**
     * @type {Integer (Int32)}
     */
    static MCI_SET_OFF => 16384

    /**
     * @type {Integer (Int32)}
     */
    static MCI_SET_AUDIO_ALL => 0

    /**
     * @type {Integer (Int32)}
     */
    static MCI_SET_AUDIO_LEFT => 1

    /**
     * @type {Integer (Int32)}
     */
    static MCI_SET_AUDIO_RIGHT => 2

    /**
     * @type {Integer (Int32)}
     */
    static MCI_BREAK_KEY => 256

    /**
     * @type {Integer (Int32)}
     */
    static MCI_BREAK_HWND => 512

    /**
     * @type {Integer (Int32)}
     */
    static MCI_BREAK_OFF => 1024

    /**
     * @type {Integer (Int32)}
     */
    static MCI_RECORD_INSERT => 256

    /**
     * @type {Integer (Int32)}
     */
    static MCI_RECORD_OVERWRITE => 512

    /**
     * @type {Integer (Int32)}
     */
    static MCI_SAVE_FILE => 256

    /**
     * @type {Integer (Int32)}
     */
    static MCI_LOAD_FILE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_VD_MODE_PARK => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_VD_MEDIA_CLV => 1026

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_VD_MEDIA_CAV => 1027

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_VD_MEDIA_OTHER => 1028

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_VD_FORMAT_TRACK => 16385

    /**
     * @type {Integer (Int32)}
     */
    static MCI_VD_PLAY_REVERSE => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_VD_PLAY_FAST => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_VD_PLAY_SPEED => 262144

    /**
     * @type {Integer (Int32)}
     */
    static MCI_VD_PLAY_SCAN => 524288

    /**
     * @type {Integer (Int32)}
     */
    static MCI_VD_PLAY_SLOW => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static MCI_VD_SEEK_REVERSE => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_VD_STATUS_SPEED => 16386

    /**
     * @type {Integer (Int32)}
     */
    static MCI_VD_STATUS_FORWARD => 16387

    /**
     * @type {Integer (Int32)}
     */
    static MCI_VD_STATUS_MEDIA_TYPE => 16388

    /**
     * @type {Integer (Int32)}
     */
    static MCI_VD_STATUS_SIDE => 16389

    /**
     * @type {Integer (Int32)}
     */
    static MCI_VD_STATUS_DISC_SIZE => 16390

    /**
     * @type {Integer (Int32)}
     */
    static MCI_VD_GETDEVCAPS_CLV => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_VD_GETDEVCAPS_CAV => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_VD_SPIN_UP => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_VD_SPIN_DOWN => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_VD_GETDEVCAPS_CAN_REVERSE => 16386

    /**
     * @type {Integer (Int32)}
     */
    static MCI_VD_GETDEVCAPS_FAST_RATE => 16387

    /**
     * @type {Integer (Int32)}
     */
    static MCI_VD_GETDEVCAPS_SLOW_RATE => 16388

    /**
     * @type {Integer (Int32)}
     */
    static MCI_VD_GETDEVCAPS_NORMAL_RATE => 16389

    /**
     * @type {Integer (Int32)}
     */
    static MCI_VD_STEP_FRAMES => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_VD_STEP_REVERSE => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_VD_ESCAPE_STRING => 256

    /**
     * @type {Integer (Int32)}
     */
    static MCI_CDA_STATUS_TYPE_TRACK => 16385

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_CDA_TRACK_AUDIO => 1088

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_CDA_TRACK_OTHER => 1089

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_WAVE_PCM => 1152

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_WAVE_MAPPER => 1153

    /**
     * @type {Integer (Int32)}
     */
    static MCI_WAVE_OPEN_BUFFER => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_WAVE_SET_FORMATTAG => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_WAVE_SET_CHANNELS => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_WAVE_SET_SAMPLESPERSEC => 262144

    /**
     * @type {Integer (Int32)}
     */
    static MCI_WAVE_SET_AVGBYTESPERSEC => 524288

    /**
     * @type {Integer (Int32)}
     */
    static MCI_WAVE_SET_BLOCKALIGN => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static MCI_WAVE_SET_BITSPERSAMPLE => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static MCI_WAVE_INPUT => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static MCI_WAVE_OUTPUT => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static MCI_WAVE_STATUS_FORMATTAG => 16385

    /**
     * @type {Integer (Int32)}
     */
    static MCI_WAVE_STATUS_CHANNELS => 16386

    /**
     * @type {Integer (Int32)}
     */
    static MCI_WAVE_STATUS_SAMPLESPERSEC => 16387

    /**
     * @type {Integer (Int32)}
     */
    static MCI_WAVE_STATUS_AVGBYTESPERSEC => 16388

    /**
     * @type {Integer (Int32)}
     */
    static MCI_WAVE_STATUS_BLOCKALIGN => 16389

    /**
     * @type {Integer (Int32)}
     */
    static MCI_WAVE_STATUS_BITSPERSAMPLE => 16390

    /**
     * @type {Integer (Int32)}
     */
    static MCI_WAVE_STATUS_LEVEL => 16391

    /**
     * @type {Integer (Int32)}
     */
    static MCI_WAVE_SET_ANYINPUT => 67108864

    /**
     * @type {Integer (Int32)}
     */
    static MCI_WAVE_SET_ANYOUTPUT => 134217728

    /**
     * @type {Integer (Int32)}
     */
    static MCI_WAVE_GETDEVCAPS_INPUTS => 16385

    /**
     * @type {Integer (Int32)}
     */
    static MCI_WAVE_GETDEVCAPS_OUTPUTS => 16386

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_SEQ_FORMAT_SONGPTR => 16385

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_SEQ_FILE => 16386

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_SEQ_MIDI => 16387

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_SEQ_SMPTE => 16388

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_SEQ_NONE => 65533

    /**
     * @type {Integer (UInt32)}
     */
    static MCI_SEQ_MAPPER => 65535

    /**
     * @type {Integer (Int32)}
     */
    static MCI_SEQ_STATUS_TEMPO => 16386

    /**
     * @type {Integer (Int32)}
     */
    static MCI_SEQ_STATUS_PORT => 16387

    /**
     * @type {Integer (Int32)}
     */
    static MCI_SEQ_STATUS_SLAVE => 16391

    /**
     * @type {Integer (Int32)}
     */
    static MCI_SEQ_STATUS_MASTER => 16392

    /**
     * @type {Integer (Int32)}
     */
    static MCI_SEQ_STATUS_OFFSET => 16393

    /**
     * @type {Integer (Int32)}
     */
    static MCI_SEQ_STATUS_DIVTYPE => 16394

    /**
     * @type {Integer (Int32)}
     */
    static MCI_SEQ_STATUS_NAME => 16395

    /**
     * @type {Integer (Int32)}
     */
    static MCI_SEQ_STATUS_COPYRIGHT => 16396

    /**
     * @type {Integer (Int32)}
     */
    static MCI_SEQ_SET_TEMPO => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_SEQ_SET_PORT => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_SEQ_SET_SLAVE => 262144

    /**
     * @type {Integer (Int32)}
     */
    static MCI_SEQ_SET_MASTER => 524288

    /**
     * @type {Integer (Int32)}
     */
    static MCI_SEQ_SET_OFFSET => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static MCI_ANIM_OPEN_WS => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_ANIM_OPEN_PARENT => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_ANIM_OPEN_NOSTATIC => 262144

    /**
     * @type {Integer (Int32)}
     */
    static MCI_ANIM_PLAY_SPEED => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_ANIM_PLAY_REVERSE => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_ANIM_PLAY_FAST => 262144

    /**
     * @type {Integer (Int32)}
     */
    static MCI_ANIM_PLAY_SLOW => 524288

    /**
     * @type {Integer (Int32)}
     */
    static MCI_ANIM_PLAY_SCAN => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static MCI_ANIM_STEP_REVERSE => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_ANIM_STEP_FRAMES => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_ANIM_STATUS_SPEED => 16385

    /**
     * @type {Integer (Int32)}
     */
    static MCI_ANIM_STATUS_FORWARD => 16386

    /**
     * @type {Integer (Int32)}
     */
    static MCI_ANIM_STATUS_HWND => 16387

    /**
     * @type {Integer (Int32)}
     */
    static MCI_ANIM_STATUS_HPAL => 16388

    /**
     * @type {Integer (Int32)}
     */
    static MCI_ANIM_STATUS_STRETCH => 16389

    /**
     * @type {Integer (Int32)}
     */
    static MCI_ANIM_INFO_TEXT => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_ANIM_GETDEVCAPS_CAN_REVERSE => 16385

    /**
     * @type {Integer (Int32)}
     */
    static MCI_ANIM_GETDEVCAPS_FAST_RATE => 16386

    /**
     * @type {Integer (Int32)}
     */
    static MCI_ANIM_GETDEVCAPS_SLOW_RATE => 16387

    /**
     * @type {Integer (Int32)}
     */
    static MCI_ANIM_GETDEVCAPS_NORMAL_RATE => 16388

    /**
     * @type {Integer (Int32)}
     */
    static MCI_ANIM_GETDEVCAPS_PALETTES => 16390

    /**
     * @type {Integer (Int32)}
     */
    static MCI_ANIM_GETDEVCAPS_CAN_STRETCH => 16391

    /**
     * @type {Integer (Int32)}
     */
    static MCI_ANIM_GETDEVCAPS_MAX_WINDOWS => 16392

    /**
     * @type {Integer (Int32)}
     */
    static MCI_ANIM_REALIZE_NORM => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_ANIM_REALIZE_BKGD => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_ANIM_WINDOW_HWND => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_ANIM_WINDOW_STATE => 262144

    /**
     * @type {Integer (Int32)}
     */
    static MCI_ANIM_WINDOW_TEXT => 524288

    /**
     * @type {Integer (Int32)}
     */
    static MCI_ANIM_WINDOW_ENABLE_STRETCH => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static MCI_ANIM_WINDOW_DISABLE_STRETCH => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static MCI_ANIM_WINDOW_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static MCI_ANIM_RECT => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_ANIM_PUT_SOURCE => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_ANIM_PUT_DESTINATION => 262144

    /**
     * @type {Integer (Int32)}
     */
    static MCI_ANIM_WHERE_SOURCE => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_ANIM_WHERE_DESTINATION => 262144

    /**
     * @type {Integer (Int32)}
     */
    static MCI_ANIM_UPDATE_HDC => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_OVLY_OPEN_WS => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_OVLY_OPEN_PARENT => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_OVLY_STATUS_HWND => 16385

    /**
     * @type {Integer (Int32)}
     */
    static MCI_OVLY_STATUS_STRETCH => 16386

    /**
     * @type {Integer (Int32)}
     */
    static MCI_OVLY_INFO_TEXT => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_OVLY_GETDEVCAPS_CAN_STRETCH => 16385

    /**
     * @type {Integer (Int32)}
     */
    static MCI_OVLY_GETDEVCAPS_CAN_FREEZE => 16386

    /**
     * @type {Integer (Int32)}
     */
    static MCI_OVLY_GETDEVCAPS_MAX_WINDOWS => 16387

    /**
     * @type {Integer (Int32)}
     */
    static MCI_OVLY_WINDOW_HWND => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_OVLY_WINDOW_STATE => 262144

    /**
     * @type {Integer (Int32)}
     */
    static MCI_OVLY_WINDOW_TEXT => 524288

    /**
     * @type {Integer (Int32)}
     */
    static MCI_OVLY_WINDOW_ENABLE_STRETCH => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static MCI_OVLY_WINDOW_DISABLE_STRETCH => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static MCI_OVLY_WINDOW_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static MCI_OVLY_RECT => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MCI_OVLY_PUT_SOURCE => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_OVLY_PUT_DESTINATION => 262144

    /**
     * @type {Integer (Int32)}
     */
    static MCI_OVLY_PUT_FRAME => 524288

    /**
     * @type {Integer (Int32)}
     */
    static MCI_OVLY_PUT_VIDEO => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static MCI_OVLY_WHERE_SOURCE => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MCI_OVLY_WHERE_DESTINATION => 262144

    /**
     * @type {Integer (Int32)}
     */
    static MCI_OVLY_WHERE_FRAME => 524288

    /**
     * @type {Integer (Int32)}
     */
    static MCI_OVLY_WHERE_VIDEO => 1048576
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {Integer} mciId 
     * @param {Integer} uMsg 
     * @param {Pointer} dwParam1 
     * @param {Pointer} dwParam2 
     * @returns {Integer} 
     */
    static mciSendCommandA(mciId, uMsg, dwParam1, dwParam2) {
        result := DllCall("WINMM.dll\mciSendCommandA", "uint", mciId, "uint", uMsg, "ptr", dwParam1, "ptr", dwParam2, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} mciId 
     * @param {Integer} uMsg 
     * @param {Pointer} dwParam1 
     * @param {Pointer} dwParam2 
     * @returns {Integer} 
     */
    static mciSendCommandW(mciId, uMsg, dwParam1, dwParam2) {
        result := DllCall("WINMM.dll\mciSendCommandW", "uint", mciId, "uint", uMsg, "ptr", dwParam1, "ptr", dwParam2, "uint")
        return result
    }

    /**
     * 
     * @param {PSTR} lpstrCommand 
     * @param {PSTR} lpstrReturnString 
     * @param {Integer} uReturnLength 
     * @param {HWND} hwndCallback 
     * @returns {Integer} 
     */
    static mciSendStringA(lpstrCommand, lpstrReturnString, uReturnLength, hwndCallback) {
        lpstrCommand := lpstrCommand is String ? StrPtr(lpstrCommand) : lpstrCommand
        lpstrReturnString := lpstrReturnString is String ? StrPtr(lpstrReturnString) : lpstrReturnString
        hwndCallback := hwndCallback is Win32Handle ? NumGet(hwndCallback, "ptr") : hwndCallback

        result := DllCall("WINMM.dll\mciSendStringA", "ptr", lpstrCommand, "ptr", lpstrReturnString, "uint", uReturnLength, "ptr", hwndCallback, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} lpstrCommand 
     * @param {PWSTR} lpstrReturnString 
     * @param {Integer} uReturnLength 
     * @param {HWND} hwndCallback 
     * @returns {Integer} 
     */
    static mciSendStringW(lpstrCommand, lpstrReturnString, uReturnLength, hwndCallback) {
        lpstrCommand := lpstrCommand is String ? StrPtr(lpstrCommand) : lpstrCommand
        lpstrReturnString := lpstrReturnString is String ? StrPtr(lpstrReturnString) : lpstrReturnString
        hwndCallback := hwndCallback is Win32Handle ? NumGet(hwndCallback, "ptr") : hwndCallback

        result := DllCall("WINMM.dll\mciSendStringW", "ptr", lpstrCommand, "ptr", lpstrReturnString, "uint", uReturnLength, "ptr", hwndCallback, "uint")
        return result
    }

    /**
     * 
     * @param {PSTR} pszDevice 
     * @returns {Integer} 
     */
    static mciGetDeviceIDA(pszDevice) {
        pszDevice := pszDevice is String ? StrPtr(pszDevice) : pszDevice

        result := DllCall("WINMM.dll\mciGetDeviceIDA", "ptr", pszDevice, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszDevice 
     * @returns {Integer} 
     */
    static mciGetDeviceIDW(pszDevice) {
        pszDevice := pszDevice is String ? StrPtr(pszDevice) : pszDevice

        result := DllCall("WINMM.dll\mciGetDeviceIDW", "ptr", pszDevice, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} dwElementID 
     * @param {PSTR} lpstrType 
     * @returns {Integer} 
     */
    static mciGetDeviceIDFromElementIDA(dwElementID, lpstrType) {
        lpstrType := lpstrType is String ? StrPtr(lpstrType) : lpstrType

        result := DllCall("WINMM.dll\mciGetDeviceIDFromElementIDA", "uint", dwElementID, "ptr", lpstrType, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} dwElementID 
     * @param {PWSTR} lpstrType 
     * @returns {Integer} 
     */
    static mciGetDeviceIDFromElementIDW(dwElementID, lpstrType) {
        lpstrType := lpstrType is String ? StrPtr(lpstrType) : lpstrType

        result := DllCall("WINMM.dll\mciGetDeviceIDFromElementIDW", "uint", dwElementID, "ptr", lpstrType, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} mcierr 
     * @param {PSTR} pszText 
     * @param {Integer} cchText 
     * @returns {BOOL} 
     */
    static mciGetErrorStringA(mcierr, pszText, cchText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := DllCall("WINMM.dll\mciGetErrorStringA", "uint", mcierr, "ptr", pszText, "uint", cchText, "int")
        return result
    }

    /**
     * 
     * @param {Integer} mcierr 
     * @param {PWSTR} pszText 
     * @param {Integer} cchText 
     * @returns {BOOL} 
     */
    static mciGetErrorStringW(mcierr, pszText, cchText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := DllCall("WINMM.dll\mciGetErrorStringW", "uint", mcierr, "ptr", pszText, "uint", cchText, "int")
        return result
    }

    /**
     * 
     * @param {Integer} mciId 
     * @param {Pointer<YIELDPROC>} fpYieldProc 
     * @param {Integer} dwYieldData 
     * @returns {BOOL} 
     */
    static mciSetYieldProc(mciId, fpYieldProc, dwYieldData) {
        result := DllCall("WINMM.dll\mciSetYieldProc", "uint", mciId, "ptr", fpYieldProc, "uint", dwYieldData, "int")
        return result
    }

    /**
     * 
     * @param {Integer} mciId 
     * @returns {HTASK} 
     */
    static mciGetCreatorTask(mciId) {
        result := DllCall("WINMM.dll\mciGetCreatorTask", "uint", mciId, "ptr")
        return HTASK({Value: result}, True)
    }

    /**
     * 
     * @param {Integer} mciId 
     * @param {Pointer<Integer>} pdwYieldData 
     * @returns {Pointer<YIELDPROC>} 
     */
    static mciGetYieldProc(mciId, pdwYieldData) {
        pdwYieldDataMarshal := pdwYieldData is VarRef ? "uint*" : "ptr"

        result := DllCall("WINMM.dll\mciGetYieldProc", "uint", mciId, pdwYieldDataMarshal, pdwYieldData, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} wDeviceID 
     * @returns {Pointer} 
     */
    static mciGetDriverData(wDeviceID) {
        result := DllCall("WINMM.dll\mciGetDriverData", "uint", wDeviceID, "ptr")
        return result
    }

    /**
     * 
     * @param {HANDLE} hInstance 
     * @param {PWSTR} lpResName 
     * @param {Integer} wType 
     * @returns {Integer} 
     */
    static mciLoadCommandResource(hInstance, lpResName, wType) {
        hInstance := hInstance is Win32Handle ? NumGet(hInstance, "ptr") : hInstance
        lpResName := lpResName is String ? StrPtr(lpResName) : lpResName

        result := DllCall("WINMM.dll\mciLoadCommandResource", "ptr", hInstance, "ptr", lpResName, "uint", wType, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} wDeviceID 
     * @param {Pointer} dwData 
     * @returns {BOOL} 
     */
    static mciSetDriverData(wDeviceID, dwData) {
        result := DllCall("WINMM.dll\mciSetDriverData", "uint", wDeviceID, "ptr", dwData, "int")
        return result
    }

    /**
     * 
     * @param {Integer} wDeviceID 
     * @returns {Integer} 
     */
    static mciDriverYield(wDeviceID) {
        result := DllCall("WINMM.dll\mciDriverYield", "uint", wDeviceID, "uint")
        return result
    }

    /**
     * 
     * @param {HANDLE} hwndCallback 
     * @param {Integer} wDeviceID 
     * @param {Integer} uStatus 
     * @returns {BOOL} 
     */
    static mciDriverNotify(hwndCallback, wDeviceID, uStatus) {
        hwndCallback := hwndCallback is Win32Handle ? NumGet(hwndCallback, "ptr") : hwndCallback

        result := DllCall("WINMM.dll\mciDriverNotify", "ptr", hwndCallback, "uint", wDeviceID, "uint", uStatus, "int")
        return result
    }

    /**
     * 
     * @param {Integer} wTable 
     * @returns {BOOL} 
     */
    static mciFreeCommandResource(wTable) {
        result := DllCall("WINMM.dll\mciFreeCommandResource", "uint", wTable, "int")
        return result
    }

    /**
     * Closes an installable driver.
     * @param {HDRVR} hDriver Handle of an installable driver instance. The handle must have been previously created by using the <a href="https://docs.microsoft.com/previous-versions/dd743639(v=vs.85)">OpenDriver</a> function.
     * @param {LPARAM} lParam1 32-bit driver-specific data.
     * @param {LPARAM} lParam2 32-bit driver-specific data.
     * @returns {LRESULT} Returns nonzero if successful or zero otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//mmiscapi/nf-mmiscapi-closedriver
     * @since windows5.0
     */
    static CloseDriver(hDriver, lParam1, lParam2) {
        hDriver := hDriver is Win32Handle ? NumGet(hDriver, "ptr") : hDriver

        result := DllCall("WINMM.dll\CloseDriver", "ptr", hDriver, "ptr", lParam1, "ptr", lParam2, "ptr")
        return result
    }

    /**
     * Opens an instance of an installable driver and initializes the instance using either the driver's default settings or a driver-specific value.
     * @param {PWSTR} szDriverName Address of a null-terminated, wide-character string that specifies the filename of an installable driver or the name of a registry value associated with the installable driver. (This value must have been previously set when the driver was installed.)
     * @param {PWSTR} szSectionName Address of a null-terminated, wide-character string that specifies the name of the registry key containing the registry value given by the <i>lpDriverName</i> parameter. If <i>lpSectionName</i> is <b>NULL</b>, the registry key is assumed to be <b>Drivers32</b>.
     * @param {LPARAM} lParam2 32-bit driver-specific value. This value is passed as the <i>lParam2</i> parameter to the <a href="https://docs.microsoft.com/previous-versions/dd797918(v=vs.85)">DriverProc</a> function of the installable driver.
     * @returns {HDRVR} Returns the handle of the installable driver instance if successful or <b>NULL</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//mmiscapi/nf-mmiscapi-opendriver
     * @since windows5.0
     */
    static OpenDriver(szDriverName, szSectionName, lParam2) {
        szDriverName := szDriverName is String ? StrPtr(szDriverName) : szDriverName
        szSectionName := szSectionName is String ? StrPtr(szSectionName) : szSectionName

        result := DllCall("WINMM.dll\OpenDriver", "ptr", szDriverName, "ptr", szSectionName, "ptr", lParam2, "ptr")
        return HDRVR({Value: result}, True)
    }

    /**
     * Sends the specified message to the installable driver.
     * @param {HDRVR} hDriver Handle of the installable driver instance. The handle must been previously created by using the <a href="https://docs.microsoft.com/previous-versions/dd743639(v=vs.85)">OpenDriver</a> function.
     * @param {Integer} message Driver message value. It can be a custom message value or one of these standard message values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DRV_QUERYCONFIGURE"></a><a id="drv_queryconfigure"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/Multimedia/drv-queryconfigure">DRV_QUERYCONFIGURE</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Queries an installable driver about whether it supports the <b>DRV_CONFIGURE</b> message and can display a configuration dialog box.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DRV_CONFIGURE"></a><a id="drv_configure"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/Multimedia/drv-configure">DRV_CONFIGURE</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Notifies an installable driver that it should display a configuration dialog box. (This message should only be sent if the driver returns a nonzero value when the <a href="https://docs.microsoft.com/windows/desktop/Multimedia/drv-queryconfigure">DRV_QUERYCONFIGURE</a> message is processed.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DRV_INSTALL"></a><a id="drv_install"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/Multimedia/drv-install">DRV_INSTALL</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Notifies an installable driver that it has been successfully installed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DRV_REMOVE"></a><a id="drv_remove"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/Multimedia/drv-remove">DRV_REMOVE</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Notifies an installable driver that it is about to be removed from the system.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {LPARAM} lParam1 32-bit message-dependent information.
     * @param {LPARAM} lParam2 32-bit message-dependent information.
     * @returns {LRESULT} Returns nonzero if successful or zero otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//mmiscapi/nf-mmiscapi-senddrivermessage
     * @since windows5.0
     */
    static SendDriverMessage(hDriver, message, lParam1, lParam2) {
        hDriver := hDriver is Win32Handle ? NumGet(hDriver, "ptr") : hDriver

        result := DllCall("WINMM.dll\SendDriverMessage", "ptr", hDriver, "uint", message, "ptr", lParam1, "ptr", lParam2, "ptr")
        return result
    }

    /**
     * Retrieves the instance handle of the module that contains the installable driver. This function is provided for compatibility with previous versions of Windows.
     * @param {HDRVR} hDriver Handle of the installable driver instance. The handle must have been previously created by using the <a href="https://docs.microsoft.com/previous-versions/dd743639(v=vs.85)">OpenDriver</a> function.
     * @returns {HMODULE} Returns an instance handle of the driver module if successful or <b>NULL</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//mmiscapi/nf-mmiscapi-drvgetmodulehandle
     * @since windows5.0
     */
    static DrvGetModuleHandle(hDriver) {
        hDriver := hDriver is Win32Handle ? NumGet(hDriver, "ptr") : hDriver

        result := DllCall("WINMM.dll\DrvGetModuleHandle", "ptr", hDriver, "ptr")
        return HMODULE({Value: result}, True)
    }

    /**
     * Retrieves the instance handle of the module that contains the installable driver.
     * @param {HDRVR} hDriver Handle of the installable driver instance. The handle must have been previously created by using the <a href="https://docs.microsoft.com/previous-versions/dd743639(v=vs.85)">OpenDriver</a> function.
     * @returns {HMODULE} Returns an instance handle of the driver module if successful or <b>NULL</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//mmiscapi/nf-mmiscapi-getdrivermodulehandle
     * @since windows5.0
     */
    static GetDriverModuleHandle(hDriver) {
        hDriver := hDriver is Win32Handle ? NumGet(hDriver, "ptr") : hDriver

        result := DllCall("WINMM.dll\GetDriverModuleHandle", "ptr", hDriver, "ptr")
        return HMODULE({Value: result}, True)
    }

    /**
     * Provides default processing for any messages not processed by an installable driver. This function is intended to be used only within the DriverProc function of an installable driver.
     * @param {Pointer} dwDriverIdentifier Identifier of the installable driver.
     * @param {HDRVR} hdrvr Handle of the installable driver instance.
     * @param {Integer} uMsg Driver message value.
     * @param {LPARAM} lParam1 32-bit message-dependent information.
     * @param {LPARAM} lParam2 32-bit message-dependent information.
     * @returns {LRESULT} Returns nonzero if successful or zero otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//mmiscapi/nf-mmiscapi-defdriverproc
     * @since windows5.0
     */
    static DefDriverProc(dwDriverIdentifier, hdrvr, uMsg, lParam1, lParam2) {
        hdrvr := hdrvr is Win32Handle ? NumGet(hdrvr, "ptr") : hdrvr

        result := DllCall("WINMM.dll\DefDriverProc", "ptr", dwDriverIdentifier, "ptr", hdrvr, "uint", uMsg, "ptr", lParam1, "ptr", lParam2, "ptr")
        return result
    }

    /**
     * Calls a callback function, sends a message to a window, or unblocks a thread. The action depends on the value of the notification flag. This function is intended to be used only within the DriverProc function of an installable driver.
     * @param {Pointer} dwCallback Address of the callback function, a window handle, or a task handle, depending on the flag specified in the <i>dwFlags</i> parameter.
     * @param {Integer} dwFlags Notification flags. It can be one of these values:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DCB_NOSWITCH"></a><a id="dcb_noswitch"></a><dl>
     * <dt><b>DCB_NOSWITCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is prevented from switching stacks. This value is only used if enough stack space for the callback function is known to exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DCB_FUNCTION"></a><a id="dcb_function"></a><dl>
     * <dt><b>DCB_FUNCTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwCallback</i> parameter is the address of an application-defined callback function. The system sends the callback message to the callback function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DCB_WINDOW"></a><a id="dcb_window"></a><dl>
     * <dt><b>DCB_WINDOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwCallback</i> parameter is the handle of an application-defined window. The system sends subsequent notifications to the window.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DCB_TASK"></a><a id="dcb_task"></a><dl>
     * <dt><b>DCB_TASK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwCallback</i> parameter is the handle of an application or task. The system sends subsequent notifications to the application or task.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {HDRVR} hDevice Handle of the installable driver instance.
     * @param {Integer} dwMsg Message value.
     * @param {Pointer} dwUser 32-bit user-instance data supplied by the application when the device was opened.
     * @param {Pointer} dwParam1 32-bit message-dependent parameter.
     * @param {Pointer} dwParam2 32-bit message-dependent parameter.
     * @returns {BOOL} Returns <b>TRUE</b> if successful or <b>FALSE</b> if a parameter is invalid or the task's message queue is full.
     * @see https://docs.microsoft.com/windows/win32/api//mmiscapi/nf-mmiscapi-drivercallback
     * @since windows5.0
     */
    static DriverCallback(dwCallback, dwFlags, hDevice, dwMsg, dwUser, dwParam1, dwParam2) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        result := DllCall("WINMM.dll\DriverCallback", "ptr", dwCallback, "uint", dwFlags, "ptr", hDevice, "uint", dwMsg, "ptr", dwUser, "ptr", dwParam1, "ptr", dwParam2, "int")
        return result
    }

    /**
     * Opens the specified sound event.
     * @param {PWSTR} EventName The name of the sound event.
     * @param {PWSTR} AppName The application associated with the sound event.
     * @param {Integer} Flags Flags for playing the sound. The following values are defined.
     * @param {Pointer<HANDLE>} FileHandle Receives the handle to the sound.
     * @returns {Integer} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mmiscapi/nf-mmiscapi-sndopensound
     * @since windows8.1
     */
    static sndOpenSound(EventName, AppName, Flags, FileHandle) {
        EventName := EventName is String ? StrPtr(EventName) : EventName
        AppName := AppName is String ? StrPtr(AppName) : AppName

        result := DllCall("api-ms-win-mm-misc-l1-1-1.dll\sndOpenSound", "ptr", EventName, "ptr", AppName, "int", Flags, "ptr", FileHandle, "int")
        return result
    }

    /**
     * 
     * @param {HDRVR} hDriver 
     * @param {PWSTR} wszDrvEntry 
     * @param {Pointer<DRIVERMSGPROC>} drvMessage 
     * @param {Integer} wFlags 
     * @returns {Integer} 
     */
    static mmDrvInstall(hDriver, wszDrvEntry, drvMessage, wFlags) {
        hDriver := hDriver is Win32Handle ? NumGet(hDriver, "ptr") : hDriver
        wszDrvEntry := wszDrvEntry is String ? StrPtr(wszDrvEntry) : wszDrvEntry

        result := DllCall("WINMM.dll\mmDrvInstall", "ptr", hDriver, "ptr", wszDrvEntry, "ptr", drvMessage, "uint", wFlags, "uint")
        return result
    }

    /**
     * The mmioStringToFOURCC function converts a null-terminated string to a four-character code.
     * @param {PSTR} sz Pointer to a null-terminated string to convert to a four-character code.
     * @param {Integer} uFlags Flags for the conversion. The following value is defined:
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>MMIO_TOUPPER</td>
     * <td>Converts all characters to uppercase.</td>
     * </tr>
     * </table>
     * @returns {Integer} Returns the four-character code created from the given string.
     * @see https://docs.microsoft.com/windows/win32/api//mmiscapi/nf-mmiscapi-mmiostringtofourcca
     * @since windows5.0
     */
    static mmioStringToFOURCCA(sz, uFlags) {
        sz := sz is String ? StrPtr(sz) : sz

        result := DllCall("WINMM.dll\mmioStringToFOURCCA", "ptr", sz, "uint", uFlags, "uint")
        return result
    }

    /**
     * The mmioStringToFOURCC function converts a null-terminated string to a four-character code.
     * @param {PWSTR} sz Pointer to a null-terminated string to convert to a four-character code.
     * @param {Integer} uFlags Flags for the conversion. The following value is defined:
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>MMIO_TOUPPER</td>
     * <td>Converts all characters to uppercase.</td>
     * </tr>
     * </table>
     * @returns {Integer} Returns the four-character code created from the given string.
     * @see https://docs.microsoft.com/windows/win32/api//mmiscapi/nf-mmiscapi-mmiostringtofourccw
     * @since windows5.0
     */
    static mmioStringToFOURCCW(sz, uFlags) {
        sz := sz is String ? StrPtr(sz) : sz

        result := DllCall("WINMM.dll\mmioStringToFOURCCW", "ptr", sz, "uint", uFlags, "uint")
        return result
    }

    /**
     * The mmioInstallIOProc function installs or removes a custom I/O procedure. This function also locates an installed I/O procedure, using its corresponding four-character code.
     * @param {Integer} fccIOProc Four-character code identifying the I/O procedure to install, remove, or locate. All characters in this code should be uppercase.
     * @param {Pointer<LPMMIOPROC>} pIOProc Pointer to the I/O procedure to install. To remove or locate an I/O procedure, set this parameter to <b>NULL</b>. For more information about the I/O procedure, see <a href="https://docs.microsoft.com/previous-versions/dd757332(v=vs.85)">MMIOProc</a>.
     * @param {Integer} dwFlags Flag indicating whether the I/O procedure is being installed, removed, or located. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>MMIO_FINDPROC</td>
     * <td>Searches for the specified I/O procedure.</td>
     * </tr>
     * <tr>
     * <td>MMIO_GLOBALPROC</td>
     * <td>This flag is a modifier to the MMIO_INSTALLPROC flag and indicates the I/O procedure should be installed for global use. This flag is ignored if MMIO_FINDPROC or MMIO_REMOVEPROC is specified.</td>
     * </tr>
     * <tr>
     * <td>MMIO_INSTALLPROC</td>
     * <td>Installs the specified I/O procedure.</td>
     * </tr>
     * <tr>
     * <td>MMIO_REMOVEPROC</td>
     * <td>Removes the specified I/O procedure.</td>
     * </tr>
     * </table>
     * @returns {Pointer<LPMMIOPROC>} Returns the address of the I/O procedure installed, removed, or located. Returns <b>NULL</b> if there is an error.
     * @see https://docs.microsoft.com/windows/win32/api//mmiscapi/nf-mmiscapi-mmioinstallioproca
     * @since windows5.0
     */
    static mmioInstallIOProcA(fccIOProc, pIOProc, dwFlags) {
        result := DllCall("WINMM.dll\mmioInstallIOProcA", "uint", fccIOProc, "ptr", pIOProc, "uint", dwFlags, "ptr")
        return result
    }

    /**
     * The mmioInstallIOProc function installs or removes a custom I/O procedure. This function also locates an installed I/O procedure, using its corresponding four-character code.
     * @param {Integer} fccIOProc Four-character code identifying the I/O procedure to install, remove, or locate. All characters in this code should be uppercase.
     * @param {Pointer<LPMMIOPROC>} pIOProc Pointer to the I/O procedure to install. To remove or locate an I/O procedure, set this parameter to <b>NULL</b>. For more information about the I/O procedure, see <a href="https://docs.microsoft.com/previous-versions/dd757332(v=vs.85)">MMIOProc</a>.
     * @param {Integer} dwFlags Flag indicating whether the I/O procedure is being installed, removed, or located. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>MMIO_FINDPROC</td>
     * <td>Searches for the specified I/O procedure.</td>
     * </tr>
     * <tr>
     * <td>MMIO_GLOBALPROC</td>
     * <td>This flag is a modifier to the MMIO_INSTALLPROC flag and indicates the I/O procedure should be installed for global use. This flag is ignored if MMIO_FINDPROC or MMIO_REMOVEPROC is specified.</td>
     * </tr>
     * <tr>
     * <td>MMIO_INSTALLPROC</td>
     * <td>Installs the specified I/O procedure.</td>
     * </tr>
     * <tr>
     * <td>MMIO_REMOVEPROC</td>
     * <td>Removes the specified I/O procedure.</td>
     * </tr>
     * </table>
     * @returns {Pointer<LPMMIOPROC>} Returns the address of the I/O procedure installed, removed, or located. Returns <b>NULL</b> if there is an error.
     * @see https://docs.microsoft.com/windows/win32/api//mmiscapi/nf-mmiscapi-mmioinstallioprocw
     * @since windows5.0
     */
    static mmioInstallIOProcW(fccIOProc, pIOProc, dwFlags) {
        result := DllCall("WINMM.dll\mmioInstallIOProcW", "uint", fccIOProc, "ptr", pIOProc, "uint", dwFlags, "ptr")
        return result
    }

    /**
     * The mmioOpen function opens a file for unbuffered or buffered I/O; creates a file; deletes a file; or checks whether a file exists.
     * @remarks
     * 
     * If <i>lpmmioinfo</i> points to an <a href="https://docs.microsoft.com/previous-versions/dd757322(v=vs.85)">MMIOINFO</a> structure, initialize the members of the structure as follows. All unused members must be set to zero, including reserved members.
     * 
     * <ul>
     * <li>To request that a file be opened with an installed I/O procedure, set <b>fccIOProc</b> to the four-character code of the I/O procedure, and set <b>pIOProc</b> to <b>NULL</b>.</li>
     * <li>To request that a file be opened with an uninstalled I/O procedure, set <a href="https://docs.microsoft.com/previous-versions/dd757098(v=vs.85)">IOProc</a> to point to the I/O procedure, and set <b>fccIOProc</b> to <b>NULL</b>.</li>
     * <li>To request that <b>mmioOpen</b> determine which I/O procedure to use to open the file based on the file name contained in <i>szFilename</i>, set <b>fccIOProc</b> and <b>pIOProc</b> to <b>NULL</b>. This is the default behavior if no <a href="https://docs.microsoft.com/previous-versions/dd757322(v=vs.85)">MMIOINFO</a> structure is specified.</li>
     * <li>To open a memory file using an internally allocated and managed buffer, set <b>pchBuffer</b> to <b>NULL</b>, <b>fccIOProc</b> to FOURCC_MEM, <b>cchBuffer</b> to the initial size of the buffer, and <b>adwInfo</b> to the incremental expansion size of the buffer. This memory file will automatically be expanded in increments of the number of bytes specified in <b>adwInfo</b> when necessary. Specify the MMIO_CREATE flag for the <i>dwOpenFlags</i> parameter to initially set the end of the file to be the beginning of the buffer.</li>
     * <li>To open a memory file using an application-supplied buffer, set <b>pchBuffer</b> to point to the memory buffer, <b>fccIOProc</b> to FOURCC_MEM, <b>cchBuffer</b> to the size of the buffer, and <b>adwInfo</b> to the incremental expansion size of the buffer. The expansion size in <b>adwInfo</b> should be nonzero only if <b>pchBuffer</b> is a pointer obtained by calling the <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> and <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-globallock">GlobalLock</a> functions; in this case, the <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-globalrealloc">GlobalReAlloc</a> function will be called to expand the buffer. In other words, if <b>pchBuffer</b> points to a local or global array or a block of memory in the local heap, <b>adwInfo</b> must be zero. Specify the MMIO_CREATE flag for the <i>dwOpenFlags</i> parameter to initially set the end of the file to be the beginning of the buffer. Otherwise, the entire block of memory is considered readable.</li>
     * <li>To use a currently open standard file handle (that is, a file handle that does not have the <b>HMMIO</b> type) with multimedia file I/O services, set <b>fccIOProc</b> to FOURCC_DOS, <b>pchBuffer</b> to <b>NULL</b>, and <b>adwInfo</b> to the standard file handle. Offsets within the file will be relative to the beginning of the file and are not related to the position in the standard file at the time <b>mmioOpen</b> is called; the initial multimedia file I/O offset will be the same as the offset in the standard file when <b>mmioOpen</b> is called. To close the multimedia file I/O file handle without closing the standard file handle, pass the MMIO_FHOPEN flag to <a href="https://docs.microsoft.com/previous-versions/dd757316(v=vs.85)">mmioClose</a>.</li>
     * </ul>
     * You must call <a href="https://docs.microsoft.com/previous-versions/dd757316(v=vs.85)">mmioClose</a> to close a file opened by using <b>mmioOpen</b>. Open files are not automatically closed when an application exits.
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The mmiscapi.h header defines mmioOpen as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * 
     * @param {PSTR} pszFileName Pointer to a buffer that contains the name of the file. If no I/O procedure is specified to open the file, the file name determines how the file is opened, as follows:
     * 
     * <ul>
     * <li>If the file name does not contain a plus sign (+), it is assumed to be the name of a standard file (that is, a file whose type is not <b>HMMIO</b>).</li>
     * <li>If the file name is of the form EXAMPLE.EXT+ABC, the extension EXT is assumed to identify an installed I/O procedure which is called to perform I/O on the file. For more information, see <a href="https://docs.microsoft.com/previous-versions/dd757323(v=vs.85)">mmioInstallIOProc</a>.</li>
     * <li>If the file name is <b>NULL</b> and no I/O procedure is given, the <b>adwInfo</b> member of the <a href="https://docs.microsoft.com/previous-versions/dd757322(v=vs.85)">MMIOINFO</a> structure is assumed to be the standard (non-<b>HMMIO</b>) file handle of a currently open file.</li>
     * </ul>
     * The file name should not be longer than 128 characters, including the terminating NULL character.
     * 
     * When opening a memory file, set <i>szFilename</i> to <b>NULL</b>.
     * @param {Pointer<MMIOINFO>} pmmioinfo Pointer to an <a href="https://docs.microsoft.com/previous-versions/dd757322(v=vs.85)">MMIOINFO</a> structure containing extra parameters used by <b>mmioOpen</b>. Unless you are opening a memory file, specifying the size of a buffer for buffered I/O, or specifying an uninstalled I/O procedure to open a file, this parameter should be <b>NULL</b>. If this parameter is not <b>NULL</b>, all unused members of the <b>MMIOINFO</b> structure it references must be set to zero, including the reserved members.
     * @param {Integer} fdwOpen Flags for the open operation. The MMIO_READ, MMIO_WRITE, and MMIO_READWRITE flags are mutually exclusive – only one should be specified. The MMIO_COMPAT, MMIO_EXCLUSIVE, MMIO_DENYWRITE, MMIO_DENYREAD, and MMIO_DENYNONE flags are file-sharing flags. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>MMIO_ALLOCBUF</td>
     * <td>Opens a file for buffered I/O. To allocate a buffer larger or smaller than the default buffer size (8K, defined as MMIO_DEFAULTBUFFER), set the <b>cchBuffer</b> member of the <a href="https://docs.microsoft.com/previous-versions/dd757322(v=vs.85)">MMIOINFO</a> structure to the desired buffer size. If <b>cchBuffer</b> is zero, the default buffer size is used. If you are providing your own I/O buffer, this flag should not be used.</td>
     * </tr>
     * <tr>
     * <td>MMIO_COMPAT</td>
     * <td>Opens the file with compatibility mode, allowing any process on a given machine to open the file any number of times. If the file has been opened with any of the other sharing modes, <b>mmioOpen</b> fails.</td>
     * </tr>
     * <tr>
     * <td>MMIO_CREATE</td>
     * <td>Creates a new file. If the file already exists, it is truncated to zero length. For memory files, this flag indicates the end of the file is initially at the start of the buffer.</td>
     * </tr>
     * <tr>
     * <td>MMIO_DELETE</td>
     * <td>Deletes a file. If this flag is specified, <i>szFilename</i> should not be <b>NULL</b>. The return value is <b>TRUE</b> (cast to <b>HMMIO</b>) if the file was deleted successfully or <b>FALSE</b> otherwise. Do not call the <a href="https://docs.microsoft.com/previous-versions/dd757316(v=vs.85)">mmioClose</a> function for a file that has been deleted. If this flag is specified, all other flags that open files are ignored.</td>
     * </tr>
     * <tr>
     * <td>MMIO_DENYNONE</td>
     * <td>Opens the file without denying other processes read or write access to the file. If the file has been opened in compatibility mode by any other process, <b>mmioOpen</b> fails.</td>
     * </tr>
     * <tr>
     * <td>MMIO_DENYREAD</td>
     * <td>Opens the file and denies other processes read access to the file. If the file has been opened in compatibility mode or for read access by any other process, <b>mmioOpen</b> fails.</td>
     * </tr>
     * <tr>
     * <td>MMIO_DENYWRITE</td>
     * <td>Opens the file and denies other processes write access to the file. If the file has been opened in compatibility mode or for write access by any other process, <b>mmioOpen</b> fails.</td>
     * </tr>
     * <tr>
     * <td>MMIO_EXCLUSIVE</td>
     * <td>Opens the file and denies other processes read and write access to the file. If the file has been opened in any other mode for read or write access, even by the current process, <b>mmioOpen</b> fails.</td>
     * </tr>
     * <tr>
     * <td>MMIO_EXIST</td>
     * <td>Determines whether the specified file exists and creates a fully qualified file name from the path specified in <i>szFilename</i>. The return value is <b>TRUE</b> (cast to <b>HMMIO</b>) if the qualification was successful and the file exists or <b>FALSE</b> otherwise. The file is not opened, and the function does not return a valid multimedia file I/O file handle, so do not attempt to close the file.
     * <div class="alert"><b>Note</b>  Applications should call <b>GetFileAttributes</b>  or <b>GetFileAttributesEx</b> instead.</div>
     * <div> </div>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>MMIO_GETTEMP</td>
     * <td>
     * Creates a temporary file name, optionally using the parameters passed in <i>szFilename.</i> For example, you can specify "C:F" to create a temporary file residing on drive C, starting with letter "F". The resulting file name is copied to the buffer pointed to by <i>szFilename</i>.  The buffer must be large enough to hold at least 128 characters.
     * 
     * If the temporary file name was created successfully, the return value is <b>MMSYSERR_NOERROR</b> (cast to <b>HMMIO</b>). Otherwise, the return value is <b>MMIOERR_FILENOTFOUND</b> otherwise. The file is not opened, and the function does not return a valid multimedia file I/O file handle, so do not attempt to close the file. This flag overrides all other flags.
     * 
     * 
     * <div class="alert"><b>Note</b>  Applications should call <b>GetTempFileName</b>  instead.</div>
     * <div> </div>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>MMIO_PARSE</td>
     * <td>
     * Creates a fully qualified file name from the path specified in <i>szFilename</i>. The fully qualified name is copied to the buffer pointed to by <i>szFilename</i>.  The buffer must be large enough to hold at least 128 characters.
     * 
     *  If the function succeeds, the return value is <b>TRUE</b> (cast to <b>HMMIO</b>). Otherwise, the return value is <b>FALSE</b>. The file is not opened, and the function does not return a valid multimedia file I/O file handle, so do not attempt to close the file. If this flag is specified, all flags that open files are ignored.
     * 
     * 
     * <div class="alert"><b>Note</b>  Applications should call <b>GetFullPathName</b>  instead.</div>
     * <div> </div>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>MMIO_READ</td>
     * <td>Opens the file for reading only. This is the default if MMIO_WRITE and MMIO_READWRITE are not specified.</td>
     * </tr>
     * <tr>
     * <td>MMIO_READWRITE</td>
     * <td>Opens the file for reading and writing.</td>
     * </tr>
     * <tr>
     * <td>MMIO_WRITE</td>
     * <td>Opens the file for writing only.</td>
     * </tr>
     * </table>
     * @returns {HMMIO} 
     * @see https://docs.microsoft.com/windows/win32/api//mmiscapi/nf-mmiscapi-mmioopena
     * @since windows5.0
     */
    static mmioOpenA(pszFileName, pmmioinfo, fdwOpen) {
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName

        result := DllCall("WINMM.dll\mmioOpenA", "ptr", pszFileName, "ptr", pmmioinfo, "uint", fdwOpen, "ptr")
        return HMMIO({Value: result}, True)
    }

    /**
     * The mmioOpen function opens a file for unbuffered or buffered I/O; creates a file; deletes a file; or checks whether a file exists.
     * @remarks
     * 
     * If <i>lpmmioinfo</i> points to an <a href="https://docs.microsoft.com/previous-versions/dd757322(v=vs.85)">MMIOINFO</a> structure, initialize the members of the structure as follows. All unused members must be set to zero, including reserved members.
     * 
     * <ul>
     * <li>To request that a file be opened with an installed I/O procedure, set <b>fccIOProc</b> to the four-character code of the I/O procedure, and set <b>pIOProc</b> to <b>NULL</b>.</li>
     * <li>To request that a file be opened with an uninstalled I/O procedure, set <a href="https://docs.microsoft.com/previous-versions/dd757098(v=vs.85)">IOProc</a> to point to the I/O procedure, and set <b>fccIOProc</b> to <b>NULL</b>.</li>
     * <li>To request that <b>mmioOpen</b> determine which I/O procedure to use to open the file based on the file name contained in <i>szFilename</i>, set <b>fccIOProc</b> and <b>pIOProc</b> to <b>NULL</b>. This is the default behavior if no <a href="https://docs.microsoft.com/previous-versions/dd757322(v=vs.85)">MMIOINFO</a> structure is specified.</li>
     * <li>To open a memory file using an internally allocated and managed buffer, set <b>pchBuffer</b> to <b>NULL</b>, <b>fccIOProc</b> to FOURCC_MEM, <b>cchBuffer</b> to the initial size of the buffer, and <b>adwInfo</b> to the incremental expansion size of the buffer. This memory file will automatically be expanded in increments of the number of bytes specified in <b>adwInfo</b> when necessary. Specify the MMIO_CREATE flag for the <i>dwOpenFlags</i> parameter to initially set the end of the file to be the beginning of the buffer.</li>
     * <li>To open a memory file using an application-supplied buffer, set <b>pchBuffer</b> to point to the memory buffer, <b>fccIOProc</b> to FOURCC_MEM, <b>cchBuffer</b> to the size of the buffer, and <b>adwInfo</b> to the incremental expansion size of the buffer. The expansion size in <b>adwInfo</b> should be nonzero only if <b>pchBuffer</b> is a pointer obtained by calling the <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> and <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-globallock">GlobalLock</a> functions; in this case, the <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-globalrealloc">GlobalReAlloc</a> function will be called to expand the buffer. In other words, if <b>pchBuffer</b> points to a local or global array or a block of memory in the local heap, <b>adwInfo</b> must be zero. Specify the MMIO_CREATE flag for the <i>dwOpenFlags</i> parameter to initially set the end of the file to be the beginning of the buffer. Otherwise, the entire block of memory is considered readable.</li>
     * <li>To use a currently open standard file handle (that is, a file handle that does not have the <b>HMMIO</b> type) with multimedia file I/O services, set <b>fccIOProc</b> to FOURCC_DOS, <b>pchBuffer</b> to <b>NULL</b>, and <b>adwInfo</b> to the standard file handle. Offsets within the file will be relative to the beginning of the file and are not related to the position in the standard file at the time <b>mmioOpen</b> is called; the initial multimedia file I/O offset will be the same as the offset in the standard file when <b>mmioOpen</b> is called. To close the multimedia file I/O file handle without closing the standard file handle, pass the MMIO_FHOPEN flag to <a href="https://docs.microsoft.com/previous-versions/dd757316(v=vs.85)">mmioClose</a>.</li>
     * </ul>
     * You must call <a href="https://docs.microsoft.com/previous-versions/dd757316(v=vs.85)">mmioClose</a> to close a file opened by using <b>mmioOpen</b>. Open files are not automatically closed when an application exits.
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The mmiscapi.h header defines mmioOpen as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * 
     * @param {PWSTR} pszFileName Pointer to a buffer that contains the name of the file. If no I/O procedure is specified to open the file, the file name determines how the file is opened, as follows:
     * 
     * <ul>
     * <li>If the file name does not contain a plus sign (+), it is assumed to be the name of a standard file (that is, a file whose type is not <b>HMMIO</b>).</li>
     * <li>If the file name is of the form EXAMPLE.EXT+ABC, the extension EXT is assumed to identify an installed I/O procedure which is called to perform I/O on the file. For more information, see <a href="https://docs.microsoft.com/previous-versions/dd757323(v=vs.85)">mmioInstallIOProc</a>.</li>
     * <li>If the file name is <b>NULL</b> and no I/O procedure is given, the <b>adwInfo</b> member of the <a href="https://docs.microsoft.com/previous-versions/dd757322(v=vs.85)">MMIOINFO</a> structure is assumed to be the standard (non-<b>HMMIO</b>) file handle of a currently open file.</li>
     * </ul>
     * The file name should not be longer than 128 characters, including the terminating NULL character.
     * 
     * When opening a memory file, set <i>szFilename</i> to <b>NULL</b>.
     * @param {Pointer<MMIOINFO>} pmmioinfo Pointer to an <a href="https://docs.microsoft.com/previous-versions/dd757322(v=vs.85)">MMIOINFO</a> structure containing extra parameters used by <b>mmioOpen</b>. Unless you are opening a memory file, specifying the size of a buffer for buffered I/O, or specifying an uninstalled I/O procedure to open a file, this parameter should be <b>NULL</b>. If this parameter is not <b>NULL</b>, all unused members of the <b>MMIOINFO</b> structure it references must be set to zero, including the reserved members.
     * @param {Integer} fdwOpen Flags for the open operation. The MMIO_READ, MMIO_WRITE, and MMIO_READWRITE flags are mutually exclusive – only one should be specified. The MMIO_COMPAT, MMIO_EXCLUSIVE, MMIO_DENYWRITE, MMIO_DENYREAD, and MMIO_DENYNONE flags are file-sharing flags. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>MMIO_ALLOCBUF</td>
     * <td>Opens a file for buffered I/O. To allocate a buffer larger or smaller than the default buffer size (8K, defined as MMIO_DEFAULTBUFFER), set the <b>cchBuffer</b> member of the <a href="https://docs.microsoft.com/previous-versions/dd757322(v=vs.85)">MMIOINFO</a> structure to the desired buffer size. If <b>cchBuffer</b> is zero, the default buffer size is used. If you are providing your own I/O buffer, this flag should not be used.</td>
     * </tr>
     * <tr>
     * <td>MMIO_COMPAT</td>
     * <td>Opens the file with compatibility mode, allowing any process on a given machine to open the file any number of times. If the file has been opened with any of the other sharing modes, <b>mmioOpen</b> fails.</td>
     * </tr>
     * <tr>
     * <td>MMIO_CREATE</td>
     * <td>Creates a new file. If the file already exists, it is truncated to zero length. For memory files, this flag indicates the end of the file is initially at the start of the buffer.</td>
     * </tr>
     * <tr>
     * <td>MMIO_DELETE</td>
     * <td>Deletes a file. If this flag is specified, <i>szFilename</i> should not be <b>NULL</b>. The return value is <b>TRUE</b> (cast to <b>HMMIO</b>) if the file was deleted successfully or <b>FALSE</b> otherwise. Do not call the <a href="https://docs.microsoft.com/previous-versions/dd757316(v=vs.85)">mmioClose</a> function for a file that has been deleted. If this flag is specified, all other flags that open files are ignored.</td>
     * </tr>
     * <tr>
     * <td>MMIO_DENYNONE</td>
     * <td>Opens the file without denying other processes read or write access to the file. If the file has been opened in compatibility mode by any other process, <b>mmioOpen</b> fails.</td>
     * </tr>
     * <tr>
     * <td>MMIO_DENYREAD</td>
     * <td>Opens the file and denies other processes read access to the file. If the file has been opened in compatibility mode or for read access by any other process, <b>mmioOpen</b> fails.</td>
     * </tr>
     * <tr>
     * <td>MMIO_DENYWRITE</td>
     * <td>Opens the file and denies other processes write access to the file. If the file has been opened in compatibility mode or for write access by any other process, <b>mmioOpen</b> fails.</td>
     * </tr>
     * <tr>
     * <td>MMIO_EXCLUSIVE</td>
     * <td>Opens the file and denies other processes read and write access to the file. If the file has been opened in any other mode for read or write access, even by the current process, <b>mmioOpen</b> fails.</td>
     * </tr>
     * <tr>
     * <td>MMIO_EXIST</td>
     * <td>Determines whether the specified file exists and creates a fully qualified file name from the path specified in <i>szFilename</i>. The return value is <b>TRUE</b> (cast to <b>HMMIO</b>) if the qualification was successful and the file exists or <b>FALSE</b> otherwise. The file is not opened, and the function does not return a valid multimedia file I/O file handle, so do not attempt to close the file.
     * <div class="alert"><b>Note</b>  Applications should call <b>GetFileAttributes</b>  or <b>GetFileAttributesEx</b> instead.</div>
     * <div> </div>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>MMIO_GETTEMP</td>
     * <td>
     * Creates a temporary file name, optionally using the parameters passed in <i>szFilename.</i> For example, you can specify "C:F" to create a temporary file residing on drive C, starting with letter "F". The resulting file name is copied to the buffer pointed to by <i>szFilename</i>.  The buffer must be large enough to hold at least 128 characters.
     * 
     * If the temporary file name was created successfully, the return value is <b>MMSYSERR_NOERROR</b> (cast to <b>HMMIO</b>). Otherwise, the return value is <b>MMIOERR_FILENOTFOUND</b> otherwise. The file is not opened, and the function does not return a valid multimedia file I/O file handle, so do not attempt to close the file. This flag overrides all other flags.
     * 
     * 
     * <div class="alert"><b>Note</b>  Applications should call <b>GetTempFileName</b>  instead.</div>
     * <div> </div>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>MMIO_PARSE</td>
     * <td>
     * Creates a fully qualified file name from the path specified in <i>szFilename</i>. The fully qualified name is copied to the buffer pointed to by <i>szFilename</i>.  The buffer must be large enough to hold at least 128 characters.
     * 
     *  If the function succeeds, the return value is <b>TRUE</b> (cast to <b>HMMIO</b>). Otherwise, the return value is <b>FALSE</b>. The file is not opened, and the function does not return a valid multimedia file I/O file handle, so do not attempt to close the file. If this flag is specified, all flags that open files are ignored.
     * 
     * 
     * <div class="alert"><b>Note</b>  Applications should call <b>GetFullPathName</b>  instead.</div>
     * <div> </div>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>MMIO_READ</td>
     * <td>Opens the file for reading only. This is the default if MMIO_WRITE and MMIO_READWRITE are not specified.</td>
     * </tr>
     * <tr>
     * <td>MMIO_READWRITE</td>
     * <td>Opens the file for reading and writing.</td>
     * </tr>
     * <tr>
     * <td>MMIO_WRITE</td>
     * <td>Opens the file for writing only.</td>
     * </tr>
     * </table>
     * @returns {HMMIO} 
     * @see https://docs.microsoft.com/windows/win32/api//mmiscapi/nf-mmiscapi-mmioopenw
     * @since windows5.0
     */
    static mmioOpenW(pszFileName, pmmioinfo, fdwOpen) {
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName

        result := DllCall("WINMM.dll\mmioOpenW", "ptr", pszFileName, "ptr", pmmioinfo, "uint", fdwOpen, "ptr")
        return HMMIO({Value: result}, True)
    }

    /**
     * The mmioRename function renames the specified file.
     * @param {PSTR} pszFileName Pointer to a string containing the file name of the file to rename.
     * @param {PSTR} pszNewFileName Pointer to a string containing the new file name.
     * @param {Pointer<MMIOINFO>} pmmioinfo Pointer to an <a href="https://docs.microsoft.com/previous-versions/dd757322(v=vs.85)">MMIOINFO</a> structure containing extra parameters used by <b>mmioRename</b>. If this parameter is not <b>NULL</b>, all unused members of the <b>MMIOINFO</b> structure it references must be set to zero, including the reserved members.
     * @param {Integer} fdwRename Flags for the rename operation. This parameter should be set to zero.
     * @returns {Integer} Returns zero if the file was renamed. Otherwise, returns an error code returned from <b>mmioRename</b> or from the I/O procedure.
     * @see https://docs.microsoft.com/windows/win32/api//mmiscapi/nf-mmiscapi-mmiorenamea
     * @since windows5.0
     */
    static mmioRenameA(pszFileName, pszNewFileName, pmmioinfo, fdwRename) {
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName
        pszNewFileName := pszNewFileName is String ? StrPtr(pszNewFileName) : pszNewFileName

        result := DllCall("WINMM.dll\mmioRenameA", "ptr", pszFileName, "ptr", pszNewFileName, "ptr", pmmioinfo, "uint", fdwRename, "uint")
        return result
    }

    /**
     * The mmioRename function renames the specified file.
     * @param {PWSTR} pszFileName Pointer to a string containing the file name of the file to rename.
     * @param {PWSTR} pszNewFileName Pointer to a string containing the new file name.
     * @param {Pointer<MMIOINFO>} pmmioinfo Pointer to an <a href="https://docs.microsoft.com/previous-versions/dd757322(v=vs.85)">MMIOINFO</a> structure containing extra parameters used by <b>mmioRename</b>. If this parameter is not <b>NULL</b>, all unused members of the <b>MMIOINFO</b> structure it references must be set to zero, including the reserved members.
     * @param {Integer} fdwRename Flags for the rename operation. This parameter should be set to zero.
     * @returns {Integer} Returns zero if the file was renamed. Otherwise, returns an error code returned from <b>mmioRename</b> or from the I/O procedure.
     * @see https://docs.microsoft.com/windows/win32/api//mmiscapi/nf-mmiscapi-mmiorenamew
     * @since windows5.0
     */
    static mmioRenameW(pszFileName, pszNewFileName, pmmioinfo, fdwRename) {
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName
        pszNewFileName := pszNewFileName is String ? StrPtr(pszNewFileName) : pszNewFileName

        result := DllCall("WINMM.dll\mmioRenameW", "ptr", pszFileName, "ptr", pszNewFileName, "ptr", pmmioinfo, "uint", fdwRename, "uint")
        return result
    }

    /**
     * The mmioClose function closes a file that was opened by using the mmioOpen function.
     * @param {HMMIO} hmmio File handle of the file to close.
     * @param {Integer} fuClose Flags for the close operation. The following value is defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>MMIO_FHOPEN</td>
     * <td>If the file was opened by passing a file handle whose type is not <b>HMMIO</b>, using this flag tells the <b>mmioClose</b> function to close the multimedia file handle, but not the standard file handle.</td>
     * </tr>
     * </table>
     * @returns {Integer} Returns zero if successful or an error otherwise. The error value can originate from the <a href="/previous-versions/dd757319(v=vs.85)">mmioFlush</a> function or from the I/O procedure. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMIOERR_CANNOTWRITE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The contents of the buffer could not be written to disk.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmiscapi/nf-mmiscapi-mmioclose
     * @since windows5.0
     */
    static mmioClose(hmmio, fuClose) {
        hmmio := hmmio is Win32Handle ? NumGet(hmmio, "ptr") : hmmio

        result := DllCall("WINMM.dll\mmioClose", "ptr", hmmio, "uint", fuClose, "uint")
        return result
    }

    /**
     * The mmioRead function reads a specified number of bytes from a file opened by using the mmioOpen function.
     * @param {HMMIO} hmmio File handle of the file to be read.
     * @param {Pointer} pch Pointer to a buffer to contain the data read from the file.
     * @param {Integer} cch Number of bytes to read from the file.
     * @returns {Integer} Returns the number of bytes actually read. If the end of the file has been reached and no more bytes can be read, the return value is 0. If there is an error reading from the file, the return value is –1.
     * @see https://docs.microsoft.com/windows/win32/api//mmiscapi/nf-mmiscapi-mmioread
     * @since windows5.0
     */
    static mmioRead(hmmio, pch, cch) {
        hmmio := hmmio is Win32Handle ? NumGet(hmmio, "ptr") : hmmio

        result := DllCall("WINMM.dll\mmioRead", "ptr", hmmio, "ptr", pch, "int", cch, "int")
        return result
    }

    /**
     * The mmioWrite function writes a specified number of bytes to a file opened by using the mmioOpen function.
     * @param {HMMIO} hmmio File handle of the file.
     * @param {Pointer} pch Pointer to the buffer to be written to the file.
     * @param {Integer} cch Number of bytes to write to the file.
     * @returns {Integer} Returns the number of bytes actually written. If there is an error writing to the file, the return value is -1.
     * @see https://docs.microsoft.com/windows/win32/api//mmiscapi/nf-mmiscapi-mmiowrite
     * @since windows5.0
     */
    static mmioWrite(hmmio, pch, cch) {
        hmmio := hmmio is Win32Handle ? NumGet(hmmio, "ptr") : hmmio

        result := DllCall("WINMM.dll\mmioWrite", "ptr", hmmio, "ptr", pch, "int", cch, "int")
        return result
    }

    /**
     * The mmioSeek function changes the current file position in a file opened by using the mmioOpen function.
     * @param {HMMIO} hmmio File handle of the file to seek in.
     * @param {Integer} lOffset Offset to change the file position.
     * @param {Integer} iOrigin Flags indicating how the offset specified by <i>lOffset</i> is interpreted. The following values are defined:
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SEEK_CUR"></a><a id="seek_cur"></a><dl>
     * <dt><b>SEEK_CUR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Seeks to <i>lOffset</i> bytes from the current file position.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SEEK_END"></a><a id="seek_end"></a><dl>
     * <dt><b>SEEK_END</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Seeks to <i>lOffset</i> bytes from the end of the file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SEEK_SET"></a><a id="seek_set"></a><dl>
     * <dt><b>SEEK_SET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Seeks to <i>lOffset</i> bytes from the beginning of the file.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} Returns the new file position, in bytes, relative to the beginning of the file. If there is an error, the return value is –1.
     * @see https://docs.microsoft.com/windows/win32/api//mmiscapi/nf-mmiscapi-mmioseek
     * @since windows5.0
     */
    static mmioSeek(hmmio, lOffset, iOrigin) {
        hmmio := hmmio is Win32Handle ? NumGet(hmmio, "ptr") : hmmio

        result := DllCall("WINMM.dll\mmioSeek", "ptr", hmmio, "int", lOffset, "int", iOrigin, "int")
        return result
    }

    /**
     * The mmioGetInfo function retrieves information about a file opened by using the mmioOpen function. This information allows the application to directly access the I/O buffer, if the file is opened for buffered I/O.
     * @param {HMMIO} hmmio File handle of the file.
     * @param {Pointer<MMIOINFO>} pmmioinfo Pointer to a buffer that receives an <a href="https://docs.microsoft.com/previous-versions/dd757322(v=vs.85)">MMIOINFO</a> structure that <b>mmioGetInfo</b> fills with information about the file.
     * @param {Integer} fuInfo Reserved; must be zero.
     * @returns {Integer} Returns zero if successful or an error otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//mmiscapi/nf-mmiscapi-mmiogetinfo
     * @since windows5.0
     */
    static mmioGetInfo(hmmio, pmmioinfo, fuInfo) {
        hmmio := hmmio is Win32Handle ? NumGet(hmmio, "ptr") : hmmio

        result := DllCall("WINMM.dll\mmioGetInfo", "ptr", hmmio, "ptr", pmmioinfo, "uint", fuInfo, "uint")
        return result
    }

    /**
     * The mmioSetInfo function updates the information retrieved by the mmioGetInfo function about a file opened by using the mmioOpen function. Use this function to terminate direct buffer access of a file opened for buffered I/O.
     * @param {HMMIO} hmmio File handle of the file.
     * @param {Pointer<MMIOINFO>} pmmioinfo Pointer to an <a href="https://docs.microsoft.com/previous-versions/dd757322(v=vs.85)">MMIOINFO</a> structure filled with information by the <a href="https://docs.microsoft.com/previous-versions/dd757321(v=vs.85)">mmioGetInfo</a> function.
     * @param {Integer} fuInfo Reserved; must be zero.
     * @returns {Integer} Returns zero if successful or an error otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//mmiscapi/nf-mmiscapi-mmiosetinfo
     * @since windows5.0
     */
    static mmioSetInfo(hmmio, pmmioinfo, fuInfo) {
        hmmio := hmmio is Win32Handle ? NumGet(hmmio, "ptr") : hmmio

        result := DllCall("WINMM.dll\mmioSetInfo", "ptr", hmmio, "ptr", pmmioinfo, "uint", fuInfo, "uint")
        return result
    }

    /**
     * The mmioSetBuffer function enables or disables buffered I/O, or changes the buffer or buffer size for a file opened by using the mmioOpen function.
     * @param {HMMIO} hmmio File handle of the file.
     * @param {PSTR} pchBuffer Pointer to an application-defined buffer to use for buffered I/O. If this parameter is <b>NULL</b>, <b>mmioSetBuffer</b> allocates an internal buffer for buffered I/O.
     * @param {Integer} cchBuffer Size, in characters, of the application-defined buffer, or the size of the buffer for <b>mmioSetBuffer</b> to allocate.
     * @param {Integer} fuBuffer Reserved; must be zero.
     * @returns {Integer} Returns zero if successful or an error otherwise. If an error occurs, the file handle remains valid. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMIOERR_CANNOTWRITE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The contents of the old buffer could not be written to disk, so the operation was aborted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMIOERR_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The new buffer could not be allocated, probably due to a lack of available memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmiscapi/nf-mmiscapi-mmiosetbuffer
     * @since windows5.0
     */
    static mmioSetBuffer(hmmio, pchBuffer, cchBuffer, fuBuffer) {
        hmmio := hmmio is Win32Handle ? NumGet(hmmio, "ptr") : hmmio
        pchBuffer := pchBuffer is String ? StrPtr(pchBuffer) : pchBuffer

        result := DllCall("WINMM.dll\mmioSetBuffer", "ptr", hmmio, "ptr", pchBuffer, "int", cchBuffer, "uint", fuBuffer, "uint")
        return result
    }

    /**
     * The mmioFlush function writes the I/O buffer of a file to disk if the buffer has been written to.
     * @param {HMMIO} hmmio File handle of a file opened by using the <a href="https://docs.microsoft.com/previous-versions/dd757331(v=vs.85)">mmioOpen</a> function.
     * @param {Integer} fuFlush Flag determining how the flush is carried out. It can be zero or the following.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>MMIO_EMPTYBUF</td>
     * <td>Empties the buffer after writing it to the disk.</td>
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
     * <dt><b>MMIOERR_CANNOTWRITE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The contents of the buffer could not be written to disk.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmiscapi/nf-mmiscapi-mmioflush
     * @since windows5.0
     */
    static mmioFlush(hmmio, fuFlush) {
        hmmio := hmmio is Win32Handle ? NumGet(hmmio, "ptr") : hmmio

        result := DllCall("WINMM.dll\mmioFlush", "ptr", hmmio, "uint", fuFlush, "uint")
        return result
    }

    /**
     * The mmioAdvance function advances the I/O buffer of a file set up for direct I/O buffer access with the mmioGetInfo function.
     * @param {HMMIO} hmmio File handle of a file opened by using the <a href="https://docs.microsoft.com/previous-versions/dd757331(v=vs.85)">mmioOpen</a> function.
     * @param {Pointer<MMIOINFO>} pmmioinfo Pointer to the <a href="https://docs.microsoft.com/previous-versions/dd757322(v=vs.85)">MMIOINFO</a> structure obtained by using the <a href="https://docs.microsoft.com/previous-versions/dd757321(v=vs.85)">mmioGetInfo</a> function. This structure is used to set the current file information, and then it is updated after the buffer is advanced. This parameter is optional.
     * @param {Integer} fuAdvance Flags for the operation. It can be one of the following.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>MMIO_READ</td>
     * <td>Buffer is filled from the file.</td>
     * </tr>
     * <tr>
     * <td>MMIO_WRITE</td>
     * <td>Buffer is written to the file.</td>
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
     * <dt><b>MMIOERR_CANNOTEXPAND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified memory file cannot be expanded, probably because the <b>adwInfo</b> member of the <a href="/previous-versions/dd757322(v=vs.85)">MMIOINFO</a> structure was set to zero in the initial call to the <a href="/previous-versions/dd757331(v=vs.85)">mmioOpen</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMIOERR_CANNOTREAD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while refilling the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMIOERR_CANNOTWRITE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The contents of the buffer could not be written to disk.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMIOERR_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was not enough memory to expand a memory file for further writing.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMIOERR_UNBUFFERED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified file is not opened for buffered I/O.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmiscapi/nf-mmiscapi-mmioadvance
     * @since windows5.0
     */
    static mmioAdvance(hmmio, pmmioinfo, fuAdvance) {
        hmmio := hmmio is Win32Handle ? NumGet(hmmio, "ptr") : hmmio

        result := DllCall("WINMM.dll\mmioAdvance", "ptr", hmmio, "ptr", pmmioinfo, "uint", fuAdvance, "uint")
        return result
    }

    /**
     * The mmioSendMessage function sends a message to the I/O procedure associated with the specified file.
     * @param {HMMIO} hmmio File handle for a file opened by using the <a href="https://docs.microsoft.com/previous-versions/dd757331(v=vs.85)">mmioOpen</a> function.
     * @param {Integer} uMsg Message to send to the I/O procedure.
     * @param {LPARAM} lParam1 Parameter for the message.
     * @param {LPARAM} lParam2 Parameter for the message.
     * @returns {LRESULT} Returns a value that corresponds to the message. If the I/O procedure does not recognize the message, the return value should be zero.
     * @see https://docs.microsoft.com/windows/win32/api//mmiscapi/nf-mmiscapi-mmiosendmessage
     * @since windows5.0
     */
    static mmioSendMessage(hmmio, uMsg, lParam1, lParam2) {
        hmmio := hmmio is Win32Handle ? NumGet(hmmio, "ptr") : hmmio

        result := DllCall("WINMM.dll\mmioSendMessage", "ptr", hmmio, "uint", uMsg, "ptr", lParam1, "ptr", lParam2, "ptr")
        return result
    }

    /**
     * The mmioDescend function descends into a chunk of a RIFF file that was opened by using the mmioOpen function. It can also search for a given chunk.
     * @param {HMMIO} hmmio File handle of an open RIFF file.
     * @param {Pointer<MMCKINFO>} pmmcki Pointer to a buffer that receives an <a href="https://docs.microsoft.com/previous-versions/dd757312(v=vs.85)">MMCKINFO</a> structure.
     * @param {Pointer<MMCKINFO>} pmmckiParent Pointer to an optional application-defined <a href="https://docs.microsoft.com/previous-versions/dd757312(v=vs.85)">MMCKINFO</a> structure identifying the parent of the chunk being searched for. If this parameter is not <b>NULL</b>, <b>mmioDescend</b> assumes the <b>MMCKINFO</b> structure it refers to was filled when <b>mmioDescend</b> was called to descend into the parent chunk, and <b>mmioDescend</b> searches for a chunk within the parent chunk. Set this parameter to <b>NULL</b> if no parent chunk is being specified.
     * @param {Integer} fuDescend Search flags. If no flags are specified, <b>mmioDescend</b> descends into the chunk beginning at the current file position. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>MMIO_FINDCHUNK</td>
     * <td>Searches for a chunk with the specified chunk identifier.</td>
     * </tr>
     * <tr>
     * <td>MMIO_FINDLIST</td>
     * <td>Searches for a chunk with the chunk identifier "LIST" and with the specified form type.</td>
     * </tr>
     * <tr>
     * <td>MMIO_FINDRIFF</td>
     * <td>Searches for a chunk with the chunk identifier "RIFF" and with the specified form type.</td>
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
     * <dt><b>MMIOERR_CHUNKNOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The end of the file (or the end of the parent chunk, if given) was reached before the desired chunk was found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmiscapi/nf-mmiscapi-mmiodescend
     * @since windows5.0
     */
    static mmioDescend(hmmio, pmmcki, pmmckiParent, fuDescend) {
        hmmio := hmmio is Win32Handle ? NumGet(hmmio, "ptr") : hmmio

        result := DllCall("WINMM.dll\mmioDescend", "ptr", hmmio, "ptr", pmmcki, "ptr", pmmckiParent, "uint", fuDescend, "uint")
        return result
    }

    /**
     * The mmioAscend function ascends out of a chunk in a RIFF file descended into with the mmioDescend function or created with the mmioCreateChunk function.
     * @param {HMMIO} hmmio File handle of an open RIFF file.
     * @param {Pointer<MMCKINFO>} pmmcki Pointer to an application-defined <a href="https://docs.microsoft.com/previous-versions/dd757312(v=vs.85)">MMCKINFO</a> structure previously filled by the <a href="https://docs.microsoft.com/previous-versions/dd757318(v=vs.85)">mmioDescend</a> or <a href="https://docs.microsoft.com/previous-versions/dd757317(v=vs.85)">mmioCreateChunk</a> function.
     * @param {Integer} fuAscend Reserved; must be zero.
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
     * <dt><b>MMIOERR_CANNOTSEEK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was an error while seeking to the end of the chunk.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMIOERR_CANNOTWRITE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The contents of the buffer could not be written to disk.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmiscapi/nf-mmiscapi-mmioascend
     * @since windows5.0
     */
    static mmioAscend(hmmio, pmmcki, fuAscend) {
        hmmio := hmmio is Win32Handle ? NumGet(hmmio, "ptr") : hmmio

        result := DllCall("WINMM.dll\mmioAscend", "ptr", hmmio, "ptr", pmmcki, "uint", fuAscend, "uint")
        return result
    }

    /**
     * The mmioCreateChunk function creates a chunk in a RIFF file that was opened by using the mmioOpen function.
     * @param {HMMIO} hmmio File handle of an open RIFF file.
     * @param {Pointer<MMCKINFO>} pmmcki Pointer to a buffer that receives a <a href="https://docs.microsoft.com/previous-versions/dd757312(v=vs.85)">MMCKINFO</a> structure containing information about the chunk to be created.
     * @param {Integer} fuCreate Flags identifying what type of chunk to create. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>MMIO_CREATELIST</td>
     * <td>"LIST" chunk.</td>
     * </tr>
     * <tr>
     * <td>MMIO_CREATERIFF</td>
     * <td>"RIFF" chunk.</td>
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
     * <dt><b>MMIOERR_CANNOTSEEK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to determine offset of the data portion of the chunk.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMIOERR_CANNOTWRITE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to write the chunk header.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmiscapi/nf-mmiscapi-mmiocreatechunk
     * @since windows5.0
     */
    static mmioCreateChunk(hmmio, pmmcki, fuCreate) {
        hmmio := hmmio is Win32Handle ? NumGet(hmmio, "ptr") : hmmio

        result := DllCall("WINMM.dll\mmioCreateChunk", "ptr", hmmio, "ptr", pmmcki, "uint", fuCreate, "uint")
        return result
    }

    /**
     * The joyGetPosEx function queries a joystick for its position and button status.
     * @param {Integer} uJoyID Identifier of the joystick to be queried. Valid values for <i>uJoyID</i> range from zero (JOYSTICKID1) to 15.
     * @param {Pointer<JOYINFOEX>} pji Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd757112(v=vs.85)">JOYINFOEX</a> structure that contains extended position information and button status of the joystick. You must set the <b>dwSize</b> and <b>dwFlags</b> members or <b>joyGetPosEx</b> will fail. The information returned from <b>joyGetPosEx</b> depends on the flags you specify in <b>dwFlags</b>.
     * @returns {Integer} Returns JOYERR_NOERROR if successful or one of the following error values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The joystick driver is not present.
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
     * An invalid parameter was passed.
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
     * The specified joystick identifier is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>JOYERR_UNPLUGGED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified joystick is not connected to the system.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>JOYERR_PARMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified joystick identifier is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//joystickapi/nf-joystickapi-joygetposex
     * @since windows5.0
     */
    static joyGetPosEx(uJoyID, pji) {
        result := DllCall("WINMM.dll\joyGetPosEx", "uint", uJoyID, "ptr", pji, "uint")
        return result
    }

    /**
     * The joyGetNumDevs function queries the joystick driver for the number of joysticks it supports.
     * @returns {Integer} The <b>joyGetNumDevs</b> function returns the number of joysticks supported by the current driver or zero if no driver is installed.
     * @see https://docs.microsoft.com/windows/win32/api//joystickapi/nf-joystickapi-joygetnumdevs
     * @since windows5.0
     */
    static joyGetNumDevs() {
        result := DllCall("WINMM.dll\joyGetNumDevs", "uint")
        return result
    }

    /**
     * The joyGetDevCaps function queries a joystick to determine its capabilities.
     * @param {Pointer} uJoyID Identifier of the joystick to be queried. Valid values for <i>uJoyID</i> range from -1 to 15. A value of -1 enables retrieval of the <b>szRegKey</b> member of the <a href="https://docs.microsoft.com/previous-versions/dd757103(v=vs.85)">JOYCAPS</a> structure whether a device is present or not.
     * @param {Pointer} pjc Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd757103(v=vs.85)">JOYCAPS</a> structure to contain the capabilities of the joystick.
     * @param {Integer} cbjc Size, in bytes, of the <a href="https://docs.microsoft.com/previous-versions/dd757103(v=vs.85)">JOYCAPS</a> structure.
     * @returns {Integer} Returns JOYERR_NOERROR if successful or one of the following error values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The joystick driver is not present, or the specified joystick identifier is invalid. The specified joystick identifier is invalid.
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
     * An invalid parameter was passed. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//joystickapi/nf-joystickapi-joygetdevcapsa
     */
    static joyGetDevCapsA(uJoyID, pjc, cbjc) {
        result := DllCall("WINMM.dll\joyGetDevCapsA", "ptr", uJoyID, "ptr", pjc, "uint", cbjc, "uint")
        return result
    }

    /**
     * The joyGetDevCaps function queries a joystick to determine its capabilities.
     * @param {Pointer} uJoyID Identifier of the joystick to be queried. Valid values for <i>uJoyID</i> range from -1 to 15. A value of -1 enables retrieval of the <b>szRegKey</b> member of the <a href="https://docs.microsoft.com/previous-versions/dd757103(v=vs.85)">JOYCAPS</a> structure whether a device is present or not.
     * @param {Pointer} pjc Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd757103(v=vs.85)">JOYCAPS</a> structure to contain the capabilities of the joystick.
     * @param {Integer} cbjc Size, in bytes, of the <a href="https://docs.microsoft.com/previous-versions/dd757103(v=vs.85)">JOYCAPS</a> structure.
     * @returns {Integer} Returns JOYERR_NOERROR if successful or one of the following error values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The joystick driver is not present, or the specified joystick identifier is invalid. The specified joystick identifier is invalid.
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
     * An invalid parameter was passed. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//joystickapi/nf-joystickapi-joygetdevcapsw
     * @since windows5.0
     */
    static joyGetDevCapsW(uJoyID, pjc, cbjc) {
        result := DllCall("WINMM.dll\joyGetDevCapsW", "ptr", uJoyID, "ptr", pjc, "uint", cbjc, "uint")
        return result
    }

    /**
     * The joyGetPos function queries a joystick for its position and button status.
     * @param {Integer} uJoyID Identifier of the joystick to be queried. Valid values for <i>uJoyID</i> range from zero (JOYSTICKID1) to 15.
     * @param {Pointer<JOYINFO>} pji Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd757110(v=vs.85)">JOYINFO</a> structure that contains the position and button status of the joystick.
     * @returns {Integer} Returns JOYERR_NOERROR if successful or one of the following error values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The joystick driver is not present.
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
     * An invalid parameter was passed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>JOYERR_UNPLUGGED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified joystick is not connected to the system.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//joystickapi/nf-joystickapi-joygetpos
     * @since windows5.0
     */
    static joyGetPos(uJoyID, pji) {
        result := DllCall("WINMM.dll\joyGetPos", "uint", uJoyID, "ptr", pji, "uint")
        return result
    }

    /**
     * The joyGetThreshold function queries a joystick for its current movement threshold.
     * @param {Integer} uJoyID Identifier of the joystick. Valid values for <i>uJoyID</i> range from zero (JOYSTICKID1) to 15.
     * @param {Pointer<Integer>} puThreshold Pointer to a variable that contains the movement threshold value.
     * @returns {Integer} Returns JOYERR_NOERROR if successful or one of the following error values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The joystick driver is not present.
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
     * An invalid parameter was passed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//joystickapi/nf-joystickapi-joygetthreshold
     * @since windows5.0
     */
    static joyGetThreshold(uJoyID, puThreshold) {
        puThresholdMarshal := puThreshold is VarRef ? "uint*" : "ptr"

        result := DllCall("WINMM.dll\joyGetThreshold", "uint", uJoyID, puThresholdMarshal, puThreshold, "uint")
        return result
    }

    /**
     * The joyReleaseCapture function releases the specified captured joystick.
     * @param {Integer} uJoyID Identifier of the joystick to be released. Valid values for <i>uJoyID</i> range from zero (JOYSTICKID1) to 15.
     * @returns {Integer} Returns JOYERR_NOERROR if successful or one of the following error values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The joystick driver is not present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_INVALIDPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified joystick device identifier <i>uJoyID</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>JOYERR_PARMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified joystick device identifier <i>uJoyID</i> is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//joystickapi/nf-joystickapi-joyreleasecapture
     * @since windows5.0
     */
    static joyReleaseCapture(uJoyID) {
        result := DllCall("WINMM.dll\joyReleaseCapture", "uint", uJoyID, "uint")
        return result
    }

    /**
     * The joySetCapture function captures a joystick by causing its messages to be sent to the specified window.
     * @param {HWND} hwnd Handle to the window to receive the joystick messages.
     * @param {Integer} uJoyID Identifier of the joystick to be captured. Valid values for <i>uJoyID</i> range from zero (JOYSTICKID1) to 15.
     * @param {Integer} uPeriod Polling frequency, in milliseconds.
     * @param {BOOL} fChanged Change position flag. Specify <b>TRUE</b> for this parameter to send messages only when the position changes by a value greater than the joystick movement threshold. Otherwise, messages are sent at the polling frequency specified in <i>uPeriod</i>.
     * @returns {Integer} Returns JOYERR_NOERROR if successful or one of the following error values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The joystick driver is not present.
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
     * Invalid joystick ID or hwnd is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>JOYERR_NOCANDO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot capture joystick input because a required service (such as a Windows timer) is unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>JOYERR_UNPLUGGED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified joystick is not connected to the system.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>JOYERR_PARMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid joystick ID or hwnd is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//joystickapi/nf-joystickapi-joysetcapture
     * @since windows5.0
     */
    static joySetCapture(hwnd, uJoyID, uPeriod, fChanged) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("WINMM.dll\joySetCapture", "ptr", hwnd, "uint", uJoyID, "uint", uPeriod, "int", fChanged, "uint")
        return result
    }

    /**
     * The joySetThreshold function sets the movement threshold of a joystick.
     * @param {Integer} uJoyID Identifier of the joystick. Valid values for <i>uJoyID</i> range from zero (JOYSTICKID1) to 15.
     * @param {Integer} uThreshold New movement threshold.
     * @returns {Integer} Returns JOYERR_NOERROR if successful or one of the following error values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MMSYSERR_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The joystick driver is not present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>JOYERR_PARMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified joystick device identifier <i>uJoyID</i> is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//joystickapi/nf-joystickapi-joysetthreshold
     * @since windows5.0
     */
    static joySetThreshold(uJoyID, uThreshold) {
        result := DllCall("WINMM.dll\joySetThreshold", "uint", uJoyID, "uint", uThreshold, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static VideoForWindowsVersion() {
        result := DllCall("MSVFW32.dll\VideoForWindowsVersion", "uint")
        return result
    }

    /**
     * The ICInfo function retrieves information about specific installed compressors or enumerates the installed compressors.
     * @param {Integer} fccType Four-character code indicating the type of compressor. Specify zero to match all compressor types.
     * @param {Integer} fccHandler Four-character code identifying a specific compressor or a number between zero and the number of installed compressors of the type specified by <i>fccType</i>.
     * @param {Pointer<ICINFO>} lpicinfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-icinfo">ICINFO</a> structure to return information about the compressor.
     * @returns {BOOL} Returns <b>TRUE</b> if successful or an error otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-icinfo
     * @since windows5.0
     */
    static ICInfo(fccType, fccHandler, lpicinfo) {
        result := DllCall("MSVFW32.dll\ICInfo", "uint", fccType, "uint", fccHandler, "ptr", lpicinfo, "int")
        return result
    }

    /**
     * The ICInstall function installs a new compressor or decompressor.
     * @param {Integer} fccType Four-character code indicating the type of data used by the compressor or decompressor. Specify "VIDC" for a video compressor or decompressor.
     * @param {Integer} fccHandler Four-character code identifying a specific compressor or decompressor.
     * @param {LPARAM} lParam Pointer to a null-terminated string containing the name of the compressor or decompressor, or the address of a function used for compression or decompression. The contents of this parameter are defined by the flags set for <i>wFlags</i>.
     * @param {PSTR} szDesc Reserved; do not use.
     * @param {Integer} wFlags Flags defining the contents of <i>lParam</i>. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Meaning
     *                 </th>
     * </tr>
     * <tr>
     * <td>ICINSTALL_DRIVER</td>
     * <td>The <i>lParam</i> parameter contains the address of a null-terminated string that names the compressor to install.</td>
     * </tr>
     * <tr>
     * <td>ICINSTALL_FUNCTION</td>
     * <td>The <i>lParam</i> parameter contains the address of a compressor function. This function should be structured like the <a href="https://docs.microsoft.com/previous-versions/dd797918(v=vs.85)">DriverProc</a> entry point function used by compressors.</td>
     * </tr>
     * </table>
     * @returns {BOOL} Returns ICERR_OK if successful or an error otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-icinstall
     * @since windows5.0
     */
    static ICInstall(fccType, fccHandler, lParam, szDesc, wFlags) {
        szDesc := szDesc is String ? StrPtr(szDesc) : szDesc

        result := DllCall("MSVFW32.dll\ICInstall", "uint", fccType, "uint", fccHandler, "ptr", lParam, "ptr", szDesc, "uint", wFlags, "int")
        return result
    }

    /**
     * The ICRemove function removes an installed compressor.
     * @param {Integer} fccType Four-character code indicating the type of data used by the compressor or decompressor. Specify "VIDC" for a video compressor or decompressor.
     * @param {Integer} fccHandler Four-character code identifying a specific compressor or a number between zero and the number of installed compressors of the type specified by <i>fccType</i>.
     * @param {Integer} wFlags Reserved; do not use.
     * @returns {BOOL} Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-icremove
     * @since windows5.0
     */
    static ICRemove(fccType, fccHandler, wFlags) {
        result := DllCall("MSVFW32.dll\ICRemove", "uint", fccType, "uint", fccHandler, "uint", wFlags, "int")
        return result
    }

    /**
     * The ICGetInfo function obtains information about a compressor.
     * @param {HIC} hic Handle to a compressor.
     * @param {Pointer} picinfo Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-icinfo">ICINFO</a> structure to return information about the compressor.
     * @param {Integer} cb Size, in bytes, of the structure pointed to by <i>lpicinfo</i>.
     * @returns {LRESULT} Returns the number of bytes copied into the structure or zero if an error occurs.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-icgetinfo
     * @since windows5.0
     */
    static ICGetInfo(hic, picinfo, cb) {
        hic := hic is Win32Handle ? NumGet(hic, "ptr") : hic

        result := DllCall("MSVFW32.dll\ICGetInfo", "ptr", hic, "ptr", picinfo, "uint", cb, "ptr")
        return result
    }

    /**
     * The ICOpen function opens a compressor or decompressor.
     * @param {Integer} fccType Four-character code indicating the type of compressor or decompressor to open. For video streams, the value of this parameter is "VIDC".
     * @param {Integer} fccHandler Preferred handler of the specified type. Typically, the handler type is stored in the stream header in an AVI file.
     * @param {Integer} wMode Flag defining the use of the compressor or decompressor. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Meaning
     *                 </th>
     * </tr>
     * <tr>
     * <td>ICMODE_COMPRESS</td>
     * <td>Compressor will perform normal compression.</td>
     * </tr>
     * <tr>
     * <td>ICMODE_DECOMPRESS</td>
     * <td>Decompressor will perform normal decompression.</td>
     * </tr>
     * <tr>
     * <td>ICMODE_DRAW</td>
     * <td>Decompressor will decompress and draw the data directly to hardware.</td>
     * </tr>
     * <tr>
     * <td>ICMODE_FASTCOMPRESS</td>
     * <td>Compressor will perform fast (real-time) compression.</td>
     * </tr>
     * <tr>
     * <td>ICMODE_FASTDECOMPRESS</td>
     * <td>Decompressor will perform fast (real-time) decompression.</td>
     * </tr>
     * <tr>
     * <td>ICMODE_QUERY</td>
     * <td>Queries the compressor or decompressor for information.</td>
     * </tr>
     * </table>
     * @returns {HIC} Returns a handle to a compressor or decompressor if successful or zero otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-icopen
     * @since windows5.0
     */
    static ICOpen(fccType, fccHandler, wMode) {
        result := DllCall("MSVFW32.dll\ICOpen", "uint", fccType, "uint", fccHandler, "uint", wMode, "ptr")
        return HIC({Value: result}, True)
    }

    /**
     * The ICOpenFunction function opens a compressor or decompressor defined as a function.
     * @param {Integer} fccType Type of compressor to open. For video, the value of this parameter is ICTYPE_VIDEO.
     * @param {Integer} fccHandler Preferred handler of the specified type. Typically, this comes from the stream header in an AVI file.
     * @param {Integer} wMode Flag to define the use of the compressor or decompressor. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Meaning
     *                 </th>
     * </tr>
     * <tr>
     * <td>ICMODE_COMPRESS</td>
     * <td>Compressor will perform normal compression.</td>
     * </tr>
     * <tr>
     * <td>ICMODE_DECOMPRESS</td>
     * <td>Decompressor will perform normal decompression.</td>
     * </tr>
     * <tr>
     * <td>ICMODE_DRAW</td>
     * <td>Decompressor will decompress and draw the data directly to hardware.</td>
     * </tr>
     * <tr>
     * <td>ICMODE_FASTCOMPRESS</td>
     * <td>Compressor will perform fast (real-time) compression.</td>
     * </tr>
     * <tr>
     * <td>ICMODE_FASTDECOMPRESS</td>
     * <td>Decompressor will perform fast (real-time) decompression.</td>
     * </tr>
     * <tr>
     * <td>ICMODE_QUERY</td>
     * <td>Queries the compressor or decompressor for information.</td>
     * </tr>
     * </table>
     * @param {Pointer<FARPROC>} lpfnHandler Pointer to the function used as the compressor or decompressor.
     * @returns {HIC} Returns a handle to a compressor or decompressor if successful or zero otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-icopenfunction
     * @since windows5.0
     */
    static ICOpenFunction(fccType, fccHandler, wMode, lpfnHandler) {
        result := DllCall("MSVFW32.dll\ICOpenFunction", "uint", fccType, "uint", fccHandler, "uint", wMode, "ptr", lpfnHandler, "ptr")
        return HIC({Value: result}, True)
    }

    /**
     * The ICClose function closes a compressor or decompressor.
     * @param {HIC} hic Handle to a compressor or decompressor.
     * @returns {LRESULT} Returns ICERR_OK if successful or an error otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-icclose
     * @since windows5.0
     */
    static ICClose(hic) {
        hic := hic is Win32Handle ? NumGet(hic, "ptr") : hic

        result := DllCall("MSVFW32.dll\ICClose", "ptr", hic, "ptr")
        return result
    }

    /**
     * The ICSendMessage function sends a message to a compressor.
     * @param {HIC} hic Handle to the compressor to receive the message.
     * @param {Integer} msg Message to send.
     * @param {Pointer} dw1 Additional message-specific information.
     * @param {Pointer} dw2 Additional message-specific information.
     * @returns {LRESULT} Returns a message-specific result.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-icsendmessage
     * @since windows5.0
     */
    static ICSendMessage(hic, msg, dw1, dw2) {
        hic := hic is Win32Handle ? NumGet(hic, "ptr") : hic

        result := DllCall("MSVFW32.dll\ICSendMessage", "ptr", hic, "uint", msg, "ptr", dw1, "ptr", dw2, "ptr")
        return result
    }

    /**
     * The ICCompress function compresses a single video image.
     * @param {HIC} hic Handle to the compressor to use.
     * @param {Integer} dwFlags Compression flag. The following value is defined:
     * @param {Pointer<BITMAPINFOHEADER>} lpbiOutput Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure containing the output format.
     * @param {Pointer<Void>} lpData Pointer to an output buffer large enough to contain a compressed frame.
     * @param {Pointer<BITMAPINFOHEADER>} lpbiInput Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure containing the input format.
     * @param {Pointer<Void>} lpBits Pointer to the input buffer.
     * @param {Pointer<Integer>} lpckid Reserved; do not use.
     * @param {Pointer<Integer>} lpdwFlags Pointer to the return flags used in the AVI index. The following value is defined:
     * @param {Integer} lFrameNum Frame number.
     * @param {Integer} dwFrameSize Requested frame size, in bytes. Specify a nonzero value if the compressor supports a suggested frame size, as indicated by the presence of the <b>VIDCF_CRUNCH</b> flag returned by the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-icgetinfo">ICGetInfo</a> function. If this flag is not set or a data rate for the frame is not specified, specify zero for this parameter.
     * 
     * A compressor might have to sacrifice image quality or make some other trade-off to obtain the size goal specified in this parameter.
     * @param {Integer} dwQuality Requested quality value for the frame. Specify a nonzero value if the compressor supports a suggested quality value, as indicated by the presence of the <b>VIDCF_QUALITY</b> flag returned by <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-icgetinfo">ICGetInfo</a>. Otherwise, specify zero for this parameter.
     * @param {Pointer<BITMAPINFOHEADER>} lpbiPrev Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure containing the format of the previous frame.
     * @param {Pointer<Void>} lpPrev Pointer to the uncompressed image of the previous frame. This parameter is not used for fast temporal compression. Specify <b>NULL</b> for this parameter when compressing a key frame, if the compressor does not support temporal compression, or if the compressor does not require an external buffer to store the format and data of the previous image.
     * @returns {Integer} Returns <b>ICERR_OK</b> if successful or an error otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-iccompress
     * @since windows5.0
     */
    static ICCompress(hic, dwFlags, lpbiOutput, lpData, lpbiInput, lpBits, lpckid, lpdwFlags, lFrameNum, dwFrameSize, dwQuality, lpbiPrev, lpPrev) {
        hic := hic is Win32Handle ? NumGet(hic, "ptr") : hic

        lpDataMarshal := lpData is VarRef ? "ptr" : "ptr"
        lpBitsMarshal := lpBits is VarRef ? "ptr" : "ptr"
        lpckidMarshal := lpckid is VarRef ? "uint*" : "ptr"
        lpdwFlagsMarshal := lpdwFlags is VarRef ? "uint*" : "ptr"
        lpPrevMarshal := lpPrev is VarRef ? "ptr" : "ptr"

        result := DllCall("MSVFW32.dll\ICCompress", "ptr", hic, "uint", dwFlags, "ptr", lpbiOutput, lpDataMarshal, lpData, "ptr", lpbiInput, lpBitsMarshal, lpBits, lpckidMarshal, lpckid, lpdwFlagsMarshal, lpdwFlags, "int", lFrameNum, "uint", dwFrameSize, "uint", dwQuality, "ptr", lpbiPrev, lpPrevMarshal, lpPrev, "CDecl uint")
        return result
    }

    /**
     * The ICDecompress function decompresses a single video frame.
     * @param {HIC} hic Handle to the decompressor to use.
     * @param {Integer} dwFlags Applicable decompression flags. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Meaning
     *                 </th>
     * </tr>
     * <tr>
     * <td><b>ICDECOMPRESS_HURRYUP</b></td>
     * <td>Tries to decompress at a faster rate. When an application uses this flag, the driver should buffer the decompressed data but not draw the image.</td>
     * </tr>
     * <tr>
     * <td><b>ICDECOMPRESS_NOTKEYFRAME</b></td>
     * <td>Current frame is not a key frame.</td>
     * </tr>
     * <tr>
     * <td><b>ICDECOMPRESS_NULLFRAME</b></td>
     * <td>Current frame does not contain data and the decompressed image should be left the same.</td>
     * </tr>
     * <tr>
     * <td><b>ICDECOMPRESS_PREROLL</b></td>
     * <td>Current frame precedes the point in the movie where playback starts and, therefore, will not be drawn.</td>
     * </tr>
     * <tr>
     * <td><b>ICDECOMPRESS_UPDATE</b></td>
     * <td>Screen is being updated or refreshed.</td>
     * </tr>
     * </table>
     * @param {Pointer<BITMAPINFOHEADER>} lpbiFormat Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure containing the format of the compressed data.
     * @param {Pointer<Void>} lpData Pointer to the input data.
     * @param {Pointer<BITMAPINFOHEADER>} lpbi Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure containing the output format.
     * @param {Pointer<Void>} lpBits Pointer to a buffer that is large enough to contain the decompressed data.
     * @returns {Integer} Returns ICERR_OK if successful or an error otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-icdecompress
     * @since windows5.0
     */
    static ICDecompress(hic, dwFlags, lpbiFormat, lpData, lpbi, lpBits) {
        hic := hic is Win32Handle ? NumGet(hic, "ptr") : hic

        lpDataMarshal := lpData is VarRef ? "ptr" : "ptr"
        lpBitsMarshal := lpBits is VarRef ? "ptr" : "ptr"

        result := DllCall("MSVFW32.dll\ICDecompress", "ptr", hic, "uint", dwFlags, "ptr", lpbiFormat, lpDataMarshal, lpData, "ptr", lpbi, lpBitsMarshal, lpBits, "CDecl uint")
        return result
    }

    /**
     * The ICDrawBegin function initializes the renderer and prepares the drawing destination for drawing.
     * @param {HIC} hic Handle to the decompressor to use.
     * @param {Integer} dwFlags Decompression flags. The following values are defined.
     *             
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Meaning
     *                 </th>
     * </tr>
     * <tr>
     * <td><b>ICDRAW_ANIMATE</b></td>
     * <td>Application can animate the palette.</td>
     * </tr>
     * <tr>
     * <td><b>ICDRAW_CONTINUE</b></td>
     * <td>Drawing is a continuation of the previous frame.</td>
     * </tr>
     * <tr>
     * <td><b>ICDRAW_FULLSCREEN</b></td>
     * <td>Draws the decompressed data on the full screen.</td>
     * </tr>
     * <tr>
     * <td><b>ICDRAW_HDC</b></td>
     * <td>Draws the decompressed data to a window or a DC.</td>
     * </tr>
     * <tr>
     * <td><b>ICDRAW_MEMORYDC</b></td>
     * <td>DC is off-screen.</td>
     * </tr>
     * <tr>
     * <td><b>ICDRAW_QUERY</b></td>
     * <td>Determines if the decompressor can decompress the data. The driver does not decompress the data.</td>
     * </tr>
     * <tr>
     * <td><b>ICDRAW_UPDATING</b></td>
     * <td>Current frame is being updated rather than played.</td>
     * </tr>
     * </table>
     * @param {HPALETTE} hpal Handle to the palette used for drawing.
     * @param {HWND} hwnd Handle to the window used for drawing.
     * @param {HDC} hdc DC used for drawing.
     * @param {Integer} xDst The x-coordinate of the upper right corner of the destination rectangle.
     * @param {Integer} yDst The y-coordinate of the upper right corner of the destination rectangle.
     * @param {Integer} dxDst Width of the destination rectangle.
     * @param {Integer} dyDst Height of the destination rectangle.
     * @param {Pointer<BITMAPINFOHEADER>} lpbi Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure containing the format of the input data to be decompressed.
     * @param {Integer} xSrc The x-coordinate of the upper right corner of the source rectangle.
     * @param {Integer} ySrc The y-coordinate of the upper right corner of the source rectangle.
     * @param {Integer} dxSrc Width of the source rectangle.
     * @param {Integer} dySrc Height of the source rectangle.
     * @param {Integer} dwRate Frame rate numerator. The frame rate, in frames per second, is obtained by dividing <i>dwRate</i> by <i>dwScale</i>.
     * @param {Integer} dwScale Frame rate denominator. The frame rate, in frames per second, is obtained by dividing <i>dwRate</i> by <i>dwScale</i>.
     * @returns {Integer} Returns ICERR_OK if the renderer can decompress the data or <b>ICERR_UNSUPPORTED</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-icdrawbegin
     * @since windows5.0
     */
    static ICDrawBegin(hic, dwFlags, hpal, hwnd, hdc, xDst, yDst, dxDst, dyDst, lpbi, xSrc, ySrc, dxSrc, dySrc, dwRate, dwScale) {
        hic := hic is Win32Handle ? NumGet(hic, "ptr") : hic
        hpal := hpal is Win32Handle ? NumGet(hpal, "ptr") : hpal
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("MSVFW32.dll\ICDrawBegin", "ptr", hic, "uint", dwFlags, "ptr", hpal, "ptr", hwnd, "ptr", hdc, "int", xDst, "int", yDst, "int", dxDst, "int", dyDst, "ptr", lpbi, "int", xSrc, "int", ySrc, "int", dxSrc, "int", dySrc, "uint", dwRate, "uint", dwScale, "CDecl uint")
        return result
    }

    /**
     * The ICDraw function decompresses an image for drawing.
     * @param {HIC} hic Handle to an decompressor.
     * @param {Integer} dwFlags Decompression flags. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Meaning
     *                 </th>
     * </tr>
     * <tr>
     * <td><b>ICDRAW_HURRYUP</b></td>
     * <td>Data is buffered and not drawn to the screen. Use this flag for fastest decompression.</td>
     * </tr>
     * <tr>
     * <td><b>ICDRAW_NOTKEYFRAME</b></td>
     * <td>Current frame is not a key frame.</td>
     * </tr>
     * <tr>
     * <td><b>ICDRAW_NULLFRAME</b></td>
     * <td>Current frame does not contain any data and the previous frame should be redrawn.</td>
     * </tr>
     * <tr>
     * <td><b>ICDRAW_PREROLL</b></td>
     * <td>Current frame of video occurs before playback should start. For example, if playback will begin on frame 10, and frame 0 is the nearest previous key frame, frames 0 through 9 are sent to the driver with the <b>ICDRAW_PREROLL</b> flag set. The driver needs this data to display frame 10 properly.</td>
     * </tr>
     * <tr>
     * <td><b>ICDRAW_UPDATE</b></td>
     * <td>Updates the screen based on previously received data. Set <i>lpData</i> to <b>NULL</b> when this flag is used.</td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} lpFormat Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure containing the input format of the data.
     * @param {Pointer} lpData Pointer to the input data.
     * @param {Integer} cbData Size of the input data, in bytes.
     * @param {Integer} lTime Time, in samples, to draw this frame. The units for video data are frames. For a definition of the playback rate, see the <b>dwRate</b> and <b>dwScale</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-icdrawbegin">ICDRAWBEGIN</a> structure.
     * @returns {Integer} Returns<b> ICERR_OK</b> if successful or an error otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-icdraw
     * @since windows5.0
     */
    static ICDraw(hic, dwFlags, lpFormat, lpData, cbData, lTime) {
        hic := hic is Win32Handle ? NumGet(hic, "ptr") : hic

        lpFormatMarshal := lpFormat is VarRef ? "ptr" : "ptr"

        result := DllCall("MSVFW32.dll\ICDraw", "ptr", hic, "uint", dwFlags, lpFormatMarshal, lpFormat, "ptr", lpData, "uint", cbData, "int", lTime, "CDecl uint")
        return result
    }

    /**
     * The ICLocate function finds a compressor or decompressor that can handle images with the specified formats, or finds a driver that can decompress an image with a specified format directly to hardware.
     * @param {Integer} fccType Four-character code indicating the type of compressor or decompressor to open. For video streams, the value of this parameter is 'VIDC'.
     * @param {Integer} fccHandler Preferred handler of the specified type. Typically, the handler type is stored in the stream header in an AVI file. Specify <b>NULL</b> if your application can use any handler type or it does not know the handler type to use.
     * @param {Pointer<BITMAPINFOHEADER>} lpbiIn Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure defining the input format. A compressor handle is not returned unless it supports this format.
     * @param {Pointer<BITMAPINFOHEADER>} lpbiOut Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure defining an optional decompressed format. You can also specify zero to use the default output format associated with the input format.
     * 
     * If this parameter is nonzero, a compressor handle is not returned unless it can create this output format.
     * @param {Integer} wFlags Flags that describe the search criteria for a compressor or decompressor. The following values are defined:
     *           
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICMODE_COMPRESS"></a><a id="icmode_compress"></a><dl>
     * <dt><b>ICMODE_COMPRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Finds a compressor that can compress an image with a format defined by <i>lpbiIn</i> to the format defined by <i>lpbiOut</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICMODE_DECOMPRESS"></a><a id="icmode_decompress"></a><dl>
     * <dt><b>ICMODE_DECOMPRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Finds a decompressor that can decompress an image with a format defined by <i>lpbiIn</i> to the format defined by <i>lpbiOut</i>.
     *           
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICMODE_DRAW"></a><a id="icmode_draw"></a><dl>
     * <dt><b>ICMODE_DRAW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Finds a decompressor that can decompress an image with a format defined by <i>lpbiIn</i> and draw it directly to hardware.
     *           
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICMODE_FASTCOMPRESS"></a><a id="icmode_fastcompress"></a><dl>
     * <dt><b>ICMODE_FASTCOMPRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Has the same meaning as <b>ICMODE_COMPRESS</b> except the compressor is used for a real-time operation and emphasizes speed over quality.
     *           
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICMODE_FASTDECOMPRESS"></a><a id="icmode_fastdecompress"></a><dl>
     * <dt><b>ICMODE_FASTDECOMPRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Has the same meaning as <b>ICMODE_DECOMPRESS</b> except the decompressor is used for a real-time operation and emphasizes speed over quality.
     *           
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HIC} Returns a handle to a compressor or decompressor if successful or zero otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-iclocate
     * @since windows5.0
     */
    static ICLocate(fccType, fccHandler, lpbiIn, lpbiOut, wFlags) {
        result := DllCall("MSVFW32.dll\ICLocate", "uint", fccType, "uint", fccHandler, "ptr", lpbiIn, "ptr", lpbiOut, "ushort", wFlags, "ptr")
        return HIC({Value: result}, True)
    }

    /**
     * The ICGetDisplayFormat function determines the best format available for displaying a compressed image. The function also opens a compressor if a handle of an open compressor is not specified.
     * @param {HIC} hic Handle to the compressor to use. Specify <b>NULL</b> to have VCM select and open an appropriate compressor.
     * @param {Pointer<BITMAPINFOHEADER>} lpbiIn Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure containing the compressed format.
     * @param {Pointer<BITMAPINFOHEADER>} lpbiOut Pointer to a buffer to return the decompressed format. The buffer should be large enough for a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure and 256 color entries.
     * @param {Integer} BitDepth Preferred bit depth, if nonzero.
     * @param {Integer} dx Width multiplier to stretch the image. If this parameter is zero, that dimension is not stretched.
     * @param {Integer} dy Height multiplier to stretch the image. If this parameter is zero, that dimension is not stretched.
     * @returns {HIC} Returns a handle to a decompressor if successful or zero otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-icgetdisplayformat
     * @since windows5.0
     */
    static ICGetDisplayFormat(hic, lpbiIn, lpbiOut, BitDepth, dx, dy) {
        hic := hic is Win32Handle ? NumGet(hic, "ptr") : hic

        result := DllCall("MSVFW32.dll\ICGetDisplayFormat", "ptr", hic, "ptr", lpbiIn, "ptr", lpbiOut, "int", BitDepth, "int", dx, "int", dy, "ptr")
        return HIC({Value: result}, True)
    }

    /**
     * The ICImageCompress function compresses an image to a given size. This function does not require initialization functions.
     * @param {HIC} hic Handle to a compressor opened with the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-icopen">ICOpen</a> function. Specify <b>NULL</b> to have VCM select an appropriate compressor for the compression format. An application can have the user select the compressor by using the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-iccompressorchoose">ICCompressorChoose</a> function, which opens the selected compressor and returns a handle of the compressor in this parameter.
     * @param {Integer} uiFlags Reserved; must be zero.
     * @param {Pointer<BITMAPINFO>} lpbiIn Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure containing the input data format.
     * @param {Pointer<Void>} lpBits Pointer to input data bits to compress. The data bits exclude header and format information.
     * @param {Pointer<BITMAPINFO>} lpbiOut Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure containing the compressed output format. Specify <b>NULL</b> to have the compressor use an appropriate format.
     * @param {Integer} lQuality Quality value used by the compressor. Values range from 0 to 10,000.
     * @param {Pointer<Integer>} plSize Maximum size desired for the compressed image. The compressor might not be able to compress the data to fit within this size. When the function returns, this parameter points to the size of the compressed image. Image sizes are specified in bytes.
     * @returns {HANDLE} Returns a handle to a compressed DIB. The image data follows the format header.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-icimagecompress
     * @since windows5.0
     */
    static ICImageCompress(hic, uiFlags, lpbiIn, lpBits, lpbiOut, lQuality, plSize) {
        hic := hic is Win32Handle ? NumGet(hic, "ptr") : hic

        lpBitsMarshal := lpBits is VarRef ? "ptr" : "ptr"
        plSizeMarshal := plSize is VarRef ? "int*" : "ptr"

        result := DllCall("MSVFW32.dll\ICImageCompress", "ptr", hic, "uint", uiFlags, "ptr", lpbiIn, lpBitsMarshal, lpBits, "ptr", lpbiOut, "int", lQuality, plSizeMarshal, plSize, "ptr")
        return HANDLE({Value: result}, True)
    }

    /**
     * The ICImageDecompress function decompresses an image without using initialization functions.
     * @param {HIC} hic Handle to a decompressor opened with the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-icopen">ICOpen</a> function. Specify <b>NULL</b> to have VCM select an appropriate decompressor for the compressed image.
     * @param {Integer} uiFlags Reserved; must be zero.
     * @param {Pointer<BITMAPINFO>} lpbiIn Compressed input data format.
     * @param {Pointer<Void>} lpBits Pointer to input data bits to compress. The data bits exclude header and format information.
     * @param {Pointer<BITMAPINFO>} lpbiOut Decompressed output format. Specify <b>NULL</b> to let decompressor use an appropriate format.
     * @returns {HANDLE} Returns a handle to an uncompressed DIB in the CF_DIB format if successful or <b>NULL</b> otherwise. Image data follows the format header.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-icimagedecompress
     * @since windows5.0
     */
    static ICImageDecompress(hic, uiFlags, lpbiIn, lpBits, lpbiOut) {
        hic := hic is Win32Handle ? NumGet(hic, "ptr") : hic

        lpBitsMarshal := lpBits is VarRef ? "ptr" : "ptr"

        result := DllCall("MSVFW32.dll\ICImageDecompress", "ptr", hic, "uint", uiFlags, "ptr", lpbiIn, lpBitsMarshal, lpBits, "ptr", lpbiOut, "ptr")
        return HANDLE({Value: result}, True)
    }

    /**
     * The ICCompressorChoose function displays a dialog box in which a user can select a compressor. This function can display all registered compressors or list only the compressors that support a specific format.
     * @param {HWND} hwnd Handle to a parent window for the dialog box.
     * @param {Integer} uiFlags Applicable flags. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Meaning
     *                 </th>
     * </tr>
     * <tr>
     * <td>ICMF_CHOOSE_ALLCOMPRESSORS</td>
     * <td>All compressors should appear in the selection list. If this flag is not specified, only the compressors that can handle the input format appear in the selection list.</td>
     * </tr>
     * <tr>
     * <td>ICMF_CHOOSE_DATARATE</td>
     * <td>Displays a check box and edit box to enter the data rate for the movie.</td>
     * </tr>
     * <tr>
     * <td>ICMF_CHOOSE_KEYFRAME</td>
     * <td>Displays a check box and edit box to enter the frequency of key frames.</td>
     * </tr>
     * <tr>
     * <td>ICMF_CHOOSE_PREVIEW</td>
     * <td>Displays a button to expand the dialog box to include a preview window. The preview window shows how frames of your movie will appear when compressed with the current settings.</td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} pvIn Uncompressed data input format. Only compressors that support the specified data input format are included in the compressor list. This parameter is optional.
     * @param {Pointer<Void>} lpData Pointer to an AVI stream interface to use in the preview window. You must specify a video stream. This parameter is optional.
     * @param {Pointer<COMPVARS>} pc Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-compvars">COMPVARS</a> structure. The information returned initializes the structure for use with other functions.
     * @param {PSTR} lpszTitle Pointer to a null-terminated string containing a title for the dialog box. This parameter is optional.
     * @returns {BOOL} Returns <b>TRUE</b> if the user chooses a compressor and presses OK. Returns <b>FALSE</b> on error or if the user presses CANCEL.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-iccompressorchoose
     * @since windows5.0
     */
    static ICCompressorChoose(hwnd, uiFlags, pvIn, lpData, pc, lpszTitle) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        lpszTitle := lpszTitle is String ? StrPtr(lpszTitle) : lpszTitle

        pvInMarshal := pvIn is VarRef ? "ptr" : "ptr"
        lpDataMarshal := lpData is VarRef ? "ptr" : "ptr"

        result := DllCall("MSVFW32.dll\ICCompressorChoose", "ptr", hwnd, "uint", uiFlags, pvInMarshal, pvIn, lpDataMarshal, lpData, "ptr", pc, "ptr", lpszTitle, "int")
        return result
    }

    /**
     * The ICSeqCompressFrameStart function initializes resources for compressing a sequence of frames using the ICSeqCompressFrame function.
     * @param {Pointer<COMPVARS>} pc Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-compvars">COMPVARS</a> structure initialized with information for compression.
     * @param {Pointer<BITMAPINFO>} lpbiIn Format of the data to be compressed.
     * @returns {BOOL} Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-icseqcompressframestart
     * @since windows5.0
     */
    static ICSeqCompressFrameStart(pc, lpbiIn) {
        result := DllCall("MSVFW32.dll\ICSeqCompressFrameStart", "ptr", pc, "ptr", lpbiIn, "int")
        return result
    }

    /**
     * The ICSeqCompressFrameEnd function ends sequence compression that was initiated by using the ICSeqCompressFrameStart and ICSeqCompressFrame functions.
     * @param {Pointer<COMPVARS>} pc Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-compvars">COMPVARS</a> structure used during sequence compression.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-icseqcompressframeend
     * @since windows5.0
     */
    static ICSeqCompressFrameEnd(pc) {
        DllCall("MSVFW32.dll\ICSeqCompressFrameEnd", "ptr", pc)
    }

    /**
     * The ICSeqCompressFrame function compresses one frame in a sequence of frames.
     * @param {Pointer<COMPVARS>} pc Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-compvars">COMPVARS</a> structure initialized with information about the compression.
     * @param {Pointer<Void>} lpBits Pointer to the data bits to compress. (The data bits exclude header or format information.)
     * @param {Pointer<BOOL>} pfKey Returns whether or not the frame was compressed into a key frame.
     * @param {Pointer<Integer>} plSize Maximum size desired for the compressed image. The compressor might not be able to compress the data to fit within this size. When the function returns, the parameter points to the size of the compressed image. Images sizes are specified in bytes.
     * @returns {Pointer<Void>} Returns the address of the compressed bits if successful or <b>NULL</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-icseqcompressframe
     * @since windows5.0
     */
    static ICSeqCompressFrame(pc, lpBits, pfKey, plSize) {
        static uiFlags := 0 ;Reserved parameters must always be NULL

        lpBitsMarshal := lpBits is VarRef ? "ptr" : "ptr"
        plSizeMarshal := plSize is VarRef ? "int*" : "ptr"

        result := DllCall("MSVFW32.dll\ICSeqCompressFrame", "ptr", pc, "uint", uiFlags, lpBitsMarshal, lpBits, "ptr", pfKey, plSizeMarshal, plSize, "ptr")
        return result
    }

    /**
     * The ICCompressorFree function frees the resources in the COMPVARS structure used by other VCM functions.
     * @param {Pointer<COMPVARS>} pc Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-compvars">COMPVARS</a> structure containing the resources to be freed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-iccompressorfree
     * @since windows5.0
     */
    static ICCompressorFree(pc) {
        DllCall("MSVFW32.dll\ICCompressorFree", "ptr", pc)
    }

    /**
     * The DrawDibOpen function opens the DrawDib library for use and creates a DrawDib DC for drawing.
     * @returns {Pointer} Returns a handle to a DrawDib DC if successful or <b>NULL</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-drawdibopen
     * @since windows5.0
     */
    static DrawDibOpen() {
        result := DllCall("MSVFW32.dll\DrawDibOpen", "ptr")
        return result
    }

    /**
     * The DrawDibClose function closes a DrawDib DC and frees the resources DrawDib allocated for it.
     * @param {Pointer} hdd Handle to a DrawDib DC.
     * @returns {BOOL} Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-drawdibclose
     * @since windows5.0
     */
    static DrawDibClose(hdd) {
        result := DllCall("MSVFW32.dll\DrawDibClose", "ptr", hdd, "int")
        return result
    }

    /**
     * The DrawDibGetBuffer function retrieves the location of the buffer used by DrawDib for decompression.
     * @param {Pointer} hdd Handle to a DrawDib DC.
     * @param {Pointer<BITMAPINFOHEADER>} lpbi Pointer to a <a href="https://docs.microsoft.com/previous-versions//ms532284(v=vs.85)">BITMAPINFO</a> structure. This structure is made up of a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure and a 256-entry table defining the colors used by the bitmap.
     * @param {Integer} dwSize Size, in bytes, of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure pointed to by <i>lpbi</i>
     * @param {Integer} dwFlags Reserved; must be zero.
     * @returns {Pointer<Void>} Returns the address of the buffer or <b>NULL</b> if no buffer is used. if <i>lpbr</i> is not <b>NULL</b>, it is filled with a copy of the <a href="/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure describing the buffer.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-drawdibgetbuffer
     * @since windows5.0
     */
    static DrawDibGetBuffer(hdd, lpbi, dwSize, dwFlags) {
        result := DllCall("MSVFW32.dll\DrawDibGetBuffer", "ptr", hdd, "ptr", lpbi, "uint", dwSize, "uint", dwFlags, "ptr")
        return result
    }

    /**
     * The DrawDibGetPalette function retrieves the palette used by a DrawDib DC.
     * @param {Pointer} hdd Handle to a DrawDib DC.
     * @returns {HPALETTE} Returns a handle to the palette if successful or <b>NULL</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-drawdibgetpalette
     * @since windows5.0
     */
    static DrawDibGetPalette(hdd) {
        result := DllCall("MSVFW32.dll\DrawDibGetPalette", "ptr", hdd, "ptr")
        return HPALETTE({Value: result}, True)
    }

    /**
     * The DrawDibSetPalette function sets the palette used for drawing DIBs.
     * @param {Pointer} hdd Handle to a DrawDib DC.
     * @param {HPALETTE} hpal Handle to the palette. Specify <b>NULL</b> to use the default palette.
     * @returns {BOOL} Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-drawdibsetpalette
     * @since windows5.0
     */
    static DrawDibSetPalette(hdd, hpal) {
        hpal := hpal is Win32Handle ? NumGet(hpal, "ptr") : hpal

        result := DllCall("MSVFW32.dll\DrawDibSetPalette", "ptr", hdd, "ptr", hpal, "int")
        return result
    }

    /**
     * The DrawDibChangePalette function sets the palette entries used for drawing DIBs.
     * @param {Pointer} hdd Handle to a DrawDib DC.
     * @param {Integer} iStart Starting palette entry number.
     * @param {Integer} iLen Number of palette entries.
     * @param {Pointer<PALETTEENTRY>} lppe Pointer to an array of palette entries.
     * @returns {BOOL} Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-drawdibchangepalette
     * @since windows5.0
     */
    static DrawDibChangePalette(hdd, iStart, iLen, lppe) {
        result := DllCall("MSVFW32.dll\DrawDibChangePalette", "ptr", hdd, "int", iStart, "int", iLen, "ptr", lppe, "int")
        return result
    }

    /**
     * The DrawDibRealize function realizes the palette of the DrawDib DC for use with the specified DC.
     * @param {Pointer} hdd Handle to a DrawDib DC.
     * @param {HDC} hdc Handle to the DC containing the palette.
     * @param {BOOL} fBackground Background palette flag. If this value is nonzero, the palette is a background palette. If this value is zero and the DC is attached to a window, the logical palette becomes the foreground palette when the window has the input focus. (A DC is attached to a window when the window class style is CS_OWNDC or when the DC is obtained by using the <a href="https://docs.microsoft.com/previous-versions//ms533241(v=vs.85)">GetDC</a> function.)
     * @returns {Integer} Returns the number of entries in the logical palette mapped to different values in the system palette. If an error occurs or no colors were updated, it returns zero.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-drawdibrealize
     * @since windows5.0
     */
    static DrawDibRealize(hdd, hdc, fBackground) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("MSVFW32.dll\DrawDibRealize", "ptr", hdd, "ptr", hdc, "int", fBackground, "uint")
        return result
    }

    /**
     * The DrawDibStart function prepares a DrawDib DC for streaming playback.
     * @param {Pointer} hdd Handle to a DrawDib DC.
     * @param {Integer} rate Playback rate, in microseconds per frame.
     * @returns {BOOL} Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-drawdibstart
     * @since windows5.0
     */
    static DrawDibStart(hdd, rate) {
        result := DllCall("MSVFW32.dll\DrawDibStart", "ptr", hdd, "uint", rate, "int")
        return result
    }

    /**
     * The DrawDibStop function frees the resources used by a DrawDib DC for streaming playback.
     * @param {Pointer} hdd Handle to a DrawDib DC.
     * @returns {BOOL} Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-drawdibstop
     * @since windows5.0
     */
    static DrawDibStop(hdd) {
        result := DllCall("MSVFW32.dll\DrawDibStop", "ptr", hdd, "int")
        return result
    }

    /**
     * The DrawDib function changes parameters of a DrawDib DC or initializes a new DrawDib DC.
     * @param {Pointer} hdd Handle to a DrawDib DC.
     * @param {HDC} hdc Handle to a DC for drawing. This parameter is optional.
     * @param {Integer} dxDst Width, in <b>MM_TEXT</b> client units, of the destination rectangle.
     * @param {Integer} dyDst Height, in <b>MM_TEXT</b> client units, of the destination rectangle.
     * @param {Pointer<BITMAPINFOHEADER>} lpbi Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure containing the image format. The color table for the DIB follows the image format and the <b>biHeight</b> member must be a positive value.
     * @param {Integer} dxSrc Width, in pixels, of the source rectangle.
     * @param {Integer} dySrc Height, in pixels, of the source rectangle.
     * @param {Integer} wFlags Applicable flags for the function. The following values are defined.
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
     * <td>DDF_ANIMATE</td>
     * <td>Allows palette animation. If this value is present, DrawDib reserves as many entries as possible by setting <b>PC_RESERVED</b> in the <b>palPalEntry</b> array entries of the <a href="https://docs.microsoft.com/previous-versions//ms532642(v=vs.85)">LOGPALETTE</a> structure, and the palette can be animated by using the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-drawdibchangepalette">DrawDibChangePalette</a> function. If your application uses the <b>DrawDibBegin</b> function with the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-drawdibdraw">DrawDibDraw</a> function, set this value with <b>DrawDibBegin</b> rather than <b>DrawDibDraw</b>.</td>
     * </tr>
     * <tr>
     * <td>DDF_BACKGROUNDPAL</td>
     * <td>Realizes the palette used for drawing as a background task, leaving the current palette used for the display unchanged. (This value is mutually exclusive of <b>DDF_SAME_HDC</b>.)</td>
     * </tr>
     * <tr>
     * <td>DDF_BUFFER</td>
     * <td>Causes DrawDib to try to use an off-screen buffer so <b>DDF_UPDATE</b> can be used. This disables decompression and drawing directly to the screen. If DrawDib is unable to create an off-screen buffer, it will decompress or draw directly to the screen. For more information, see the <b>DDF_UPDATE</b> and <b>DDF_DONTDRAW</b> values described for <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-drawdibdraw">DrawDibDraw</a>.</td>
     * </tr>
     * <tr>
     * <td>DDF_DONTDRAW</td>
     * <td>Current image is not drawn, but is decompressed. <b>DDF_UPDATE</b> can be used later to draw the image. This flag supersedes the <b>DDF_PREROLL</b> flag.</td>
     * </tr>
     * <tr>
     * <td>DDF_FULLSCREEN</td>
     * <td>Not supported.</td>
     * </tr>
     * <tr>
     * <td>DDF_HALFTONE</td>
     * <td>Always dithers the DIB to a standard palette regardless of the palette of the DIB. If your application uses <b>DrawDibBegin</b> with <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-drawdibdraw">DrawDibDraw</a>, set this value with <b>DrawDibBegin</b> rather than <b>DrawDibDraw</b>.</td>
     * </tr>
     * <tr>
     * <td>DDF_JUSTDRAWIT</td>
     * <td>Draws the image by using GDI. Prohibits DrawDib functions from decompressing, stretching, or dithering the image. This strips DrawDib of capabilities that differentiate it from the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-stretchdibits">StretchDIBits</a> function.</td>
     * </tr>
     * <tr>
     * <td>DDF_SAME_DRAW</td>
     * <td>Use the current drawing parameters for <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-drawdibdraw">DrawDibDraw</a>. Use this value only if <i>lpbi</i>, <i>dxDest</i>, <i>dyDest</i>, <i>dxSrc</i>, and <i>dySrc</i> have not changed since using <b>DrawDibDraw</b> or <b>DrawDibBegin</b>. This flag supersedes the <b>DDF_SAME_DIB</b> and <b>DDF_SAME_SIZE</b> flags.</td>
     * </tr>
     * <tr>
     * <td>DDF_SAME_HDC</td>
     * <td>Use the current DC handle and the palette currently associated with the DC.</td>
     * </tr>
     * <tr>
     * <td>DDF_UPDATE</td>
     * <td>Last buffered bitmap needs to be redrawn. If drawing fails with this value, a buffered image is not available and a new image needs to be specified before the display can be updated.</td>
     * </tr>
     * </table>
     * @returns {BOOL} Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-drawdibbegin
     * @since windows5.0
     */
    static DrawDibBegin(hdd, hdc, dxDst, dyDst, lpbi, dxSrc, dySrc, wFlags) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("MSVFW32.dll\DrawDibBegin", "ptr", hdd, "ptr", hdc, "int", dxDst, "int", dyDst, "ptr", lpbi, "int", dxSrc, "int", dySrc, "uint", wFlags, "int")
        return result
    }

    /**
     * The DrawDibDraw function draws a DIB to the screen.
     * @param {Pointer} hdd Handle to a DrawDib DC.
     * @param {HDC} hdc Handle to the DC.
     * @param {Integer} xDst The x-coordinate, in <b>MM_TEXT</b> client coordinates, of the upper left corner of the destination rectangle.
     * @param {Integer} yDst The y-coordinate, in <b>MM_TEXT</b> client coordinates, of the upper left corner of the destination rectangle.
     * @param {Integer} dxDst Width, in <b>MM_TEXT</b> client coordinates, of the destination rectangle. If <i>dxDst</i> is −1, the width of the bitmap is used.
     * @param {Integer} dyDst Height, in <b>MM_TEXT</b> client coordinates, of the destination rectangle. If <i>dyDst</i> is −1, the height of the bitmap is used.
     * @param {Pointer<BITMAPINFOHEADER>} lpbi Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure containing the image format. The color table for the DIB within <b>BITMAPINFOHEADER</b> follows the format and the <b>biHeight</b> member must be a positive value; <b>DrawDibDraw</b> will not draw inverted DIBs.
     * @param {Pointer<Void>} lpBits Pointer to the buffer that contains the bitmap bits.
     * @param {Integer} xSrc The x-coordinate, in pixels, of the upper left corner of the source rectangle. The coordinates (0,0) represent the upper left corner of the bitmap.
     * @param {Integer} ySrc The y-coordinate, in pixels, of the upper left corner of the source rectangle. The coordinates (0,0) represent the upper left corner of the bitmap.
     * @param {Integer} dxSrc Width, in pixels, of the source rectangle.
     * @param {Integer} dySrc Height, in pixels, of the source rectangle.
     * @param {Integer} wFlags Applicable flags for drawing. The following values are defined.
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
     * <td><b>DDF_BACKGROUNDPAL</b></td>
     * <td>Realizes the palette used for drawing in the background, leaving the actual palette used for display unchanged. This value is valid only if <b>DDF_SAME_HDC</b> is not set.</td>
     * </tr>
     * <tr>
     * <td><b>DDF_DONTDRAW</b></td>
     * <td>Current image is decompressed but not drawn. This flag supersedes the <b>DDF_PREROLL</b> flag.</td>
     * </tr>
     * <tr>
     * <td><b>DDF_FULLSCREEN</b></td>
     * <td>Not supported.</td>
     * </tr>
     * <tr>
     * <td><b>DDF_HALFTONE</b></td>
     * <td>Always dithers the DIB to a standard palette regardless of the palette of the DIB. If your application uses the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-drawdibbegin">DrawDibBegin</a> function, set this value in <b>DrawDibBegin</b> rather than in <b>DrawDibDraw</b>.</td>
     * </tr>
     * <tr>
     * <td><b>DDF_HURRYUP</b></td>
     * <td>Data does not have to be drawn (that is, it can be dropped) and <b>DDF_UPDATE</b> will not be used to recall this information. DrawDib checks this value only if it is required to build the next frame; otherwise, the value is ignored.This value is usually used to synchronize video and audio. When synchronizing data, applications should send the image with this value in case the driver needs to buffer the frame to decompress subsequent frames.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>DDF_NOTKEYFRAME</b></td>
     * <td>DIB data is not a key frame.</td>
     * </tr>
     * <tr>
     * <td><b>DDF_SAME_HDC</b></td>
     * <td>Use the current DC handle and the palette currently associated with the DC.</td>
     * </tr>
     * <tr>
     * <td><b>DDF_SAME_DRAW</b></td>
     * <td>Use the current drawing parameters for <b>DrawDibDraw</b>. Use this value only if <i>lpbi</i>, <i>dxDst</i>, <i>dyDst</i>, <i>dxSrc</i>, and <i>dySrc</i> have not changed since using <b>DrawDibDraw</b> or <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-drawdibbegin">DrawDibBegin</a>. <b>DrawDibDraw</b> typically checks the parameters, and if they have changed, <b>DrawDibBegin</b> prepares the DrawDib DC for drawing. This flag supersedes the <b>DDF_SAME_DIB</b> and <b>DDF_SAME_SIZE</b> flags.</td>
     * </tr>
     * <tr>
     * <td><b>DDF_UPDATE</b></td>
     * <td>Last buffered bitmap is to be redrawn. If drawing fails with this value, a buffered image is not available and a new image needs to be specified before the display can be updated.</td>
     * </tr>
     * </table>
     * @returns {BOOL} Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-drawdibdraw
     * @since windows5.0
     */
    static DrawDibDraw(hdd, hdc, xDst, yDst, dxDst, dyDst, lpbi, lpBits, xSrc, ySrc, dxSrc, dySrc, wFlags) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        lpBitsMarshal := lpBits is VarRef ? "ptr" : "ptr"

        result := DllCall("MSVFW32.dll\DrawDibDraw", "ptr", hdd, "ptr", hdc, "int", xDst, "int", yDst, "int", dxDst, "int", dyDst, "ptr", lpbi, lpBitsMarshal, lpBits, "int", xSrc, "int", ySrc, "int", dxSrc, "int", dySrc, "uint", wFlags, "int")
        return result
    }

    /**
     * The DrawDibEnd function clears the flags and other settings of a DrawDib DC that are set by the DrawDibBegin or DrawDibDraw functions.
     * @param {Pointer} hdd Handle to the DrawDib DC to free.
     * @returns {BOOL} Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-drawdibend
     * @since windows5.0
     */
    static DrawDibEnd(hdd) {
        result := DllCall("MSVFW32.dll\DrawDibEnd", "ptr", hdd, "int")
        return result
    }

    /**
     * The DrawDibTime function retrieves timing information about the drawing operation and is used during debug operations.
     * @param {Pointer} hdd Handle to a DrawDib DC.
     * @param {Pointer<DRAWDIBTIME>} lpddtime Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-drawdibtime">DRAWDIBTIME</a> structure.
     * @returns {BOOL} Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-drawdibtime
     * @since windows5.0
     */
    static DrawDibTime(hdd, lpddtime) {
        result := DllCall("MSVFW32.dll\DrawDibTime", "ptr", hdd, "ptr", lpddtime, "int")
        return result
    }

    /**
     * The DrawDibProfileDisplay function determines settings for the display system when using DrawDib functions.
     * @param {Pointer<BITMAPINFOHEADER>} lpbi Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure that contains bitmap information. You can also specify <b>NULL</b> to verify that the profile information is current. If the profile information is not current, DrawDib will rerun the profile tests to obtain a current set of information. When you call <b>DrawDibProfileDisplay</b> with this parameter set to <b>NULL</b>, the return value is meaningless.
     * @returns {LRESULT} Returns a value that indicates the fastest drawing and stretching capabilities of the display system. This value can be zero if the bitmap format is not supported or one or more of the following values.
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
     * <dt><b>PD_CAN_DRAW_DIB</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * DrawDib can draw images using this format. Stretching might or might not also be supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PD_CAN_STRETCHDIB</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * DrawDib can stretch and draw images using this format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PD_STRETCHDIB_1_1_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="/windows/desktop/api/wingdi/nf-wingdi-stretchdibits">StretchDIBits</a> draws unstretched images using this format faster than an alternative method.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PD_STRETCHDIB_1_2_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="/windows/desktop/api/wingdi/nf-wingdi-stretchdibits">StretchDIBits</a> draws stretched images (in a 1:2 ratio) using this format faster than an alternative method.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PD_STRETCHDIB_1_N_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="/windows/desktop/api/wingdi/nf-wingdi-stretchdibits">StretchDIBits</a> draws stretched images (in a 1:N ratio) using this format faster than an alternative method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-drawdibprofiledisplay
     * @since windows5.0
     */
    static DrawDibProfileDisplay(lpbi) {
        result := DllCall("MSVFW32.dll\DrawDibProfileDisplay", "ptr", lpbi, "ptr")
        return result
    }

    /**
     * The AVIFileInit function initializes the AVIFile library.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avifileinit
     * @since windows5.0
     */
    static AVIFileInit() {
        DllCall("AVIFIL32.dll\AVIFileInit")
    }

    /**
     * The AVIFileExit function exits the AVIFile library and decrements the reference count for the library.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avifileexit
     * @since windows5.0
     */
    static AVIFileExit() {
        DllCall("AVIFIL32.dll\AVIFileExit")
    }

    /**
     * The AVIFileAddRef function increments the reference count of an AVI file.
     * @param {IAVIFile} pfile Handle to an open AVI file.
     * @returns {Integer} Returns the updated reference count for the file interface.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avifileaddref
     * @since windows5.0
     */
    static AVIFileAddRef(pfile) {
        result := DllCall("AVIFIL32.dll\AVIFileAddRef", "ptr", pfile, "uint")
        return result
    }

    /**
     * The AVIFileRelease function decrements the reference count of an AVI file interface handle and closes the file if the count reaches zero.
     * @param {IAVIFile} pfile Handle to an open AVI file.
     * @returns {Integer} Returns the reference count of the file. This return value should be used only for debugging purposes.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avifilerelease
     * @since windows5.0
     */
    static AVIFileRelease(pfile) {
        result := DllCall("AVIFIL32.dll\AVIFileRelease", "ptr", pfile, "uint")
        return result
    }

    /**
     * The AVIFileOpen function opens an AVI file and returns the address of a file interface used to access it.
     * @param {Pointer<IAVIFile>} ppfile Pointer to a buffer that receives the new <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavifile">IAVIFile</a> interface pointer.
     * @param {PSTR} szFile Null-terminated string containing the name of the file to open.
     * @param {Integer} uMode Access mode to use when opening the file. The default access mode is OF_READ. The following access modes can be specified with <b>AVIFileOpen</b>.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>OF_CREATE</td>
     * <td>Creates a new file. If the file already exists, it is truncated to zero length.</td>
     * </tr>
     * <tr>
     * <td>OF_PARSE</td>
     * <td>Skips time-consuming operations, such as building an index. Set this flag if you want the function to return as quickly as possible—for example, if you are going to query the file properties but not read the file.</td>
     * </tr>
     * <tr>
     * <td>OF_READ</td>
     * <td>Opens the file for reading.</td>
     * </tr>
     * <tr>
     * <td>OF_READWRITE</td>
     * <td>Opens the file for reading and writing.</td>
     * </tr>
     * <tr>
     * <td>OF_SHARE_DENY_NONE</td>
     * <td>Opens the file nonexclusively. Other processes can open the file with read or write access. <b>AVIFileOpen</b> fails if another process has opened the file in compatibility mode.</td>
     * </tr>
     * <tr>
     * <td>OF_SHARE_DENY_READ</td>
     * <td>Opens the file nonexclusively. Other processes can open the file with write access. <b>AVIFileOpen</b> fails if another process has opened the file in compatibility mode or has read access to it.</td>
     * </tr>
     * <tr>
     * <td>OF_SHARE_DENY_WRITE</td>
     * <td>Opens the file nonexclusively. Other processes can open the file with read access. <b>AVIFileOpen</b> fails if another process has opened the file in compatibility mode or has write access to it.</td>
     * </tr>
     * <tr>
     * <td>OF_SHARE_EXCLUSIVE</td>
     * <td>Opens the file and denies other processes any access to it. <b>AVIFileOpen</b> fails if any other process has opened the file.</td>
     * </tr>
     * <tr>
     * <td>OF_WRITE</td>
     * <td>Opens the file for writing.</td>
     * </tr>
     * </table>
     * @param {Pointer<Guid>} lpHandler Pointer to a class identifier of the standard or custom handler you want to use. If the value is <b>NULL</b>, the system chooses a handler from the registry based on the file extension or the RIFF type specified in the file.
     * @returns {HRESULT} Returns zero if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AVIERR_BADFORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file couldn't be read, indicating a corrupt file or an unrecognized format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AVIERR_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file could not be opened because of insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AVIERR_FILEREAD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A disk error occurred while reading the file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AVIERR_FILEOPEN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A disk error occurred while opening the file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>REGDB_E_CLASSNOTREG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * According to the registry, the type of file specified in <b>AVIFileOpen</b> does not have a handler to process it.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avifileopena
     * @since windows5.0
     */
    static AVIFileOpenA(ppfile, szFile, uMode, lpHandler) {
        szFile := szFile is String ? StrPtr(szFile) : szFile

        result := DllCall("AVIFIL32.dll\AVIFileOpenA", "ptr*", ppfile, "ptr", szFile, "uint", uMode, "ptr", lpHandler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The AVIFileOpen function opens an AVI file and returns the address of a file interface used to access it.
     * @param {Pointer<IAVIFile>} ppfile Pointer to a buffer that receives the new <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-iavifile">IAVIFile</a> interface pointer.
     * @param {PWSTR} szFile Null-terminated string containing the name of the file to open.
     * @param {Integer} uMode Access mode to use when opening the file. The default access mode is OF_READ. The following access modes can be specified with <b>AVIFileOpen</b>.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>OF_CREATE</td>
     * <td>Creates a new file. If the file already exists, it is truncated to zero length.</td>
     * </tr>
     * <tr>
     * <td>OF_PARSE</td>
     * <td>Skips time-consuming operations, such as building an index. Set this flag if you want the function to return as quickly as possible—for example, if you are going to query the file properties but not read the file.</td>
     * </tr>
     * <tr>
     * <td>OF_READ</td>
     * <td>Opens the file for reading.</td>
     * </tr>
     * <tr>
     * <td>OF_READWRITE</td>
     * <td>Opens the file for reading and writing.</td>
     * </tr>
     * <tr>
     * <td>OF_SHARE_DENY_NONE</td>
     * <td>Opens the file nonexclusively. Other processes can open the file with read or write access. <b>AVIFileOpen</b> fails if another process has opened the file in compatibility mode.</td>
     * </tr>
     * <tr>
     * <td>OF_SHARE_DENY_READ</td>
     * <td>Opens the file nonexclusively. Other processes can open the file with write access. <b>AVIFileOpen</b> fails if another process has opened the file in compatibility mode or has read access to it.</td>
     * </tr>
     * <tr>
     * <td>OF_SHARE_DENY_WRITE</td>
     * <td>Opens the file nonexclusively. Other processes can open the file with read access. <b>AVIFileOpen</b> fails if another process has opened the file in compatibility mode or has write access to it.</td>
     * </tr>
     * <tr>
     * <td>OF_SHARE_EXCLUSIVE</td>
     * <td>Opens the file and denies other processes any access to it. <b>AVIFileOpen</b> fails if any other process has opened the file.</td>
     * </tr>
     * <tr>
     * <td>OF_WRITE</td>
     * <td>Opens the file for writing.</td>
     * </tr>
     * </table>
     * @param {Pointer<Guid>} lpHandler Pointer to a class identifier of the standard or custom handler you want to use. If the value is <b>NULL</b>, the system chooses a handler from the registry based on the file extension or the RIFF type specified in the file.
     * @returns {HRESULT} Returns zero if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AVIERR_BADFORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file couldn't be read, indicating a corrupt file or an unrecognized format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AVIERR_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file could not be opened because of insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AVIERR_FILEREAD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A disk error occurred while reading the file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AVIERR_FILEOPEN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A disk error occurred while opening the file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>REGDB_E_CLASSNOTREG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * According to the registry, the type of file specified in <b>AVIFileOpen</b> does not have a handler to process it.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avifileopenw
     * @since windows5.0
     */
    static AVIFileOpenW(ppfile, szFile, uMode, lpHandler) {
        szFile := szFile is String ? StrPtr(szFile) : szFile

        result := DllCall("AVIFIL32.dll\AVIFileOpenW", "ptr*", ppfile, "ptr", szFile, "uint", uMode, "ptr", lpHandler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The AVIFileInfo function obtains information about an AVI file.
     * @param {IAVIFile} pfile Handle to an open AVI file.
     * @param {Pointer} pfi Pointer to the structure used to return file information. Typically, this parameter points to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-avifileinfoa">AVIFILEINFO</a> structure.
     * @param {Integer} lSize Size, in bytes, of the structure.
     * @returns {HRESULT} Returns zero if successful or an error otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avifileinfow
     * @since windows5.0
     */
    static AVIFileInfoW(pfile, pfi, lSize) {
        result := DllCall("AVIFIL32.dll\AVIFileInfoW", "ptr", pfile, "ptr", pfi, "int", lSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The AVIFileInfo function obtains information about an AVI file.
     * @param {IAVIFile} pfile Handle to an open AVI file.
     * @param {Pointer} pfi Pointer to the structure used to return file information. Typically, this parameter points to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-avifileinfoa">AVIFILEINFO</a> structure.
     * @param {Integer} lSize Size, in bytes, of the structure.
     * @returns {HRESULT} Returns zero if successful or an error otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avifileinfoa
     * @since windows5.0
     */
    static AVIFileInfoA(pfile, pfi, lSize) {
        result := DllCall("AVIFIL32.dll\AVIFileInfoA", "ptr", pfile, "ptr", pfi, "int", lSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The AVIFileGetStream function returns the address of a stream interface that is associated with a specified AVI file.
     * @param {IAVIFile} pfile Handle to an open AVI file.
     * @param {Pointer<IAVIStream>} ppavi Pointer to the new stream interface.
     * @param {Integer} fccType Four-character code indicating the type of stream to open. Zero indicates any stream can be opened. The following definitions apply to the data commonly found in AVI streams.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>streamtypeAUDIO</td>
     * <td>Indicates an audio stream.</td>
     * </tr>
     * <tr>
     * <td>streamtypeMIDI</td>
     * <td>Indicates a MIDI stream.</td>
     * </tr>
     * <tr>
     * <td>streamtypeTEXT</td>
     * <td>Indicates a text stream.</td>
     * </tr>
     * <tr>
     * <td>streamtypeVIDEO</td>
     * <td>Indicates a video stream.</td>
     * </tr>
     * </table>
     * @param {Integer} lParam Count of the stream type. Identifies which occurrence of the specified stream type to access.
     * @returns {HRESULT} Returns zero if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AVIERR_NODATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file does not contain a stream corresponding to the values of <i>fccType</i> and <i>lParam</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AVIERR_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avifilegetstream
     * @since windows5.0
     */
    static AVIFileGetStream(pfile, ppavi, fccType, lParam) {
        result := DllCall("AVIFIL32.dll\AVIFileGetStream", "ptr", pfile, "ptr*", ppavi, "uint", fccType, "int", lParam, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The AVIFileCreateStream function creates a new stream in an existing file and creates an interface to the new stream.
     * @param {IAVIFile} pfile Handle to an open AVI file.
     * @param {Pointer<IAVIStream>} ppavi Pointer to the new stream interface.
     * @param {Pointer<AVISTREAMINFOW>} psi Pointer to a structure containing information about the new stream, including the stream type and its sample rate.
     * @returns {HRESULT} Returns zero if successful or an error otherwise. Unless the file has been opened with write permission, this function returns AVIERR_READONLY.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avifilecreatestreamw
     * @since windows5.0
     */
    static AVIFileCreateStreamW(pfile, ppavi, psi) {
        result := DllCall("AVIFIL32.dll\AVIFileCreateStreamW", "ptr", pfile, "ptr*", ppavi, "ptr", psi, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The AVIFileCreateStream function creates a new stream in an existing file and creates an interface to the new stream.
     * @param {IAVIFile} pfile Handle to an open AVI file.
     * @param {Pointer<IAVIStream>} ppavi Pointer to the new stream interface.
     * @param {Pointer<AVISTREAMINFOA>} psi Pointer to a structure containing information about the new stream, including the stream type and its sample rate.
     * @returns {HRESULT} Returns zero if successful or an error otherwise. Unless the file has been opened with write permission, this function returns AVIERR_READONLY.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avifilecreatestreama
     * @since windows5.0
     */
    static AVIFileCreateStreamA(pfile, ppavi, psi) {
        result := DllCall("AVIFIL32.dll\AVIFileCreateStreamA", "ptr", pfile, "ptr*", ppavi, "ptr", psi, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The AVIFileWriteData function writes supplementary data (other than normal header, format, and stream data) to the file.
     * @param {IAVIFile} pfile Handle to an open AVI file.
     * @param {Integer} ckid RIFF chunk identifier (four-character code) of the data.
     * @param {Pointer} lpData Pointer to the buffer used to write the data.
     * @param {Integer} cbData Size, in bytes, of the memory block referenced by <i>lpData</i>.
     * @returns {HRESULT} Returns zero if successful or an error otherwise. In an application has read-only access to the file, the error code AVIERR_READONLY is returned.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avifilewritedata
     * @since windows5.0
     */
    static AVIFileWriteData(pfile, ckid, lpData, cbData) {
        result := DllCall("AVIFIL32.dll\AVIFileWriteData", "ptr", pfile, "uint", ckid, "ptr", lpData, "int", cbData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The AVIFileReadData function reads optional header data that applies to the entire file, such as author or copyright information.
     * @param {IAVIFile} pfile Handle to an open AVI file.
     * @param {Integer} ckid RIFF chunk identifier (four-character code) of the data.
     * @param {Pointer} lpData Pointer to the buffer used to return the data read.
     * @param {Pointer<Integer>} lpcbData Pointer to a location indicating the size of the memory block referenced by <i>lpData</i>. If the data is read successfully, the value is changed to indicate the amount of data read.
     * @returns {HRESULT} Returns zero if successful or an error otherwise. The return value AVIERR_NODATA indicates that data with the requested chunk identifier does not exist.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avifilereaddata
     * @since windows5.0
     */
    static AVIFileReadData(pfile, ckid, lpData, lpcbData) {
        lpcbDataMarshal := lpcbData is VarRef ? "int*" : "ptr"

        result := DllCall("AVIFIL32.dll\AVIFileReadData", "ptr", pfile, "uint", ckid, "ptr", lpData, lpcbDataMarshal, lpcbData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The AVIFileEndRecord function marks the end of a record when writing an interleaved file that uses a 1:1 interleave factor of video to audio data. (Each frame of video is interspersed with an equivalent amount of audio data.).
     * @param {IAVIFile} pfile Handle to an open AVI file.
     * @returns {HRESULT} Returns zero if successful or an error otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avifileendrecord
     * @since windows5.0
     */
    static AVIFileEndRecord(pfile) {
        result := DllCall("AVIFIL32.dll\AVIFileEndRecord", "ptr", pfile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The AVIStreamAddRef function increments the reference count of an AVI stream.
     * @param {IAVIStream} pavi Handle to an open AVI stream.
     * @returns {Integer} Returns the current reference count of the stream. This value should be used only for debugging purposes.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avistreamaddref
     * @since windows5.0
     */
    static AVIStreamAddRef(pavi) {
        result := DllCall("AVIFIL32.dll\AVIStreamAddRef", "ptr", pavi, "uint")
        return result
    }

    /**
     * The AVIStreamRelease function decrements the reference count of an AVI stream interface handle, and closes the stream if the count reaches zero.
     * @param {IAVIStream} pavi Handle to an open stream.
     * @returns {Integer} Returns the current reference count of the stream. This value should be used only for debugging purposes.
     * 
     * The argument <i>pavi</i> is a pointer to an <a href="/windows/desktop/api/vfw/nn-vfw-iavistream">IAVIStream</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avistreamrelease
     * @since windows5.0
     */
    static AVIStreamRelease(pavi) {
        result := DllCall("AVIFIL32.dll\AVIStreamRelease", "ptr", pavi, "uint")
        return result
    }

    /**
     * The AVIStreamInfo function obtains stream header information.
     * @param {IAVIStream} pavi Handle to an open stream.
     * @param {Pointer} psi Pointer to a structure to contain the stream information.
     * @param {Integer} lSize Size, in bytes, of the structure used forpsi.
     * @returns {HRESULT} Returns zero if successful or an error otherwise.
     * 
     * The argument <i>pavi</i> is a pointer to an <a href="/windows/desktop/api/vfw/nn-vfw-iavistream">IAVIStream</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avistreaminfow
     * @since windows5.0
     */
    static AVIStreamInfoW(pavi, psi, lSize) {
        result := DllCall("AVIFIL32.dll\AVIStreamInfoW", "ptr", pavi, "ptr", psi, "int", lSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The AVIStreamInfo function obtains stream header information.
     * @param {IAVIStream} pavi Handle to an open stream.
     * @param {Pointer} psi Pointer to a structure to contain the stream information.
     * @param {Integer} lSize Size, in bytes, of the structure used forpsi.
     * @returns {HRESULT} Returns zero if successful or an error otherwise.
     * 
     * The argument <i>pavi</i> is a pointer to an <a href="/windows/desktop/api/vfw/nn-vfw-iavistream">IAVIStream</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avistreaminfoa
     * @since windows5.0
     */
    static AVIStreamInfoA(pavi, psi, lSize) {
        result := DllCall("AVIFIL32.dll\AVIStreamInfoA", "ptr", pavi, "ptr", psi, "int", lSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The AVIStreamFindSample function returns the position of a sample (key frame, nonempty frame, or a frame containing a format change) relative to the specified position.
     * @param {IAVIStream} pavi Handle to an open stream.
     * @param {Integer} lPos Starting frame for the search.
     * @param {Integer} lFlags Flags that designate the type of frame to locate, the direction in the stream to search, and the type of return information. The following flags are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>FIND_ANY</td>
     * <td>Finds a nonempty frame. This flag supersedes the SEARCH_ANY flag.</td>
     * </tr>
     * <tr>
     * <td>FIND_KEY</td>
     * <td>Finds a key frame. This flag supersedes the SEARCH_KEY flag.</td>
     * </tr>
     * <tr>
     * <td>FIND_FORMAT</td>
     * <td>Finds a format change.</td>
     * </tr>
     * <tr>
     * <td>FIND_NEXT</td>
     * <td>Finds nearest sample, frame, or format change searching forward. The current sample is included in the search. Use this flag with the FIND_ANY, FIND_KEY, or FIND_FORMAT flag. This flag supersedes the SEARCH_FORWARD flag.</td>
     * </tr>
     * <tr>
     * <td>FIND_PREV</td>
     * <td>Finds nearest sample, frame, or format change searching backward. The current sample is included in the search. Use this flag with the FIND_ANY, FIND_KEY, or FIND_FORMAT flag. This flag supersedes the SEARCH_NEAREST and SEARCH_BACKWARD flags.</td>
     * </tr>
     * <tr>
     * <td>FIND_FROM_START</td>
     * <td>Finds first sample, frame, or format change beginning from the start of the stream. Use this flag with the FIND_ANY, FIND_KEY, or FIND_FORMAT flag.</td>
     * </tr>
     * </table>
     * @returns {Integer} Returns the position of the frame found or -1 if the search is unsuccessful.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avistreamfindsample
     * @since windows5.0
     */
    static AVIStreamFindSample(pavi, lPos, lFlags) {
        result := DllCall("AVIFIL32.dll\AVIStreamFindSample", "ptr", pavi, "int", lPos, "int", lFlags, "int")
        return result
    }

    /**
     * The AVIStreamReadFormat function reads the stream format data.
     * @param {IAVIStream} pavi Handle to an open stream.
     * @param {Integer} lPos Position in the stream used to obtain the format data.
     * @param {Pointer} lpFormat Pointer to a buffer to contain the format data.
     * @param {Pointer<Integer>} lpcbFormat Pointer to a location indicating the size of the memory block referenced by <i>lpFormat</i>. On return, the value is changed to indicate the amount of data read. If <i>lpFormat</i> is <b>NULL</b>, this parameter can be used to obtain the amount of memory needed to return the format.
     * @returns {HRESULT} Returns zero if successful or an error otherwise.
     * 
     * The argument <i>pavi</i> is a pointer to an <a href="/windows/desktop/api/vfw/nn-vfw-iavistream">IAVIStream</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avistreamreadformat
     * @since windows5.0
     */
    static AVIStreamReadFormat(pavi, lPos, lpFormat, lpcbFormat) {
        lpcbFormatMarshal := lpcbFormat is VarRef ? "int*" : "ptr"

        result := DllCall("AVIFIL32.dll\AVIStreamReadFormat", "ptr", pavi, "int", lPos, "ptr", lpFormat, lpcbFormatMarshal, lpcbFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The AVIStreamSetFormat function sets the format of a stream at the specified position.
     * @param {IAVIStream} pavi Handle to an open stream.
     * @param {Integer} lPos Position in the stream to receive the format.
     * @param {Pointer} lpFormat Pointer to a structure containing the new format.
     * @param {Integer} cbFormat Size, in bytes, of the block of memory referenced by <i>lpFormat</i>.
     * @returns {HRESULT} Returns zero if successful or an error otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avistreamsetformat
     * @since windows5.0
     */
    static AVIStreamSetFormat(pavi, lPos, lpFormat, cbFormat) {
        result := DllCall("AVIFIL32.dll\AVIStreamSetFormat", "ptr", pavi, "int", lPos, "ptr", lpFormat, "int", cbFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The AVIStreamReadData function reads optional header data from a stream.
     * @param {IAVIStream} pavi Handle to an open stream.
     * @param {Integer} fcc Four-character code identifying the data.
     * @param {Pointer} lp Pointer to the buffer to contain the optional header data.
     * @param {Pointer<Integer>} lpcb Pointer to the location that specifies the buffer size used for <i>lpData</i>. If the read is successful, AVIFile changes this value to indicate the amount of data written into the buffer for <i>lpData</i>.
     * @returns {HRESULT} Returns zero if successful or an error otherwise. The return value AVIERR_NODATA indicates the system could not find any data with the specified chunk identifier.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avistreamreaddata
     * @since windows5.0
     */
    static AVIStreamReadData(pavi, fcc, lp, lpcb) {
        lpcbMarshal := lpcb is VarRef ? "int*" : "ptr"

        result := DllCall("AVIFIL32.dll\AVIStreamReadData", "ptr", pavi, "uint", fcc, "ptr", lp, lpcbMarshal, lpcb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The AVIStreamWriteData function writes optional header information to the stream.
     * @param {IAVIStream} pavi Handle to an open stream.
     * @param {Integer} fcc Four-character code identifying the data.
     * @param {Pointer} lp Pointer to a buffer containing the data to write.
     * @param {Integer} cb Number of bytes of data to write into the stream.
     * @returns {HRESULT} Returns zero if successful or an error otherwise. The return value AVIERR_READONLY indicates the file was opened without write access.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avistreamwritedata
     * @since windows5.0
     */
    static AVIStreamWriteData(pavi, fcc, lp, cb) {
        result := DllCall("AVIFIL32.dll\AVIStreamWriteData", "ptr", pavi, "uint", fcc, "ptr", lp, "int", cb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The AVIStreamRead function reads audio, video or other data from a stream according to the stream type.
     * @param {IAVIStream} pavi Handle to an open stream.
     * @param {Integer} lStart First sample to read.
     * @param {Integer} lSamples Number of samples to read. You can also specify the value AVISTREAMREAD_CONVENIENT to let the stream handler determine the number of samples to read.
     * @param {Pointer} lpBuffer Pointer to a buffer to contain the data.
     * @param {Integer} cbBuffer Size, in bytes, of the buffer pointed to by <i>lpBuffer</i>.
     * @param {Pointer<Integer>} plBytes Pointer to a buffer that receives the number of bytes of data written in the buffer referenced by <i>lpBuffer</i>. This value can be <b>NULL</b>.
     * @param {Pointer<Integer>} plSamples Pointer to a buffer that receives the number of samples written in the buffer referenced by <i>lpBuffer</i>. This value can be <b>NULL</b>.
     * @returns {HRESULT} Returns zero if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AVIERR_BUFFERTOOSMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer size <i>cbBuffer</i> was smaller than a single sample of data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AVIERR_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was not enough memory to complete the read operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AVIERR_FILEREAD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A disk error occurred while reading the file.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avistreamread
     * @since windows5.0
     */
    static AVIStreamRead(pavi, lStart, lSamples, lpBuffer, cbBuffer, plBytes, plSamples) {
        plBytesMarshal := plBytes is VarRef ? "int*" : "ptr"
        plSamplesMarshal := plSamples is VarRef ? "int*" : "ptr"

        result := DllCall("AVIFIL32.dll\AVIStreamRead", "ptr", pavi, "int", lStart, "int", lSamples, "ptr", lpBuffer, "int", cbBuffer, plBytesMarshal, plBytes, plSamplesMarshal, plSamples, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The AVIStreamWrite function writes data to a stream.
     * @param {IAVIStream} pavi Handle to an open stream.
     * @param {Integer} lStart First sample to write.
     * @param {Integer} lSamples Number of samples to write.
     * @param {Pointer} lpBuffer Pointer to a buffer containing the data to write.
     * @param {Integer} cbBuffer Size of the buffer referenced by <i>lpBuffer</i>.
     * @param {Integer} dwFlags Flag associated with this data. The following flag is defined:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AVIIF_KEYFRAME"></a><a id="aviif_keyframe"></a><dl>
     * <dt><b>AVIIF_KEYFRAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates this data does not rely on preceding data in the file.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} plSampWritten Pointer to a buffer that receives the number of samples written. This can be set to <b>NULL</b>.
     * @param {Pointer<Integer>} plBytesWritten Pointer to a buffer that receives the number of bytes written. This can be set to <b>NULL</b>.
     * @returns {HRESULT} Returns zero if successful or an error otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avistreamwrite
     * @since windows5.0
     */
    static AVIStreamWrite(pavi, lStart, lSamples, lpBuffer, cbBuffer, dwFlags, plSampWritten, plBytesWritten) {
        plSampWrittenMarshal := plSampWritten is VarRef ? "int*" : "ptr"
        plBytesWrittenMarshal := plBytesWritten is VarRef ? "int*" : "ptr"

        result := DllCall("AVIFIL32.dll\AVIStreamWrite", "ptr", pavi, "int", lStart, "int", lSamples, "ptr", lpBuffer, "int", cbBuffer, "uint", dwFlags, plSampWrittenMarshal, plSampWritten, plBytesWrittenMarshal, plBytesWritten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The AVIStreamStart function returns the starting sample number for the stream.
     * @param {IAVIStream} pavi Handle to an open stream.
     * @returns {Integer} Returns the number if successful or -1 otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avistreamstart
     * @since windows5.0
     */
    static AVIStreamStart(pavi) {
        result := DllCall("AVIFIL32.dll\AVIStreamStart", "ptr", pavi, "int")
        return result
    }

    /**
     * The AVIStreamLength function returns the length of the stream.
     * @param {IAVIStream} pavi Handle to an open stream.
     * @returns {Integer} Returns the stream's length, in samples, if successful or -1 otherwise.
     * 
     * The argument <i>pavi</i> is a pointer to an <a href="/windows/desktop/api/vfw/nn-vfw-iavistream">IAVIStream</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avistreamlength
     * @since windows5.0
     */
    static AVIStreamLength(pavi) {
        result := DllCall("AVIFIL32.dll\AVIStreamLength", "ptr", pavi, "int")
        return result
    }

    /**
     * The AVIStreamTimeToSample function converts from milliseconds to samples.
     * @param {IAVIStream} pavi Handle to an open stream.
     * @param {Integer} lTime Time, expressed in milliseconds.
     * @returns {Integer} Returns the converted time if successful or -1 otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avistreamtimetosample
     * @since windows5.0
     */
    static AVIStreamTimeToSample(pavi, lTime) {
        result := DllCall("AVIFIL32.dll\AVIStreamTimeToSample", "ptr", pavi, "int", lTime, "int")
        return result
    }

    /**
     * The AVIStreamSampleToTime function converts a stream position from samples to milliseconds.
     * @param {IAVIStream} pavi Handle to an open stream.
     * @param {Integer} lSample Position information. A sample can correspond to blocks of audio, a video frame, or other format, depending on the stream type.
     * @returns {Integer} Returns the converted time if successful or −1 otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avistreamsampletotime
     * @since windows5.0
     */
    static AVIStreamSampleToTime(pavi, lSample) {
        result := DllCall("AVIFIL32.dll\AVIStreamSampleToTime", "ptr", pavi, "int", lSample, "int")
        return result
    }

    /**
     * The AVIStreamBeginStreaming function specifies the parameters used in streaming and lets a stream handler prepare for streaming.
     * @param {IAVIStream} pavi Pointer to a stream.
     * @param {Integer} lStart Starting frame for streaming.
     * @param {Integer} lEnd Ending frame for streaming.
     * @param {Integer} lRate Speed at which the file is read relative to its natural speed. Specify 1000 for the normal speed. Values less than 1000 indicate a slower-than-normal speed; values greater than 1000 indicate a faster-than-normal speed.
     * @returns {HRESULT} Returns zero if successful or an error otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avistreambeginstreaming
     * @since windows5.0
     */
    static AVIStreamBeginStreaming(pavi, lStart, lEnd, lRate) {
        result := DllCall("AVIFIL32.dll\AVIStreamBeginStreaming", "ptr", pavi, "int", lStart, "int", lEnd, "int", lRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The AVIStreamEndStreaming function ends streaming.
     * @param {IAVIStream} pavi Pointer to a stream.
     * @returns {HRESULT} Returns zero if successful or an error otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avistreamendstreaming
     * @since windows5.0
     */
    static AVIStreamEndStreaming(pavi) {
        result := DllCall("AVIFIL32.dll\AVIStreamEndStreaming", "ptr", pavi, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The AVIStreamGetFrameOpen function prepares to decompress video frames from the specified video stream.
     * @param {IAVIStream} pavi Pointer to the video stream used as the video source.
     * @param {Pointer<BITMAPINFOHEADER>} lpbiWanted Pointer to a structure that defines the desired video format. Specify <b>NULL</b> to use a default format. You can also specify AVIGETFRAMEF_BESTDISPLAYFMT to decode the frames to the best format for your display.
     * @returns {IGetFrame} Returns a <b>GetFrame</b> object that can be used with the <a href="/windows/desktop/api/vfw/nf-vfw-avistreamgetframe">AVIStreamGetFrame</a> function. If the system cannot find a decompressor that can decompress the stream to the given format, or to any RGB format, the function returns <b>NULL</b>.
     * 
     * The argument <i>pavi</i> is a pointer to an <a href="/windows/desktop/api/vfw/nn-vfw-iavistream">IAVIStream</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avistreamgetframeopen
     * @since windows5.0
     */
    static AVIStreamGetFrameOpen(pavi, lpbiWanted) {
        result := DllCall("AVIFIL32.dll\AVIStreamGetFrameOpen", "ptr", pavi, "ptr", lpbiWanted, "ptr")
        return result
    }

    /**
     * The AVIStreamGetFrame function returns the address of a decompressed video frame.
     * @param {IGetFrame} pg Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nn-vfw-igetframe">IGetFrame</a> interface.
     * @param {Integer} lPos Position, in samples, within the stream of the desired frame.
     * @returns {Pointer<Void>} Returns a pointer to the frame data if successful or <b>NULL</b> otherwise. The frame data is returned as a packed DIB.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avistreamgetframe
     * @since windows5.0
     */
    static AVIStreamGetFrame(pg, lPos) {
        result := DllCall("AVIFIL32.dll\AVIStreamGetFrame", "ptr", pg, "int", lPos, "ptr")
        return result
    }

    /**
     * The AVIStreamGetFrameClose function releases resources used to decompress video frames.
     * @param {IGetFrame} pg Handle returned from the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-avistreamgetframeopen">AVIStreamGetFrameOpen</a> function. After calling this function, the handle is invalid.
     * @returns {HRESULT} Returns zero if successful or an error otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avistreamgetframeclose
     * @since windows5.0
     */
    static AVIStreamGetFrameClose(pg) {
        result := DllCall("AVIFIL32.dll\AVIStreamGetFrameClose", "ptr", pg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The AVIStreamOpenFromFile function opens a single stream from a file.
     * @param {Pointer<IAVIStream>} ppavi Pointer to a buffer that receives the new stream handle.
     * @param {PSTR} szFile Null-terminated string containing the name of the file to open.
     * @param {Integer} fccType Four-character code indicating the type of stream to be opened. Zero indicates that any stream can be opened. The following definitions apply to the data commonly found in AVI streams:
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>streamtypeAUDIO</td>
     * <td>Indicates an audio stream.</td>
     * </tr>
     * <tr>
     * <td>streamtypeMIDI</td>
     * <td>Indicates a MIDI stream.</td>
     * </tr>
     * <tr>
     * <td>streamtypeTEXT</td>
     * <td>Indicates a text stream.</td>
     * </tr>
     * <tr>
     * <td>streamtypeVIDEO</td>
     * <td>Indicates a video stream.</td>
     * </tr>
     * </table>
     * @param {Integer} lParam Stream of the type specified in <i>fccType</i> to access. This parameter is zero-based; use zero to specify the first occurrence.
     * @param {Integer} mode Access mode to use when opening the file. This function can open only existing streams, so the OF_CREATE mode flag cannot be used. For more information about the available flags for the <i>mode</i> parameter, see the <b>OpenFile</b> function.
     * @param {Pointer<Guid>} pclsidHandler Pointer to a class identifier of the handler you want to use. If the value is <b>NULL</b>, the system chooses one from the registry based on the file extension or the file RIFF type.
     * @returns {HRESULT} Returns zero if successful or an error otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avistreamopenfromfilea
     * @since windows5.0
     */
    static AVIStreamOpenFromFileA(ppavi, szFile, fccType, lParam, mode, pclsidHandler) {
        szFile := szFile is String ? StrPtr(szFile) : szFile

        result := DllCall("AVIFIL32.dll\AVIStreamOpenFromFileA", "ptr*", ppavi, "ptr", szFile, "uint", fccType, "int", lParam, "uint", mode, "ptr", pclsidHandler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The AVIStreamOpenFromFile function opens a single stream from a file.
     * @param {Pointer<IAVIStream>} ppavi Pointer to a buffer that receives the new stream handle.
     * @param {PWSTR} szFile Null-terminated string containing the name of the file to open.
     * @param {Integer} fccType Four-character code indicating the type of stream to be opened. Zero indicates that any stream can be opened. The following definitions apply to the data commonly found in AVI streams:
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>streamtypeAUDIO</td>
     * <td>Indicates an audio stream.</td>
     * </tr>
     * <tr>
     * <td>streamtypeMIDI</td>
     * <td>Indicates a MIDI stream.</td>
     * </tr>
     * <tr>
     * <td>streamtypeTEXT</td>
     * <td>Indicates a text stream.</td>
     * </tr>
     * <tr>
     * <td>streamtypeVIDEO</td>
     * <td>Indicates a video stream.</td>
     * </tr>
     * </table>
     * @param {Integer} lParam Stream of the type specified in <i>fccType</i> to access. This parameter is zero-based; use zero to specify the first occurrence.
     * @param {Integer} mode Access mode to use when opening the file. This function can open only existing streams, so the OF_CREATE mode flag cannot be used. For more information about the available flags for the <i>mode</i> parameter, see the <b>OpenFile</b> function.
     * @param {Pointer<Guid>} pclsidHandler Pointer to a class identifier of the handler you want to use. If the value is <b>NULL</b>, the system chooses one from the registry based on the file extension or the file RIFF type.
     * @returns {HRESULT} Returns zero if successful or an error otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avistreamopenfromfilew
     * @since windows5.0
     */
    static AVIStreamOpenFromFileW(ppavi, szFile, fccType, lParam, mode, pclsidHandler) {
        szFile := szFile is String ? StrPtr(szFile) : szFile

        result := DllCall("AVIFIL32.dll\AVIStreamOpenFromFileW", "ptr*", ppavi, "ptr", szFile, "uint", fccType, "int", lParam, "uint", mode, "ptr", pclsidHandler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The AVIStreamCreate function creates a stream not associated with any file.
     * @param {Pointer<IAVIStream>} ppavi Pointer to a buffer that receives the new stream interface.
     * @param {Integer} lParam1 Stream-handler specific information.
     * @param {Integer} lParam2 Stream-handler specific information.
     * @param {Pointer<Guid>} pclsidHandler Pointer to the class identifier used for the stream.
     * @returns {HRESULT} Returns zero if successful or an error otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avistreamcreate
     * @since windows5.0
     */
    static AVIStreamCreate(ppavi, lParam1, lParam2, pclsidHandler) {
        result := DllCall("AVIFIL32.dll\AVIStreamCreate", "ptr*", ppavi, "int", lParam1, "int", lParam2, "ptr", pclsidHandler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The AVIMakeCompressedStream function creates a compressed stream from an uncompressed stream and a compression filter, and returns the address of a pointer to the compressed stream. This function supports audio and video compression.
     * @param {Pointer<IAVIStream>} ppsCompressed Pointer to a buffer that receives the compressed stream pointer.
     * @param {IAVIStream} ppsSource Pointer to the stream to be compressed.
     * @param {Pointer<AVICOMPRESSOPTIONS>} lpOptions Pointer to a structure that identifies the type of compression to use and the options to apply. You can specify video compression by identifying an appropriate handler in the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-avicompressoptions">AVICOMPRESSOPTIONS</a> structure. For audio compression, specify the compressed data format.
     * @param {Pointer<Guid>} pclsidHandler Pointer to a class identifier used to create the stream.
     * @returns {HRESULT} Returns AVIERR_OK if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AVIERR_NOCOMPRESSOR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A suitable compressor cannot be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AVIERR_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AVIERR_UNSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Compression is not supported for this type of data. This error might be returned if you try to compress data that is not audio or video.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avimakecompressedstream
     * @since windows5.0
     */
    static AVIMakeCompressedStream(ppsCompressed, ppsSource, lpOptions, pclsidHandler) {
        result := DllCall("AVIFIL32.dll\AVIMakeCompressedStream", "ptr*", ppsCompressed, "ptr", ppsSource, "ptr", lpOptions, "ptr", pclsidHandler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The AVISave function builds a file by combining data streams from other files or from memory.
     * @param {PSTR} szFile Null-terminated string containing the name of the file to save.
     * @param {Pointer<Guid>} pclsidHandler Pointer to the file handler used to write the file. The file is created by calling the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-avifileopen">AVIFileOpen</a> function using this handler. If a handler is not specified, a default is selected from the registry based on the file extension.
     * @param {Pointer<AVISAVECALLBACK>} lpfnCallback Pointer to a callback function for the save operation.
     * @param {Integer} nStreams Number of streams saved in the file.
     * @param {IAVIStream} pfile Pointer to an AVI stream. This parameter is paired with <i>lpOptions</i>. The parameter pair can be repeated as a variable number of arguments.
     * @param {Pointer<AVICOMPRESSOPTIONS>} lpOptions Pointer to an application-defined <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-avicompressoptions">AVICOMPRESSOPTIONS</a> structure containing the compression options for the stream referenced by <i>pavi</i>. This parameter is paired with pavi. The parameter pair can be repeated as a variable number of arguments.
     * @returns {HRESULT} Returns AVIERR_OK if successful or an error otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avisavea
     * @since windows5.0
     */
    static AVISaveA(szFile, pclsidHandler, lpfnCallback, nStreams, pfile, lpOptions) {
        szFile := szFile is String ? StrPtr(szFile) : szFile

        result := DllCall("AVIFIL32.dll\AVISaveA", "ptr", szFile, "ptr", pclsidHandler, "ptr", lpfnCallback, "int", nStreams, "ptr", pfile, "ptr", lpOptions, "CDecl int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The AVISaveV function builds a file by combining data streams from other files or from memory.
     * @param {PSTR} szFile Null-terminated string containing the name of the file to save.
     * @param {Pointer<Guid>} pclsidHandler Pointer to the file handler used to write the file. The file is created by calling the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-avifileopen">AVIFileOpen</a> function using this handler. If a handler is not specified, a default is selected from the registry based on the file extension.
     * @param {Pointer<AVISAVECALLBACK>} lpfnCallback Pointer to a callback function used to display status information and to let the user cancel the save operation.
     * @param {Integer} nStreams Number of streams to save.
     * @param {Pointer<IAVIStream>} ppavi Pointer to an array of pointers to the <b>AVISTREAM</b> function structures. The array uses one pointer for each stream.
     * @param {Pointer<Pointer<AVICOMPRESSOPTIONS>>} plpOptions Pointer to an array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-avicompressoptions">AVICOMPRESSOPTIONS</a> structures. The array uses one pointer for each stream.
     * @returns {HRESULT} Returns AVIERR_OK if successful or an error otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avisaveva
     * @since windows5.0
     */
    static AVISaveVA(szFile, pclsidHandler, lpfnCallback, nStreams, ppavi, plpOptions) {
        szFile := szFile is String ? StrPtr(szFile) : szFile

        result := DllCall("AVIFIL32.dll\AVISaveVA", "ptr", szFile, "ptr", pclsidHandler, "ptr", lpfnCallback, "int", nStreams, "ptr*", ppavi, "ptr*", plpOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The AVISave function builds a file by combining data streams from other files or from memory.
     * @param {PWSTR} szFile Null-terminated string containing the name of the file to save.
     * @param {Pointer<Guid>} pclsidHandler Pointer to the file handler used to write the file. The file is created by calling the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-avifileopen">AVIFileOpen</a> function using this handler. If a handler is not specified, a default is selected from the registry based on the file extension.
     * @param {Pointer<AVISAVECALLBACK>} lpfnCallback Pointer to a callback function for the save operation.
     * @param {Integer} nStreams Number of streams saved in the file.
     * @param {IAVIStream} pfile Pointer to an AVI stream. This parameter is paired with <i>lpOptions</i>. The parameter pair can be repeated as a variable number of arguments.
     * @param {Pointer<AVICOMPRESSOPTIONS>} lpOptions Pointer to an application-defined <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-avicompressoptions">AVICOMPRESSOPTIONS</a> structure containing the compression options for the stream referenced by <i>pavi</i>. This parameter is paired with pavi. The parameter pair can be repeated as a variable number of arguments.
     * @returns {HRESULT} Returns AVIERR_OK if successful or an error otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avisavew
     * @since windows5.0
     */
    static AVISaveW(szFile, pclsidHandler, lpfnCallback, nStreams, pfile, lpOptions) {
        szFile := szFile is String ? StrPtr(szFile) : szFile

        result := DllCall("AVIFIL32.dll\AVISaveW", "ptr", szFile, "ptr", pclsidHandler, "ptr", lpfnCallback, "int", nStreams, "ptr", pfile, "ptr", lpOptions, "CDecl int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The AVISaveV function builds a file by combining data streams from other files or from memory.
     * @param {PWSTR} szFile Null-terminated string containing the name of the file to save.
     * @param {Pointer<Guid>} pclsidHandler Pointer to the file handler used to write the file. The file is created by calling the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-avifileopen">AVIFileOpen</a> function using this handler. If a handler is not specified, a default is selected from the registry based on the file extension.
     * @param {Pointer<AVISAVECALLBACK>} lpfnCallback Pointer to a callback function used to display status information and to let the user cancel the save operation.
     * @param {Integer} nStreams Number of streams to save.
     * @param {Pointer<IAVIStream>} ppavi Pointer to an array of pointers to the <b>AVISTREAM</b> function structures. The array uses one pointer for each stream.
     * @param {Pointer<Pointer<AVICOMPRESSOPTIONS>>} plpOptions Pointer to an array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-avicompressoptions">AVICOMPRESSOPTIONS</a> structures. The array uses one pointer for each stream.
     * @returns {HRESULT} Returns AVIERR_OK if successful or an error otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avisavevw
     * @since windows5.0
     */
    static AVISaveVW(szFile, pclsidHandler, lpfnCallback, nStreams, ppavi, plpOptions) {
        szFile := szFile is String ? StrPtr(szFile) : szFile

        result := DllCall("AVIFIL32.dll\AVISaveVW", "ptr", szFile, "ptr", pclsidHandler, "ptr", lpfnCallback, "int", nStreams, "ptr*", ppavi, "ptr*", plpOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The AVISaveOptions function retrieves the save options for a file and returns them in a buffer.
     * @param {HWND} hwnd Handle to the parent window for the Compression Options dialog box.
     * @param {Integer} uiFlags Flags for displaying the Compression Options dialog box. The following flags are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>ICMF_CHOOSE_KEYFRAME</td>
     * <td>Displays a Key Frame Every dialog box for the video options. This is the same flag used in the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-iccompressorchoose">ICCompressorChoose</a> function.</td>
     * </tr>
     * <tr>
     * <td>ICMF_CHOOSE_DATARATE</td>
     * <td>Displays a Data Rate dialog box for the video options. This is the same flag used in <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-iccompressorchoose">ICCompressorChoose</a>.</td>
     * </tr>
     * <tr>
     * <td>ICMF_CHOOSE_PREVIEW</td>
     * <td>Displays a Preview button for the video options. This button previews the compression by using a frame from the stream. This is the same flag used in <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-iccompressorchoose">ICCompressorChoose</a>.</td>
     * </tr>
     * </table>
     * @param {Integer} nStreams Number of streams that have their options set by the dialog box.
     * @param {Pointer<IAVIStream>} ppavi Pointer to an array of stream interface pointers. The <i>nStreams</i> parameter indicates the number of pointers in the array.
     * @param {Pointer<Pointer<AVICOMPRESSOPTIONS>>} plpOptions Pointer to an array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-avicompressoptions">AVICOMPRESSOPTIONS</a> structures. These structures hold the compression options set by the dialog box. The <i>nStreams</i> parameter indicates the number of pointers in the array.
     * @returns {Pointer} Returns <b>TRUE</b> if the user pressed OK, <b>FALSE</b> for CANCEL, or an error otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avisaveoptions
     * @since windows5.0
     */
    static AVISaveOptions(hwnd, uiFlags, nStreams, ppavi, plpOptions) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("AVIFIL32.dll\AVISaveOptions", "ptr", hwnd, "uint", uiFlags, "int", nStreams, "ptr*", ppavi, "ptr*", plpOptions, "ptr")
        return result
    }

    /**
     * The AVISaveOptionsFree function frees the resources allocated by the AVISaveOptions function.
     * @param {Integer} nStreams Count of the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-avicompressoptions">AVICOMPRESSOPTIONS</a> structures referenced in <i>plpOptions</i>.
     * @param {Pointer<Pointer<AVICOMPRESSOPTIONS>>} plpOptions Pointer to an array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-avicompressoptions">AVICOMPRESSOPTIONS</a> structures. These structures hold the compression options set by the dialog box. The resources allocated by <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-avisaveoptions">AVISaveOptions</a> for each of these structures will be freed.
     * @returns {HRESULT} Returns AVIERR_OK.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avisaveoptionsfree
     * @since windows5.0
     */
    static AVISaveOptionsFree(nStreams, plpOptions) {
        result := DllCall("AVIFIL32.dll\AVISaveOptionsFree", "int", nStreams, "ptr*", plpOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The AVIBuildFilter function builds a filter specification that is subsequently used by the GetOpenFileName or GetSaveFileName function.
     * @param {PWSTR} lpszFilter Pointer to the buffer containing the filter string.
     * @param {Integer} cbFilter Size, in characters, of buffer pointed to by <i>lpszFilter</i>.
     * @param {BOOL} fSaving Flag that indicates whether the filter should include read or write formats. Specify <b>TRUE</b> to include write formats or <b>FALSE</b> to include read formats.
     * @returns {HRESULT} Returns AVIERR_OK if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AVIERR_BUFFERTOOSMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer size <i>cbFilter</i> was smaller than the generated filter specification.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AVIERR_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was not enough memory to complete the read operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avibuildfilterw
     * @since windows5.0
     */
    static AVIBuildFilterW(lpszFilter, cbFilter, fSaving) {
        lpszFilter := lpszFilter is String ? StrPtr(lpszFilter) : lpszFilter

        result := DllCall("AVIFIL32.dll\AVIBuildFilterW", "ptr", lpszFilter, "int", cbFilter, "int", fSaving, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The AVIBuildFilter function builds a filter specification that is subsequently used by the GetOpenFileName or GetSaveFileName function.
     * @param {PSTR} lpszFilter Pointer to the buffer containing the filter string.
     * @param {Integer} cbFilter Size, in characters, of buffer pointed to by <i>lpszFilter</i>.
     * @param {BOOL} fSaving Flag that indicates whether the filter should include read or write formats. Specify <b>TRUE</b> to include write formats or <b>FALSE</b> to include read formats.
     * @returns {HRESULT} Returns AVIERR_OK if successful or an error otherwise. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AVIERR_BUFFERTOOSMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer size <i>cbFilter</i> was smaller than the generated filter specification.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AVIERR_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was not enough memory to complete the read operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avibuildfiltera
     * @since windows5.0
     */
    static AVIBuildFilterA(lpszFilter, cbFilter, fSaving) {
        lpszFilter := lpszFilter is String ? StrPtr(lpszFilter) : lpszFilter

        result := DllCall("AVIFIL32.dll\AVIBuildFilterA", "ptr", lpszFilter, "int", cbFilter, "int", fSaving, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The AVIMakeFileFromStreams function constructs an AVIFile interface pointer from separate streams.
     * @param {Pointer<IAVIFile>} ppfile Pointer to a buffer that receives the new file interface pointer.
     * @param {Integer} nStreams Count of the number of streams in the array of stream interface pointers referenced by papStreams.
     * @param {Pointer<IAVIStream>} papStreams Pointer to an array of stream interface pointers.
     * @returns {HRESULT} Returns zero if successful or an error otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avimakefilefromstreams
     * @since windows5.0
     */
    static AVIMakeFileFromStreams(ppfile, nStreams, papStreams) {
        result := DllCall("AVIFIL32.dll\AVIMakeFileFromStreams", "ptr*", ppfile, "int", nStreams, "ptr*", papStreams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The AVIMakeStreamFromClipboard function creates an editable stream from stream data on the clipboard.
     * @param {Integer} cfFormat Clipboard flag.
     * @param {HANDLE} hGlobal Handle to stream data on the clipboard.
     * @param {Pointer<IAVIStream>} ppstream Handle to the created stream.
     * @returns {HRESULT} Returns zero if successful or an error otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avimakestreamfromclipboard
     * @since windows5.0
     */
    static AVIMakeStreamFromClipboard(cfFormat, hGlobal, ppstream) {
        hGlobal := hGlobal is Win32Handle ? NumGet(hGlobal, "ptr") : hGlobal

        result := DllCall("AVIFIL32.dll\AVIMakeStreamFromClipboard", "uint", cfFormat, "ptr", hGlobal, "ptr*", ppstream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The AVIPutFileOnClipboard function copies an AVI file to the clipboard.
     * @param {IAVIFile} pf Handle to an open AVI file.
     * @returns {HRESULT} Returns zero if successful or an error otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-aviputfileonclipboard
     * @since windows5.0
     */
    static AVIPutFileOnClipboard(pf) {
        result := DllCall("AVIFIL32.dll\AVIPutFileOnClipboard", "ptr", pf, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The AVIGetFromClipboard function copies an AVI file from the clipboard.
     * @param {Pointer<IAVIFile>} lppf Pointer to the location used to return the handle created for the AVI file.
     * @returns {HRESULT} Returns zero if successful or an error otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-avigetfromclipboard
     * @since windows5.0
     */
    static AVIGetFromClipboard(lppf) {
        result := DllCall("AVIFIL32.dll\AVIGetFromClipboard", "ptr*", lppf, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The AVIClearClipboard function removes an AVI file from the clipboard.
     * @returns {HRESULT} Returns zero if successful or an error otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-aviclearclipboard
     * @since windows5.0
     */
    static AVIClearClipboard() {
        result := DllCall("AVIFIL32.dll\AVIClearClipboard", "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The CreateEditableStream function creates an editable stream. Use this function before using other stream editing functions.
     * @param {Pointer<IAVIStream>} ppsEditable Pointer to a buffer that receives the new stream handle.
     * @param {IAVIStream} psSource Handle to the stream supplying data for the new stream. Specify <b>NULL</b> to create an empty editable string that you can copy and paste data into.
     * @returns {HRESULT} Returns zero if successful or an error otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-createeditablestream
     * @since windows5.0
     */
    static CreateEditableStream(ppsEditable, psSource) {
        result := DllCall("AVIFIL32.dll\CreateEditableStream", "ptr*", ppsEditable, "ptr", psSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The EditStreamCut function deletes all or part of an editable stream and creates a temporary editable stream from the deleted portion of the stream.
     * @param {IAVIStream} pavi Handle to the stream being edited.
     * @param {Pointer<Integer>} plStart Starting position of the data to cut from the stream referenced by <i>pavi</i>.
     * @param {Pointer<Integer>} plLength Amount of data to cut from the stream referenced by <i>pavi</i>.
     * @param {Pointer<IAVIStream>} ppResult Pointer to the handle created for the new stream.
     * @returns {HRESULT} Returns zero if successful or an error otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-editstreamcut
     * @since windows5.0
     */
    static EditStreamCut(pavi, plStart, plLength, ppResult) {
        plStartMarshal := plStart is VarRef ? "int*" : "ptr"
        plLengthMarshal := plLength is VarRef ? "int*" : "ptr"

        result := DllCall("AVIFIL32.dll\EditStreamCut", "ptr", pavi, plStartMarshal, plStart, plLengthMarshal, plLength, "ptr*", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The EditStreamCopy function copies an editable stream (or a portion of it) into a temporary stream.
     * @param {IAVIStream} pavi Handle to the stream being copied.
     * @param {Pointer<Integer>} plStart Starting position within the stream being copied. The starting position is returned.
     * @param {Pointer<Integer>} plLength Amount of data to copy from the stream referenced by <i>pavi</i>. The length of the copied data is returned.
     * @param {Pointer<IAVIStream>} ppResult Pointer to a buffer that receives the handle created for the new stream.
     * @returns {HRESULT} Returns zero if successful or an error otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-editstreamcopy
     * @since windows5.0
     */
    static EditStreamCopy(pavi, plStart, plLength, ppResult) {
        plStartMarshal := plStart is VarRef ? "int*" : "ptr"
        plLengthMarshal := plLength is VarRef ? "int*" : "ptr"

        result := DllCall("AVIFIL32.dll\EditStreamCopy", "ptr", pavi, plStartMarshal, plStart, plLengthMarshal, plLength, "ptr*", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The EditStreamPaste function copies a stream (or a portion of it) from one stream and pastes it within another stream at a specified location.
     * @param {IAVIStream} pavi Handle to an editable stream that will receive the copied stream data.
     * @param {Pointer<Integer>} plPos Starting position to paste the data within the destination stream (referenced by <i>pavi</i>).
     * @param {Pointer<Integer>} plLength Pointer to a buffer that receives the amount of data pasted in the stream.
     * @param {IAVIStream} pstream Handle to a stream supplying the data to paste. This stream does not need to be an editable stream.
     * @param {Integer} lStart Starting position of the data to copy within the source stream.
     * @param {Integer} lEnd Amount of data to copy from the source stream. If <i>lLength</i> is -1, the entire stream referenced by <i>pstream</i> is pasted in the other stream.
     * @returns {HRESULT} Returns zero if successful or an error otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-editstreampaste
     * @since windows5.0
     */
    static EditStreamPaste(pavi, plPos, plLength, pstream, lStart, lEnd) {
        plPosMarshal := plPos is VarRef ? "int*" : "ptr"
        plLengthMarshal := plLength is VarRef ? "int*" : "ptr"

        result := DllCall("AVIFIL32.dll\EditStreamPaste", "ptr", pavi, plPosMarshal, plPos, plLengthMarshal, plLength, "ptr", pstream, "int", lStart, "int", lEnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The EditStreamClone function creates a duplicate editable stream.
     * @param {IAVIStream} pavi Handle to an editable stream that will be copied.
     * @param {Pointer<IAVIStream>} ppResult Pointer to a buffer that receives the new stream handle.
     * @returns {HRESULT} Returns zero if successful or an error otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-editstreamclone
     * @since windows5.0
     */
    static EditStreamClone(pavi, ppResult) {
        result := DllCall("AVIFIL32.dll\EditStreamClone", "ptr", pavi, "ptr*", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The EditStreamSetName function assigns a descriptive string to a stream.
     * @param {IAVIStream} pavi Handle to an open stream.
     * @param {PSTR} lpszName Null-terminated string containing the description of the stream.
     * @returns {HRESULT} Returns zero if successful or an error otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-editstreamsetnamea
     * @since windows5.0
     */
    static EditStreamSetNameA(pavi, lpszName) {
        lpszName := lpszName is String ? StrPtr(lpszName) : lpszName

        result := DllCall("AVIFIL32.dll\EditStreamSetNameA", "ptr", pavi, "ptr", lpszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The EditStreamSetName function assigns a descriptive string to a stream.
     * @param {IAVIStream} pavi Handle to an open stream.
     * @param {PWSTR} lpszName Null-terminated string containing the description of the stream.
     * @returns {HRESULT} Returns zero if successful or an error otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-editstreamsetnamew
     * @since windows5.0
     */
    static EditStreamSetNameW(pavi, lpszName) {
        lpszName := lpszName is String ? StrPtr(lpszName) : lpszName

        result := DllCall("AVIFIL32.dll\EditStreamSetNameW", "ptr", pavi, "ptr", lpszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The EditStreamSetInfo function changes characteristics of an editable stream.
     * @param {IAVIStream} pavi Handle to an open stream.
     * @param {Pointer} lpInfo Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-avistreaminfoa">AVISTREAMINFO</a> structure containing new information.
     * @param {Integer} cbInfo Size, in bytes, of the structure pointed to by <i>lpInfo</i>.
     * @returns {HRESULT} Returns zero if successful or an error otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-editstreamsetinfow
     * @since windows5.0
     */
    static EditStreamSetInfoW(pavi, lpInfo, cbInfo) {
        result := DllCall("AVIFIL32.dll\EditStreamSetInfoW", "ptr", pavi, "ptr", lpInfo, "int", cbInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The EditStreamSetInfo function changes characteristics of an editable stream.
     * @param {IAVIStream} pavi Handle to an open stream.
     * @param {Pointer} lpInfo Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-avistreaminfoa">AVISTREAMINFO</a> structure containing new information.
     * @param {Integer} cbInfo Size, in bytes, of the structure pointed to by <i>lpInfo</i>.
     * @returns {HRESULT} Returns zero if successful or an error otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-editstreamsetinfoa
     * @since windows5.0
     */
    static EditStreamSetInfoA(pavi, lpInfo, cbInfo) {
        result := DllCall("AVIFIL32.dll\EditStreamSetInfoA", "ptr", pavi, "ptr", lpInfo, "int", cbInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The MCIWndCreate function registers the MCIWnd window class and creates an MCIWnd window for using MCI services. MCIWndCreate can also open an MCI device or file (such as an AVI file) and associate it with the MCIWnd window.
     * @param {HWND} hwndParent Handle to the parent window.
     * @param {HINSTANCE} hInstance Handle to the module instance to associate with the MCIWnd window.
     * @param {Integer} dwStyle Flags defining the window style. In addition to specifying the window styles used with the <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-createwindowexa">CreateWindowEx</a> function, you can specify the following styles to use with MCIWnd windows.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>MCIWNDF_NOAUTOSIZEWINDOW</td>
     * <td>Will not change the dimensions of an MCIWnd window when the image size changes.</td>
     * </tr>
     * <tr>
     * <td>MCIWNDF_NOAUTOSIZEMOVIE</td>
     * <td>Will not change the dimensions of the destination rectangle when an MCIWnd window size changes.</td>
     * </tr>
     * <tr>
     * <td>MCIWNDF_NOERRORDLG</td>
     * <td>Inhibits display of MCI errors to users.</td>
     * </tr>
     * <tr>
     * <td>MCIWNDF_NOMENU</td>
     * <td>Hides the Menu button from view on the toolbar and prohibits users from accessing its pop-up menu.</td>
     * </tr>
     * <tr>
     * <td>MCIWNDF_NOOPEN</td>
     * <td>Hides the open and close commands from the MCIWnd menu and prohibits users from accessing these choices in the pop-up menu.</td>
     * </tr>
     * <tr>
     * <td>MCIWNDF_NOPLAYBAR</td>
     * <td>Hides the toolbar from view and prohibits users from accessing it.</td>
     * </tr>
     * <tr>
     * <td>MCIWNDF_NOTIFYANSI</td>
     * <td>Causes MCIWnd to use an ANSI string instead of a Unicode string when notifying the parent window of device mode changes. This flag is used in combination with MCIWNDF_NOTIFYMODE.</td>
     * </tr>
     * <tr>
     * <td>MCIWNDF_NOTIFYMODE</td>
     * <td>Causes MCIWnd to notify the parent window with an <a href="https://docs.microsoft.com/windows/desktop/Multimedia/mciwndm-notifymode">MCIWNDM_NOTIFYMODE</a> message whenever the device changes operating modes. The <i>lParam</i> parameter of this message identifies the new mode, such as MCI_MODE_STOP.</td>
     * </tr>
     * <tr>
     * <td>MCIWNDF_NOTIFYPOS</td>
     * <td>Causes MCIWnd to notify the parent window with an <a href="https://docs.microsoft.com/windows/desktop/Multimedia/mciwndm-notifypos">MCIWNDM_NOTIFYPOS</a> message whenever a change in the playback or record position within the content occurs. The <i>lParam</i> parameter of this message contains the new position in the content.</td>
     * </tr>
     * <tr>
     * <td>MCIWNDF_NOTIFYMEDIA</td>
     * <td>Causes MCIWnd to notify the parent window with an <a href="https://docs.microsoft.com/windows/desktop/Multimedia/mciwndm-notifymedia">MCIWNDM_NOTIFYMEDIA</a> message whenever a new device is used or a data file is opened or closed. The <i>lParam</i> parameter of this message contains a pointer to the new file name.</td>
     * </tr>
     * <tr>
     * <td>MCIWNDF_NOTIFYSIZE</td>
     * <td>Causes MCIWnd to notify the parent window when the MCIWnd window size changes.</td>
     * </tr>
     * <tr>
     * <td>MCIWNDF_NOTIFYERROR</td>
     * <td>Causes MCIWnd to notify the parent window when an MCI error occurs.</td>
     * </tr>
     * <tr>
     * <td>MCIWNDF_NOTIFYALL</td>
     * <td>Causes all MCIWNDF window notification styles to be used.</td>
     * </tr>
     * <tr>
     * <td>MCIWNDF_RECORD</td>
     * <td>Adds a Record button to the toolbar and adds a new file command to the menu if the MCI device has recording capability.</td>
     * </tr>
     * <tr>
     * <td>MCIWNDF_SHOWALL</td>
     * <td>Causes all MCIWNDF_SHOW styles to be used.</td>
     * </tr>
     * <tr>
     * <td>MCIWNDF_SHOWMODE</td>
     * <td>Displays the current mode of the MCI device in the window title bar. For a list of device modes, see the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-mciwndgetmode">MCIWndGetMode</a> macro.</td>
     * </tr>
     * <tr>
     * <td>MCIWNDF_SHOWNAME</td>
     * <td>Displays the name of the open MCI device or data file in the MCIWnd window title bar.</td>
     * </tr>
     * <tr>
     * <td>MCIWNDF_SHOWPOS</td>
     * <td>Displays the current position within the content of the MCI device in the window title bar.</td>
     * </tr>
     * </table>
     * @param {PSTR} szFile Null-terminated string indicating the name of an MCI device or data file to open.
     * @returns {HWND} Returns the handle to an MCI window if successful or zero otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-mciwndcreatea
     * @since windows5.0
     */
    static MCIWndCreateA(hwndParent, hInstance, dwStyle, szFile) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent
        hInstance := hInstance is Win32Handle ? NumGet(hInstance, "ptr") : hInstance
        szFile := szFile is String ? StrPtr(szFile) : szFile

        result := DllCall("MSVFW32.dll\MCIWndCreateA", "ptr", hwndParent, "ptr", hInstance, "uint", dwStyle, "ptr", szFile, "CDecl ptr")
        return HWND({Value: result}, True)
    }

    /**
     * The MCIWndCreate function registers the MCIWnd window class and creates an MCIWnd window for using MCI services. MCIWndCreate can also open an MCI device or file (such as an AVI file) and associate it with the MCIWnd window.
     * @param {HWND} hwndParent Handle to the parent window.
     * @param {HINSTANCE} hInstance Handle to the module instance to associate with the MCIWnd window.
     * @param {Integer} dwStyle Flags defining the window style. In addition to specifying the window styles used with the <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-createwindowexa">CreateWindowEx</a> function, you can specify the following styles to use with MCIWnd windows.
     * 
     * <table>
     * <tr>
     * <th>Value
     * </th>
     * <th>Meaning
     * </th>
     * </tr>
     * <tr>
     * <td>MCIWNDF_NOAUTOSIZEWINDOW</td>
     * <td>Will not change the dimensions of an MCIWnd window when the image size changes.</td>
     * </tr>
     * <tr>
     * <td>MCIWNDF_NOAUTOSIZEMOVIE</td>
     * <td>Will not change the dimensions of the destination rectangle when an MCIWnd window size changes.</td>
     * </tr>
     * <tr>
     * <td>MCIWNDF_NOERRORDLG</td>
     * <td>Inhibits display of MCI errors to users.</td>
     * </tr>
     * <tr>
     * <td>MCIWNDF_NOMENU</td>
     * <td>Hides the Menu button from view on the toolbar and prohibits users from accessing its pop-up menu.</td>
     * </tr>
     * <tr>
     * <td>MCIWNDF_NOOPEN</td>
     * <td>Hides the open and close commands from the MCIWnd menu and prohibits users from accessing these choices in the pop-up menu.</td>
     * </tr>
     * <tr>
     * <td>MCIWNDF_NOPLAYBAR</td>
     * <td>Hides the toolbar from view and prohibits users from accessing it.</td>
     * </tr>
     * <tr>
     * <td>MCIWNDF_NOTIFYANSI</td>
     * <td>Causes MCIWnd to use an ANSI string instead of a Unicode string when notifying the parent window of device mode changes. This flag is used in combination with MCIWNDF_NOTIFYMODE.</td>
     * </tr>
     * <tr>
     * <td>MCIWNDF_NOTIFYMODE</td>
     * <td>Causes MCIWnd to notify the parent window with an <a href="https://docs.microsoft.com/windows/desktop/Multimedia/mciwndm-notifymode">MCIWNDM_NOTIFYMODE</a> message whenever the device changes operating modes. The <i>lParam</i> parameter of this message identifies the new mode, such as MCI_MODE_STOP.</td>
     * </tr>
     * <tr>
     * <td>MCIWNDF_NOTIFYPOS</td>
     * <td>Causes MCIWnd to notify the parent window with an <a href="https://docs.microsoft.com/windows/desktop/Multimedia/mciwndm-notifypos">MCIWNDM_NOTIFYPOS</a> message whenever a change in the playback or record position within the content occurs. The <i>lParam</i> parameter of this message contains the new position in the content.</td>
     * </tr>
     * <tr>
     * <td>MCIWNDF_NOTIFYMEDIA</td>
     * <td>Causes MCIWnd to notify the parent window with an <a href="https://docs.microsoft.com/windows/desktop/Multimedia/mciwndm-notifymedia">MCIWNDM_NOTIFYMEDIA</a> message whenever a new device is used or a data file is opened or closed. The <i>lParam</i> parameter of this message contains a pointer to the new file name.</td>
     * </tr>
     * <tr>
     * <td>MCIWNDF_NOTIFYSIZE</td>
     * <td>Causes MCIWnd to notify the parent window when the MCIWnd window size changes.</td>
     * </tr>
     * <tr>
     * <td>MCIWNDF_NOTIFYERROR</td>
     * <td>Causes MCIWnd to notify the parent window when an MCI error occurs.</td>
     * </tr>
     * <tr>
     * <td>MCIWNDF_NOTIFYALL</td>
     * <td>Causes all MCIWNDF window notification styles to be used.</td>
     * </tr>
     * <tr>
     * <td>MCIWNDF_RECORD</td>
     * <td>Adds a Record button to the toolbar and adds a new file command to the menu if the MCI device has recording capability.</td>
     * </tr>
     * <tr>
     * <td>MCIWNDF_SHOWALL</td>
     * <td>Causes all MCIWNDF_SHOW styles to be used.</td>
     * </tr>
     * <tr>
     * <td>MCIWNDF_SHOWMODE</td>
     * <td>Displays the current mode of the MCI device in the window title bar. For a list of device modes, see the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-mciwndgetmode">MCIWndGetMode</a> macro.</td>
     * </tr>
     * <tr>
     * <td>MCIWNDF_SHOWNAME</td>
     * <td>Displays the name of the open MCI device or data file in the MCIWnd window title bar.</td>
     * </tr>
     * <tr>
     * <td>MCIWNDF_SHOWPOS</td>
     * <td>Displays the current position within the content of the MCI device in the window title bar.</td>
     * </tr>
     * </table>
     * @param {PWSTR} szFile Null-terminated string indicating the name of an MCI device or data file to open.
     * @returns {HWND} Returns the handle to an MCI window if successful or zero otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-mciwndcreatew
     * @since windows5.0
     */
    static MCIWndCreateW(hwndParent, hInstance, dwStyle, szFile) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent
        hInstance := hInstance is Win32Handle ? NumGet(hInstance, "ptr") : hInstance
        szFile := szFile is String ? StrPtr(szFile) : szFile

        result := DllCall("MSVFW32.dll\MCIWndCreateW", "ptr", hwndParent, "ptr", hInstance, "uint", dwStyle, "ptr", szFile, "CDecl ptr")
        return HWND({Value: result}, True)
    }

    /**
     * The MCIWndRegisterClass function registers the MCI window class MCIWND_WINDOW_CLASS.
     * @returns {BOOL} Returns zero if successful.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-mciwndregisterclass
     * @since windows5.0
     */
    static MCIWndRegisterClass() {
        result := DllCall("MSVFW32.dll\MCIWndRegisterClass", "CDecl int")
        return result
    }

    /**
     * The capCreateCaptureWindow function creates a capture window.
     * @param {PSTR} lpszWindowName Null-terminated string containing the name used for the capture window.
     * @param {Integer} dwStyle Window styles used for the capture window. Window styles are described with the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createwindowexa">CreateWindowEx</a> function.
     * @param {Integer} x The x-coordinate of the upper left corner of the capture window.
     * @param {Integer} y The y-coordinate of the upper left corner of the capture window.
     * @param {Integer} nWidth Width of the capture window.
     * @param {Integer} nHeight Height of the capture window.
     * @param {HWND} hwndParent Handle to the parent window.
     * @param {Integer} nID Window identifier.
     * @returns {HWND} Returns a handle of the capture window if successful or <b>NULL</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-capcreatecapturewindowa
     * @since windows5.0
     */
    static capCreateCaptureWindowA(lpszWindowName, dwStyle, x, y, nWidth, nHeight, hwndParent, nID) {
        lpszWindowName := lpszWindowName is String ? StrPtr(lpszWindowName) : lpszWindowName
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := DllCall("AVICAP32.dll\capCreateCaptureWindowA", "ptr", lpszWindowName, "uint", dwStyle, "int", x, "int", y, "int", nWidth, "int", nHeight, "ptr", hwndParent, "int", nID, "ptr")
        return HWND({Value: result}, True)
    }

    /**
     * The capGetDriverDescription function retrieves the version description of the capture driver.
     * @param {Integer} wDriverIndex Index of the capture driver. The index can range from 0 through 9.
     * 
     * Plug-and-Play capture drivers are enumerated first, followed by capture drivers listed in the registry, which are then followed by capture drivers listed in SYSTEM.INI.
     * @param {PSTR} lpszName Pointer to a buffer containing a null-terminated string corresponding to the capture driver name.
     * @param {Integer} cbName Length, in bytes, of the buffer pointed to by <i>lpszName</i>.
     * @param {PSTR} lpszVer Pointer to a buffer containing a null-terminated string corresponding to the description of the capture driver.
     * @param {Integer} cbVer Length, in bytes, of the buffer pointed to by <i>lpszVer</i>.
     * @returns {BOOL} Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-capgetdriverdescriptiona
     * @since windows5.0
     */
    static capGetDriverDescriptionA(wDriverIndex, lpszName, cbName, lpszVer, cbVer) {
        lpszName := lpszName is String ? StrPtr(lpszName) : lpszName
        lpszVer := lpszVer is String ? StrPtr(lpszVer) : lpszVer

        result := DllCall("AVICAP32.dll\capGetDriverDescriptionA", "uint", wDriverIndex, "ptr", lpszName, "int", cbName, "ptr", lpszVer, "int", cbVer, "int")
        return result
    }

    /**
     * The capCreateCaptureWindow function creates a capture window.
     * @param {PWSTR} lpszWindowName Null-terminated string containing the name used for the capture window.
     * @param {Integer} dwStyle Window styles used for the capture window. Window styles are described with the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createwindowexa">CreateWindowEx</a> function.
     * @param {Integer} x The x-coordinate of the upper left corner of the capture window.
     * @param {Integer} y The y-coordinate of the upper left corner of the capture window.
     * @param {Integer} nWidth Width of the capture window.
     * @param {Integer} nHeight Height of the capture window.
     * @param {HWND} hwndParent Handle to the parent window.
     * @param {Integer} nID Window identifier.
     * @returns {HWND} Returns a handle of the capture window if successful or <b>NULL</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-capcreatecapturewindoww
     * @since windows5.0
     */
    static capCreateCaptureWindowW(lpszWindowName, dwStyle, x, y, nWidth, nHeight, hwndParent, nID) {
        lpszWindowName := lpszWindowName is String ? StrPtr(lpszWindowName) : lpszWindowName
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := DllCall("AVICAP32.dll\capCreateCaptureWindowW", "ptr", lpszWindowName, "uint", dwStyle, "int", x, "int", y, "int", nWidth, "int", nHeight, "ptr", hwndParent, "int", nID, "ptr")
        return HWND({Value: result}, True)
    }

    /**
     * The capGetDriverDescription function retrieves the version description of the capture driver.
     * @param {Integer} wDriverIndex Index of the capture driver. The index can range from 0 through 9.
     * 
     * Plug-and-Play capture drivers are enumerated first, followed by capture drivers listed in the registry, which are then followed by capture drivers listed in SYSTEM.INI.
     * @param {PWSTR} lpszName Pointer to a buffer containing a null-terminated string corresponding to the capture driver name.
     * @param {Integer} cbName Length, in bytes, of the buffer pointed to by <i>lpszName</i>.
     * @param {PWSTR} lpszVer Pointer to a buffer containing a null-terminated string corresponding to the description of the capture driver.
     * @param {Integer} cbVer Length, in bytes, of the buffer pointed to by <i>lpszVer</i>.
     * @returns {BOOL} Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-capgetdriverdescriptionw
     * @since windows5.0
     */
    static capGetDriverDescriptionW(wDriverIndex, lpszName, cbName, lpszVer, cbVer) {
        lpszName := lpszName is String ? StrPtr(lpszName) : lpszName
        lpszVer := lpszVer is String ? StrPtr(lpszVer) : lpszVer

        result := DllCall("AVICAP32.dll\capGetDriverDescriptionW", "uint", wDriverIndex, "ptr", lpszName, "int", cbName, "ptr", lpszVer, "int", cbVer, "int")
        return result
    }

    /**
     * The GetOpenFileNamePreview function selects a file by using the Open dialog box. The dialog box also allows the user to preview the currently specified AVI file. This function augments the capability found in the GetOpenFileName function.
     * @param {Pointer<OPENFILENAMEA>} lpofn Pointer to an <b>OPENFILENAME</b> structure used to initialize the dialog box. On return, the structure contains information about the user's file selection.
     * @returns {BOOL} Returns a handle to the selected file.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-getopenfilenamepreviewa
     * @since windows5.0
     */
    static GetOpenFileNamePreviewA(lpofn) {
        result := DllCall("MSVFW32.dll\GetOpenFileNamePreviewA", "ptr", lpofn, "int")
        return result
    }

    /**
     * The GetSaveFileNamePreview function selects a file by using the Save As dialog box. The dialog box also allows the user to preview the currently specified file. This function augments the capability found in the GetSaveFileName function.
     * @param {Pointer<OPENFILENAMEA>} lpofn Pointer to an <b>OPENFILENAME</b> structure used to initialize the dialog box. On return, the structure contains information about the user's file selection.
     * @returns {BOOL} Returns a handle to the selected file.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-getsavefilenamepreviewa
     * @since windows5.0
     */
    static GetSaveFileNamePreviewA(lpofn) {
        result := DllCall("MSVFW32.dll\GetSaveFileNamePreviewA", "ptr", lpofn, "int")
        return result
    }

    /**
     * The GetOpenFileNamePreview function selects a file by using the Open dialog box. The dialog box also allows the user to preview the currently specified AVI file. This function augments the capability found in the GetOpenFileName function.
     * @param {Pointer<OPENFILENAMEW>} lpofn Pointer to an <b>OPENFILENAME</b> structure used to initialize the dialog box. On return, the structure contains information about the user's file selection.
     * @returns {BOOL} Returns a handle to the selected file.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-getopenfilenameprevieww
     * @since windows5.0
     */
    static GetOpenFileNamePreviewW(lpofn) {
        result := DllCall("MSVFW32.dll\GetOpenFileNamePreviewW", "ptr", lpofn, "int")
        return result
    }

    /**
     * The GetSaveFileNamePreview function selects a file by using the Save As dialog box. The dialog box also allows the user to preview the currently specified file. This function augments the capability found in the GetSaveFileName function.
     * @param {Pointer<OPENFILENAMEW>} lpofn Pointer to an <b>OPENFILENAME</b> structure used to initialize the dialog box. On return, the structure contains information about the user's file selection.
     * @returns {BOOL} Returns a handle to the selected file.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-getsavefilenameprevieww
     * @since windows5.0
     */
    static GetSaveFileNamePreviewW(lpofn) {
        result := DllCall("MSVFW32.dll\GetSaveFileNamePreviewW", "ptr", lpofn, "int")
        return result
    }

    /**
     * The mmTaskCreate function is deprecated. Applications should not use this function.
     * @param {Pointer<LPTASKCALLBACK>} lpfn Reserved.
     * @param {Pointer<HANDLE>} lph Reserved.
     * @param {Pointer} dwInst Reserved.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//mmddk/nf-mmddk-mmtaskcreate
     */
    static mmTaskCreate(lpfn, lph, dwInst) {
        result := DllCall("WINMM.dll\mmTaskCreate", "ptr", lpfn, "ptr", lph, "ptr", dwInst, "uint")
        return result
    }

    /**
     * The mmTaskBlock function is deprecated. Applications should not use this function.
     * @param {Integer} h Reserved.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//mmddk/nf-mmddk-mmtaskblock
     */
    static mmTaskBlock(h) {
        DllCall("WINMM.dll\mmTaskBlock", "uint", h)
    }

    /**
     * The mmTaskSignal function is deprecated. Applications should not use this function.
     * @param {Integer} h Reserved.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//mmddk/nf-mmddk-mmtasksignal
     */
    static mmTaskSignal(h) {
        result := DllCall("WINMM.dll\mmTaskSignal", "uint", h, "int")
        return result
    }

    /**
     * The mmTaskYield function is deprecated. Applications should not use this function.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//mmddk/nf-mmddk-mmtaskyield
     */
    static mmTaskYield() {
        DllCall("WINMM.dll\mmTaskYield")
    }

    /**
     * The mmGetCurrentTask function is deprecated. Applications should not use this function.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//mmddk/nf-mmddk-mmgetcurrenttask
     */
    static mmGetCurrentTask() {
        result := DllCall("WINMM.dll\mmGetCurrentTask", "uint")
        return result
    }

;@endregion Methods
}
