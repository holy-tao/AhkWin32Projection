#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DVD_HMSF_TIMECODE.ahk
#Include .\DVD_VideoAttributes.ahk
#Include .\DVD_AudioAttributes.ahk
#Include .\DVD_MUA_MixingInfo.ahk
#Include .\DVD_MUA_Coeff.ahk
#Include .\DVD_MultichannelAudioAttributes.ahk
#Include .\DVD_SubpictureAttributes.ahk

/**
 * The DVD_TitleAttributes structure contains information about a DVD title.
 * @remarks
 * By default, the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> uses the <b>AppMode</b> member of the anonymous union to report  the title mode.
 * 
 * If the application sets the <b>DVD_EnableTitleLength</b> option to <b>TRUE</b>, the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> uses the <b>TitleLength</b> member of the union to report the title length. To set this option, call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol2-setoption">IDvdControl2::SetOption</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-dvd_titleattributes
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVD_TitleAttributes extends Win32Struct
{
    static sizeof => 456

    static packingSize => 8

    /**
     * @type {Integer}
     */
    AppMode {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {DVD_HMSF_TIMECODE}
     */
    TitleLength{
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
    VideoAttributes{
        get {
            if(!this.HasProp("__VideoAttributes"))
                this.__VideoAttributes := DVD_VideoAttributes(8, this)
            return this.__VideoAttributes
        }
    }

    /**
     * The number of audio streams available in the title.
     * @type {Integer}
     */
    ulNumberOfAudioStreams {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * An array of [DVD_AudioAttributes](/windows/desktop/api/strmif/ns-strmif-dvd_audioattributes) structures containing information about each available audio stream in the current title.
     * @type {Array<DVD_AudioAttributes>}
     */
    AudioAttributes{
        get {
            if(!this.HasProp("__AudioAttributesProxyArray"))
                this.__AudioAttributesProxyArray := Win32FixedArray(this.ptr + 64, 8, DVD_AudioAttributes, "")
            return this.__AudioAttributesProxyArray
        }
    }

    /**
     * An array of [DVD_AudioAttributes](/windows/desktop/api/strmif/ns-strmif-dvd_audioattributes) structure.
     * @type {Array<DVD_MultichannelAudioAttributes>}
     */
    MultichannelAudioAttributes{
        get {
            if(!this.HasProp("__MultichannelAudioAttributesProxyArray"))
                this.__MultichannelAudioAttributesProxyArray := Win32FixedArray(this.ptr + 128, 8, DVD_MultichannelAudioAttributes, "")
            return this.__MultichannelAudioAttributesProxyArray
        }
    }

    /**
     * The number of subpicture streams available in the title.
     * @type {Integer}
     */
    ulNumberOfSubpictureStreams {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }

    /**
     * An array of [DVD_SubpictureAttributes](/windows/desktop/api/strmif/ns-strmif-dvd_subpictureattributes) structures that contain information about each available subpicture stream in the title.
     * @type {Array<DVD_SubpictureAttributes>}
     */
    SubpictureAttributes{
        get {
            if(!this.HasProp("__SubpictureAttributesProxyArray"))
                this.__SubpictureAttributesProxyArray := Win32FixedArray(this.ptr + 200, 32, DVD_SubpictureAttributes, "")
            return this.__SubpictureAttributesProxyArray
        }
    }
}
