#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates which user operation (UOP) commands are currently allowed by the DVD.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-valid_uop_flag
 * @namespace Windows.Win32.Media.DirectShow
 */
class VALID_UOP_FLAG extends Win32Enum {

    /**
     * Annex J commands: Time_Play, TimeSearch.
     * Native name: UOP_FLAG_Play_Title_Or_AtTime
     * @type {Integer (Int32)}
     */
    static Play_Title_Or_AtTime => 1

    /**
     * Annex J commands: PTT_Play, PTT_Search.
     * Native name: UOP_FLAG_Play_Chapter
     * @type {Integer (Int32)}
     */
    static Play_Chapter => 2

    /**
     * Annex J command: Title_Play.
     * Native name: UOP_FLAG_Play_Title
     * @type {Integer (Int32)}
     */
    static Play_Title => 4

    /**
     * Annex J command: Stop.
     * Native name: UOP_FLAG_Stop
     * @type {Integer (Int32)}
     */
    static Stop => 8

    /**
     * Annex J command: GoUp.
     * Native name: UOP_FLAG_ReturnFromSubMenu
     * @type {Integer (Int32)}
     */
    static ReturnFromSubMenu => 16

    /**
     * Annex J commands: Time_Search, PTT_Search.
     * Native name: UOP_FLAG_Play_Chapter_Or_AtTime
     * @type {Integer (Int32)}
     */
    static Play_Chapter_Or_AtTime => 32

    /**
     * Annex J commands: PrevPG_Search, TopPG_Search.
     * Native name: UOP_FLAG_PlayPrev_Or_Replay_Chapter
     * @type {Integer (Int32)}
     */
    static PlayPrev_Or_Replay_Chapter => 64

    /**
     * Annex J command: NextPG_Search.
     * Native name: UOP_FLAG_PlayNext_Chapter
     * @type {Integer (Int32)}
     */
    static PlayNext_Chapter => 128

    /**
     * Annex J command: Forward_Scan.
     * Native name: UOP_FLAG_Play_Forwards
     * @type {Integer (Int32)}
     */
    static Play_Forwards => 256

    /**
     * Annex J command: Backward_Scan.
     * Native name: UOP_FLAG_Play_Backwards
     * @type {Integer (Int32)}
     */
    static Play_Backwards => 512

    /**
     * Annex J command: Menu_Call(<i>Title</i>).
     * Native name: UOP_FLAG_ShowMenu_Title
     * @type {Integer (Int32)}
     */
    static ShowMenu_Title => 1024

    /**
     * Annex J command: Menu_Call(<i>Root</i>).
     * Native name: UOP_FLAG_ShowMenu_Root
     * @type {Integer (Int32)}
     */
    static ShowMenu_Root => 2048

    /**
     * Annex J command: Menu_Call(<i>Sub-picture</i>).
     * Native name: UOP_FLAG_ShowMenu_SubPic
     * @type {Integer (Int32)}
     */
    static ShowMenu_SubPic => 4096

    /**
     * Annex J command: Menu_Call(<i>Audio</i>).
     * Native name: UOP_FLAG_ShowMenu_Audio
     * @type {Integer (Int32)}
     */
    static ShowMenu_Audio => 8192

    /**
     * Annex J command: Menu_Call(<i>Angle</i>).
     * Native name: UOP_FLAG_ShowMenu_Angle
     * @type {Integer (Int32)}
     */
    static ShowMenu_Angle => 16384

    /**
     * Annex J command: Menu_Call(<i>PTT</i>).
     * Native name: UOP_FLAG_ShowMenu_Chapter
     * @type {Integer (Int32)}
     */
    static ShowMenu_Chapter => 32768

    /**
     * Annex J command: Resume.
     * Native name: UOP_FLAG_Resume
     * @type {Integer (Int32)}
     */
    static Resume => 65536

    /**
     * Annex J commands: Upper_Button_Select, Lower_Button_Select, Left_Button_Select, Right_Button_Select, Button_Activate, Button_Select_And_Activate.
     * Native name: UOP_FLAG_Select_Or_Activate_Button
     * @type {Integer (Int32)}
     */
    static Select_Or_Activate_Button => 131072

    /**
     * Annex J command: Still_Off.
     * Native name: UOP_FLAG_Still_Off
     * @type {Integer (Int32)}
     */
    static Still_Off => 262144

    /**
     * Annex J command: Pause_On.
     * Native name: UOP_FLAG_Pause_On
     * @type {Integer (Int32)}
     */
    static Pause_On => 524288

    /**
     * Annex J command: Audio_Stream_Change.
     * Native name: UOP_FLAG_Select_Audio_Stream
     * @type {Integer (Int32)}
     */
    static Select_Audio_Stream => 1048576

    /**
     * Annex J command: Sub-picture_Stream_Change.
     * Native name: UOP_FLAG_Select_SubPic_Stream
     * @type {Integer (Int32)}
     */
    static Select_SubPic_Stream => 2097152

    /**
     * Annex J command : Angle_Change.
     * Native name: UOP_FLAG_Select_Angle
     * @type {Integer (Int32)}
     */
    static Select_Angle => 4194304

    /**
     * Annex J command: Karaoke_Audio_Presentation_Mode_Change.
     * Native name: UOP_FLAG_Select_Karaoke_Audio_Presentation_Mode
     * @type {Integer (Int32)}
     */
    static Select_Karaoke_Audio_Presentation_Mode => 8388608

    /**
     * Annex J command: Video_Presentation_Mode_Change.
     * Native name: UOP_FLAG_Select_Video_Mode_Preference
     * @type {Integer (Int32)}
     */
    static Select_Video_Mode_Preference => 16777216
}
