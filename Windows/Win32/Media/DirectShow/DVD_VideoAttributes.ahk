#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DVD_VideoAttributes structure describes the attributes of the video stream for the current title or menu.
 * @remarks
 * This structure is filled when an application calls the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdinfo2-getcurrentvideoattributes">IDvdInfo2::GetCurrentVideoAttributes</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-dvd_videoattributes
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVD_VideoAttributes extends Win32Struct
{
    static sizeof => 52

    static packingSize => 4

    /**
     * <b>TRUE</b> means the picture can be shown as pan-scan if the display aspect ratio is 4 x 3.
     * @type {BOOL}
     */
    fPanscanPermitted {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * <b>TRUE</b> means the picture can be shown as letterbox if the display aspect ratio is 4 x 3.
     * @type {BOOL}
     */
    fLetterboxPermitted {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The video stream's X aspect (4 or 16).
     * @type {Integer}
     */
    ulAspectX {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The video stream's Y aspect (3 or 9).
     * @type {Integer}
     */
    ulAspectY {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The frame rate in hertz (Hz), either 50 or 60.
     * @type {Integer}
     */
    ulFrameRate {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The frame height in lines (525 for a frame rate of 60 Hz or 625 for 50 Hz).
     * @type {Integer}
     */
    ulFrameHeight {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Variable of type [DVD_VIDEO_COMPRESSION](/windows/desktop/api/strmif/ne-strmif-dvd_video_compression) indicating the MPEG compression type used on the disc.
     * @type {Integer}
     */
    Compression {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * <b>TRUE</b> means there is user data in line 21, field 1.
     * @type {BOOL}
     */
    fLine21Field1InGOP {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * <b>TRUE</b> means there is user data in line 21, field 2.
     * @type {BOOL}
     */
    fLine21Field2InGOP {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * The x-axis source resolution (352, 704, or 720).
     * @type {Integer}
     */
    ulSourceResolutionX {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The y-axis source resolution (240, 480, 288, or 576).
     * @type {Integer}
     */
    ulSourceResolutionY {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * <b>TRUE</b> means the source video is in letterbox format. Subpictures and menu buttons can only be displayed in the active video area.
     * @type {BOOL}
     */
    fIsSourceLetterboxed {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * For 625/50 Hz systems, <b>TRUE</b> means "film mode" and <b>FALSE</b> means "camera mode."
     * @type {BOOL}
     */
    fIsFilmMode {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }
}
