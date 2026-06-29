#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DVD_SUBPICTURE_TYPE.ahk" { DVD_SUBPICTURE_TYPE }
#Import ".\DVD_AUDIO_LANG_EXT.ahk" { DVD_AUDIO_LANG_EXT }
#Import ".\DVD_VideoAttributes.ahk" { DVD_VideoAttributes }
#Import ".\DVD_SubpictureAttributes.ahk" { DVD_SubpictureAttributes }
#Import ".\DVD_SUBPICTURE_CODING.ahk" { DVD_SUBPICTURE_CODING }
#Import ".\DVD_AUDIO_FORMAT.ahk" { DVD_AUDIO_FORMAT }
#Import ".\DVD_AudioAttributes.ahk" { DVD_AudioAttributes }
#Import ".\DVD_SUBPICTURE_LANG_EXT.ahk" { DVD_SUBPICTURE_LANG_EXT }
#Import ".\DVD_VIDEO_COMPRESSION.ahk" { DVD_VIDEO_COMPRESSION }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DVD_AUDIO_APPMODE.ahk" { DVD_AUDIO_APPMODE }

/**
 * The DVD_MenuAttributes structure contains information about a DVD menu. The IDvdInfo2::GetTitleAttributes method fills in a DVD_MenuAttributes structure for a specified stream.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-dvd_menuattributes
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct DVD_MenuAttributes {
    #StructPack 4

    /**
     * An array of <b>TRUE</b>/<b>FALSE</b> values indicating with which DVD regions the disc's authored region is compatible. The eight array indexes (numbered 0-7) correspond to the eight DVD regions (numbered 1-8). This array is only filled in when the menu being queried is the Video Manager Menu (the main menu for the entire disc).
     * 
     * <div class="alert"><b>Important</b>  A value of 0 (<b>FALSE</b>) indicates that the region is compatible (permitted). A value of 1 (<b>TRUE</b>) indicates that the region is not compatible. This member should have been named <i>fIncompatibleRegion</i>.</div>
     * <div> </div>
     */
    fCompatibleRegion : BOOL[8]

    /**
     * A [DVD_VideoAttributes](/windows/desktop/api/strmif/ns-strmif-dvd_videoattributes) structure containing the video attributes of the menu. This applies to both a VMGM and VTSM.
     */
    VideoAttributes : DVD_VideoAttributes

    /**
     * A variable of type BOOL indicating whether the menu has an audio stream.
     */
    fAudioPresent : BOOL

    /**
     * A [DVD_AudioAttributes](/windows/desktop/api/strmif/ns-strmif-dvd_audioattributes) structure containing information about the menu's audio stream. This structure will only be filled in if <i>fAudioPresent</i> is <b>TRUE</b>.
     */
    AudioAttributes : DVD_AudioAttributes

    /**
     * A variable of type BOOL indicating whether the menu has a subpicture stream.
     */
    fSubpicturePresent : BOOL

    /**
     * A [DVD_SubpictureAttributes](/windows/desktop/api/strmif/ns-strmif-dvd_subpictureattributes) structure containing information about the menu's subpicture stream. This structure will only be filled in if <i>fSubpicturePresent</i> is <b>TRUE</b>.
     */
    SubpictureAttributes : DVD_SubpictureAttributes

}
