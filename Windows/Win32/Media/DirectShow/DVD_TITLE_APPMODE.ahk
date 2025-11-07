#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates whether a DVD title is a karaoke title. This enumeration is a member of the DVD_TitleAttributes structure, which is filled when an application calls the IDvdInfo2::GetTitleAttributes method.
 * @remarks
 * 
 * When the DVD Navigator encounters a karaoke title on a disc, it goes into "karaoke mode" and informs the audio decoder. The decoder must respond by initially muting the three auxiliary channels. Applications can then selectively control the volume and mixing configuration of these channels using the karaoke-related methods in the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcontrol2">IDvdControl2</a> interface For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/playing-karaoke-audio-streams">Playing Karaoke Audio Streams</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ne-strmif-dvd_title_appmode
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVD_TITLE_APPMODE{

    /**
     * The disc does not provide any application mode information about this title.
     * @type {Integer (Int32)}
     */
    static DVD_AppMode_Not_Specified => 0

    /**
     * Title contains karaoke content.
     * @type {Integer (Int32)}
     */
    static DVD_AppMode_Karaoke => 1

    /**
     * Title contains a type of content that the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator Filter</a> does not recognize, so the application should treat the title as a regular DVD-Video title.
     * @type {Integer (Int32)}
     */
    static DVD_AppMode_Other => 3
}
