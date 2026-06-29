#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DVD_SUBPICTURE_TYPE.ahk" { DVD_SUBPICTURE_TYPE }
#Import ".\DVD_MUA_Coeff.ahk" { DVD_MUA_Coeff }
#Import ".\DVD_MultichannelAudioAttributes.ahk" { DVD_MultichannelAudioAttributes }
#Import ".\DVD_AUDIO_LANG_EXT.ahk" { DVD_AUDIO_LANG_EXT }
#Import ".\DVD_MUA_MixingInfo.ahk" { DVD_MUA_MixingInfo }
#Import ".\DVD_VideoAttributes.ahk" { DVD_VideoAttributes }
#Import ".\DVD_SubpictureAttributes.ahk" { DVD_SubpictureAttributes }
#Import ".\DVD_SUBPICTURE_CODING.ahk" { DVD_SUBPICTURE_CODING }
#Import ".\DVD_AUDIO_FORMAT.ahk" { DVD_AUDIO_FORMAT }
#Import ".\DVD_AudioAttributes.ahk" { DVD_AudioAttributes }
#Import ".\DVD_TITLE_APPMODE.ahk" { DVD_TITLE_APPMODE }
#Import ".\DVD_SUBPICTURE_LANG_EXT.ahk" { DVD_SUBPICTURE_LANG_EXT }
#Import ".\DVD_VIDEO_COMPRESSION.ahk" { DVD_VIDEO_COMPRESSION }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DVD_AUDIO_APPMODE.ahk" { DVD_AUDIO_APPMODE }
#Import ".\DVD_HMSF_TIMECODE.ahk" { DVD_HMSF_TIMECODE }

/**
 * The DVD_TitleAttributes structure contains information about a DVD title.
 * @remarks
 * By default, the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> uses the <b>AppMode</b> member of the anonymous union to report  the title mode.
 * 
 * If the application sets the <b>DVD_EnableTitleLength</b> option to <b>TRUE</b>, the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> uses the <b>TitleLength</b> member of the union to report the title length. To set this option, call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol2-setoption">IDvdControl2::SetOption</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-dvd_titleattributes
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct DVD_TitleAttributes {
    #StructPack 8

    AppMode : DVD_TITLE_APPMODE

    /**
     * A [DVD_VideoAttributes](/windows/desktop/api/strmif/ns-strmif-dvd_videoattributes) structure containing information about the "main" video of the current menu or title.
     */
    VideoAttributes : DVD_VideoAttributes

    /**
     * The number of audio streams available in the title.
     */
    ulNumberOfAudioStreams : UInt32

    /**
     * An array of [DVD_AudioAttributes](/windows/desktop/api/strmif/ns-strmif-dvd_audioattributes) structures containing information about each available audio stream in the current title.
     */
    AudioAttributes : DVD_AudioAttributes[8]

    /**
     * An array of [DVD_AudioAttributes](/windows/desktop/api/strmif/ns-strmif-dvd_audioattributes) structure.
     */
    MultichannelAudioAttributes : DVD_MultichannelAudioAttributes[8]

    /**
     * The number of subpicture streams available in the title.
     */
    ulNumberOfSubpictureStreams : UInt32

    /**
     * An array of [DVD_SubpictureAttributes](/windows/desktop/api/strmif/ns-strmif-dvd_subpictureattributes) structures that contain information about each available subpicture stream in the title.
     */
    SubpictureAttributes : DVD_SubpictureAttributes[32]

    static __New() {
        DefineProp(this.Prototype, 'TitleLength', { type: DVD_HMSF_TIMECODE, offset: 0 })
        this.DeleteProp("__New")
    }
}
