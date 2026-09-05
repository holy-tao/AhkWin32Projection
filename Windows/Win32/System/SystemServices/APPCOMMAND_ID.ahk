#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class APPCOMMAND_ID extends Win32Enum {

    /**
     * Native name: APPCOMMAND_BROWSER_BACKWARD
     * @type {Integer (UInt32)}
     */
    static BROWSER_BACKWARD => 1

    /**
     * Native name: APPCOMMAND_BROWSER_FORWARD
     * @type {Integer (UInt32)}
     */
    static BROWSER_FORWARD => 2

    /**
     * Native name: APPCOMMAND_BROWSER_REFRESH
     * @type {Integer (UInt32)}
     */
    static BROWSER_REFRESH => 3

    /**
     * Native name: APPCOMMAND_BROWSER_STOP
     * @type {Integer (UInt32)}
     */
    static BROWSER_STOP => 4

    /**
     * Native name: APPCOMMAND_BROWSER_SEARCH
     * @type {Integer (UInt32)}
     */
    static BROWSER_SEARCH => 5

    /**
     * Native name: APPCOMMAND_BROWSER_FAVORITES
     * @type {Integer (UInt32)}
     */
    static BROWSER_FAVORITES => 6

    /**
     * Native name: APPCOMMAND_BROWSER_HOME
     * @type {Integer (UInt32)}
     */
    static BROWSER_HOME => 7

    /**
     * Native name: APPCOMMAND_VOLUME_MUTE
     * @type {Integer (UInt32)}
     */
    static VOLUME_MUTE => 8

    /**
     * Native name: APPCOMMAND_VOLUME_DOWN
     * @type {Integer (UInt32)}
     */
    static VOLUME_DOWN => 9

    /**
     * Native name: APPCOMMAND_VOLUME_UP
     * @type {Integer (UInt32)}
     */
    static VOLUME_UP => 10

    /**
     * Native name: APPCOMMAND_MEDIA_NEXTTRACK
     * @type {Integer (UInt32)}
     */
    static MEDIA_NEXTTRACK => 11

    /**
     * Native name: APPCOMMAND_MEDIA_PREVIOUSTRACK
     * @type {Integer (UInt32)}
     */
    static MEDIA_PREVIOUSTRACK => 12

    /**
     * Native name: APPCOMMAND_MEDIA_STOP
     * @type {Integer (UInt32)}
     */
    static MEDIA_STOP => 13

    /**
     * Native name: APPCOMMAND_MEDIA_PLAY_PAUSE
     * @type {Integer (UInt32)}
     */
    static MEDIA_PLAY_PAUSE => 14

    /**
     * Native name: APPCOMMAND_LAUNCH_MAIL
     * @type {Integer (UInt32)}
     */
    static LAUNCH_MAIL => 15

    /**
     * Native name: APPCOMMAND_LAUNCH_MEDIA_SELECT
     * @type {Integer (UInt32)}
     */
    static LAUNCH_MEDIA_SELECT => 16

    /**
     * Native name: APPCOMMAND_LAUNCH_APP1
     * @type {Integer (UInt32)}
     */
    static LAUNCH_APP1 => 17

    /**
     * Native name: APPCOMMAND_LAUNCH_APP2
     * @type {Integer (UInt32)}
     */
    static LAUNCH_APP2 => 18

    /**
     * Native name: APPCOMMAND_BASS_DOWN
     * @type {Integer (UInt32)}
     */
    static BASS_DOWN => 19

    /**
     * Native name: APPCOMMAND_BASS_BOOST
     * @type {Integer (UInt32)}
     */
    static BASS_BOOST => 20

    /**
     * Native name: APPCOMMAND_BASS_UP
     * @type {Integer (UInt32)}
     */
    static BASS_UP => 21

    /**
     * Native name: APPCOMMAND_TREBLE_DOWN
     * @type {Integer (UInt32)}
     */
    static TREBLE_DOWN => 22

    /**
     * Native name: APPCOMMAND_TREBLE_UP
     * @type {Integer (UInt32)}
     */
    static TREBLE_UP => 23

    /**
     * Native name: APPCOMMAND_MICROPHONE_VOLUME_MUTE
     * @type {Integer (UInt32)}
     */
    static MICROPHONE_VOLUME_MUTE => 24

    /**
     * Native name: APPCOMMAND_MICROPHONE_VOLUME_DOWN
     * @type {Integer (UInt32)}
     */
    static MICROPHONE_VOLUME_DOWN => 25

    /**
     * Native name: APPCOMMAND_MICROPHONE_VOLUME_UP
     * @type {Integer (UInt32)}
     */
    static MICROPHONE_VOLUME_UP => 26

    /**
     * Native name: APPCOMMAND_HELP
     * @type {Integer (UInt32)}
     */
    static HELP => 27

    /**
     * Native name: APPCOMMAND_FIND
     * @type {Integer (UInt32)}
     */
    static FIND => 28

    /**
     * Native name: APPCOMMAND_NEW
     * @type {Integer (UInt32)}
     */
    static NEW => 29

    /**
     * Native name: APPCOMMAND_OPEN
     * @type {Integer (UInt32)}
     */
    static OPEN => 30

    /**
     * Native name: APPCOMMAND_CLOSE
     * @type {Integer (UInt32)}
     */
    static CLOSE => 31

    /**
     * Native name: APPCOMMAND_SAVE
     * @type {Integer (UInt32)}
     */
    static SAVE => 32

    /**
     * Native name: APPCOMMAND_PRINT
     * @type {Integer (UInt32)}
     */
    static PRINT => 33

    /**
     * Native name: APPCOMMAND_UNDO
     * @type {Integer (UInt32)}
     */
    static UNDO => 34

    /**
     * Native name: APPCOMMAND_REDO
     * @type {Integer (UInt32)}
     */
    static REDO => 35

    /**
     * Native name: APPCOMMAND_COPY
     * @type {Integer (UInt32)}
     */
    static COPY => 36

    /**
     * Native name: APPCOMMAND_CUT
     * @type {Integer (UInt32)}
     */
    static CUT => 37

    /**
     * Native name: APPCOMMAND_PASTE
     * @type {Integer (UInt32)}
     */
    static PASTE => 38

    /**
     * Native name: APPCOMMAND_REPLY_TO_MAIL
     * @type {Integer (UInt32)}
     */
    static REPLY_TO_MAIL => 39

    /**
     * Native name: APPCOMMAND_FORWARD_MAIL
     * @type {Integer (UInt32)}
     */
    static FORWARD_MAIL => 40

    /**
     * Native name: APPCOMMAND_SEND_MAIL
     * @type {Integer (UInt32)}
     */
    static SEND_MAIL => 41

    /**
     * Native name: APPCOMMAND_SPELL_CHECK
     * @type {Integer (UInt32)}
     */
    static SPELL_CHECK => 42

    /**
     * Native name: APPCOMMAND_DICTATE_OR_COMMAND_CONTROL_TOGGLE
     * @type {Integer (UInt32)}
     */
    static DICTATE_OR_COMMAND_CONTROL_TOGGLE => 43

    /**
     * Native name: APPCOMMAND_MIC_ON_OFF_TOGGLE
     * @type {Integer (UInt32)}
     */
    static MIC_ON_OFF_TOGGLE => 44

    /**
     * Native name: APPCOMMAND_CORRECTION_LIST
     * @type {Integer (UInt32)}
     */
    static CORRECTION_LIST => 45

    /**
     * Native name: APPCOMMAND_MEDIA_PLAY
     * @type {Integer (UInt32)}
     */
    static MEDIA_PLAY => 46

    /**
     * Native name: APPCOMMAND_MEDIA_PAUSE
     * @type {Integer (UInt32)}
     */
    static MEDIA_PAUSE => 47

    /**
     * Native name: APPCOMMAND_MEDIA_RECORD
     * @type {Integer (UInt32)}
     */
    static MEDIA_RECORD => 48

    /**
     * Native name: APPCOMMAND_MEDIA_FAST_FORWARD
     * @type {Integer (UInt32)}
     */
    static MEDIA_FAST_FORWARD => 49

    /**
     * Native name: APPCOMMAND_MEDIA_REWIND
     * @type {Integer (UInt32)}
     */
    static MEDIA_REWIND => 50

    /**
     * Native name: APPCOMMAND_MEDIA_CHANNEL_UP
     * @type {Integer (UInt32)}
     */
    static MEDIA_CHANNEL_UP => 51

    /**
     * Native name: APPCOMMAND_MEDIA_CHANNEL_DOWN
     * @type {Integer (UInt32)}
     */
    static MEDIA_CHANNEL_DOWN => 52

    /**
     * Native name: APPCOMMAND_DELETE
     * @type {Integer (UInt32)}
     */
    static DELETE => 53

    /**
     * Native name: APPCOMMAND_DWM_FLIP3D
     * @type {Integer (UInt32)}
     */
    static DWM_FLIP3D => 54
}
