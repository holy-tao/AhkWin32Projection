#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DVD_VIDEO_COMPRESSION.ahk" { DVD_VIDEO_COMPRESSION }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The DVD_VideoAttributes structure describes the attributes of the video stream for the current title or menu.
 * @remarks
 * This structure is filled when an application calls the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdinfo2-getcurrentvideoattributes">IDvdInfo2::GetCurrentVideoAttributes</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-dvd_videoattributes
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct DVD_VideoAttributes {
    #StructPack 4

    /**
     * <b>TRUE</b> means the picture can be shown as pan-scan if the display aspect ratio is 4 x 3.
     */
    fPanscanPermitted : BOOL

    /**
     * <b>TRUE</b> means the picture can be shown as letterbox if the display aspect ratio is 4 x 3.
     */
    fLetterboxPermitted : BOOL

    /**
     * The video stream's X aspect (4 or 16).
     */
    ulAspectX : UInt32

    /**
     * The video stream's Y aspect (3 or 9).
     */
    ulAspectY : UInt32

    /**
     * The frame rate in hertz (Hz), either 50 or 60.
     */
    ulFrameRate : UInt32

    /**
     * The frame height in lines (525 for a frame rate of 60 Hz or 625 for 50 Hz).
     */
    ulFrameHeight : UInt32

    /**
     * Variable of type [DVD_VIDEO_COMPRESSION](/windows/desktop/api/strmif/ne-strmif-dvd_video_compression) indicating the MPEG compression type used on the disc.
     */
    Compression : DVD_VIDEO_COMPRESSION

    /**
     * <b>TRUE</b> means there is user data in line 21, field 1.
     */
    fLine21Field1InGOP : BOOL

    /**
     * <b>TRUE</b> means there is user data in line 21, field 2.
     */
    fLine21Field2InGOP : BOOL

    /**
     * The x-axis source resolution (352, 704, or 720).
     */
    ulSourceResolutionX : UInt32

    /**
     * The y-axis source resolution (240, 480, 288, or 576).
     */
    ulSourceResolutionY : UInt32

    /**
     * <b>TRUE</b> means the source video is in letterbox format. Subpictures and menu buttons can only be displayed in the active video area.
     */
    fIsSourceLetterboxed : BOOL

    /**
     * For 625/50 Hz systems, <b>TRUE</b> means "film mode" and <b>FALSE</b> means "camera mode."
     */
    fIsFilmMode : BOOL

}
