#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates which user operation (UOP) commands are currently allowed by the DVD.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-valid_uop_flag
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VALID_UOP_FLAG extends Win32Enum{

    /**
     * Annex J commands: Time_Play, TimeSearch.
     * @type {Integer (Int32)}
     */
    static UOP_FLAG_Play_Title_Or_AtTime => 1

    /**
     * Annex J commands: PTT_Play, PTT_Search.
     * @type {Integer (Int32)}
     */
    static UOP_FLAG_Play_Chapter => 2

    /**
     * Annex J command: Title_Play.
     * @type {Integer (Int32)}
     */
    static UOP_FLAG_Play_Title => 4

    /**
     * Annex J command: Stop.
     * @type {Integer (Int32)}
     */
    static UOP_FLAG_Stop => 8

    /**
     * Annex J command: GoUp.
     * @type {Integer (Int32)}
     */
    static UOP_FLAG_ReturnFromSubMenu => 16

    /**
     * Annex J commands: Time_Search, PTT_Search.
     * @type {Integer (Int32)}
     */
    static UOP_FLAG_Play_Chapter_Or_AtTime => 32

    /**
     * Annex J commands: PrevPG_Search, TopPG_Search.
     * @type {Integer (Int32)}
     */
    static UOP_FLAG_PlayPrev_Or_Replay_Chapter => 64

    /**
     * Annex J command: NextPG_Search.
     * @type {Integer (Int32)}
     */
    static UOP_FLAG_PlayNext_Chapter => 128

    /**
     * Annex J command: Forward_Scan.
     * @type {Integer (Int32)}
     */
    static UOP_FLAG_Play_Forwards => 256

    /**
     * Annex J command: Backward_Scan.
     * @type {Integer (Int32)}
     */
    static UOP_FLAG_Play_Backwards => 512

    /**
     * Annex J command: Menu_Call(<i>Title</i>).
     * @type {Integer (Int32)}
     */
    static UOP_FLAG_ShowMenu_Title => 1024

    /**
     * Annex J command: Menu_Call(<i>Root</i>).
     * @type {Integer (Int32)}
     */
    static UOP_FLAG_ShowMenu_Root => 2048

    /**
     * Annex J command: Menu_Call(<i>Sub-picture</i>).
     * @type {Integer (Int32)}
     */
    static UOP_FLAG_ShowMenu_SubPic => 4096

    /**
     * Annex J command: Menu_Call(<i>Audio</i>).
     * @type {Integer (Int32)}
     */
    static UOP_FLAG_ShowMenu_Audio => 8192

    /**
     * Annex J command: Menu_Call(<i>Angle</i>).
     * @type {Integer (Int32)}
     */
    static UOP_FLAG_ShowMenu_Angle => 16384

    /**
     * Annex J command: Menu_Call(<i>PTT</i>).
     * @type {Integer (Int32)}
     */
    static UOP_FLAG_ShowMenu_Chapter => 32768

    /**
     * Annex J command: Resume.
     * @type {Integer (Int32)}
     */
    static UOP_FLAG_Resume => 65536

    /**
     * Annex J commands: Upper_Button_Select, Lower_Button_Select, Left_Button_Select, Right_Button_Select, Button_Activate, Button_Select_And_Activate.
     * @type {Integer (Int32)}
     */
    static UOP_FLAG_Select_Or_Activate_Button => 131072

    /**
     * Annex J command: Still_Off.
     * @type {Integer (Int32)}
     */
    static UOP_FLAG_Still_Off => 262144

    /**
     * Annex J command: Pause_On.
     * @type {Integer (Int32)}
     */
    static UOP_FLAG_Pause_On => 524288

    /**
     * Annex J command: Audio_Stream_Change.
     * @type {Integer (Int32)}
     */
    static UOP_FLAG_Select_Audio_Stream => 1048576

    /**
     * Annex J command: Sub-picture_Stream_Change.
     * @type {Integer (Int32)}
     */
    static UOP_FLAG_Select_SubPic_Stream => 2097152

    /**
     * Annex J command : Angle_Change.
     * @type {Integer (Int32)}
     */
    static UOP_FLAG_Select_Angle => 4194304

    /**
     * Annex J command: Karaoke_Audio_Presentation_Mode_Change.
     * @type {Integer (Int32)}
     */
    static UOP_FLAG_Select_Karaoke_Audio_Presentation_Mode => 8388608

    /**
     * Annex J command: Video_Presentation_Mode_Change.
     * @type {Integer (Int32)}
     */
    static UOP_FLAG_Select_Video_Mode_Preference => 16777216
}
