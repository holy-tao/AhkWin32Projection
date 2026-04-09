#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DVD_TITLE_APPMODE.ahk
#Include .\DVD_HMSF_TIMECODE.ahk
#Include .\DVD_VideoAttributes.ahk
#Include .\DVD_VIDEO_COMPRESSION.ahk
#Include .\DVD_AudioAttributes.ahk
#Include .\DVD_AUDIO_APPMODE.ahk
#Include .\DVD_AUDIO_FORMAT.ahk
#Include .\DVD_AUDIO_LANG_EXT.ahk
#Include .\DVD_MultichannelAudioAttributes.ahk
#Include .\DVD_MUA_MixingInfo.ahk
#Include .\DVD_MUA_Coeff.ahk
#Include .\DVD_SubpictureAttributes.ahk
#Include .\DVD_SUBPICTURE_TYPE.ahk
#Include .\DVD_SUBPICTURE_CODING.ahk
#Include .\DVD_SUBPICTURE_LANG_EXT.ahk

/**
 * The DVD_TitleAttributes structure contains information about a DVD title.
 * @remarks
 * By default, the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> uses the <b>AppMode</b> member of the anonymous union to report  the title mode.
 * 
 * If the application sets the <b>DVD_EnableTitleLength</b> option to <b>TRUE</b>, the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> uses the <b>TitleLength</b> member of the union to report the title length. To set this option, call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol2-setoption">IDvdControl2::SetOption</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-dvd_titleattributes
 * @namespace Windows.Win32.Media.DirectShow
 */
class DVD_TitleAttributes extends Win32Struct {
    static sizeof => 3208

    static packingSize => 8

    /**
     * @type {DVD_TITLE_APPMODE}
     */
    AppMode {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {DVD_HMSF_TIMECODE}
     */
    TitleLength {
        get {
            if(!this.HasProp("__TitleLength"))
                this.__TitleLength := DVD_HMSF_TIMECODE(0, this)
            return this.__TitleLength
        }
    }

    /**
     * A [DVD_VideoAttributes](/windows/desktop/api/strmif/ns-strmif-dvd_videoattributes) structure containing information about the "main" video of the current menu or title.
     * @type {DVD_VideoAttributes}
     */
    VideoAttributes {
        get {
            if(!this.HasProp("__VideoAttributes"))
                this.__VideoAttributes := DVD_VideoAttributes(4, this)
            return this.__VideoAttributes
        }
    }

    /**
     * The number of audio streams available in the title.
     * @type {Integer}
     */
    ulNumberOfAudioStreams {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * An array of [DVD_AudioAttributes](/windows/desktop/api/strmif/ns-strmif-dvd_audioattributes) structures containing information about each available audio stream in the current title.
     * @type {DVD_AudioAttributes}
     */
    AudioAttributes {
        get {
            if(!this.HasProp("__AudioAttributesProxyArray"))
                this.__AudioAttributesProxyArray := Win32FixedArray(this.ptr + 60, 8, DVD_AudioAttributes, "")
            return this.__AudioAttributesProxyArray
        }
    }

    /**
     * An array of [DVD_AudioAttributes](/windows/desktop/api/strmif/ns-strmif-dvd_audioattributes) structure.
     * @type {DVD_MultichannelAudioAttributes}
     */
    MultichannelAudioAttributes {
        get {
            if(!this.HasProp("__MultichannelAudioAttributesProxyArray"))
                this.__MultichannelAudioAttributesProxyArray := Win32FixedArray(this.ptr + 384, 8, DVD_MultichannelAudioAttributes, "")
            return this.__MultichannelAudioAttributesProxyArray
        }
    }

    /**
     * The number of subpicture streams available in the title.
     * @type {Integer}
     */
    ulNumberOfSubpictureStreams {
        get => NumGet(this, 2688, "uint")
        set => NumPut("uint", value, this, 2688)
    }

    /**
     * An array of [DVD_SubpictureAttributes](/windows/desktop/api/strmif/ns-strmif-dvd_subpictureattributes) structures that contain information about each available subpicture stream in the title.
     * @type {DVD_SubpictureAttributes}
     */
    SubpictureAttributes {
        get {
            if(!this.HasProp("__SubpictureAttributesProxyArray"))
                this.__SubpictureAttributesProxyArray := Win32FixedArray(this.ptr + 2692, 32, DVD_SubpictureAttributes, "")
            return this.__SubpictureAttributesProxyArray
        }
    }
}
