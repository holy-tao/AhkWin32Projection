#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.Media
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global TIMERR_NOERROR := 0

/**
 * @type {Integer (UInt32)}
 */
export global TIMERR_NOCANDO := 97

/**
 * @type {Integer (UInt32)}
 */
export global TIMERR_STRUCT := 129

/**
 * @type {Integer (UInt32)}
 */
export global MAXPNAMELEN := 32

/**
 * @type {Integer (UInt32)}
 */
export global MAXERRORLENGTH := 256

/**
 * @type {Integer (UInt32)}
 */
export global MM_MICROSOFT := 1

/**
 * @type {Integer (UInt32)}
 */
export global MM_MIDI_MAPPER := 1

/**
 * @type {Integer (UInt32)}
 */
export global MM_WAVE_MAPPER := 2

/**
 * @type {Integer (UInt32)}
 */
export global MM_SNDBLST_MIDIOUT := 3

/**
 * @type {Integer (UInt32)}
 */
export global MM_SNDBLST_MIDIIN := 4

/**
 * @type {Integer (UInt32)}
 */
export global MM_SNDBLST_SYNTH := 5

/**
 * @type {Integer (UInt32)}
 */
export global MM_SNDBLST_WAVEOUT := 6

/**
 * @type {Integer (UInt32)}
 */
export global MM_SNDBLST_WAVEIN := 7

/**
 * @type {Integer (UInt32)}
 */
export global MM_ADLIB := 9

/**
 * @type {Integer (UInt32)}
 */
export global MM_MPU401_MIDIOUT := 10

/**
 * @type {Integer (UInt32)}
 */
export global MM_MPU401_MIDIIN := 11

/**
 * @type {Integer (UInt32)}
 */
export global MM_PC_JOYSTICK := 12

/**
 * @type {Integer (UInt32)}
 */
export global TIME_MS := 1

/**
 * @type {Integer (UInt32)}
 */
export global TIME_SAMPLES := 2

/**
 * @type {Integer (UInt32)}
 */
export global TIME_BYTES := 4

/**
 * @type {Integer (UInt32)}
 */
export global TIME_SMPTE := 8

/**
 * @type {Integer (UInt32)}
 */
export global TIME_MIDI := 16

/**
 * @type {Integer (UInt32)}
 */
export global TIME_TICKS := 32

/**
 * @type {Integer (UInt32)}
 */
export global MM_JOY1MOVE := 928

/**
 * @type {Integer (UInt32)}
 */
export global MM_JOY2MOVE := 929

/**
 * @type {Integer (UInt32)}
 */
export global MM_JOY1ZMOVE := 930

/**
 * @type {Integer (UInt32)}
 */
export global MM_JOY2ZMOVE := 931

/**
 * @type {Integer (UInt32)}
 */
export global MM_JOY1BUTTONDOWN := 949

/**
 * @type {Integer (UInt32)}
 */
export global MM_JOY2BUTTONDOWN := 950

/**
 * @type {Integer (UInt32)}
 */
export global MM_JOY1BUTTONUP := 951

/**
 * @type {Integer (UInt32)}
 */
export global MM_JOY2BUTTONUP := 952

/**
 * @type {Integer (UInt32)}
 */
export global MM_MCINOTIFY := 953

/**
 * @type {Integer (UInt32)}
 */
export global MM_WOM_OPEN := 955

/**
 * @type {Integer (UInt32)}
 */
export global MM_WOM_CLOSE := 956

/**
 * @type {Integer (UInt32)}
 */
export global MM_WOM_DONE := 957

/**
 * @type {Integer (UInt32)}
 */
export global MM_WIM_OPEN := 958

/**
 * @type {Integer (UInt32)}
 */
export global MM_WIM_CLOSE := 959

/**
 * @type {Integer (UInt32)}
 */
export global MM_WIM_DATA := 960

/**
 * @type {Integer (UInt32)}
 */
export global MM_MIM_OPEN := 961

/**
 * @type {Integer (UInt32)}
 */
export global MM_MIM_CLOSE := 962

/**
 * @type {Integer (UInt32)}
 */
export global MM_MIM_DATA := 963

/**
 * @type {Integer (UInt32)}
 */
export global MM_MIM_LONGDATA := 964

/**
 * @type {Integer (UInt32)}
 */
export global MM_MIM_ERROR := 965

/**
 * @type {Integer (UInt32)}
 */
export global MM_MIM_LONGERROR := 966

/**
 * @type {Integer (UInt32)}
 */
export global MM_MOM_OPEN := 967

/**
 * @type {Integer (UInt32)}
 */
export global MM_MOM_CLOSE := 968

/**
 * @type {Integer (UInt32)}
 */
export global MM_MOM_DONE := 969

/**
 * @type {Integer (UInt32)}
 */
export global MM_DRVM_OPEN := 976

/**
 * @type {Integer (UInt32)}
 */
export global MM_DRVM_CLOSE := 977

/**
 * @type {Integer (UInt32)}
 */
export global MM_DRVM_DATA := 978

/**
 * @type {Integer (UInt32)}
 */
export global MM_DRVM_ERROR := 979

/**
 * @type {Integer (UInt32)}
 */
export global MM_STREAM_OPEN := 980

/**
 * @type {Integer (UInt32)}
 */
export global MM_STREAM_CLOSE := 981

/**
 * @type {Integer (UInt32)}
 */
export global MM_STREAM_DONE := 982

/**
 * @type {Integer (UInt32)}
 */
export global MM_STREAM_ERROR := 983

/**
 * @type {Integer (UInt32)}
 */
export global MM_MOM_POSITIONCB := 970

/**
 * @type {Integer (UInt32)}
 */
export global MM_MCISIGNAL := 971

/**
 * @type {Integer (UInt32)}
 */
export global MM_MIM_MOREDATA := 972

/**
 * @type {Integer (UInt32)}
 */
export global MM_MIXM_LINE_CHANGE := 976

/**
 * @type {Integer (UInt32)}
 */
export global MM_MIXM_CONTROL_CHANGE := 977

/**
 * @type {Integer (UInt32)}
 */
export global MMSYSERR_BASE := 0

/**
 * @type {Integer (UInt32)}
 */
export global WAVERR_BASE := 32

/**
 * @type {Integer (UInt32)}
 */
export global MIDIERR_BASE := 64

/**
 * @type {Integer (UInt32)}
 */
export global TIMERR_BASE := 96

/**
 * @type {Integer (UInt32)}
 */
export global JOYERR_BASE := 160

/**
 * @type {Integer (UInt32)}
 */
export global MCIERR_BASE := 256

/**
 * @type {Integer (UInt32)}
 */
export global MIXERR_BASE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global MCI_STRING_OFFSET := 512

/**
 * @type {Integer (UInt32)}
 */
export global MCI_VD_OFFSET := 1024

/**
 * @type {Integer (UInt32)}
 */
export global MCI_CD_OFFSET := 1088

/**
 * @type {Integer (UInt32)}
 */
export global MCI_WAVE_OFFSET := 1152

/**
 * @type {Integer (UInt32)}
 */
export global MCI_SEQ_OFFSET := 1216

/**
 * @type {Integer (UInt32)}
 */
export global MMSYSERR_NOERROR := 0

/**
 * @type {Integer (UInt32)}
 */
export global MMSYSERR_ERROR := 1

/**
 * @type {Integer (UInt32)}
 */
export global MMSYSERR_BADDEVICEID := 2

/**
 * @type {Integer (UInt32)}
 */
export global MMSYSERR_NOTENABLED := 3

/**
 * @type {Integer (UInt32)}
 */
export global MMSYSERR_ALLOCATED := 4

/**
 * @type {Integer (UInt32)}
 */
export global MMSYSERR_INVALHANDLE := 5

/**
 * @type {Integer (UInt32)}
 */
export global MMSYSERR_NODRIVER := 6

/**
 * @type {Integer (UInt32)}
 */
export global MMSYSERR_NOMEM := 7

/**
 * @type {Integer (UInt32)}
 */
export global MMSYSERR_NOTSUPPORTED := 8

/**
 * @type {Integer (UInt32)}
 */
export global MMSYSERR_BADERRNUM := 9

/**
 * @type {Integer (UInt32)}
 */
export global MMSYSERR_INVALFLAG := 10

/**
 * @type {Integer (UInt32)}
 */
export global MMSYSERR_INVALPARAM := 11

/**
 * @type {Integer (UInt32)}
 */
export global MMSYSERR_HANDLEBUSY := 12

/**
 * @type {Integer (UInt32)}
 */
export global MMSYSERR_INVALIDALIAS := 13

/**
 * @type {Integer (UInt32)}
 */
export global MMSYSERR_BADDB := 14

/**
 * @type {Integer (UInt32)}
 */
export global MMSYSERR_KEYNOTFOUND := 15

/**
 * @type {Integer (UInt32)}
 */
export global MMSYSERR_READERROR := 16

/**
 * @type {Integer (UInt32)}
 */
export global MMSYSERR_WRITEERROR := 17

/**
 * @type {Integer (UInt32)}
 */
export global MMSYSERR_DELETEERROR := 18

/**
 * @type {Integer (UInt32)}
 */
export global MMSYSERR_VALNOTFOUND := 19

/**
 * @type {Integer (UInt32)}
 */
export global MMSYSERR_NODRIVERCB := 20

/**
 * @type {Integer (UInt32)}
 */
export global MMSYSERR_MOREDATA := 21

/**
 * @type {Integer (UInt32)}
 */
export global MMSYSERR_LASTERROR := 21

/**
 * @type {Integer (UInt32)}
 */
export global TIME_ONESHOT := 0

/**
 * @type {Integer (UInt32)}
 */
export global TIME_PERIODIC := 1

/**
 * @type {Integer (UInt32)}
 */
export global TIME_CALLBACK_FUNCTION := 0

/**
 * @type {Integer (UInt32)}
 */
export global TIME_CALLBACK_EVENT_SET := 16

/**
 * @type {Integer (UInt32)}
 */
export global TIME_CALLBACK_EVENT_PULSE := 32

/**
 * @type {Integer (UInt32)}
 */
export global TIME_KILL_SYNCHRONOUS := 256
;@endregion Constants
