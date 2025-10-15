#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include .\DVD_VideoAttributes.ahk
#Include .\DVD_AudioAttributes.ahk
#Include .\DVD_SubpictureAttributes.ahk

/**
 * The DVD_MenuAttributes structure contains information about a DVD menu. The IDvdInfo2::GetTitleAttributes method fills in a DVD_MenuAttributes structure for a specified stream.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ns-strmif-dvd_menuattributes
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVD_MenuAttributes extends Win32Struct
{
    static sizeof => 184

    static packingSize => 8

    /**
     * An array of <b>TRUE</b>/<b>FALSE</b> values indicating with which DVD regions the disc's authored region is compatible. The eight array indexes (numbered 0-7) correspond to the eight DVD regions (numbered 1-8). This array is only filled in when the menu being queried is the Video Manager Menu (the main menu for the entire disc).
     * 
     * <div class="alert"><b>Important</b>  A value of 0 (<b>FALSE</b>) indicates that the region is compatible (permitted). A value of 1 (<b>TRUE</b>) indicates that the region is not compatible. This member should have been named <i>fIncompatibleRegion</i>.</div>
     * <div> </div>
     * @type {Array<BOOL>}
     */
    fCompatibleRegion{
        get {
            if(!this.HasProp("__fCompatibleRegionProxyArray"))
                this.__fCompatibleRegionProxyArray := Win32FixedArray(this.ptr + 0, 8, BOOL, "")
            return this.__fCompatibleRegionProxyArray
        }
    }

    /**
     * A [DVD_VideoAttributes](/windows/desktop/api/strmif/ns-strmif-dvd_videoattributes) structure containing the video attributes of the menu. This applies to both a VMGM and VTSM.
     * @type {DVD_VideoAttributes}
     */
    VideoAttributes{
        get {
            if(!this.HasProp("__VideoAttributes"))
                this.__VideoAttributes := DVD_VideoAttributes(this.ptr + 64)
            return this.__VideoAttributes
        }
    }

    /**
     * A variable of type BOOL indicating whether the menu has an audio stream.
     * @type {BOOL}
     */
    fAudioPresent{
        get {
            if(!this.HasProp("__fAudioPresent"))
                this.__fAudioPresent := BOOL(this.ptr + 116)
            return this.__fAudioPresent
        }
    }

    /**
     * A [DVD_AudioAttributes](/windows/desktop/api/strmif/ns-strmif-dvd_audioattributes) structure containing information about the menu's audio stream. This structure will only be filled in if <i>fAudioPresent</i> is <b>TRUE</b>.
     * @type {DVD_AudioAttributes}
     */
    AudioAttributes{
        get {
            if(!this.HasProp("__AudioAttributes"))
                this.__AudioAttributes := DVD_AudioAttributes(this.ptr + 120)
            return this.__AudioAttributes
        }
    }

    /**
     * A variable of type BOOL indicating whether the menu has a subpicture stream.
     * @type {BOOL}
     */
    fSubpicturePresent{
        get {
            if(!this.HasProp("__fSubpicturePresent"))
                this.__fSubpicturePresent := BOOL(this.ptr + 160)
            return this.__fSubpicturePresent
        }
    }

    /**
     * A [DVD_SubpictureAttributes](/windows/desktop/api/strmif/ns-strmif-dvd_subpictureattributes) structure containing information about the menu's subpicture stream. This structure will only be filled in if <i>fSubpicturePresent</i> is <b>TRUE</b>.
     * @type {DVD_SubpictureAttributes}
     */
    SubpictureAttributes{
        get {
            if(!this.HasProp("__SubpictureAttributes"))
                this.__SubpictureAttributes := DVD_SubpictureAttributes(this.ptr + 168)
            return this.__SubpictureAttributes
        }
    }
}
